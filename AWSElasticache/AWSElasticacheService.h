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
#import "AWSElasticacheModel.h"
#import "AWSElasticacheResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSElasticache
FOUNDATION_EXPORT NSString *const AWSElasticacheSDKVersion;

/**
 <fullname>Amazon ElastiCache</fullname><p>Amazon ElastiCache is a web service that makes it easier to set up, operate, and scale a distributed cache in the cloud.</p><p>With ElastiCache, customers get all of the benefits of a high-performance, in-memory cache with less of the administrative burden involved in launching and managing a distributed cache. The service makes setup, scaling, and cluster failure handling much simpler than in a self-managed cache deployment.</p><p>In addition, through integration with Amazon CloudWatch, customers get enhanced visibility into the key performance statistics associated with their cache and can receive alarms if a part of their cache runs hot.</p>
 */
@interface AWSElasticache : AWSService

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

     let Elasticache = AWSElasticache.default()

 *Objective-C*

     AWSElasticache *Elasticache = [AWSElasticache defaultElasticache];

 @return The default service client.
 */
+ (instancetype)defaultElasticache;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticache.register(with: configuration!, forKey: "USWest2Elasticache")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:@"USWest2Elasticache"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticache = AWSElasticache(forKey: "USWest2Elasticache")

 *Objective-C*

     AWSElasticache *Elasticache = [AWSElasticache ElasticacheForKey:@"USWest2Elasticache"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerElasticacheWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerElasticacheWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSElasticache.register(with: configuration!, forKey: "USWest2Elasticache")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:@"USWest2Elasticache"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Elasticache = AWSElasticache(forKey: "USWest2Elasticache")

 *Objective-C*

     AWSElasticache *Elasticache = [AWSElasticache ElasticacheForKey:@"USWest2Elasticache"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ElasticacheForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeElasticacheForKey:(NSString *)key;

/**
 <p>Adds up to 50 cost allocation tags to the named resource. A cost allocation tag is a key-value pair where the key and value are case-sensitive. You can use cost allocation tags to categorize and track your AWS costs.</p><p> When you apply tags to your ElastiCache resources, AWS generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by your tags. You can apply tags that represent business categories (such as cost centers, application names, or owners) to organize your costs across multiple services. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Using Cost Allocation Tags in Amazon ElastiCache</a> in the <i>ElastiCache User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheTagListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorInvalidARN`.
 
 @see AWSElasticacheAddTagsToResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (AWSTask<AWSElasticacheTagListMessage *> *)addTagsToResource:(AWSElasticacheAddTagsToResourceMessage *)request;

/**
 <p>Adds up to 50 cost allocation tags to the named resource. A cost allocation tag is a key-value pair where the key and value are case-sensitive. You can use cost allocation tags to categorize and track your AWS costs.</p><p> When you apply tags to your ElastiCache resources, AWS generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by your tags. You can apply tags that represent business categories (such as cost centers, application names, or owners) to organize your costs across multiple services. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Using Cost Allocation Tags in Amazon ElastiCache</a> in the <i>ElastiCache User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorInvalidARN`.
 
 @see AWSElasticacheAddTagsToResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (void)addTagsToResource:(AWSElasticacheAddTagsToResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheTagListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows network ingress to a cache security group. Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism.</p><note><p>You cannot authorize ingress from an Amazon EC2 security group in one region to an ElastiCache cluster in another region.</p></note>
 
 @param request A container for the necessary parameters to execute the AuthorizeCacheSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheAuthorizeCacheSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorAuthorizationAlreadyExists`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage
 @see AWSElasticacheAuthorizeCacheSecurityGroupIngressResult
 */
- (AWSTask<AWSElasticacheAuthorizeCacheSecurityGroupIngressResult *> *)authorizeCacheSecurityGroupIngress:(AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage *)request;

/**
 <p>Allows network ingress to a cache security group. Applications using ElastiCache must be running on Amazon EC2, and Amazon EC2 security groups are used as the authorization mechanism.</p><note><p>You cannot authorize ingress from an Amazon EC2 security group in one region to an ElastiCache cluster in another region.</p></note>
 
 @param request A container for the necessary parameters to execute the AuthorizeCacheSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorAuthorizationAlreadyExists`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage
 @see AWSElasticacheAuthorizeCacheSecurityGroupIngressResult
 */
- (void)authorizeCacheSecurityGroupIngress:(AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheAuthorizeCacheSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Apply the service update. For more information on service updates and applying them, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html">Applying Service Updates</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchApplyUpdateAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheUpdateActionResultsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheBatchApplyUpdateActionMessage
 @see AWSElasticacheUpdateActionResultsMessage
 */
- (AWSTask<AWSElasticacheUpdateActionResultsMessage *> *)batchApplyUpdateAction:(AWSElasticacheBatchApplyUpdateActionMessage *)request;

/**
 <p>Apply the service update. For more information on service updates and applying them, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/applying-updates.html">Applying Service Updates</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchApplyUpdateAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheBatchApplyUpdateActionMessage
 @see AWSElasticacheUpdateActionResultsMessage
 */
- (void)batchApplyUpdateAction:(AWSElasticacheBatchApplyUpdateActionMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheUpdateActionResultsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stop the service update. For more information on service updates and stopping them, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html">Stopping Service Updates</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopUpdateAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheUpdateActionResultsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheBatchStopUpdateActionMessage
 @see AWSElasticacheUpdateActionResultsMessage
 */
- (AWSTask<AWSElasticacheUpdateActionResultsMessage *> *)batchStopUpdateAction:(AWSElasticacheBatchStopUpdateActionMessage *)request;

/**
 <p>Stop the service update. For more information on service updates and stopping them, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/stopping-self-service-updates.html">Stopping Service Updates</a>.</p>
 
 @param request A container for the necessary parameters to execute the BatchStopUpdateAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheBatchStopUpdateActionMessage
 @see AWSElasticacheUpdateActionResultsMessage
 */
- (void)batchStopUpdateAction:(AWSElasticacheBatchStopUpdateActionMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheUpdateActionResultsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Complete the migration of data.</p>
 
 @param request A container for the necessary parameters to execute the CompleteMigration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCompleteMigrationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorReplicationGroupNotUnderMigration`.
 
 @see AWSElasticacheCompleteMigrationMessage
 @see AWSElasticacheCompleteMigrationResponse
 */
- (AWSTask<AWSElasticacheCompleteMigrationResponse *> *)completeMigration:(AWSElasticacheCompleteMigrationMessage *)request;

/**
 <p>Complete the migration of data.</p>
 
 @param request A container for the necessary parameters to execute the CompleteMigration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorReplicationGroupNotUnderMigration`.
 
 @see AWSElasticacheCompleteMigrationMessage
 @see AWSElasticacheCompleteMigrationResponse
 */
- (void)completeMigration:(AWSElasticacheCompleteMigrationMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCompleteMigrationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Makes a copy of an existing snapshot.</p><note><p>This operation is valid for Redis only.</p></note><important><p>Users or groups that have permissions to use the <code>CopySnapshot</code> operation can create their own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control who has the ability to use the <code>CopySnapshot</code> operation. For more information about using IAM to control the use of ElastiCache operations, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html">Exporting Snapshots</a> and <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html">Authentication &amp; Access Control</a>.</p></important><p>You could receive the following error messages.</p><p class="title"><b>Error Messages</b></p><ul><li><p><b>Error Message:</b> The S3 bucket %s is outside of the region.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The S3 bucket %s does not exist.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The S3 bucket %s is not owned by the authenticated user.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The authenticated user does not have sufficient permissions to perform the desired activity.</p><p><b>Solution:</b> Contact your system administrator to get the needed permissions.</p></li><li><p><b>Error Message:</b> The S3 bucket %s already contains an object with key %s.</p><p><b>Solution:</b> Give the <code>TargetSnapshotName</code> a new and unique value. If exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for <code>TargetSnapshotName</code>.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted READ permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add List and Read permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add Upload/Delete permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add View Permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheReplicateSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidSnapshotState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheReplicateSnapshotMessage
 @see AWSElasticacheReplicateSnapshotResult
 */
- (AWSTask<AWSElasticacheReplicateSnapshotResult *> *)replicateSnapshot:(AWSElasticacheReplicateSnapshotMessage *)request;

/**
 <p>Makes a copy of an existing snapshot.</p><note><p>This operation is valid for Redis only.</p></note><important><p>Users or groups that have permissions to use the <code>CopySnapshot</code> operation can create their own Amazon S3 buckets and copy snapshots to it. To control access to your snapshots, use an IAM policy to control who has the ability to use the <code>CopySnapshot</code> operation. For more information about using IAM to control the use of ElastiCache operations, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html">Exporting Snapshots</a> and <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/IAM.html">Authentication &amp; Access Control</a>.</p></important><p>You could receive the following error messages.</p><p class="title"><b>Error Messages</b></p><ul><li><p><b>Error Message:</b> The S3 bucket %s is outside of the region.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The S3 bucket %s does not exist.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The S3 bucket %s is not owned by the authenticated user.</p><p><b>Solution:</b> Create an Amazon S3 bucket in the same region as your snapshot. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-create-s3-bucket">Step 1: Create an Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message:</b> The authenticated user does not have sufficient permissions to perform the desired activity.</p><p><b>Solution:</b> Contact your system administrator to get the needed permissions.</p></li><li><p><b>Error Message:</b> The S3 bucket %s already contains an object with key %s.</p><p><b>Solution:</b> Give the <code>TargetSnapshotName</code> a new and unique value. If exporting a snapshot, you could alternatively create a new Amazon S3 bucket and use this same value for <code>TargetSnapshotName</code>.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted READ permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add List and Read permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted WRITE permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add Upload/Delete permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li><li><p><b>Error Message: </b> ElastiCache has not been granted READ_ACP permissions %s on the S3 Bucket.</p><p><b>Solution:</b> Add View Permissions on the bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-exporting.html#backups-exporting-grant-access">Step 2: Grant ElastiCache Access to Your Amazon S3 Bucket</a> in the ElastiCache User Guide.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CopySnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidSnapshotState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheReplicateSnapshotMessage
 @see AWSElasticacheReplicateSnapshotResult
 */
- (void)replicateSnapshot:(AWSElasticacheReplicateSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheReplicateSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine software, either Memcached or Redis.</p><p>This operation is not supported for Redis (cluster mode enabled) clusters.</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateCacheClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorCacheClusterAlreadyExists`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheClusterMessage
 @see AWSElasticacheCreateCacheClusterResult
 */
- (AWSTask<AWSElasticacheCreateCacheClusterResult *> *)createCacheCluster:(AWSElasticacheCreateCacheClusterMessage *)request;

/**
 <p>Creates a cluster. All nodes in the cluster run the same protocol-compliant cache engine software, either Memcached or Redis.</p><p>This operation is not supported for Redis (cluster mode enabled) clusters.</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorCacheClusterAlreadyExists`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheClusterMessage
 @see AWSElasticacheCreateCacheClusterResult
 */
- (void)createCacheCluster:(AWSElasticacheCreateCacheClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateCacheClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is a collection of parameters and their values that are applied to all of the nodes in any cluster or replication group using the CacheParameterGroup.</p><p>A newly created CacheParameterGroup is an exact duplicate of the default parameter group for the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can change the values of specific parameters. For more information, see:</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html">ModifyCacheParameterGroup</a> in the ElastiCache API Reference.</p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html">Parameters and Parameter Groups</a> in the ElastiCache User Guide.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateCacheParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateCacheParameterGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupQuotaExceeded`, `AWSElasticacheErrorCacheParameterGroupAlreadyExists`, `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheParameterGroupMessage
 @see AWSElasticacheCreateCacheParameterGroupResult
 */
- (AWSTask<AWSElasticacheCreateCacheParameterGroupResult *> *)createCacheParameterGroup:(AWSElasticacheCreateCacheParameterGroupMessage *)request;

/**
 <p>Creates a new Amazon ElastiCache cache parameter group. An ElastiCache cache parameter group is a collection of parameters and their values that are applied to all of the nodes in any cluster or replication group using the CacheParameterGroup.</p><p>A newly created CacheParameterGroup is an exact duplicate of the default parameter group for the CacheParameterGroupFamily. To customize the newly created CacheParameterGroup you can change the values of specific parameters. For more information, see:</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyCacheParameterGroup.html">ModifyCacheParameterGroup</a> in the ElastiCache API Reference.</p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html">Parameters and Parameter Groups</a> in the ElastiCache User Guide.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateCacheParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupQuotaExceeded`, `AWSElasticacheErrorCacheParameterGroupAlreadyExists`, `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheParameterGroupMessage
 @see AWSElasticacheCreateCacheParameterGroupResult
 */
- (void)createCacheParameterGroup:(AWSElasticacheCreateCacheParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateCacheParameterGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new cache security group. Use a cache security group to control access to one or more clusters.</p><p>Cache security groups are only used when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache subnet group instead. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html">CreateCacheSubnetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateCacheSecurityGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupAlreadyExists`, `AWSElasticacheErrorCacheSecurityGroupQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheSecurityGroupMessage
 @see AWSElasticacheCreateCacheSecurityGroupResult
 */
- (AWSTask<AWSElasticacheCreateCacheSecurityGroupResult *> *)createCacheSecurityGroup:(AWSElasticacheCreateCacheSecurityGroupMessage *)request;

/**
 <p>Creates a new cache security group. Use a cache security group to control access to one or more clusters.</p><p>Cache security groups are only used when you are creating a cluster outside of an Amazon Virtual Private Cloud (Amazon VPC). If you are creating a cluster inside of a VPC, use a cache subnet group instead. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html">CreateCacheSubnetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupAlreadyExists`, `AWSElasticacheErrorCacheSecurityGroupQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateCacheSecurityGroupMessage
 @see AWSElasticacheCreateCacheSecurityGroupResult
 */
- (void)createCacheSecurityGroup:(AWSElasticacheCreateCacheSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateCacheSecurityGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new cache subnet group.</p><p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateCacheSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupAlreadyExists`, `AWSElasticacheErrorCacheSubnetGroupQuotaExceeded`, `AWSElasticacheErrorCacheSubnetQuotaExceeded`, `AWSElasticacheErrorInvalidSubnet`.
 
 @see AWSElasticacheCreateCacheSubnetGroupMessage
 @see AWSElasticacheCreateCacheSubnetGroupResult
 */
- (AWSTask<AWSElasticacheCreateCacheSubnetGroupResult *> *)createCacheSubnetGroup:(AWSElasticacheCreateCacheSubnetGroupMessage *)request;

/**
 <p>Creates a new cache subnet group.</p><p>Use this parameter only when you are creating a cluster in an Amazon Virtual Private Cloud (Amazon VPC).</p>
 
 @param request A container for the necessary parameters to execute the CreateCacheSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupAlreadyExists`, `AWSElasticacheErrorCacheSubnetGroupQuotaExceeded`, `AWSElasticacheErrorCacheSubnetQuotaExceeded`, `AWSElasticacheErrorInvalidSubnet`.
 
 @see AWSElasticacheCreateCacheSubnetGroupMessage
 @see AWSElasticacheCreateCacheSubnetGroupResult
 */
- (void)createCacheSubnetGroup:(AWSElasticacheCreateCacheSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateCacheSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Global Datastore for Redis offers fully managed, fast, reliable and secure cross-region replication. Using Global Datastore for Redis, you can create cross-region read replica clusters for ElastiCache for Redis to enable low-latency reads and disaster recovery across regions. For more information, see <a href="/AmazonElastiCache/latest/red-ug/Redis-Global-Clusters.html">Replication Across Regions Using Global Datastore</a>. </p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> is the name of the Global Datastore.</p></li><li><p>The <b>PrimaryReplicationGroupId</b> represents the name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorGlobalReplicationGroupAlreadyExists`, `AWSElasticacheErrorServiceLinkedRoleNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheCreateGlobalReplicationGroupMessage
 @see AWSElasticacheCreateGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheCreateGlobalReplicationGroupResult *> *)createGlobalReplicationGroup:(AWSElasticacheCreateGlobalReplicationGroupMessage *)request;

/**
 <p>Global Datastore for Redis offers fully managed, fast, reliable and secure cross-region replication. Using Global Datastore for Redis, you can create cross-region read replica clusters for ElastiCache for Redis to enable low-latency reads and disaster recovery across regions. For more information, see <a href="/AmazonElastiCache/latest/red-ug/Redis-Global-Clusters.html">Replication Across Regions Using Global Datastore</a>. </p><ul><li><p>The <b>GlobalReplicationGroupIdSuffix</b> is the name of the Global Datastore.</p></li><li><p>The <b>PrimaryReplicationGroupId</b> represents the name of the primary cluster that accepts writes and will replicate updates to the secondary cluster.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorGlobalReplicationGroupAlreadyExists`, `AWSElasticacheErrorServiceLinkedRoleNotFound`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheCreateGlobalReplicationGroupMessage
 @see AWSElasticacheCreateGlobalReplicationGroupResult
 */
- (void)createGlobalReplicationGroup:(AWSElasticacheCreateGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group.</p><p>This API can be used to create a standalone regional replication group or a secondary replication group associated with a Global Datastore.</p><p>A Redis (cluster mode disabled) replication group is a collection of clusters, where one of the clusters is a read/write primary and the others are read-only replicas. Writes to the primary are asynchronously propagated to the replicas.</p><p>A Redis (cluster mode enabled) replication group is a collection of 1 to 90 node groups (shards). Each node group (shard) has one read/write primary node and up to 5 read-only replica nodes. Writes to the primary are asynchronously propagated to the replicas. Redis (cluster mode enabled) replication groups partition the data across node groups (shards).</p><p>When a Redis (cluster mode disabled) replication group has been successfully created, you can add one or more read replicas to it, up to a total of 5 read replicas. You cannot alter a Redis (cluster mode enabled) replication group after it has been created. However, if you need to increase or decrease the number of node groups (console: shards), you can avail yourself of ElastiCache for Redis' enhanced backup and restore. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-restoring.html">Restoring From a Backup with Cluster Resizing</a> in the <i>ElastiCache User Guide</i>.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorReplicationGroupAlreadyExists`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateReplicationGroupMessage
 @see AWSElasticacheCreateReplicationGroupResult
 */
- (AWSTask<AWSElasticacheCreateReplicationGroupResult *> *)createReplicationGroup:(AWSElasticacheCreateReplicationGroupMessage *)request;

/**
 <p>Creates a Redis (cluster mode disabled) or a Redis (cluster mode enabled) replication group.</p><p>This API can be used to create a standalone regional replication group or a secondary replication group associated with a Global Datastore.</p><p>A Redis (cluster mode disabled) replication group is a collection of clusters, where one of the clusters is a read/write primary and the others are read-only replicas. Writes to the primary are asynchronously propagated to the replicas.</p><p>A Redis (cluster mode enabled) replication group is a collection of 1 to 90 node groups (shards). Each node group (shard) has one read/write primary node and up to 5 read-only replica nodes. Writes to the primary are asynchronously propagated to the replicas. Redis (cluster mode enabled) replication groups partition the data across node groups (shards).</p><p>When a Redis (cluster mode disabled) replication group has been successfully created, you can add one or more read replicas to it, up to a total of 5 read replicas. You cannot alter a Redis (cluster mode enabled) replication group after it has been created. However, if you need to increase or decrease the number of node groups (console: shards), you can avail yourself of ElastiCache for Redis' enhanced backup and restore. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-restoring.html">Restoring From a Backup with Cluster Resizing</a> in the <i>ElastiCache User Guide</i>.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorReplicationGroupAlreadyExists`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorTagQuotaPerResourceExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheCreateReplicationGroupMessage
 @see AWSElasticacheCreateReplicationGroupResult
 */
- (void)createReplicationGroup:(AWSElasticacheCreateReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a copy of an entire cluster or replication group at a specific moment in time.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCreateSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheCreateSnapshotMessage
 @see AWSElasticacheCreateSnapshotResult
 */
- (AWSTask<AWSElasticacheCreateSnapshotResult *> *)createSnapshot:(AWSElasticacheCreateSnapshotMessage *)request;

/**
 <p>Creates a copy of an entire cluster or replication group at a specific moment in time.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheCreateSnapshotMessage
 @see AWSElasticacheCreateSnapshotResult
 */
- (void)createSnapshot:(AWSElasticacheCreateSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCreateSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Decreases the number of node groups in a Global Datastore</p>
 
 @param request A container for the necessary parameters to execute the DecreaseNodeGroupsInGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage
 @see AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult *> *)decreaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage *)request;

/**
 <p>Decreases the number of node groups in a Global Datastore</p>
 
 @param request A container for the necessary parameters to execute the DecreaseNodeGroupsInGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage
 @see AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult
 */
- (void)decreaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Dynamically decreases the number of replicas in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>
 
 @param request A container for the necessary parameters to execute the DecreaseReplicaCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDecreaseReplicaCountResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorServiceLinkedRoleNotFound`, `AWSElasticacheErrorNoOperation`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDecreaseReplicaCountMessage
 @see AWSElasticacheDecreaseReplicaCountResult
 */
- (AWSTask<AWSElasticacheDecreaseReplicaCountResult *> *)decreaseReplicaCount:(AWSElasticacheDecreaseReplicaCountMessage *)request;

/**
 <p>Dynamically decreases the number of replicas in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>
 
 @param request A container for the necessary parameters to execute the DecreaseReplicaCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorServiceLinkedRoleNotFound`, `AWSElasticacheErrorNoOperation`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDecreaseReplicaCountMessage
 @see AWSElasticacheDecreaseReplicaCountResult
 */
- (void)decreaseReplicaCount:(AWSElasticacheDecreaseReplicaCountMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDecreaseReplicaCountResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a previously provisioned cluster. <code>DeleteCacheCluster</code> deletes all associated cache nodes, node endpoints and the cluster itself. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert this operation.</p><p>This operation is not valid for:</p><ul><li><p>Redis (cluster mode enabled) clusters</p></li><li><p>A cluster that is the last read replica of a replication group</p></li><li><p>A node group (shard) that has Multi-AZ mode enabled</p></li><li><p>A cluster from a Redis (cluster mode enabled) replication group</p></li><li><p>A cluster that is not in the <code>available</code> state</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteCacheCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDeleteCacheClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheClusterMessage
 @see AWSElasticacheDeleteCacheClusterResult
 */
- (AWSTask<AWSElasticacheDeleteCacheClusterResult *> *)deleteCacheCluster:(AWSElasticacheDeleteCacheClusterMessage *)request;

/**
 <p>Deletes a previously provisioned cluster. <code>DeleteCacheCluster</code> deletes all associated cache nodes, node endpoints and the cluster itself. When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the cluster; you cannot cancel or revert this operation.</p><p>This operation is not valid for:</p><ul><li><p>Redis (cluster mode enabled) clusters</p></li><li><p>A cluster that is the last read replica of a replication group</p></li><li><p>A node group (shard) that has Multi-AZ mode enabled</p></li><li><p>A cluster from a Redis (cluster mode enabled) replication group</p></li><li><p>A cluster that is not in the <code>available</code> state</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteCacheCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheClusterMessage
 @see AWSElasticacheDeleteCacheClusterResult
 */
- (void)deleteCacheCluster:(AWSElasticacheDeleteCacheClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDeleteCacheClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is associated with any cache clusters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCacheParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheParameterGroupMessage
 */
- (AWSTask *)deleteCacheParameterGroup:(AWSElasticacheDeleteCacheParameterGroupMessage *)request;

/**
 <p>Deletes the specified cache parameter group. You cannot delete a cache parameter group if it is associated with any cache clusters.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCacheParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheParameterGroupMessage
 */
- (void)deleteCacheParameterGroup:(AWSElasticacheDeleteCacheParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a cache security group.</p><note><p>You cannot delete a cache security group if it is associated with any clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteCacheSecurityGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheSecurityGroupMessage
 */
- (AWSTask *)deleteCacheSecurityGroup:(AWSElasticacheDeleteCacheSecurityGroupMessage *)request;

/**
 <p>Deletes a cache security group.</p><note><p>You cannot delete a cache security group if it is associated with any clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteCacheSecurityGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteCacheSecurityGroupMessage
 */
- (void)deleteCacheSecurityGroup:(AWSElasticacheDeleteCacheSecurityGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a cache subnet group.</p><note><p>You cannot delete a cache subnet group if it is associated with any clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteCacheSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupInUse`, `AWSElasticacheErrorCacheSubnetGroupNotFound`.
 
 @see AWSElasticacheDeleteCacheSubnetGroupMessage
 */
- (AWSTask *)deleteCacheSubnetGroup:(AWSElasticacheDeleteCacheSubnetGroupMessage *)request;

/**
 <p>Deletes a cache subnet group.</p><note><p>You cannot delete a cache subnet group if it is associated with any clusters.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteCacheSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupInUse`, `AWSElasticacheErrorCacheSubnetGroupNotFound`.
 
 @see AWSElasticacheDeleteCacheSubnetGroupMessage
 */
- (void)deleteCacheSubnetGroup:(AWSElasticacheDeleteCacheSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deleting a Global Datastore is a two-step process: </p><ul><li><p>First, you must <a>DisassociateGlobalReplicationGroup</a> to remove the secondary clusters in the Global Datastore.</p></li><li><p>Once the Global Datastore contains only the primary cluster, you can use DeleteGlobalReplicationGroup API to delete the Global Datastore while retainining the primary cluster using Retain…= true.</p></li></ul><p>Since the Global Datastore has only a primary cluster, you can delete the Global Datastore while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p><p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDeleteGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheDeleteGlobalReplicationGroupMessage
 @see AWSElasticacheDeleteGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheDeleteGlobalReplicationGroupResult *> *)deleteGlobalReplicationGroup:(AWSElasticacheDeleteGlobalReplicationGroupMessage *)request;

/**
 <p>Deleting a Global Datastore is a two-step process: </p><ul><li><p>First, you must <a>DisassociateGlobalReplicationGroup</a> to remove the secondary clusters in the Global Datastore.</p></li><li><p>Once the Global Datastore contains only the primary cluster, you can use DeleteGlobalReplicationGroup API to delete the Global Datastore while retainining the primary cluster using Retain…= true.</p></li></ul><p>Since the Global Datastore has only a primary cluster, you can delete the Global Datastore while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p><p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p>
 
 @param request A container for the necessary parameters to execute the DeleteGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheDeleteGlobalReplicationGroupMessage
 @see AWSElasticacheDeleteGlobalReplicationGroupResult
 */
- (void)deleteGlobalReplicationGroup:(AWSElasticacheDeleteGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDeleteGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing replication group. By default, this operation deletes the entire replication group, including the primary/primaries and all of the read replicas. If the replication group has only one primary, you can optionally delete only the read replicas, while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p><p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDeleteReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteReplicationGroupMessage
 @see AWSElasticacheDeleteReplicationGroupResult
 */
- (AWSTask<AWSElasticacheDeleteReplicationGroupResult *> *)deleteReplicationGroup:(AWSElasticacheDeleteReplicationGroupMessage *)request;

/**
 <p>Deletes an existing replication group. By default, this operation deletes the entire replication group, including the primary/primaries and all of the read replicas. If the replication group has only one primary, you can optionally delete only the read replicas, while retaining the primary by setting <code>RetainPrimaryCluster=true</code>.</p><p>When you receive a successful response from this operation, Amazon ElastiCache immediately begins deleting the selected resources; you cannot cancel or revert this operation.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorSnapshotAlreadyExists`, `AWSElasticacheErrorSnapshotFeatureNotSupported`, `AWSElasticacheErrorSnapshotQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteReplicationGroupMessage
 @see AWSElasticacheDeleteReplicationGroupResult
 */
- (void)deleteReplicationGroup:(AWSElasticacheDeleteReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDeleteReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an existing snapshot. When you receive a successful response from this operation, ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this operation.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDeleteSnapshotResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidSnapshotState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteSnapshotMessage
 @see AWSElasticacheDeleteSnapshotResult
 */
- (AWSTask<AWSElasticacheDeleteSnapshotResult *> *)deleteSnapshot:(AWSElasticacheDeleteSnapshotMessage *)request;

/**
 <p>Deletes an existing snapshot. When you receive a successful response from this operation, ElastiCache immediately begins deleting the snapshot; you cannot cancel or revert this operation.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidSnapshotState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDeleteSnapshotMessage
 @see AWSElasticacheDeleteSnapshotResult
 */
- (void)deleteSnapshot:(AWSElasticacheDeleteSnapshotMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDeleteSnapshotResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about all provisioned clusters if no cluster identifier is specified, or about a specific cache cluster if a cluster identifier is supplied.</p><p>By default, abbreviated information about the clusters is returned. You can use the optional <i>ShowCacheNodeInfo</i> flag to retrieve detailed information about the cache nodes associated with the clusters. These details include the DNS address and port for the cache node endpoint.</p><p>If the cluster is in the <i>creating</i> state, only cluster-level information is displayed until all of the nodes are successfully provisioned.</p><p>If the cluster is in the <i>deleting</i> state, only cluster-level information is displayed.</p><p>If cache nodes are currently being added to the cluster, node endpoint information and creation time for the additional nodes are not displayed until they are completely provisioned. When the cluster state is <i>available</i>, the cluster is ready for use.</p><p>If cache nodes are currently being removed from the cluster, no endpoint information for the removed nodes is displayed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheClusterMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheClustersMessage
 @see AWSElasticacheCacheClusterMessage
 */
- (AWSTask<AWSElasticacheCacheClusterMessage *> *)describeCacheClusters:(AWSElasticacheDescribeCacheClustersMessage *)request;

/**
 <p>Returns information about all provisioned clusters if no cluster identifier is specified, or about a specific cache cluster if a cluster identifier is supplied.</p><p>By default, abbreviated information about the clusters is returned. You can use the optional <i>ShowCacheNodeInfo</i> flag to retrieve detailed information about the cache nodes associated with the clusters. These details include the DNS address and port for the cache node endpoint.</p><p>If the cluster is in the <i>creating</i> state, only cluster-level information is displayed until all of the nodes are successfully provisioned.</p><p>If the cluster is in the <i>deleting</i> state, only cluster-level information is displayed.</p><p>If cache nodes are currently being added to the cluster, node endpoint information and creation time for the additional nodes are not displayed until they are completely provisioned. When the cluster state is <i>available</i>, the cluster is ready for use.</p><p>If cache nodes are currently being removed from the cluster, no endpoint information for the removed nodes is displayed.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheClustersMessage
 @see AWSElasticacheCacheClusterMessage
 */
- (void)describeCacheClusters:(AWSElasticacheDescribeCacheClustersMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheClusterMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the available cache engines and their versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheEngineVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheEngineVersionMessage`.
 
 @see AWSElasticacheDescribeCacheEngineVersionsMessage
 @see AWSElasticacheCacheEngineVersionMessage
 */
- (AWSTask<AWSElasticacheCacheEngineVersionMessage *> *)describeCacheEngineVersions:(AWSElasticacheDescribeCacheEngineVersionsMessage *)request;

/**
 <p>Returns a list of the available cache engines and their versions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheEngineVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSElasticacheDescribeCacheEngineVersionsMessage
 @see AWSElasticacheCacheEngineVersionMessage
 */
- (void)describeCacheEngineVersions:(AWSElasticacheDescribeCacheEngineVersionsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheEngineVersionMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of cache parameter group descriptions. If a cache parameter group name is specified, the list contains only the descriptions for that group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheParameterGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheParameterGroupsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheParameterGroupsMessage
 @see AWSElasticacheCacheParameterGroupsMessage
 */
- (AWSTask<AWSElasticacheCacheParameterGroupsMessage *> *)describeCacheParameterGroups:(AWSElasticacheDescribeCacheParameterGroupsMessage *)request;

/**
 <p>Returns a list of cache parameter group descriptions. If a cache parameter group name is specified, the list contains only the descriptions for that group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheParameterGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheParameterGroupsMessage
 @see AWSElasticacheCacheParameterGroupsMessage
 */
- (void)describeCacheParameterGroups:(AWSElasticacheDescribeCacheParameterGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheParameterGroupsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the detailed parameter list for a particular cache parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheParameterGroupDetails`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheParametersMessage
 @see AWSElasticacheCacheParameterGroupDetails
 */
- (AWSTask<AWSElasticacheCacheParameterGroupDetails *> *)describeCacheParameters:(AWSElasticacheDescribeCacheParametersMessage *)request;

/**
 <p>Returns the detailed parameter list for a particular cache parameter group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheParametersMessage
 @see AWSElasticacheCacheParameterGroupDetails
 */
- (void)describeCacheParameters:(AWSElasticacheDescribeCacheParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheParameterGroupDetails * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of cache security group descriptions. If a cache security group name is specified, the list contains only the description of that group. This applicable only when you have ElastiCache in Classic setup </p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheSecurityGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheSecurityGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheSecurityGroupsMessage
 @see AWSElasticacheCacheSecurityGroupMessage
 */
- (AWSTask<AWSElasticacheCacheSecurityGroupMessage *> *)describeCacheSecurityGroups:(AWSElasticacheDescribeCacheSecurityGroupsMessage *)request;

/**
 <p>Returns a list of cache security group descriptions. If a cache security group name is specified, the list contains only the description of that group. This applicable only when you have ElastiCache in Classic setup </p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheSecurityGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeCacheSecurityGroupsMessage
 @see AWSElasticacheCacheSecurityGroupMessage
 */
- (void)describeCacheSecurityGroups:(AWSElasticacheDescribeCacheSecurityGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheSecurityGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheSubnetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheSubnetGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupNotFound`.
 
 @see AWSElasticacheDescribeCacheSubnetGroupsMessage
 @see AWSElasticacheCacheSubnetGroupMessage
 */
- (AWSTask<AWSElasticacheCacheSubnetGroupMessage *> *)describeCacheSubnetGroups:(AWSElasticacheDescribeCacheSubnetGroupsMessage *)request;

/**
 <p>Returns a list of cache subnet group descriptions. If a subnet group name is specified, the list contains only the description of that group. This is applicable only when you have ElastiCache in VPC setup. All ElastiCache clusters now launch in VPC by default. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCacheSubnetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupNotFound`.
 
 @see AWSElasticacheDescribeCacheSubnetGroupsMessage
 @see AWSElasticacheCacheSubnetGroupMessage
 */
- (void)describeCacheSubnetGroups:(AWSElasticacheDescribeCacheSubnetGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheSubnetGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the default engine and system parameter information for the specified cache engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDescribeEngineDefaultParametersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeEngineDefaultParametersMessage
 @see AWSElasticacheDescribeEngineDefaultParametersResult
 */
- (AWSTask<AWSElasticacheDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSElasticacheDescribeEngineDefaultParametersMessage *)request;

/**
 <p>Returns the default engine and system parameter information for the specified cache engine.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEngineDefaultParameters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeEngineDefaultParametersMessage
 @see AWSElasticacheDescribeEngineDefaultParametersResult
 */
- (void)describeEngineDefaultParameters:(AWSElasticacheDescribeEngineDefaultParametersMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDescribeEngineDefaultParametersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns events related to clusters, cache security groups, and cache parameter groups. You can obtain events specific to a particular cluster, cache security group, or cache parameter group by providing the name as a parameter.</p><p>By default, only the events occurring within the last hour are returned; however, you can retrieve up to 14 days' worth of events if necessary.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheEventsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeEventsMessage
 @see AWSElasticacheEventsMessage
 */
- (AWSTask<AWSElasticacheEventsMessage *> *)describeEvents:(AWSElasticacheDescribeEventsMessage *)request;

/**
 <p>Returns events related to clusters, cache security groups, and cache parameter groups. You can obtain events specific to a particular cluster, cache security group, or cache parameter group by providing the name as a parameter.</p><p>By default, only the events occurring within the last hour are returned; however, you can retrieve up to 14 days' worth of events if necessary.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeEventsMessage
 @see AWSElasticacheEventsMessage
 */
- (void)describeEvents:(AWSElasticacheDescribeEventsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheEventsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a particular global replication group. If no identifier is specified, returns information about all Global Datastores. </p>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalReplicationGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDescribeGlobalReplicationGroupsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeGlobalReplicationGroupsMessage
 @see AWSElasticacheDescribeGlobalReplicationGroupsResult
 */
- (AWSTask<AWSElasticacheDescribeGlobalReplicationGroupsResult *> *)describeGlobalReplicationGroups:(AWSElasticacheDescribeGlobalReplicationGroupsMessage *)request;

/**
 <p>Returns information about a particular global replication group. If no identifier is specified, returns information about all Global Datastores. </p>
 
 @param request A container for the necessary parameters to execute the DescribeGlobalReplicationGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeGlobalReplicationGroupsMessage
 @see AWSElasticacheDescribeGlobalReplicationGroupsResult
 */
- (void)describeGlobalReplicationGroups:(AWSElasticacheDescribeGlobalReplicationGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDescribeGlobalReplicationGroupsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a particular replication group. If no identifier is specified, <code>DescribeReplicationGroups</code> returns information about all replication groups.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheReplicationGroupMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReplicationGroupsMessage
 @see AWSElasticacheReplicationGroupMessage
 */
- (AWSTask<AWSElasticacheReplicationGroupMessage *> *)describeReplicationGroups:(AWSElasticacheDescribeReplicationGroupsMessage *)request;

/**
 <p>Returns information about a particular replication group. If no identifier is specified, <code>DescribeReplicationGroups</code> returns information about all replication groups.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeReplicationGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReplicationGroupsMessage
 @see AWSElasticacheReplicationGroupMessage
 */
- (void)describeReplicationGroups:(AWSElasticacheDescribeReplicationGroupsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheReplicationGroupMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about reserved cache nodes for this account, or about a specified reserved cache node.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedCacheNodes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheReservedCacheNodeMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodeNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReservedCacheNodesMessage
 @see AWSElasticacheReservedCacheNodeMessage
 */
- (AWSTask<AWSElasticacheReservedCacheNodeMessage *> *)describeReservedCacheNodes:(AWSElasticacheDescribeReservedCacheNodesMessage *)request;

/**
 <p>Returns information about reserved cache nodes for this account, or about a specified reserved cache node.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedCacheNodes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodeNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReservedCacheNodesMessage
 @see AWSElasticacheReservedCacheNodeMessage
 */
- (void)describeReservedCacheNodes:(AWSElasticacheDescribeReservedCacheNodesMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheReservedCacheNodeMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available reserved cache node offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedCacheNodesOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheReservedCacheNodesOfferingMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodesOfferingNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReservedCacheNodesOfferingsMessage
 @see AWSElasticacheReservedCacheNodesOfferingMessage
 */
- (AWSTask<AWSElasticacheReservedCacheNodesOfferingMessage *> *)describeReservedCacheNodesOfferings:(AWSElasticacheDescribeReservedCacheNodesOfferingsMessage *)request;

/**
 <p>Lists available reserved cache node offerings.</p>
 
 @param request A container for the necessary parameters to execute the DescribeReservedCacheNodesOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodesOfferingNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeReservedCacheNodesOfferingsMessage
 @see AWSElasticacheReservedCacheNodesOfferingMessage
 */
- (void)describeReservedCacheNodesOfferings:(AWSElasticacheDescribeReservedCacheNodesOfferingsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheReservedCacheNodesOfferingMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details of the service updates</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceUpdates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheServiceUpdatesMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeServiceUpdatesMessage
 @see AWSElasticacheServiceUpdatesMessage
 */
- (AWSTask<AWSElasticacheServiceUpdatesMessage *> *)describeServiceUpdates:(AWSElasticacheDescribeServiceUpdatesMessage *)request;

/**
 <p>Returns details of the service updates</p>
 
 @param request A container for the necessary parameters to execute the DescribeServiceUpdates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorServiceUpdateNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeServiceUpdatesMessage
 @see AWSElasticacheServiceUpdatesMessage
 */
- (void)describeServiceUpdates:(AWSElasticacheDescribeServiceUpdatesMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheServiceUpdatesMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about cluster or replication group snapshots. By default, <code>DescribeSnapshots</code> lists all of your snapshots; it can optionally describe a single snapshot, or just the snapshots associated with a particular cache cluster.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDescribeSnapshotsListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeSnapshotsMessage
 @see AWSElasticacheDescribeSnapshotsListMessage
 */
- (AWSTask<AWSElasticacheDescribeSnapshotsListMessage *> *)describeSnapshots:(AWSElasticacheDescribeSnapshotsMessage *)request;

/**
 <p>Returns information about cluster or replication group snapshots. By default, <code>DescribeSnapshots</code> lists all of your snapshots; it can optionally describe a single snapshot, or just the snapshots associated with a particular cache cluster.</p><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshots service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeSnapshotsMessage
 @see AWSElasticacheDescribeSnapshotsListMessage
 */
- (void)describeSnapshots:(AWSElasticacheDescribeSnapshotsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDescribeSnapshotsListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details of the update actions </p>
 
 @param request A container for the necessary parameters to execute the DescribeUpdateActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheUpdateActionsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeUpdateActionsMessage
 @see AWSElasticacheUpdateActionsMessage
 */
- (AWSTask<AWSElasticacheUpdateActionsMessage *> *)describeUpdateActions:(AWSElasticacheDescribeUpdateActionsMessage *)request;

/**
 <p>Returns details of the update actions </p>
 
 @param request A container for the necessary parameters to execute the DescribeUpdateActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDescribeUpdateActionsMessage
 @see AWSElasticacheUpdateActionsMessage
 */
- (void)describeUpdateActions:(AWSElasticacheDescribeUpdateActionsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheUpdateActionsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Remove a secondary cluster from the Global Datastore using the Global Datastore name. The secondary cluster will no longer receive updates from the primary cluster, but will remain as a standalone cluster in that AWS region.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheDisassociateGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDisassociateGlobalReplicationGroupMessage
 @see AWSElasticacheDisassociateGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheDisassociateGlobalReplicationGroupResult *> *)disassociateGlobalReplicationGroup:(AWSElasticacheDisassociateGlobalReplicationGroupMessage *)request;

/**
 <p>Remove a secondary cluster from the Global Datastore using the Global Datastore name. The secondary cluster will no longer receive updates from the primary cluster, but will remain as a standalone cluster in that AWS region.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheDisassociateGlobalReplicationGroupMessage
 @see AWSElasticacheDisassociateGlobalReplicationGroupResult
 */
- (void)disassociateGlobalReplicationGroup:(AWSElasticacheDisassociateGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheDisassociateGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Used to failover the primary region to a selected secondary region. The selected secondary region will be come primary, and all other clusters will become secondary.</p>
 
 @param request A container for the necessary parameters to execute the FailoverGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheFailoverGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheFailoverGlobalReplicationGroupMessage
 @see AWSElasticacheFailoverGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheFailoverGlobalReplicationGroupResult *> *)failoverGlobalReplicationGroup:(AWSElasticacheFailoverGlobalReplicationGroupMessage *)request;

/**
 <p>Used to failover the primary region to a selected secondary region. The selected secondary region will be come primary, and all other clusters will become secondary.</p>
 
 @param request A container for the necessary parameters to execute the FailoverGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheFailoverGlobalReplicationGroupMessage
 @see AWSElasticacheFailoverGlobalReplicationGroupResult
 */
- (void)failoverGlobalReplicationGroup:(AWSElasticacheFailoverGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheFailoverGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Increase the number of node groups in the Global Datastore</p>
 
 @param request A container for the necessary parameters to execute the IncreaseNodeGroupsInGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage
 @see AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult *> *)increaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage *)request;

/**
 <p>Increase the number of node groups in the Global Datastore</p>
 
 @param request A container for the necessary parameters to execute the IncreaseNodeGroupsInGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage
 @see AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult
 */
- (void)increaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Dynamically increases the number of replics in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>
 
 @param request A container for the necessary parameters to execute the IncreaseReplicaCount service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheIncreaseReplicaCountResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorNoOperation`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheIncreaseReplicaCountMessage
 @see AWSElasticacheIncreaseReplicaCountResult
 */
- (AWSTask<AWSElasticacheIncreaseReplicaCountResult *> *)increaseReplicaCount:(AWSElasticacheIncreaseReplicaCountMessage *)request;

/**
 <p>Dynamically increases the number of replics in a Redis (cluster mode disabled) replication group or the number of replica nodes in one or more node groups (shards) of a Redis (cluster mode enabled) replication group. This operation is performed with no cluster down time.</p>
 
 @param request A container for the necessary parameters to execute the IncreaseReplicaCount service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorClusterQuotaForCustomerExceeded`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorNoOperation`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheIncreaseReplicaCountMessage
 @see AWSElasticacheIncreaseReplicaCountResult
 */
- (void)increaseReplicaCount:(AWSElasticacheIncreaseReplicaCountMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheIncreaseReplicaCountResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all available node types that you can scale your Redis cluster's or replication group's current node type.</p><p>When you use the <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code> operations to scale your cluster or replication group, the value of the <code>CacheNodeType</code> parameter must be one of the node types returned by this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListAllowedNodeTypeModifications service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheAllowedNodeTypeModificationsMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheListAllowedNodeTypeModificationsMessage
 @see AWSElasticacheAllowedNodeTypeModificationsMessage
 */
- (AWSTask<AWSElasticacheAllowedNodeTypeModificationsMessage *> *)listAllowedNodeTypeModifications:(AWSElasticacheListAllowedNodeTypeModificationsMessage *)request;

/**
 <p>Lists all available node types that you can scale your Redis cluster's or replication group's current node type.</p><p>When you use the <code>ModifyCacheCluster</code> or <code>ModifyReplicationGroup</code> operations to scale your cluster or replication group, the value of the <code>CacheNodeType</code> parameter must be one of the node types returned by this operation.</p>
 
 @param request A container for the necessary parameters to execute the ListAllowedNodeTypeModifications service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheListAllowedNodeTypeModificationsMessage
 @see AWSElasticacheAllowedNodeTypeModificationsMessage
 */
- (void)listAllowedNodeTypeModifications:(AWSElasticacheListAllowedNodeTypeModificationsMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheAllowedNodeTypeModificationsMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all cost allocation tags currently on the named resource. A <code>cost allocation tag</code> is a key-value pair where the key is case-sensitive and the value is optional. You can use cost allocation tags to categorize and track your AWS costs.</p><p>If the cluster is not in the <i>available</i> state, <code>ListTagsForResource</code> returns an error.</p><p>You can have a maximum of 50 cost allocation tags on an ElastiCache resource. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Monitoring Costs with Tags</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheTagListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidARN`.
 
 @see AWSElasticacheListTagsForResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (AWSTask<AWSElasticacheTagListMessage *> *)listTagsForResource:(AWSElasticacheListTagsForResourceMessage *)request;

/**
 <p>Lists all cost allocation tags currently on the named resource. A <code>cost allocation tag</code> is a key-value pair where the key is case-sensitive and the value is optional. You can use cost allocation tags to categorize and track your AWS costs.</p><p>If the cluster is not in the <i>available</i> state, <code>ListTagsForResource</code> returns an error.</p><p>You can have a maximum of 50 cost allocation tags on an ElastiCache resource. For more information, see <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Tagging.html">Monitoring Costs with Tags</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidARN`.
 
 @see AWSElasticacheListTagsForResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (void)listTagsForResource:(AWSElasticacheListTagsForResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheTagListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a cluster. You can use this operation to change one or more cluster configuration parameters by specifying the parameters and the new values.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheModifyCacheClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyCacheClusterMessage
 @see AWSElasticacheModifyCacheClusterResult
 */
- (AWSTask<AWSElasticacheModifyCacheClusterResult *> *)modifyCacheCluster:(AWSElasticacheModifyCacheClusterMessage *)request;

/**
 <p>Modifies the settings for a cluster. You can use this operation to change one or more cluster configuration parameters by specifying the parameters and the new values.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyCacheClusterMessage
 @see AWSElasticacheModifyCacheClusterResult
 */
- (void)modifyCacheCluster:(AWSElasticacheModifyCacheClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheModifyCacheClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`.
 
 @see AWSElasticacheModifyCacheParameterGroupMessage
 @see AWSElasticacheCacheParameterGroupNameMessage
 */
- (AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> *)modifyCacheParameterGroup:(AWSElasticacheModifyCacheParameterGroupMessage *)request;

/**
 <p>Modifies the parameters of a cache parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`.
 
 @see AWSElasticacheModifyCacheParameterGroupMessage
 @see AWSElasticacheCacheParameterGroupNameMessage
 */
- (void)modifyCacheParameterGroup:(AWSElasticacheModifyCacheParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies an existing cache subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheSubnetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheModifyCacheSubnetGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorCacheSubnetQuotaExceeded`, `AWSElasticacheErrorSubnetInUse`, `AWSElasticacheErrorInvalidSubnet`.
 
 @see AWSElasticacheModifyCacheSubnetGroupMessage
 @see AWSElasticacheModifyCacheSubnetGroupResult
 */
- (AWSTask<AWSElasticacheModifyCacheSubnetGroupResult *> *)modifyCacheSubnetGroup:(AWSElasticacheModifyCacheSubnetGroupMessage *)request;

/**
 <p>Modifies an existing cache subnet group.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCacheSubnetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSubnetGroupNotFound`, `AWSElasticacheErrorCacheSubnetQuotaExceeded`, `AWSElasticacheErrorSubnetInUse`, `AWSElasticacheErrorInvalidSubnet`.
 
 @see AWSElasticacheModifyCacheSubnetGroupMessage
 @see AWSElasticacheModifyCacheSubnetGroupResult
 */
- (void)modifyCacheSubnetGroup:(AWSElasticacheModifyCacheSubnetGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheModifyCacheSubnetGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a Global Datastore.</p>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheModifyGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheModifyGlobalReplicationGroupMessage
 @see AWSElasticacheModifyGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheModifyGlobalReplicationGroupResult *> *)modifyGlobalReplicationGroup:(AWSElasticacheModifyGlobalReplicationGroupMessage *)request;

/**
 <p>Modifies the settings for a Global Datastore.</p>
 
 @param request A container for the necessary parameters to execute the ModifyGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheModifyGlobalReplicationGroupMessage
 @see AWSElasticacheModifyGlobalReplicationGroupResult
 */
- (void)modifyGlobalReplicationGroup:(AWSElasticacheModifyGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheModifyGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the settings for a replication group.</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html">Scaling for Amazon ElastiCache for Redis (cluster mode enabled)</a> in the ElastiCache User Guide</p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html">ModifyReplicationGroupShardConfiguration</a> in the ElastiCache API Reference</p></li></ul><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheModifyReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyReplicationGroupMessage
 @see AWSElasticacheModifyReplicationGroupResult
 */
- (AWSTask<AWSElasticacheModifyReplicationGroupResult *> *)modifyReplicationGroup:(AWSElasticacheModifyReplicationGroupMessage *)request;

/**
 <p>Modifies the settings for a replication group.</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/scaling-redis-cluster-mode-enabled.html">Scaling for Amazon ElastiCache for Redis (cluster mode enabled)</a> in the ElastiCache User Guide</p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_ModifyReplicationGroupShardConfiguration.html">ModifyReplicationGroupShardConfiguration</a> in the ElastiCache API Reference</p></li></ul><note><p>This operation is valid for Redis only.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorNodeQuotaForClusterExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyReplicationGroupMessage
 @see AWSElasticacheModifyReplicationGroupResult
 */
- (void)modifyReplicationGroup:(AWSElasticacheModifyReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheModifyReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies a replication group's shards (node groups) by allowing you to add shards, remove shards, or rebalance the keyspaces among exisiting shards.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationGroupShardConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheModifyReplicationGroupShardConfigurationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyReplicationGroupShardConfigurationMessage
 @see AWSElasticacheModifyReplicationGroupShardConfigurationResult
 */
- (AWSTask<AWSElasticacheModifyReplicationGroupShardConfigurationResult *> *)modifyReplicationGroupShardConfiguration:(AWSElasticacheModifyReplicationGroupShardConfigurationMessage *)request;

/**
 <p>Modifies a replication group's shards (node groups) by allowing you to add shards, remove shards, or rebalance the keyspaces among exisiting shards.</p>
 
 @param request A container for the necessary parameters to execute the ModifyReplicationGroupShardConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidVPCNetworkState`, `AWSElasticacheErrorInsufficientCacheClusterCapacity`, `AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded`, `AWSElasticacheErrorNodeQuotaForCustomerExceeded`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheModifyReplicationGroupShardConfigurationMessage
 @see AWSElasticacheModifyReplicationGroupShardConfigurationResult
 */
- (void)modifyReplicationGroupShardConfiguration:(AWSElasticacheModifyReplicationGroupShardConfigurationMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheModifyReplicationGroupShardConfigurationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Allows you to purchase a reserved cache node offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedCacheNodesOffering service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticachePurchaseReservedCacheNodesOfferingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodesOfferingNotFound`, `AWSElasticacheErrorReservedCacheNodeAlreadyExists`, `AWSElasticacheErrorReservedCacheNodeQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticachePurchaseReservedCacheNodesOfferingMessage
 @see AWSElasticachePurchaseReservedCacheNodesOfferingResult
 */
- (AWSTask<AWSElasticachePurchaseReservedCacheNodesOfferingResult *> *)purchaseReservedCacheNodesOffering:(AWSElasticachePurchaseReservedCacheNodesOfferingMessage *)request;

/**
 <p>Allows you to purchase a reserved cache node offering.</p>
 
 @param request A container for the necessary parameters to execute the PurchaseReservedCacheNodesOffering service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReservedCacheNodesOfferingNotFound`, `AWSElasticacheErrorReservedCacheNodeAlreadyExists`, `AWSElasticacheErrorReservedCacheNodeQuotaExceeded`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticachePurchaseReservedCacheNodesOfferingMessage
 @see AWSElasticachePurchaseReservedCacheNodesOfferingResult
 */
- (void)purchaseReservedCacheNodesOffering:(AWSElasticachePurchaseReservedCacheNodesOfferingMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticachePurchaseReservedCacheNodesOfferingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Redistribute slots to ensure uniform distribution across existing shards in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the RebalanceSlotsInGlobalReplicationGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage
 @see AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult
 */
- (AWSTask<AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult *> *)rebalanceSlotsInGlobalReplicationGroup:(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage *)request;

/**
 <p>Redistribute slots to ensure uniform distribution across existing shards in the cluster.</p>
 
 @param request A container for the necessary parameters to execute the RebalanceSlotsInGlobalReplicationGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorGlobalReplicationGroupNotFound`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage
 @see AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult
 */
- (void)rebalanceSlotsInGlobalReplicationGroup:(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any modified cache parameter groups to the cluster. The reboot operation takes place as soon as possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is set to REBOOTING.</p><p>The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.</p><p>When the reboot is complete, a cluster event is created.</p><p>Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled) clusters.</p><p>If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied, see <a href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting a Cluster</a> for an alternate process.</p>
 
 @param request A container for the necessary parameters to execute the RebootCacheCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheRebootCacheClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorCacheClusterNotFound`.
 
 @see AWSElasticacheRebootCacheClusterMessage
 @see AWSElasticacheRebootCacheClusterResult
 */
- (AWSTask<AWSElasticacheRebootCacheClusterResult *> *)rebootCacheCluster:(AWSElasticacheRebootCacheClusterMessage *)request;

/**
 <p>Reboots some, or all, of the cache nodes within a provisioned cluster. This operation applies any modified cache parameter groups to the cluster. The reboot operation takes place as soon as possible, and results in a momentary outage to the cluster. During the reboot, the cluster status is set to REBOOTING.</p><p>The reboot causes the contents of the cache (for each cache node being rebooted) to be lost.</p><p>When the reboot is complete, a cluster event is created.</p><p>Rebooting a cluster is currently supported on Memcached and Redis (cluster mode disabled) clusters. Rebooting is not supported on Redis (cluster mode enabled) clusters.</p><p>If you make changes to parameters that require a Redis (cluster mode enabled) cluster reboot for the changes to be applied, see <a href="http://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Rebooting.html">Rebooting a Cluster</a> for an alternate process.</p>
 
 @param request A container for the necessary parameters to execute the RebootCacheCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorCacheClusterNotFound`.
 
 @see AWSElasticacheRebootCacheClusterMessage
 @see AWSElasticacheRebootCacheClusterResult
 */
- (void)rebootCacheCluster:(AWSElasticacheRebootCacheClusterMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheRebootCacheClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the tags identified by the <code>TagKeys</code> list from the named resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheTagListMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidARN`, `AWSElasticacheErrorTagNotFound`.
 
 @see AWSElasticacheRemoveTagsFromResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (AWSTask<AWSElasticacheTagListMessage *> *)removeTagsFromResource:(AWSElasticacheRemoveTagsFromResourceMessage *)request;

/**
 <p>Removes the tags identified by the <code>TagKeys</code> list from the named resource.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheClusterNotFound`, `AWSElasticacheErrorSnapshotNotFound`, `AWSElasticacheErrorInvalidARN`, `AWSElasticacheErrorTagNotFound`.
 
 @see AWSElasticacheRemoveTagsFromResourceMessage
 @see AWSElasticacheTagListMessage
 */
- (void)removeTagsFromResource:(AWSElasticacheRemoveTagsFromResourceMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheTagListMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the parameters of a cache parameter group to the engine or system default value. You can reset specific parameters by submitting a list of parameter names. To reset the entire cache parameter group, specify the <code>ResetAllParameters</code> and <code>CacheParameterGroupName</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the ResetCacheParameterGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheCacheParameterGroupNameMessage`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`.
 
 @see AWSElasticacheResetCacheParameterGroupMessage
 @see AWSElasticacheCacheParameterGroupNameMessage
 */
- (AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> *)resetCacheParameterGroup:(AWSElasticacheResetCacheParameterGroupMessage *)request;

/**
 <p>Modifies the parameters of a cache parameter group to the engine or system default value. You can reset specific parameters by submitting a list of parameter names. To reset the entire cache parameter group, specify the <code>ResetAllParameters</code> and <code>CacheParameterGroupName</code> parameters.</p>
 
 @param request A container for the necessary parameters to execute the ResetCacheParameterGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorInvalidCacheParameterGroupState`, `AWSElasticacheErrorCacheParameterGroupNotFound`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`, `AWSElasticacheErrorInvalidGlobalReplicationGroupState`.
 
 @see AWSElasticacheResetCacheParameterGroupMessage
 @see AWSElasticacheCacheParameterGroupNameMessage
 */
- (void)resetCacheParameterGroup:(AWSElasticacheResetCacheParameterGroupMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheCacheParameterGroupNameMessage * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Revokes ingress from a cache security group. Use this operation to disallow access from an Amazon EC2 security group that had been previously authorized.</p>
 
 @param request A container for the necessary parameters to execute the RevokeCacheSecurityGroupIngress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheRevokeCacheSecurityGroupIngressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorAuthorizationNotFound`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheRevokeCacheSecurityGroupIngressMessage
 @see AWSElasticacheRevokeCacheSecurityGroupIngressResult
 */
- (AWSTask<AWSElasticacheRevokeCacheSecurityGroupIngressResult *> *)revokeCacheSecurityGroupIngress:(AWSElasticacheRevokeCacheSecurityGroupIngressMessage *)request;

/**
 <p>Revokes ingress from a cache security group. Use this operation to disallow access from an Amazon EC2 security group that had been previously authorized.</p>
 
 @param request A container for the necessary parameters to execute the RevokeCacheSecurityGroupIngress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorCacheSecurityGroupNotFound`, `AWSElasticacheErrorAuthorizationNotFound`, `AWSElasticacheErrorInvalidCacheSecurityGroupState`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheRevokeCacheSecurityGroupIngressMessage
 @see AWSElasticacheRevokeCacheSecurityGroupIngressResult
 */
- (void)revokeCacheSecurityGroupIngress:(AWSElasticacheRevokeCacheSecurityGroupIngressMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheRevokeCacheSecurityGroupIngressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Start the migration of data.</p>
 
 @param request A container for the necessary parameters to execute the StartMigration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheStartMigrationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorReplicationGroupAlreadyUnderMigration`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheStartMigrationMessage
 @see AWSElasticacheStartMigrationResponse
 */
- (AWSTask<AWSElasticacheStartMigrationResponse *> *)startMigration:(AWSElasticacheStartMigrationMessage *)request;

/**
 <p>Start the migration of data.</p>
 
 @param request A container for the necessary parameters to execute the StartMigration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorReplicationGroupAlreadyUnderMigration`, `AWSElasticacheErrorInvalidParameterValue`.
 
 @see AWSElasticacheStartMigrationMessage
 @see AWSElasticacheStartMigrationResponse
 */
- (void)startMigration:(AWSElasticacheStartMigrationMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheStartMigrationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Represents the input of a <code>TestFailover</code> operation which test automatic failover on a specified node group (called shard in the console) in a replication group (called cluster in the console).</p><p class="title"><b>Note the following</b></p><ul><li><p>A customer can use this operation to test automatic failover on up to 5 shards (called node groups in the ElastiCache API and AWS CLI) in any rolling 24-hour period.</p></li><li><p>If calling this operation on shards in different clusters (called replication groups in the API and CLI), the calls can be made concurrently.</p><p></p></li><li><p>If calling this operation multiple times on different shards in the same Redis (cluster mode enabled) replication group, the first node replacement must complete before a subsequent call can be made.</p></li><li><p>To determine whether the node replacement is complete you can check Events using the Amazon ElastiCache console, the AWS CLI, or the ElastiCache API. Look for the following automatic failover related events, listed here in order of occurrance:</p><ol><li><p>Replication group message: <code>Test Failover API called for node group &lt;node-group-id&gt;</code></p></li><li><p>Cache cluster message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code></p></li><li><p>Replication group message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code></p></li><li><p>Cache cluster message: <code>Recovering cache nodes &lt;node-id&gt;</code></p></li><li><p>Cache cluster message: <code>Finished recovery for cache nodes &lt;node-id&gt;</code></p></li></ol><p>For more information see:</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html">Viewing ElastiCache Events</a> in the <i>ElastiCache User Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html">DescribeEvents</a> in the ElastiCache API Reference</p></li></ul></li></ul><p>Also see, <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test">Testing Multi-AZ with Automatic Failover</a> in the <i>ElastiCache User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TestFailover service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSElasticacheTestFailoverResult`. On failed execution, `task.error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorAPICallRateForCustomerExceeded`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorNodeGroupNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorTestFailoverNotAvailable`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheTestFailoverMessage
 @see AWSElasticacheTestFailoverResult
 */
- (AWSTask<AWSElasticacheTestFailoverResult *> *)testFailover:(AWSElasticacheTestFailoverMessage *)request;

/**
 <p>Represents the input of a <code>TestFailover</code> operation which test automatic failover on a specified node group (called shard in the console) in a replication group (called cluster in the console).</p><p class="title"><b>Note the following</b></p><ul><li><p>A customer can use this operation to test automatic failover on up to 5 shards (called node groups in the ElastiCache API and AWS CLI) in any rolling 24-hour period.</p></li><li><p>If calling this operation on shards in different clusters (called replication groups in the API and CLI), the calls can be made concurrently.</p><p></p></li><li><p>If calling this operation multiple times on different shards in the same Redis (cluster mode enabled) replication group, the first node replacement must complete before a subsequent call can be made.</p></li><li><p>To determine whether the node replacement is complete you can check Events using the Amazon ElastiCache console, the AWS CLI, or the ElastiCache API. Look for the following automatic failover related events, listed here in order of occurrance:</p><ol><li><p>Replication group message: <code>Test Failover API called for node group &lt;node-group-id&gt;</code></p></li><li><p>Cache cluster message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code></p></li><li><p>Replication group message: <code>Failover from master node &lt;primary-node-id&gt; to replica node &lt;node-id&gt; completed</code></p></li><li><p>Cache cluster message: <code>Recovering cache nodes &lt;node-id&gt;</code></p></li><li><p>Cache cluster message: <code>Finished recovery for cache nodes &lt;node-id&gt;</code></p></li></ol><p>For more information see:</p><ul><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ECEvents.Viewing.html">Viewing ElastiCache Events</a> in the <i>ElastiCache User Guide</i></p></li><li><p><a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_DescribeEvents.html">DescribeEvents</a> in the ElastiCache API Reference</p></li></ul></li></ul><p>Also see, <a href="https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/AutoFailover.html#auto-failover-test">Testing Multi-AZ with Automatic Failover</a> in the <i>ElastiCache User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TestFailover service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSElasticacheErrorDomain` domain and the following error code: `AWSElasticacheErrorAPICallRateForCustomerExceeded`, `AWSElasticacheErrorInvalidCacheClusterState`, `AWSElasticacheErrorInvalidReplicationGroupState`, `AWSElasticacheErrorNodeGroupNotFound`, `AWSElasticacheErrorReplicationGroupNotFound`, `AWSElasticacheErrorTestFailoverNotAvailable`, `AWSElasticacheErrorInvalidKMSKey`, `AWSElasticacheErrorInvalidParameterValue`, `AWSElasticacheErrorInvalidParameterCombination`.
 
 @see AWSElasticacheTestFailoverMessage
 @see AWSElasticacheTestFailoverResult
 */
- (void)testFailover:(AWSElasticacheTestFailoverMessage *)request completionHandler:(void (^ _Nullable)(AWSElasticacheTestFailoverResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
