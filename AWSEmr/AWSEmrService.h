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
#import "AWSEmrModel.h"
#import "AWSEmrResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSEmr
FOUNDATION_EXPORT NSString *const AWSEmrSDKVersion;

/**
 <p>Amazon EMR is a web service that makes it easy to process large amounts of data efficiently. Amazon EMR uses Hadoop processing combined with several AWS products to do tasks such as web indexing, data mining, log file analysis, machine learning, scientific simulation, and data warehousing.</p>
 */
@interface AWSEmr : AWSService

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

     let Emr = AWSEmr.default()

 *Objective-C*

     AWSEmr *Emr = [AWSEmr defaultEmr];

 @return The default service client.
 */
+ (instancetype)defaultEmr;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEmr.register(with: configuration!, forKey: "USWest2Emr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEmr registerEmrWithConfiguration:configuration forKey:@"USWest2Emr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Emr = AWSEmr(forKey: "USWest2Emr")

 *Objective-C*

     AWSEmr *Emr = [AWSEmr EmrForKey:@"USWest2Emr"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerEmrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerEmrWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSEmr.register(with: configuration!, forKey: "USWest2Emr")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSEmr registerEmrWithConfiguration:configuration forKey:@"USWest2Emr"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Emr = AWSEmr(forKey: "USWest2Emr")

 *Objective-C*

     AWSEmr *Emr = [AWSEmr EmrForKey:@"USWest2Emr"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)EmrForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeEmrForKey:(NSString *)key;

/**
 <p>Adds an instance fleet to a running cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x.</p></note>
 
 @param request A container for the necessary parameters to execute the AddInstanceFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrAddInstanceFleetOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrAddInstanceFleetInput
 @see AWSEmrAddInstanceFleetOutput
 */
- (AWSTask<AWSEmrAddInstanceFleetOutput *> *)addInstanceFleet:(AWSEmrAddInstanceFleetInput *)request;

/**
 <p>Adds an instance fleet to a running cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x.</p></note>
 
 @param request A container for the necessary parameters to execute the AddInstanceFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrAddInstanceFleetInput
 @see AWSEmrAddInstanceFleetOutput
 */
- (void)addInstanceFleet:(AWSEmrAddInstanceFleetInput *)request completionHandler:(void (^ _Nullable)(AWSEmrAddInstanceFleetOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more instance groups to a running cluster.</p>
 
 @param request A container for the necessary parameters to execute the AddInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrAddInstanceGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrAddInstanceGroupsInput
 @see AWSEmrAddInstanceGroupsOutput
 */
- (AWSTask<AWSEmrAddInstanceGroupsOutput *> *)addInstanceGroups:(AWSEmrAddInstanceGroupsInput *)request;

/**
 <p>Adds one or more instance groups to a running cluster.</p>
 
 @param request A container for the necessary parameters to execute the AddInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrAddInstanceGroupsInput
 @see AWSEmrAddInstanceGroupsOutput
 */
- (void)addInstanceGroups:(AWSEmrAddInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrAddInstanceGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using SSH to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>A step specifies the location of a JAR file stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. The main class can be specified either in the manifest of the JAR or by using the MainFunction parameter of the step.</p><p>Amazon EMR executes each step in the order listed. For a step to be considered complete, the main function must exit with a zero exit code and all Hadoop jobs started while the step was running must have completed and run successfully.</p><p>You can only add steps to a cluster that is in one of the following states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.</p>
 
 @param request A container for the necessary parameters to execute the AddJobFlowSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrAddJobFlowStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrAddJobFlowStepsInput
 @see AWSEmrAddJobFlowStepsOutput
 */
- (AWSTask<AWSEmrAddJobFlowStepsOutput *> *)addJobFlowSteps:(AWSEmrAddJobFlowStepsInput *)request;

/**
 <p>AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using SSH to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>A step specifies the location of a JAR file stored either on the master node of the cluster or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. The main class can be specified either in the manifest of the JAR or by using the MainFunction parameter of the step.</p><p>Amazon EMR executes each step in the order listed. For a step to be considered complete, the main function must exit with a zero exit code and all Hadoop jobs started while the step was running must have completed and run successfully.</p><p>You can only add steps to a cluster that is in one of the following states: STARTING, BOOTSTRAPPING, RUNNING, or WAITING.</p>
 
 @param request A container for the necessary parameters to execute the AddJobFlowSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrAddJobFlowStepsInput
 @see AWSEmrAddJobFlowStepsOutput
 */
- (void)addJobFlowSteps:(AWSEmrAddJobFlowStepsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrAddJobFlowStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds tags to an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrAddTagsInput
 @see AWSEmrAddTagsOutput
 */
- (AWSTask<AWSEmrAddTagsOutput *> *)addTags:(AWSEmrAddTagsInput *)request;

/**
 <p>Adds tags to an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrAddTagsInput
 @see AWSEmrAddTagsOutput
 */
- (void)addTags:(AWSEmrAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee a step will be canceled, even if the request is successfully submitted. You can only cancel steps that are in a <code>PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrCancelStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrCancelStepsInput
 @see AWSEmrCancelStepsOutput
 */
- (AWSTask<AWSEmrCancelStepsOutput *> *)cancelSteps:(AWSEmrCancelStepsInput *)request;

/**
 <p>Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions 4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee a step will be canceled, even if the request is successfully submitted. You can only cancel steps that are in a <code>PENDING</code> state.</p>
 
 @param request A container for the necessary parameters to execute the CancelSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrCancelStepsInput
 @see AWSEmrCancelStepsOutput
 */
- (void)cancelSteps:(AWSEmrCancelStepsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrCancelStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a security configuration, which is stored in the service and can be specified when a cluster is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrCreateSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrCreateSecurityConfigurationInput
 @see AWSEmrCreateSecurityConfigurationOutput
 */
- (AWSTask<AWSEmrCreateSecurityConfigurationOutput *> *)createSecurityConfiguration:(AWSEmrCreateSecurityConfigurationInput *)request;

/**
 <p>Creates a security configuration, which is stored in the service and can be specified when a cluster is created.</p>
 
 @param request A container for the necessary parameters to execute the CreateSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrCreateSecurityConfigurationInput
 @see AWSEmrCreateSecurityConfigurationOutput
 */
- (void)createSecurityConfiguration:(AWSEmrCreateSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSEmrCreateSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrDeleteSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDeleteSecurityConfigurationInput
 @see AWSEmrDeleteSecurityConfigurationOutput
 */
- (AWSTask<AWSEmrDeleteSecurityConfigurationOutput *> *)deleteSecurityConfiguration:(AWSEmrDeleteSecurityConfigurationInput *)request;

/**
 <p>Deletes a security configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDeleteSecurityConfigurationInput
 @see AWSEmrDeleteSecurityConfigurationOutput
 */
- (void)deleteSecurityConfiguration:(AWSEmrDeleteSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSEmrDeleteSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides cluster-level details including status, hardware and software configuration, VPC settings, and so on. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrDescribeClusterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeClusterInput
 @see AWSEmrDescribeClusterOutput
 */
- (AWSTask<AWSEmrDescribeClusterOutput *> *)describeCluster:(AWSEmrDescribeClusterInput *)request;

/**
 <p>Provides cluster-level details including status, hardware and software configuration, VPC settings, and so on. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeClusterInput
 @see AWSEmrDescribeClusterOutput
 */
- (void)describeCluster:(AWSEmrDescribeClusterInput *)request completionHandler:(void (^ _Nullable)(AWSEmrDescribeClusterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This API is deprecated and will eventually be removed. We recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>, <a>ListSteps</a>, <a>ListInstanceGroups</a> and <a>ListBootstrapActions</a> instead.</p><p>DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The parameters can include a list of job flow IDs, job flow states, and restrictions on job flow creation date and time.</p><p>Regardless of supplied parameters, only job flows created within the last two months are returned.</p><p>If no parameters are supplied, then job flows matching either of the following criteria are returned:</p><ul><li><p>Job flows created and completed in the last two weeks</p></li><li><p> Job flows created within the last two months that are in one of the following states: <code>RUNNING</code>, <code>WAITING</code>, <code>SHUTTING_DOWN</code>, <code>STARTING</code></p></li></ul><p>Amazon EMR can return a maximum of 512 job flow descriptions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJobFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrDescribeJobFlowsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrDescribeJobFlowsInput
 @see AWSEmrDescribeJobFlowsOutput
 */
- (AWSTask<AWSEmrDescribeJobFlowsOutput *> *)describeJobFlows:(AWSEmrDescribeJobFlowsInput *)request;

/**
 <p>This API is deprecated and will eventually be removed. We recommend you use <a>ListClusters</a>, <a>DescribeCluster</a>, <a>ListSteps</a>, <a>ListInstanceGroups</a> and <a>ListBootstrapActions</a> instead.</p><p>DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The parameters can include a list of job flow IDs, job flow states, and restrictions on job flow creation date and time.</p><p>Regardless of supplied parameters, only job flows created within the last two months are returned.</p><p>If no parameters are supplied, then job flows matching either of the following criteria are returned:</p><ul><li><p>Job flows created and completed in the last two weeks</p></li><li><p> Job flows created within the last two months that are in one of the following states: <code>RUNNING</code>, <code>WAITING</code>, <code>SHUTTING_DOWN</code>, <code>STARTING</code></p></li></ul><p>Amazon EMR can return a maximum of 512 job flow descriptions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeJobFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrDescribeJobFlowsInput
 @see AWSEmrDescribeJobFlowsOutput
 */
- (void)describeJobFlows:(AWSEmrDescribeJobFlowsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrDescribeJobFlowsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the details of a security configuration by returning the configuration JSON.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrDescribeSecurityConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeSecurityConfigurationInput
 @see AWSEmrDescribeSecurityConfigurationOutput
 */
- (AWSTask<AWSEmrDescribeSecurityConfigurationOutput *> *)describeSecurityConfiguration:(AWSEmrDescribeSecurityConfigurationInput *)request;

/**
 <p>Provides the details of a security configuration by returning the configuration JSON.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSecurityConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeSecurityConfigurationInput
 @see AWSEmrDescribeSecurityConfigurationOutput
 */
- (void)describeSecurityConfiguration:(AWSEmrDescribeSecurityConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSEmrDescribeSecurityConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides more detail about the cluster step.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStep service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrDescribeStepOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeStepInput
 @see AWSEmrDescribeStepOutput
 */
- (AWSTask<AWSEmrDescribeStepOutput *> *)describeStep:(AWSEmrDescribeStepInput *)request;

/**
 <p>Provides more detail about the cluster step.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStep service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrDescribeStepInput
 @see AWSEmrDescribeStepOutput
 */
- (void)describeStep:(AWSEmrDescribeStepInput *)request completionHandler:(void (^ _Nullable)(AWSEmrDescribeStepOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlockPublicAccessConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrGetBlockPublicAccessConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrGetBlockPublicAccessConfigurationInput
 @see AWSEmrGetBlockPublicAccessConfigurationOutput
 */
- (AWSTask<AWSEmrGetBlockPublicAccessConfigurationOutput *> *)getBlockPublicAccessConfiguration:(AWSEmrGetBlockPublicAccessConfigurationInput *)request;

/**
 <p>Returns the Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetBlockPublicAccessConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrGetBlockPublicAccessConfigurationInput
 @see AWSEmrGetBlockPublicAccessConfigurationOutput
 */
- (void)getBlockPublicAccessConfiguration:(AWSEmrGetBlockPublicAccessConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSEmrGetBlockPublicAccessConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Fetches the attached managed scaling policy for an Amazon EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the GetManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrGetManagedScalingPolicyOutput`.
 
 @see AWSEmrGetManagedScalingPolicyInput
 @see AWSEmrGetManagedScalingPolicyOutput
 */
- (AWSTask<AWSEmrGetManagedScalingPolicyOutput *> *)getManagedScalingPolicy:(AWSEmrGetManagedScalingPolicyInput *)request;

/**
 <p> Fetches the attached managed scaling policy for an Amazon EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the GetManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEmrGetManagedScalingPolicyInput
 @see AWSEmrGetManagedScalingPolicyOutput
 */
- (void)getManagedScalingPolicy:(AWSEmrGetManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSEmrGetManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about the bootstrap actions associated with a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListBootstrapActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListBootstrapActionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListBootstrapActionsInput
 @see AWSEmrListBootstrapActionsOutput
 */
- (AWSTask<AWSEmrListBootstrapActionsOutput *> *)listBootstrapActions:(AWSEmrListBootstrapActionsInput *)request;

/**
 <p>Provides information about the bootstrap actions associated with a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListBootstrapActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListBootstrapActionsInput
 @see AWSEmrListBootstrapActionsOutput
 */
- (void)listBootstrapActions:(AWSEmrListBootstrapActionsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListBootstrapActionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides the status of all clusters visible to this AWS account. Allows you to filter the list of clusters based on certain criteria; for example, filtering by cluster creation date and time or by status. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListClusters calls.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListClustersOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListClustersInput
 @see AWSEmrListClustersOutput
 */
- (AWSTask<AWSEmrListClustersOutput *> *)listClusters:(AWSEmrListClustersInput *)request;

/**
 <p>Provides the status of all clusters visible to this AWS account. Allows you to filter the list of clusters based on certain criteria; for example, filtering by cluster creation date and time or by status. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListClusters calls.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListClustersInput
 @see AWSEmrListClustersOutput
 */
- (void)listClusters:(AWSEmrListClustersInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListClustersOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all available details about the instance fleets in a cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ListInstanceFleets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListInstanceFleetsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstanceFleetsInput
 @see AWSEmrListInstanceFleetsOutput
 */
- (AWSTask<AWSEmrListInstanceFleetsOutput *> *)listInstanceFleets:(AWSEmrListInstanceFleetsInput *)request;

/**
 <p>Lists all available details about the instance fleets in a cluster.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ListInstanceFleets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstanceFleetsInput
 @see AWSEmrListInstanceFleetsOutput
 */
- (void)listInstanceFleets:(AWSEmrListInstanceFleetsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListInstanceFleetsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides all available details about the instance groups in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListInstanceGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstanceGroupsInput
 @see AWSEmrListInstanceGroupsOutput
 */
- (AWSTask<AWSEmrListInstanceGroupsOutput *> *)listInstanceGroups:(AWSEmrListInstanceGroupsInput *)request;

/**
 <p>Provides all available details about the instance groups in a cluster.</p>
 
 @param request A container for the necessary parameters to execute the ListInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstanceGroupsInput
 @see AWSEmrListInstanceGroupsOutput
 */
- (void)listInstanceGroups:(AWSEmrListInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListInstanceGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information for all active EC2 instances and EC2 instances terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListInstancesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstancesInput
 @see AWSEmrListInstancesOutput
 */
- (AWSTask<AWSEmrListInstancesOutput *> *)listInstances:(AWSEmrListInstancesInput *)request;

/**
 <p>Provides information for all active EC2 instances and EC2 instances terminated in the last 30 days, up to a maximum of 2,000. EC2 instances in any of the following states are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.</p>
 
 @param request A container for the necessary parameters to execute the ListInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListInstancesInput
 @see AWSEmrListInstancesOutput
 */
- (void)listInstances:(AWSEmrListInstancesInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListInstancesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the security configurations visible to this account, providing their creation dates and times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListSecurityConfigurationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListSecurityConfigurationsInput
 @see AWSEmrListSecurityConfigurationsOutput
 */
- (AWSTask<AWSEmrListSecurityConfigurationsOutput *> *)listSecurityConfigurations:(AWSEmrListSecurityConfigurationsInput *)request;

/**
 <p>Lists all the security configurations visible to this account, providing their creation dates and times, and their names. This call returns a maximum of 50 clusters per call, but returns a marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.</p>
 
 @param request A container for the necessary parameters to execute the ListSecurityConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListSecurityConfigurationsInput
 @see AWSEmrListSecurityConfigurationsOutput
 */
- (void)listSecurityConfigurations:(AWSEmrListSecurityConfigurationsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListSecurityConfigurationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of steps for the cluster in reverse order unless you specify <code>stepIds</code> with the request of filter by <code>StepStates</code>. You can specify a maximum of ten <code>stepIDs</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSteps service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrListStepsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListStepsInput
 @see AWSEmrListStepsOutput
 */
- (AWSTask<AWSEmrListStepsOutput *> *)listSteps:(AWSEmrListStepsInput *)request;

/**
 <p>Provides a list of steps for the cluster in reverse order unless you specify <code>stepIds</code> with the request of filter by <code>StepStates</code>. You can specify a maximum of ten <code>stepIDs</code>.</p>
 
 @param request A container for the necessary parameters to execute the ListSteps service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrListStepsInput
 @see AWSEmrListStepsOutput
 */
- (void)listSteps:(AWSEmrListStepsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrListStepsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the number of steps that can be executed concurrently for the cluster specified using ClusterID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrModifyClusterOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrModifyClusterInput
 @see AWSEmrModifyClusterOutput
 */
- (AWSTask<AWSEmrModifyClusterOutput *> *)modifyCluster:(AWSEmrModifyClusterInput *)request;

/**
 <p>Modifies the number of steps that can be executed concurrently for the cluster specified using ClusterID.</p>
 
 @param request A container for the necessary parameters to execute the ModifyCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrModifyClusterInput
 @see AWSEmrModifyClusterOutput
 */
- (void)modifyCluster:(AWSEmrModifyClusterInput *)request completionHandler:(void (^ _Nullable)(AWSEmrModifyClusterOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails atomically.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceFleet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrModifyInstanceFleetInput
 */
- (AWSTask *)modifyInstanceFleet:(AWSEmrModifyInstanceFleetInput *)request;

/**
 <p>Modifies the target On-Demand and target Spot capacities for the instance fleet with the specified InstanceFleetID within the cluster specified using ClusterID. The call either succeeds or fails atomically.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceFleet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrModifyInstanceFleetInput
 */
- (void)modifyInstanceFleet:(AWSEmrModifyInstanceFleetInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group. The input parameters include the new target instance count for the group and the instance group ID. The call will either succeed or fail atomically.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrModifyInstanceGroupsInput
 */
- (AWSTask *)modifyInstanceGroups:(AWSEmrModifyInstanceGroupsInput *)request;

/**
 <p>ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance group. The input parameters include the new target instance count for the group and the instance group ID. The call will either succeed or fail atomically.</p>
 
 @param request A container for the necessary parameters to execute the ModifyInstanceGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrModifyInstanceGroupsInput
 */
- (void)modifyInstanceGroups:(AWSEmrModifyInstanceGroupsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric.</p>
 
 @param request A container for the necessary parameters to execute the PutAutoScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrPutAutoScalingPolicyOutput`.
 
 @see AWSEmrPutAutoScalingPolicyInput
 @see AWSEmrPutAutoScalingPolicyOutput
 */
- (AWSTask<AWSEmrPutAutoScalingPolicyOutput *> *)putAutoScalingPolicy:(AWSEmrPutAutoScalingPolicyInput *)request;

/**
 <p>Creates or updates an automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric.</p>
 
 @param request A container for the necessary parameters to execute the PutAutoScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEmrPutAutoScalingPolicyInput
 @see AWSEmrPutAutoScalingPolicyOutput
 */
- (void)putAutoScalingPolicy:(AWSEmrPutAutoScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSEmrPutAutoScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutBlockPublicAccessConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrPutBlockPublicAccessConfigurationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrPutBlockPublicAccessConfigurationInput
 @see AWSEmrPutBlockPublicAccessConfigurationOutput
 */
- (AWSTask<AWSEmrPutBlockPublicAccessConfigurationOutput *> *)putBlockPublicAccessConfiguration:(AWSEmrPutBlockPublicAccessConfigurationInput *)request;

/**
 <p>Creates or updates an Amazon EMR block public access configuration for your AWS account in the current Region. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html">Configure Block Public Access for Amazon EMR</a> in the <i>Amazon EMR Management Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutBlockPublicAccessConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrPutBlockPublicAccessConfigurationInput
 @see AWSEmrPutBlockPublicAccessConfigurationOutput
 */
- (void)putBlockPublicAccessConfiguration:(AWSEmrPutBlockPublicAccessConfigurationInput *)request completionHandler:(void (^ _Nullable)(AWSEmrPutBlockPublicAccessConfigurationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy defines the limits for resources, such as EC2 instances that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 
 @param request A container for the necessary parameters to execute the PutManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrPutManagedScalingPolicyOutput`.
 
 @see AWSEmrPutManagedScalingPolicyInput
 @see AWSEmrPutManagedScalingPolicyOutput
 */
- (AWSTask<AWSEmrPutManagedScalingPolicyOutput *> *)putManagedScalingPolicy:(AWSEmrPutManagedScalingPolicyInput *)request;

/**
 <p> Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling policy defines the limits for resources, such as EC2 instances that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 
 @param request A container for the necessary parameters to execute the PutManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEmrPutManagedScalingPolicyInput
 @see AWSEmrPutManagedScalingPolicyOutput
 */
- (void)putManagedScalingPolicy:(AWSEmrPutManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSEmrPutManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes an automatic scaling policy from a specified instance group within an EMR cluster.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAutoScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrRemoveAutoScalingPolicyOutput`.
 
 @see AWSEmrRemoveAutoScalingPolicyInput
 @see AWSEmrRemoveAutoScalingPolicyOutput
 */
- (AWSTask<AWSEmrRemoveAutoScalingPolicyOutput *> *)removeAutoScalingPolicy:(AWSEmrRemoveAutoScalingPolicyInput *)request;

/**
 <p>Removes an automatic scaling policy from a specified instance group within an EMR cluster.</p>
 
 @param request A container for the necessary parameters to execute the RemoveAutoScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEmrRemoveAutoScalingPolicyInput
 @see AWSEmrRemoveAutoScalingPolicyOutput
 */
- (void)removeAutoScalingPolicy:(AWSEmrRemoveAutoScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSEmrRemoveAutoScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Removes a managed scaling policy from a specified EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the RemoveManagedScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrRemoveManagedScalingPolicyOutput`.
 
 @see AWSEmrRemoveManagedScalingPolicyInput
 @see AWSEmrRemoveManagedScalingPolicyOutput
 */
- (AWSTask<AWSEmrRemoveManagedScalingPolicyOutput *> *)removeManagedScalingPolicy:(AWSEmrRemoveManagedScalingPolicyInput *)request;

/**
 <p> Removes a managed scaling policy from a specified EMR cluster. </p>
 
 @param request A container for the necessary parameters to execute the RemoveManagedScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSEmrRemoveManagedScalingPolicyInput
 @see AWSEmrRemoveManagedScalingPolicyOutput
 */
- (void)removeManagedScalingPolicy:(AWSEmrRemoveManagedScalingPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSEmrRemoveManagedScalingPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p><p>The following example removes the stack tag with value Prod from a cluster:</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrRemoveTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrRemoveTagsInput
 @see AWSEmrRemoveTagsOutput
 */
- (AWSTask<AWSEmrRemoveTagsOutput *> *)removeTags:(AWSEmrRemoveTagsInput *)request;

/**
 <p>Removes tags from an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p><p>The following example removes the stack tag with value Prod from a cluster:</p>
 
 @param request A container for the necessary parameters to execute the RemoveTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`, `AWSEmrErrorInvalidRequest`.
 
 @see AWSEmrRemoveTagsInput
 @see AWSEmrRemoveTagsOutput
 */
- (void)removeTags:(AWSEmrRemoveTagsInput *)request completionHandler:(void (^ _Nullable)(AWSEmrRemoveTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If the <a>JobFlowInstancesConfig</a><code>KeepJobFlowAliveWhenNoSteps</code> parameter is set to <code>TRUE</code>, the cluster transitions to the WAITING state rather than shutting down after the steps have completed. </p><p>For additional protection, you can set the <a>JobFlowInstancesConfig</a><code>TerminationProtected</code> parameter to <code>TRUE</code> to lock the cluster and prevent it from being terminated by API call, user intervention, or in the event of a job flow error.</p><p>A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using the SSH shell to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>For long running clusters, we recommend that you periodically store your results.</p><note><p>The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or InstanceGroups parameters, but not both.</p></note>
 
 @param request A container for the necessary parameters to execute the RunJobFlow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSEmrRunJobFlowOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrRunJobFlowInput
 @see AWSEmrRunJobFlowOutput
 */
- (AWSTask<AWSEmrRunJobFlowOutput *> *)runJobFlow:(AWSEmrRunJobFlowInput *)request;

/**
 <p>RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps specified. After the steps complete, the cluster stops and the HDFS partition is lost. To prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If the <a>JobFlowInstancesConfig</a><code>KeepJobFlowAliveWhenNoSteps</code> parameter is set to <code>TRUE</code>, the cluster transitions to the WAITING state rather than shutting down after the steps have completed. </p><p>For additional protection, you can set the <a>JobFlowInstancesConfig</a><code>TerminationProtected</code> parameter to <code>TRUE</code> to lock the cluster and prevent it from being terminated by API call, user intervention, or in the event of a job flow error.</p><p>A maximum of 256 steps are allowed in each job flow.</p><p>If your cluster is long-running (such as a Hive data warehouse) or complex, you may require more than 256 steps to process your data. You can bypass the 256-step limitation in various ways, including using the SSH shell to connect to the master node and submitting queries directly to the software running on the master node, such as Hive and Hadoop. For more information on how to do this, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/AddMoreThan256Steps.html">Add More than 256 Steps to a Cluster</a> in the <i>Amazon EMR Management Guide</i>.</p><p>For long running clusters, we recommend that you periodically store your results.</p><note><p>The instance fleets configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters or InstanceGroups parameters, but not both.</p></note>
 
 @param request A container for the necessary parameters to execute the RunJobFlow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrRunJobFlowInput
 @see AWSEmrRunJobFlowOutput
 */
- (void)runJobFlow:(AWSEmrRunJobFlowInput *)request completionHandler:(void (^ _Nullable)(AWSEmrRunJobFlowOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The cluster still terminates upon successful completion of the job flow. Calling <code>SetTerminationProtection</code> on a cluster is similar to calling the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances in a cluster.</p><p><code>SetTerminationProtection</code> is used to prevent accidental termination of a cluster and to ensure that in the event of an error, the instances persist so that you can recover any data stored in their ephemeral instance storage.</p><p> To terminate a cluster that has been locked by setting <code>SetTerminationProtection</code> to <code>true</code>, you must first unlock the job flow by a subsequent call to <code>SetTerminationProtection</code> in which you set the value to <code>false</code>. </p><p> For more information, see<a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the SetTerminationProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrSetTerminationProtectionInput
 */
- (AWSTask *)setTerminationProtection:(AWSEmrSetTerminationProtectionInput *)request;

/**
 <p>SetTerminationProtection locks a cluster (job flow) so the EC2 instances in the cluster cannot be terminated by user intervention, an API call, or in the event of a job-flow error. The cluster still terminates upon successful completion of the job flow. Calling <code>SetTerminationProtection</code> on a cluster is similar to calling the Amazon EC2 <code>DisableAPITermination</code> API on all EC2 instances in a cluster.</p><p><code>SetTerminationProtection</code> is used to prevent accidental termination of a cluster and to ensure that in the event of an error, the instances persist so that you can recover any data stored in their ephemeral instance storage.</p><p> To terminate a cluster that has been locked by setting <code>SetTerminationProtection</code> to <code>true</code>, you must first unlock the job flow by a subsequent call to <code>SetTerminationProtection</code> in which you set the value to <code>false</code>. </p><p> For more information, see<a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html">Managing Cluster Termination</a> in the <i>Amazon EMR Management Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the SetTerminationProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrSetTerminationProtectionInput
 */
- (void)setTerminationProtection:(AWSEmrSetTerminationProtectionInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether the cluster is visible to all IAM users of the AWS account associated with the cluster. Only the IAM user who created the cluster or the AWS account root user can call this action. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If set to <code>false</code>, only the IAM user that created the cluster can perform actions. This action works on running clusters. You can override the default <code>true</code> setting when you create a cluster by using the <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetVisibleToAllUsers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrSetVisibleToAllUsersInput
 */
- (AWSTask *)setVisibleToAllUsers:(AWSEmrSetVisibleToAllUsersInput *)request;

/**
 <p>Sets the <a>Cluster$VisibleToAllUsers</a> value, which determines whether the cluster is visible to all IAM users of the AWS account associated with the cluster. Only the IAM user who created the cluster or the AWS account root user can call this action. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If set to <code>false</code>, only the IAM user that created the cluster can perform actions. This action works on running clusters. You can override the default <code>true</code> setting when you create a cluster by using the <code>VisibleToAllUsers</code> parameter with <code>RunJobFlow</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetVisibleToAllUsers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrSetVisibleToAllUsersInput
 */
- (void)setVisibleToAllUsers:(AWSEmrSetVisibleToAllUsersInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step not yet completed is canceled and the EC2 instances on which the cluster is running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when the cluster was created.</p><p>The maximum number of clusters allowed is 10. The call to <code>TerminateJobFlows</code> is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.</p>
 
 @param request A container for the necessary parameters to execute the TerminateJobFlows service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrTerminateJobFlowsInput
 */
- (AWSTask *)terminateJobFlows:(AWSEmrTerminateJobFlowsInput *)request;

/**
 <p>TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any step not yet completed is canceled and the EC2 instances on which the cluster is running are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was specified when the cluster was created.</p><p>The maximum number of clusters allowed is 10. The call to <code>TerminateJobFlows</code> is asynchronous. Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to completely terminate and release allocated resources, such as Amazon EC2 instances.</p>
 
 @param request A container for the necessary parameters to execute the TerminateJobFlows service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSEmrErrorDomain` domain and the following error code: `AWSEmrErrorInternalServer`.
 
 @see AWSEmrTerminateJobFlowsInput
 */
- (void)terminateJobFlows:(AWSEmrTerminateJobFlowsInput *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
