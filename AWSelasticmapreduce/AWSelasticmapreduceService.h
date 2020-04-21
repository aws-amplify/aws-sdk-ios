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
#import "AWSelasticmapreduceModel.h"
#import "AWSelasticmapreduceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSelasticmapreduce
FOUNDATION_EXPORT NSString *const AWSelasticmapreduceSDKVersion;

/**
 <p>Amazon EMR is a web service that makes it easy to process large amounts of data efficiently. Amazon EMR uses Hadoop processing combined with several AWS products to do tasks such as web indexing, data mining, log file analysis, machine learning, scientific simulation, and data warehousing.</p>
 */
@interface AWSelasticmapreduce : AWSService

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

     let elasticmapreduce = AWSelasticmapreduce.default()

 *Objective-C*

     AWSelasticmapreduce *elasticmapreduce = [AWSelasticmapreduce defaultelasticmapreduce];

 @return The default service client.
 */
+ (instancetype)defaultelasticmapreduce;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSelasticmapreduce.register(with: configuration!, forKey: "USWest2elasticmapreduce")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:@"USWest2elasticmapreduce"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let elasticmapreduce = AWSelasticmapreduce(forKey: "USWest2elasticmapreduce")

 *Objective-C*

     AWSelasticmapreduce *elasticmapreduce = [AWSelasticmapreduce elasticmapreduceForKey:@"USWest2elasticmapreduce"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerelasticmapreduceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerelasticmapreduceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSelasticmapreduce.register(with: configuration!, forKey: "USWest2elasticmapreduce")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:@"USWest2elasticmapreduce"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let elasticmapreduce = AWSelasticmapreduce(forKey: "USWest2elasticmapreduce")

 *Objective-C*

     AWSelasticmapreduce *elasticmapreduce = [AWSelasticmapreduce elasticmapreduceForKey:@"USWest2elasticmapreduce"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)elasticmapreduceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeelasticmapreduceForKey:(NSString *)key;

/**
 <p>Adds an instance fleet to a running cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x.</p></note>
 
 @param request A container for the necessary parameters to execute the AddInstanceFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceAddInstanceFleetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceAddInstanceFleetInput
 @see AWSelasticmapreduceAddInstanceFleetOutput
 */
- (AWSTask<AWSelasticmapreduceAddInstanceFleetOutput *> *)addInstanceFleet:(AWSelasticmapreduceAddInstanceFleetInput *)request;

/**
 <p>Adds an instance fleet to a running cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x.</p></note>
 
 @param request A container for the necessary parameters to execute the AddInstanceFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceAddInstanceFleetInput
 @see AWSelasticmapreduceAddInstanceFleetOutput
 */
- (void)addInstanceFleet:(AWSelasticmapreduceAddInstanceFleetInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceAddInstanceFleetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more instance groups to a running cluster.</p>
 
 @param request A container for the necessary parameters to execute the AddInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceAddInstanceGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceAddInstanceGroupsInput
 @see AWSelasticmapreduceAddInstanceGroupsOutput
 */
- (AWSTask<AWSelasticmapreduceAddInstanceGroupsOutput *> *)addInstanceGroups:(AWSelasticmapreduceAddInstanceGroupsInput *)request;

/**
 <p>Adds one or more instance groups to a running cluster.</p>
 
 @param request A container for the necessary parameters to execute the AddInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceAddInstanceGroupsInput
 @see AWSelasticmapreduceAddInstanceGroupsOutput
 */
- (void)addInstanceGroups:(AWSelasticmapreduceAddInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceAddInstanceGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using SSH to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>A step specifies the location of a JAR file stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. The main class can be specified either in the manifest of the JAR or by using the MainFunction parameter of the step.</p><p>Amazon EMR executes each step in the order listed. For a step to be considered complete, the main function must exit with a zero exit code and all Hadoop jobs started while the step was running must have completed and run successfully.</p><p>You can only add steps to a cluster that is in one of the following states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.</p>
 
 @param request A container for the necessary parameters to execute the AddJobFlowSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceAddJobFlowStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceAddJobFlowStepsInput
 @see AWSelasticmapreduceAddJobFlowStepsOutput
 */
- (AWSTask<AWSelasticmapreduceAddJobFlowStepsOutput *> *)addJobFlowSteps:(AWSelasticmapreduceAddJobFlowStepsInput *)request;

/**
 <p>AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using SSH to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>A step specifies the location of a JAR file stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. The main class can be specified either in the manifest of the JAR or by using the MainFunction parameter of the step.</p><p>Amazon EMR executes each step in the order listed. For a step to be considered complete, the main function must exit with a zero exit code and all Hadoop jobs started while the step was running must have completed and run successfully.</p><p>You can only add steps to a cluster that is in one of the following states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.</p>
 
 @param request A container for the necessary parameters to execute the AddJobFlowSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceAddJobFlowStepsInput
 @see AWSelasticmapreduceAddJobFlowStepsOutput
 */
- (void)addJobFlowSteps:(AWSelasticmapreduceAddJobFlowStepsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceAddJobFlowStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceAddTagsInput
 @see AWSelasticmapreduceAddTagsOutput
 */
- (AWSTask<AWSelasticmapreduceAddTagsOutput *> *)addTags:(AWSelasticmapreduceAddTagsInput *)request;

/**
 <p>Adds tags to an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceAddTagsInput
 @see AWSelasticmapreduceAddTagsOutput
 */
- (void)addTags:(AWSelasticmapreduceAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee a step will be canceled, even if the request is successfully submitted. You can only cancel steps that are in a <code>PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceCancelStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceCancelStepsInput
 @see AWSelasticmapreduceCancelStepsOutput
 */
- (AWSTask<AWSelasticmapreduceCancelStepsOutput *> *)cancelSteps:(AWSelasticmapreduceCancelStepsInput *)request;

/**
 <p>Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee a step will be canceled, even if the request is successfully submitted. You can only cancel steps that are in a <code>PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceCancelStepsInput
 @see AWSelasticmapreduceCancelStepsOutput
 */
- (void)cancelSteps:(AWSelasticmapreduceCancelStepsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceCancelStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a security configuration, which is stored in the service and can be specified when a cluster is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceCreateSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceCreateSecurityConfigurationInput
 @see AWSelasticmapreduceCreateSecurityConfigurationOutput
 */
- (AWSTask<AWSelasticmapreduceCreateSecurityConfigurationOutput *> *)createSecurityConfiguration:(AWSelasticmapreduceCreateSecurityConfigurationInput *)request;

/**
 <p>Creates a security configuration, which is stored in the service and can be specified when a cluster is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceCreateSecurityConfigurationInput
 @see AWSelasticmapreduceCreateSecurityConfigurationOutput
 */
- (void)createSecurityConfiguration:(AWSelasticmapreduceCreateSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceCreateSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceDeleteSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDeleteSecurityConfigurationInput
 @see AWSelasticmapreduceDeleteSecurityConfigurationOutput
 */
- (AWSTask<AWSelasticmapreduceDeleteSecurityConfigurationOutput *> *)deleteSecurityConfiguration:(AWSelasticmapreduceDeleteSecurityConfigurationInput *)request;

/**
 <p>Deletes a security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDeleteSecurityConfigurationInput
 @see AWSelasticmapreduceDeleteSecurityConfigurationOutput
 */
- (void)deleteSecurityConfiguration:(AWSelasticmapreduceDeleteSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceDeleteSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides cluster-level details including status, hardware and software configuration, VPC settings, and so on. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceDescribeClusterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeClusterInput
 @see AWSelasticmapreduceDescribeClusterOutput
 */
- (AWSTask<AWSelasticmapreduceDescribeClusterOutput *> *)describeCluster:(AWSelasticmapreduceDescribeClusterInput *)request;

/**
 <p>Provides cluster-level details including status, hardware and software configuration, VPC settings, and so on. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeClusterInput
 @see AWSelasticmapreduceDescribeClusterOutput
 */
- (void)describeCluster:(AWSelasticmapreduceDescribeClusterInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceDescribeClusterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is deprecated and will eventually be removed. We recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>, <a>ListSteps</a>, <a>ListInstanceGroups</a> and <a>ListBootstrapActions</a> instead.</p><p>DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The parameters can include a list of job flow IDs, job flow states, and restrictions on job flow creation date and time.</p><p>Regardless of supplied parameters, only job flows created within the last two months are returned.</p><p>If no parameters are supplied, then job flows matching either of the following criteria are returned:</p><ul><li><p>Job flows created and completed in the last two weeks</p></li><li><p> Job flows created within the last two months that are in one of the following states: <code>RUNNING</code>, <code>WAITING</code>, <code>SHUTTING_DOWN</code>, <code>STARTING</code></p></li></ul><p>Amazon EMR can return a maximum of 512 job flow descriptions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJobFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceDescribeJobFlowsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceDescribeJobFlowsInput
 @see AWSelasticmapreduceDescribeJobFlowsOutput
 */
- (AWSTask<AWSelasticmapreduceDescribeJobFlowsOutput *> *)describeJobFlows:(AWSelasticmapreduceDescribeJobFlowsInput *)request;

/**
 <p>This API is deprecated and will eventually be removed. We recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>, <a>ListSteps</a>, <a>ListInstanceGroups</a> and <a>ListBootstrapActions</a> instead.</p><p>DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The parameters can include a list of job flow IDs, job flow states, and restrictions on job flow creation date and time.</p><p>Regardless of supplied parameters, only job flows created within the last two months are returned.</p><p>If no parameters are supplied, then job flows matching either of the following criteria are returned:</p><ul><li><p>Job flows created and completed in the last two weeks</p></li><li><p> Job flows created within the last two months that are in one of the following states: <code>RUNNING</code>, <code>WAITING</code>, <code>SHUTTING_DOWN</code>, <code>STARTING</code></p></li></ul><p>Amazon EMR can return a maximum of 512 job flow descriptions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJobFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceDescribeJobFlowsInput
 @see AWSelasticmapreduceDescribeJobFlowsOutput
 */
- (void)describeJobFlows:(AWSelasticmapreduceDescribeJobFlowsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceDescribeJobFlowsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details of a security configuration by returning the configuration JSON.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceDescribeSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeSecurityConfigurationInput
 @see AWSelasticmapreduceDescribeSecurityConfigurationOutput
 */
- (AWSTask<AWSelasticmapreduceDescribeSecurityConfigurationOutput *> *)describeSecurityConfiguration:(AWSelasticmapreduceDescribeSecurityConfigurationInput *)request;

/**
 <p>Provides the details of a security configuration by returning the configuration JSON.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeSecurityConfigurationInput
 @see AWSelasticmapreduceDescribeSecurityConfigurationOutput
 */
- (void)describeSecurityConfiguration:(AWSelasticmapreduceDescribeSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceDescribeSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides more detail about the cluster step.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStep service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceDescribeStepOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeStepInput
 @see AWSelasticmapreduceDescribeStepOutput
 */
- (AWSTask<AWSelasticmapreduceDescribeStepOutput *> *)describeStep:(AWSelasticmapreduceDescribeStepInput *)request;

/**
 <p>Provides more detail about the cluster step.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStep service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceDescribeStepInput
 @see AWSelasticmapreduceDescribeStepOutput
 */
- (void)describeStep:(AWSelasticmapreduceDescribeStepInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceDescribeStepOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlockPublicAccessConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceGetBlockPublicAccessConfigurationInput
 @see AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput
 */
- (AWSTask<AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput *> *)getBlockPublicAccessConfiguration:(AWSelasticmapreduceGetBlockPublicAccessConfigurationInput *)request;

/**
 <p>Returns the Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlockPublicAccessConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceGetBlockPublicAccessConfigurationInput
 @see AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput
 */
- (void)getBlockPublicAccessConfiguration:(AWSelasticmapreduceGetBlockPublicAccessConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Fetches the attached managed scaling policy for an Amazon EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the GetManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceGetManagedScalingPolicyOutput`.
 
 @see AWSelasticmapreduceGetManagedScalingPolicyInput
 @see AWSelasticmapreduceGetManagedScalingPolicyOutput
 */
- (AWSTask<AWSelasticmapreduceGetManagedScalingPolicyOutput *> *)getManagedScalingPolicy:(AWSelasticmapreduceGetManagedScalingPolicyInput *)request;

/**
 <p> Fetches the attached managed scaling policy for an Amazon EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the GetManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSelasticmapreduceGetManagedScalingPolicyInput
 @see AWSelasticmapreduceGetManagedScalingPolicyOutput
 */
- (void)getManagedScalingPolicy:(AWSelasticmapreduceGetManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceGetManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the bootstrap actions associated with a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListBootstrapActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListBootstrapActionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListBootstrapActionsInput
 @see AWSelasticmapreduceListBootstrapActionsOutput
 */
- (AWSTask<AWSelasticmapreduceListBootstrapActionsOutput *> *)listBootstrapActions:(AWSelasticmapreduceListBootstrapActionsInput *)request;

/**
 <p>Provides information about the bootstrap actions associated with a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListBootstrapActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListBootstrapActionsInput
 @see AWSelasticmapreduceListBootstrapActionsOutput
 */
- (void)listBootstrapActions:(AWSelasticmapreduceListBootstrapActionsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListBootstrapActionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the status of all clusters visible to this AWS account. Allows you to filter the list of clusters based on certain criteria; for example, filtering by cluster creation date and time or by status. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListClusters calls.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListClustersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListClustersInput
 @see AWSelasticmapreduceListClustersOutput
 */
- (AWSTask<AWSelasticmapreduceListClustersOutput *> *)listClusters:(AWSelasticmapreduceListClustersInput *)request;

/**
 <p>Provides the status of all clusters visible to this AWS account. Allows you to filter the list of clusters based on certain criteria; for example, filtering by cluster creation date and time or by status. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListClusters calls.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListClustersInput
 @see AWSelasticmapreduceListClustersOutput
 */
- (void)listClusters:(AWSelasticmapreduceListClustersInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListClustersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all available details about the instance fleets in a cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ListInstanceFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListInstanceFleetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstanceFleetsInput
 @see AWSelasticmapreduceListInstanceFleetsOutput
 */
- (AWSTask<AWSelasticmapreduceListInstanceFleetsOutput *> *)listInstanceFleets:(AWSelasticmapreduceListInstanceFleetsInput *)request;

/**
 <p>Lists all available details about the instance fleets in a cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ListInstanceFleets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstanceFleetsInput
 @see AWSelasticmapreduceListInstanceFleetsOutput
 */
- (void)listInstanceFleets:(AWSelasticmapreduceListInstanceFleetsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListInstanceFleetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides all available details about the instance groups in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListInstanceGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstanceGroupsInput
 @see AWSelasticmapreduceListInstanceGroupsOutput
 */
- (AWSTask<AWSelasticmapreduceListInstanceGroupsOutput *> *)listInstanceGroups:(AWSelasticmapreduceListInstanceGroupsInput *)request;

/**
 <p>Provides all available details about the instance groups in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstanceGroupsInput
 @see AWSelasticmapreduceListInstanceGroupsOutput
 */
- (void)listInstanceGroups:(AWSelasticmapreduceListInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListInstanceGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information for all active EC2 instances and EC2 instances terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstancesInput
 @see AWSelasticmapreduceListInstancesOutput
 */
- (AWSTask<AWSelasticmapreduceListInstancesOutput *> *)listInstances:(AWSelasticmapreduceListInstancesInput *)request;

/**
 <p>Provides information for all active EC2 instances and EC2 instances terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListInstancesInput
 @see AWSelasticmapreduceListInstancesOutput
 */
- (void)listInstances:(AWSelasticmapreduceListInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the security configurations visible to this account, providing their creation dates and times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListSecurityConfigurationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListSecurityConfigurationsInput
 @see AWSelasticmapreduceListSecurityConfigurationsOutput
 */
- (AWSTask<AWSelasticmapreduceListSecurityConfigurationsOutput *> *)listSecurityConfigurations:(AWSelasticmapreduceListSecurityConfigurationsInput *)request;

/**
 <p>Lists all the security configurations visible to this account, providing their creation dates and times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListSecurityConfigurationsInput
 @see AWSelasticmapreduceListSecurityConfigurationsOutput
 */
- (void)listSecurityConfigurations:(AWSelasticmapreduceListSecurityConfigurationsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListSecurityConfigurationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of steps for the cluster in reverse order unless you specify <code>stepIds</code> with the request of filter by <code>StepStates</code>. You can specify a maximum of ten <code>stepIDs</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceListStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListStepsInput
 @see AWSelasticmapreduceListStepsOutput
 */
- (AWSTask<AWSelasticmapreduceListStepsOutput *> *)listSteps:(AWSelasticmapreduceListStepsInput *)request;

/**
 <p>Provides a list of steps for the cluster in reverse order unless you specify <code>stepIds</code> with the request of filter by <code>StepStates</code>. You can specify a maximum of ten <code>stepIDs</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceListStepsInput
 @see AWSelasticmapreduceListStepsOutput
 */
- (void)listSteps:(AWSelasticmapreduceListStepsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceListStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the number of steps that can be executed concurrently for the cluster specified using ClusterID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceModifyClusterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceModifyClusterInput
 @see AWSelasticmapreduceModifyClusterOutput
 */
- (AWSTask<AWSelasticmapreduceModifyClusterOutput *> *)modifyCluster:(AWSelasticmapreduceModifyClusterInput *)request;

/**
 <p>Modifies the number of steps that can be executed concurrently for the cluster specified using ClusterID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceModifyClusterInput
 @see AWSelasticmapreduceModifyClusterOutput
 */
- (void)modifyCluster:(AWSelasticmapreduceModifyClusterInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceModifyClusterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails atomically.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceModifyInstanceFleetInput
 */
- (AWSTask *)modifyInstanceFleet:(AWSelasticmapreduceModifyInstanceFleetInput *)request;

/**
 <p>Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails atomically.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceModifyInstanceFleetInput
 */
- (void)modifyInstanceFleet:(AWSelasticmapreduceModifyInstanceFleetInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group. The input parameters include the new target instance count for the group and the instance group ID. The call will either succeed or fail atomically.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceModifyInstanceGroupsInput
 */
- (AWSTask *)modifyInstanceGroups:(AWSelasticmapreduceModifyInstanceGroupsInput *)request;

/**
 <p>ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group. The input parameters include the new target instance count for the group and the instance group ID. The call will either succeed or fail atomically.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceModifyInstanceGroupsInput
 */
- (void)modifyInstanceGroups:(AWSelasticmapreduceModifyInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric.</p>
 
 @param request A container for the necessary parameters to execute the PutAutoScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreducePutAutoScalingPolicyOutput`.
 
 @see AWSelasticmapreducePutAutoScalingPolicyInput
 @see AWSelasticmapreducePutAutoScalingPolicyOutput
 */
- (AWSTask<AWSelasticmapreducePutAutoScalingPolicyOutput *> *)putAutoScalingPolicy:(AWSelasticmapreducePutAutoScalingPolicyInput *)request;

/**
 <p>Creates or updates an automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric.</p>
 
 @param request A container for the necessary parameters to execute the PutAutoScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSelasticmapreducePutAutoScalingPolicyInput
 @see AWSelasticmapreducePutAutoScalingPolicyOutput
 */
- (void)putAutoScalingPolicy:(AWSelasticmapreducePutAutoScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreducePutAutoScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutBlockPublicAccessConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreducePutBlockPublicAccessConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreducePutBlockPublicAccessConfigurationInput
 @see AWSelasticmapreducePutBlockPublicAccessConfigurationOutput
 */
- (AWSTask<AWSelasticmapreducePutBlockPublicAccessConfigurationOutput *> *)putBlockPublicAccessConfiguration:(AWSelasticmapreducePutBlockPublicAccessConfigurationInput *)request;

/**
 <p>Creates or updates an Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutBlockPublicAccessConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreducePutBlockPublicAccessConfigurationInput
 @see AWSelasticmapreducePutBlockPublicAccessConfigurationOutput
 */
- (void)putBlockPublicAccessConfiguration:(AWSelasticmapreducePutBlockPublicAccessConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreducePutBlockPublicAccessConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy defines the limits for resources, such as EC2 instances that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 
 @param request A container for the necessary parameters to execute the PutManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreducePutManagedScalingPolicyOutput`.
 
 @see AWSelasticmapreducePutManagedScalingPolicyInput
 @see AWSelasticmapreducePutManagedScalingPolicyOutput
 */
- (AWSTask<AWSelasticmapreducePutManagedScalingPolicyOutput *> *)putManagedScalingPolicy:(AWSelasticmapreducePutManagedScalingPolicyInput *)request;

/**
 <p> Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy defines the limits for resources, such as EC2 instances that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 
 @param request A container for the necessary parameters to execute the PutManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSelasticmapreducePutManagedScalingPolicyInput
 @see AWSelasticmapreducePutManagedScalingPolicyOutput
 */
- (void)putManagedScalingPolicy:(AWSelasticmapreducePutManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreducePutManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes an automatic scaling policy from a specified instance group within an EMR cluster.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAutoScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceRemoveAutoScalingPolicyOutput`.
 
 @see AWSelasticmapreduceRemoveAutoScalingPolicyInput
 @see AWSelasticmapreduceRemoveAutoScalingPolicyOutput
 */
- (AWSTask<AWSelasticmapreduceRemoveAutoScalingPolicyOutput *> *)removeAutoScalingPolicy:(AWSelasticmapreduceRemoveAutoScalingPolicyInput *)request;

/**
 <p>Removes an automatic scaling policy from a specified instance group within an EMR cluster.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAutoScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSelasticmapreduceRemoveAutoScalingPolicyInput
 @see AWSelasticmapreduceRemoveAutoScalingPolicyOutput
 */
- (void)removeAutoScalingPolicy:(AWSelasticmapreduceRemoveAutoScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceRemoveAutoScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Removes a managed scaling policy from a specified EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the RemoveManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceRemoveManagedScalingPolicyOutput`.
 
 @see AWSelasticmapreduceRemoveManagedScalingPolicyInput
 @see AWSelasticmapreduceRemoveManagedScalingPolicyOutput
 */
- (AWSTask<AWSelasticmapreduceRemoveManagedScalingPolicyOutput *> *)removeManagedScalingPolicy:(AWSelasticmapreduceRemoveManagedScalingPolicyInput *)request;

/**
 <p> Removes a managed scaling policy from a specified EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the RemoveManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSelasticmapreduceRemoveManagedScalingPolicyInput
 @see AWSelasticmapreduceRemoveManagedScalingPolicyOutput
 */
- (void)removeManagedScalingPolicy:(AWSelasticmapreduceRemoveManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceRemoveManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p><p>The following example removes the stack tag with value Prod from a cluster:</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceRemoveTagsInput
 @see AWSelasticmapreduceRemoveTagsOutput
 */
- (AWSTask<AWSelasticmapreduceRemoveTagsOutput *> *)removeTags:(AWSelasticmapreduceRemoveTagsInput *)request;

/**
 <p>Removes tags from an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p><p>The following example removes the stack tag with value Prod from a cluster:</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`, `AWSelasticmapreduceErrorInvalidRequest`.
 
 @see AWSelasticmapreduceRemoveTagsInput
 @see AWSelasticmapreduceRemoveTagsOutput
 */
- (void)removeTags:(AWSelasticmapreduceRemoveTagsInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceRemoveTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If the <a>JobFlowInstancesConfig</a><code>KeepJobFlowAliveWhenNoSteps</code> parameter is set to <code>TRUE</code>, the cluster transitions to the WAITING state rather than shutting down after the steps have completed. </p><p>For additional protection, you can set the <a>JobFlowInstancesConfig</a><code>TerminationProtected</code> parameter to <code>TRUE</code> to lock the cluster and prevent it from being terminated by API call, user intervention, or in the event of a job flow error.</p><p>A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using the SSH shell to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>For long running clusters, we recommend that you periodically store your results.</p><note><p>The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or InstanceGroups parameters, but not both.</p></note>
 
 @param request A container for the necessary parameters to execute the RunJobFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSelasticmapreduceRunJobFlowOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceRunJobFlowInput
 @see AWSelasticmapreduceRunJobFlowOutput
 */
- (AWSTask<AWSelasticmapreduceRunJobFlowOutput *> *)runJobFlow:(AWSelasticmapreduceRunJobFlowInput *)request;

/**
 <p>RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If the <a>JobFlowInstancesConfig</a><code>KeepJobFlowAliveWhenNoSteps</code> parameter is set to <code>TRUE</code>, the cluster transitions to the WAITING state rather than shutting down after the steps have completed. </p><p>For additional protection, you can set the <a>JobFlowInstancesConfig</a><code>TerminationProtected</code> parameter to <code>TRUE</code> to lock the cluster and prevent it from being terminated by API call, user intervention, or in the event of a job flow error.</p><p>A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using the SSH shell to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>For long running clusters, we recommend that you periodically store your results.</p><note><p>The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or InstanceGroups parameters, but not both.</p></note>
 
 @param request A container for the necessary parameters to execute the RunJobFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceRunJobFlowInput
 @see AWSelasticmapreduceRunJobFlowOutput
 */
- (void)runJobFlow:(AWSelasticmapreduceRunJobFlowInput *)request completionHandler:(void (^ _Nullable)(AWSelasticmapreduceRunJobFlowOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The cluster still terminates upon successful completion of the job flow. Calling <code>SetTerminationProtection</code> on a cluster is similar to calling the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances in a cluster.</p><p><code>SetTerminationProtection</code> is used to prevent accidental termination of a cluster and to ensure that in the event of an error, the instances persist so that you can recover any data stored in their ephemeral instance storage.</p><p> To terminate a cluster that has been locked by setting <code>SetTerminationProtection</code> to <code>true</code>, you must first unlock the job flow by a subsequent call to <code>SetTerminationProtection</code> in which you set the value to <code>false</code>. </p><p> For more information, see<a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the SetTerminationProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceSetTerminationProtectionInput
 */
- (AWSTask *)setTerminationProtection:(AWSelasticmapreduceSetTerminationProtectionInput *)request;

/**
 <p>SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The cluster still terminates upon successful completion of the job flow. Calling <code>SetTerminationProtection</code> on a cluster is similar to calling the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances in a cluster.</p><p><code>SetTerminationProtection</code> is used to prevent accidental termination of a cluster and to ensure that in the event of an error, the instances persist so that you can recover any data stored in their ephemeral instance storage.</p><p> To terminate a cluster that has been locked by setting <code>SetTerminationProtection</code> to <code>true</code>, you must first unlock the job flow by a subsequent call to <code>SetTerminationProtection</code> in which you set the value to <code>false</code>. </p><p> For more information, see<a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the SetTerminationProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceSetTerminationProtectionInput
 */
- (void)setTerminationProtection:(AWSelasticmapreduceSetTerminationProtectionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether the cluster is visible to all IAM users of the AWS account associated with the cluster. Only the IAM user who created the cluster or the AWS account root user can call this action. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If set to <code>false</code>, only the IAM user that created the cluster can perform actions. This action works on running clusters. You can override the default <code>true</code> setting when you create a cluster by using the <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetVisibleToAllUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceSetVisibleToAllUsersInput
 */
- (AWSTask *)setVisibleToAllUsers:(AWSelasticmapreduceSetVisibleToAllUsersInput *)request;

/**
 <p>Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether the cluster is visible to all IAM users of the AWS account associated with the cluster. Only the IAM user who created the cluster or the AWS account root user can call this action. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If set to <code>false</code>, only the IAM user that created the cluster can perform actions. This action works on running clusters. You can override the default <code>true</code> setting when you create a cluster by using the <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetVisibleToAllUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceSetVisibleToAllUsersInput
 */
- (void)setVisibleToAllUsers:(AWSelasticmapreduceSetVisibleToAllUsersInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step not yet completed is canceled and the EC2 instances on which the cluster is running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when the cluster was created.</p><p>The maximum number of clusters allowed is 10. The call to <code>TerminateJobFlows</code> is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.</p>
 
 @param request A container for the necessary parameters to execute the TerminateJobFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceTerminateJobFlowsInput
 */
- (AWSTask *)terminateJobFlows:(AWSelasticmapreduceTerminateJobFlowsInput *)request;

/**
 <p>TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step not yet completed is canceled and the EC2 instances on which the cluster is running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when the cluster was created.</p><p>The maximum number of clusters allowed is 10. The call to <code>TerminateJobFlows</code> is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.</p>
 
 @param request A container for the necessary parameters to execute the TerminateJobFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSelasticmapreduceErrorDomain` domain and the following error code: `AWSelasticmapreduceErrorInternalServer`.
 
 @see AWSelasticmapreduceTerminateJobFlowsInput
 */
- (void)terminateJobFlows:(AWSelasticmapreduceTerminateJobFlowsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
