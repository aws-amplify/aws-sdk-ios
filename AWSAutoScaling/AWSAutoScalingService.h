/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSAutoScalingModel.h"
/**
 <fullname>Auto Scaling</fullname><p> Auto Scaling is a web service designed to automatically launch or terminate Amazon Elastic Compute Cloud (Amazon EC2) instances based on user-defined policies, schedules, and health checks. This service is used in conjunction with Amazon CloudWatch and Elastic Load Balancing services. </p><p>Auto Scaling provides APIs that you can call by submitting a Query Request. Query requests are HTTP or HTTPS requests that use the HTTP verbs GET or POST and a Query parameter named <i>Action</i> or <i>Operation</i> that specifies the API you are calling. Action is used throughout this documentation, although Operation is also supported for backward compatibility with other Amazon Web Services (AWS) Query APIs. </p><p>Calling the API using a Query request is the most direct way to access the web service, but requires that your application handle low-level details such as generating the hash to sign the request and error handling. The benefit of calling the service using a Query request is that you are assured of having access to the complete functionality of the API. For information about signing a a query request, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/api_requests.html">Use Query Requests to Call Auto Scaling APIs</a></p><p> This guide provides detailed information about Auto Scaling actions, data types, parameters, and errors. For detailed information about Auto Scaling features and their associated API actions, go to the <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/">Auto Scaling Developer Guide</a>. </p><p>This reference is based on the current WSDL, which is available at:</p><p><a href="http://autoscaling.amazonaws.com/doc/2011-01-01/AutoScaling.wsdl">http://autoscaling.amazonaws.com/doc/2011-01-01/AutoScaling.wsdl</a></p><p><b>Endpoints</b></p><p>The examples in this guide assume that your instances are launched in the US East (Northern Virginia) region and use us-east-1 as the endpoint.</p><p>You can set up your Auto Scaling infrastructure in other AWS regions. For information about this product's regions and endpoints, see <a href="http://docs.aws.amazon.com/general/latest/gr/index.html?rande.html">Regions and Endpoints</a> in the Amazon Web Services General Reference. </p>
 */
@interface AWSAutoScaling : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let AutoScaling = AWSAutoScaling.defaultAutoScaling()

 *Objective-C*

     AWSAutoScaling *AutoScaling = [AWSAutoScaling defaultAutoScaling];

 @return The default service client.
 */
+ (instancetype)defaultAutoScaling;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSAutoScaling.registerAutoScalingWithConfiguration(configuration, forKey: "USWest2AutoScaling")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:@"USWest2AutoScaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AutoScaling = AWSAutoScaling(forKey: "USWest2AutoScaling")

 *Objective-C*

     AWSAutoScaling *AutoScaling = [AWSAutoScaling AutoScalingForKey:@"USWest2AutoScaling"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAutoScalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAutoScalingWithConfiguration:forKey:` before invoking this method. If `+ registerAutoScalingWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSAutoScaling.registerAutoScalingWithConfiguration(configuration, forKey: "USWest2AutoScaling")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAutoScaling registerAutoScalingWithConfiguration:configuration forKey:@"USWest2AutoScaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AutoScaling = AWSAutoScaling(forKey: "USWest2AutoScaling")

 *Objective-C*

     AWSAutoScaling *AutoScaling = [AWSAutoScaling AutoScalingForKey:@"USWest2AutoScaling"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AutoScalingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAutoScalingForKey:(NSString *)key;

/**
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerAutoScalingWithConfiguration:forKey:` and `+ AutoScalingForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerAutoScalingWithConfiguration:forKey:' and '+ AutoScalingForKey:' instead.")));

/**
 <p> Attaches one or more Amazon EC2 instances to an existing Auto Scaling group. After the instance(s) is attached, it becomes a part of the Auto Scaling group. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-instance-asg.html">Attach Amazon EC2 Instances to Your Existing Auto Scaling Group</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingAttachInstancesQuery
 */
- (AWSTask *)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request;

/**
 <p>Completes the lifecycle action for the associated token initiated under the given lifecycle hook with the specified result. </p><p> This operation is a part of the basic sequence for adding a lifecycle hook to an Auto Scaling group: </p><ol><li> Create a notification target. A target can be either an Amazon SQS queue or an Amazon SNS topic. </li><li> Create an IAM role. This role allows Auto Scaling to publish lifecycle notifications to the designated SQS queue or SNS topic. </li><li> Create the lifecycle hook. You can create a hook that acts when instances launch or when instances terminate. </li><li> If necessary, record the lifecycle action heartbeat to keep the instance in a pending state. </li><li><b>Complete the lifecycle action.</b></li></ol><p>To learn more, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingPendingState.html">Auto Scaling Pending State</a> and <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingTerminatingState.html">Auto Scaling Terminating State</a>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteLifecycleAction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingCompleteLifecycleActionAnswer`.
 
 @see AWSAutoScalingCompleteLifecycleActionType
 @see AWSAutoScalingCompleteLifecycleActionAnswer
 */
- (AWSTask *)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request;

/**
 <p> Creates a new Auto Scaling group with the specified name and other attributes. When the creation request is completed, the Auto Scaling group is ready to be used in other calls. </p><note> The Auto Scaling group name must be unique within the scope of your AWS account. </note>
 
 @param request A container for the necessary parameters to execute the CreateAutoScalingGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingCreateAutoScalingGroupType
 */
- (AWSTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request;

/**
 <p> Creates a new launch configuration. The launch configuration name must be unique within the scope of the client's AWS account. The maximum limit of launch configurations, which by default is 100, must not yet have been met; otherwise, the call will fail. When created, the new launch configuration is available for immediate use. </p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingCreateLaunchConfigurationType
 */
- (AWSTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request;

/**
 <p> Creates new tags or updates existing tags for an Auto Scaling group. </p><note> A tag's definition is composed of a resource ID, resource type, key and value, and the propagate flag. Value and the propagate flag are optional parameters. See the Request Parameters for more information. </note><p>For information on creating tags for your Auto Scaling group, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tag Your Auto Scaling Groups and Amazon EC2 Instances</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrUpdateTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorAlreadyExists`.
 
 @see AWSAutoScalingCreateOrUpdateTagsType
 */
- (AWSTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request;

/**
 <p> Deletes the specified Auto Scaling group if the group has no instances and no scaling activities in progress. </p><note> To remove all instances before calling <a>DeleteAutoScalingGroup</a>, you can call <a>UpdateAutoScalingGroup</a> to set the minimum and maximum size of the AutoScalingGroup to zero. </note>
 
 @param request A container for the necessary parameters to execute the DeleteAutoScalingGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingDeleteAutoScalingGroupType
 */
- (AWSTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request;

/**
 <p> Deletes the specified <a>LaunchConfiguration</a>. </p><p> The specified launch configuration must not be attached to an Auto Scaling group. When this call completes, the launch configuration is no longer available for use. </p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingLaunchConfigurationNameType
 */
- (AWSTask *)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request;

/**
 <p>Deletes the specified lifecycle hook. If there are any outstanding lifecycle actions, they are completed first (ABANDON for launching instances, CONTINUE for terminating instances).</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecycleHook service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDeleteLifecycleHookAnswer`.
 
 @see AWSAutoScalingDeleteLifecycleHookType
 @see AWSAutoScalingDeleteLifecycleHookAnswer
 */
- (AWSTask *)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request;

/**
 <p>Deletes notifications created by <a>PutNotificationConfiguration</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotificationConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingDeleteNotificationConfigurationType
 */
- (AWSTask *)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request;

/**
 <p>Deletes a policy created by <a>PutScalingPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingDeletePolicyType
 */
- (AWSTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request;

/**
 <p>Deletes a scheduled action previously created using the <a>PutScheduledUpdateGroupAction</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingDeleteScheduledActionType
 */
- (AWSTask *)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request;

/**
 <p>Removes the specified tags or a set of tags from a set of resources.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingDeleteTagsType
 */
- (AWSTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request;

/**
 <p> Returns the limits for the Auto Scaling resources currently allowed for your AWS account. </p><p>Your AWS account comes with default limits on resources for Auto Scaling. There is a default limit of <code>20</code> Auto Scaling groups and <code>100</code> launch configurations per region.</p><p>If you reach the limits for the number of Auto Scaling groups or the launch configurations, you can go to the <a href="https://aws.amazon.com/support/">Support Center</a> and place a request to raise the limits.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAccountLimitsAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAccountLimitsAnswer
 */
- (AWSTask *)describeAccountLimits:(AWSRequest *)request;

/**
 <p> Returns policy adjustment types for use in the <a>PutScalingPolicy</a> action. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAdjustmentTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAdjustmentTypesAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAdjustmentTypesAnswer
 */
- (AWSTask *)describeAdjustmentTypes:(AWSRequest *)request;

/**
 <p> Returns a full description of each Auto Scaling group in the given list. This includes all Amazon EC2 instances that are members of the group. If a list of names is not provided, the service returns the full details of all Auto Scaling groups. </p><p> This action supports pagination by returning a token if there are more pages to retrieve. To get the next page, call this action again with the returned token as the <code>NextToken</code> parameter. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingGroups service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingGroupsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingAutoScalingGroupNamesType
 @see AWSAutoScalingAutoScalingGroupsType
 */
- (AWSTask *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request;

/**
 <p> Returns a description of each Auto Scaling instance in the <code>InstanceIds</code> list. If a list is not provided, the service returns the full details of all instances up to a maximum of 50. By default, the service returns a list of 20 items. </p><p> This action supports pagination by returning a token if there are more pages to retrieve. To get the next page, call this action again with the returned token as the <code>NextToken</code> parameter. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingInstancesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeAutoScalingInstancesType
 @see AWSAutoScalingAutoScalingInstancesType
 */
- (AWSTask *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request;

/**
 <p> Returns a list of all notification types that are supported by Auto Scaling. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingNotificationTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer
 */
- (AWSTask *)describeAutoScalingNotificationTypes:(AWSRequest *)request;

/**
 <p> Returns a full description of the launch configurations, or the specified launch configurations, if they exist. </p><p> If no name is specified, then the full details of all launch configurations are returned. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchConfigurations service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingLaunchConfigurationsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingLaunchConfigurationNamesType
 @see AWSAutoScalingLaunchConfigurationsType
 */
- (AWSTask *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request;

/**
 <p>Describes the available types of lifecycle hooks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHookTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHookTypesAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeLifecycleHookTypesAnswer
 */
- (AWSTask *)describeLifecycleHookTypes:(AWSRequest *)request;

/**
 <p> Describes the lifecycle hooks that currently belong to the specified Auto Scaling group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHooks service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHooksAnswer`.
 
 @see AWSAutoScalingDescribeLifecycleHooksType
 @see AWSAutoScalingDescribeLifecycleHooksAnswer
 */
- (AWSTask *)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request;

/**
 <p> Returns a list of metrics and a corresponding list of granularities for each metric. </p><note><p>The <code>GroupStandbyInstances</code> metric is not returned by default. You must explicitly request it when calling <a>EnableMetricsCollection</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeMetricCollectionTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeMetricCollectionTypesAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeMetricCollectionTypesAnswer
 */
- (AWSTask *)describeMetricCollectionTypes:(AWSRequest *)request;

/**
 <p> Returns a list of notification actions associated with Auto Scaling groups for specified events. </p>
 
 @param request A container for the necessary parameters to execute the DescribeNotificationConfigurations service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeNotificationConfigurationsAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeNotificationConfigurationsType
 @see AWSAutoScalingDescribeNotificationConfigurationsAnswer
 */
- (AWSTask *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request;

/**
 <p> Returns descriptions of what each policy does. This action supports pagination. If the response includes a token, there are more records available. To get the additional records, repeat the request with the response token as the <code>NextToken</code> parameter. </p>
 
 @param request A container for the necessary parameters to execute the DescribePolicies service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPoliciesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribePoliciesType
 @see AWSAutoScalingPoliciesType
 */
- (AWSTask *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request;

/**
 <p> Returns the scaling activities for the specified Auto Scaling group. </p><p> If the specified <code>ActivityIds</code> list is empty, all the activities from the past six weeks are returned. Activities are sorted by the start time. Activities still in progress appear first on the list. </p><p> This action supports pagination. If the response includes a token, there are more records available. To get the additional records, repeat the request with the response token as the <code>NextToken</code> parameter. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivitiesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeScalingActivitiesType
 @see AWSAutoScalingActivitiesType
 */
- (AWSTask *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request;

/**
 <p>Returns scaling process types for use in the <a>ResumeProcesses</a> and <a>SuspendProcesses</a> actions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingProcessTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingProcessesType`.
 
 @see AWSRequest
 @see AWSAutoScalingProcessesType
 */
- (AWSTask *)describeScalingProcessTypes:(AWSRequest *)request;

/**
 <p> Lists all the actions scheduled for your Auto Scaling group that haven't been executed. To see a list of actions already executed, see the activity record returned in <a>DescribeScalingActivities</a>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingScheduledActionsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeScheduledActionsType
 @see AWSAutoScalingScheduledActionsType
 */
- (AWSTask *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request;

/**
 <p> Lists the Auto Scaling group tags. </p><p> You can use filters to limit results when describing tags. For example, you can query for tags of a particular Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results. </p><p> You can also specify multiple filters. The result includes information for a particular tag only if it matches all your filters. If there's no match, no special message is returned. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingTagsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeTagsType
 @see AWSAutoScalingTagsType
 */
- (AWSTask *)describeTags:(AWSAutoScalingDescribeTagsType *)request;

/**
 <p> Returns a list of all termination policies supported by Auto Scaling. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTerminationPolicyTypes service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeTerminationPolicyTypesAnswer`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeTerminationPolicyTypesAnswer
 */
- (AWSTask *)describeTerminationPolicyTypes:(AWSRequest *)request;

/**
 <p>Using <code>DetachInstances</code>, you can remove an instance from an Auto Scaling group. After the instances are detached, you can manage them independently from the rest of the Auto Scaling group.</p><p>To learn more about detaching instances, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/detach-instance-asg.html">Detach Amazon EC2 Instances From Your Auto Scaling Group</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstances service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachInstancesAnswer`.
 
 @see AWSAutoScalingDetachInstancesQuery
 @see AWSAutoScalingDetachInstancesAnswer
 */
- (AWSTask *)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request;

/**
 <p> Disables monitoring of group metrics for the Auto Scaling group specified in <code>AutoScalingGroupName</code>. You can specify the list of affected metrics with the <code>Metrics</code> parameter. </p>
 
 @param request A container for the necessary parameters to execute the DisableMetricsCollection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingDisableMetricsCollectionQuery
 */
- (AWSTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request;

/**
 <p> Enables monitoring of group metrics for the Auto Scaling group specified in <code>AutoScalingGroupName</code>. You can specify the list of enabled metrics with the <code>Metrics</code> parameter. </p><p> Auto Scaling metrics collection can be turned on only if the <code>InstanceMonitoring</code> flag, in the Auto Scaling group's launch configuration, is set to <code>True</code>. </p>
 
 @param request A container for the necessary parameters to execute the EnableMetricsCollection service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingEnableMetricsCollectionQuery
 */
- (AWSTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request;

/**
 <p> Move instances in an Auto Scaling group into a Standby mode. </p><p>To learn more about how to put instances into a Standby mode, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingInServiceState.html">Auto Scaling InService State</a>.</p>
 
 @param request A container for the necessary parameters to execute the EnterStandby service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingEnterStandbyAnswer`.
 
 @see AWSAutoScalingEnterStandbyQuery
 @see AWSAutoScalingEnterStandbyAnswer
 */
- (AWSTask *)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request;

/**
 <p>Executes the specified policy. </p>
 
 @param request A container for the necessary parameters to execute the ExecutePolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`.
 
 @see AWSAutoScalingExecutePolicyType
 */
- (AWSTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request;

/**
 <p> Move an instance out of Standby mode. </p><p>To learn more about how to put instances that are in a Standby mode back into service, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingInServiceState.html">Auto Scaling InService State</a>.</p>
 
 @param request A container for the necessary parameters to execute the ExitStandby service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingExitStandbyAnswer`.
 
 @see AWSAutoScalingExitStandbyQuery
 @see AWSAutoScalingExitStandbyAnswer
 */
- (AWSTask *)exitStandby:(AWSAutoScalingExitStandbyQuery *)request;

/**
 <p>Creates or updates a lifecycle hook for an Auto Scaling Group.</p><p>A lifecycle hook tells Auto Scaling that you want to perform an action on an instance that is not actively in service; for example, either when the instance launches or before the instance terminates.</p><p> This operation is a part of the basic sequence for adding a lifecycle hook to an Auto Scaling group: </p><ol><li> Create a notification target. A target can be either an Amazon SQS queue or an Amazon SNS topic. </li><li> Create an IAM role. This role allows Auto Scaling to publish lifecycle notifications to the designated SQS queue or SNS topic. </li><li><b>Create the lifecycle hook. You can create a hook that acts when instances launch or when instances terminate.</b></li><li> If necessary, record the lifecycle action heartbeat to keep the instance in a pending state. </li><li> Complete the lifecycle action. </li></ol><p>To learn more, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingPendingState.html">Auto Scaling Pending State</a> and <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingTerminatingState.html">Auto Scaling Terminating State</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleHook service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPutLifecycleHookAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingPutLifecycleHookType
 @see AWSAutoScalingPutLifecycleHookAnswer
 */
- (AWSTask *)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request;

/**
 <p> Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to this topic can have messages for events delivered to an endpoint such as a web server or email address. </p><p>For more information see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASGettingNotifications.html">Get Email Notifications When Your Auto Scaling Group Changes</a></p><p>A new <code>PutNotificationConfiguration</code> overwrites an existing configuration. </p>
 
 @param request A container for the necessary parameters to execute the PutNotificationConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingPutNotificationConfigurationType
 */
- (AWSTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request;

/**
 <p> Creates or updates a policy for an Auto Scaling group. To update an existing policy, use the existing policy name and set the parameter(s) you want to change. Any existing parameter not changed in an update to an existing policy is not changed in this update request. </p>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPolicyARNType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingPutScalingPolicyType
 @see AWSAutoScalingPolicyARNType
 */
- (AWSTask *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request;

/**
 <p> Creates or updates a scheduled scaling action for an Auto Scaling group. When updating a scheduled scaling action, if you leave a parameter unspecified, the corresponding value remains unchanged in the affected Auto Scaling group. </p><p>For information on creating or updating a scheduled action for your Auto Scaling group, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/schedule_time.html">Scale Based on a Schedule</a>.</p><note><p>Auto Scaling supports the date and time expressed in "YYYY-MM-DDThh:mm:ssZ" format in UTC/GMT only.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScheduledUpdateGroupAction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`.
 
 @see AWSAutoScalingPutScheduledUpdateGroupActionType
 */
- (AWSTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request;

/**
 <p> Records a heartbeat for the lifecycle action associated with a specific token. This extends the timeout by the length of time defined by the <code>HeartbeatTimeout</code> parameter of the <a>PutLifecycleHook</a> operation. </p><p> This operation is a part of the basic sequence for adding a lifecycle hook to an Auto Scaling group: </p><ol><li> Create a notification target. A target can be either an Amazon SQS queue or an Amazon SNS topic. </li><li> Create an IAM role. This role allows Auto Scaling to publish lifecycle notifications to the designated SQS queue or SNS topic. </li><li> Create the lifecycle hook. You can create a hook that acts when instances launch or when instances terminate. </li><li><b>If necessary, record the lifecycle action heartbeat to keep the instance in a pending state.</b></li><li> Complete the lifecycle action. </li></ol><p>To learn more, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingPendingState.html">Auto Scaling Pending State</a> and <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingTerminatingState.html">Auto Scaling Terminating State</a>.</p>
 
 @param request A container for the necessary parameters to execute the RecordLifecycleActionHeartbeat service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingRecordLifecycleActionHeartbeatAnswer`.
 
 @see AWSAutoScalingRecordLifecycleActionHeartbeatType
 @see AWSAutoScalingRecordLifecycleActionHeartbeatAnswer
 */
- (AWSTask *)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request;

/**
 <p> Resumes all suspended Auto Scaling processes for an Auto Scaling group. For information on suspending and resuming Auto Scaling process, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspend and Resume Auto Scaling Process</a>. </p>
 
 @param request A container for the necessary parameters to execute the ResumeProcesses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p> Sets the desired size of the specified <a>AutoScalingGroup</a>. </p>
 
 @param request A container for the necessary parameters to execute the SetDesiredCapacity service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`.
 
 @see AWSAutoScalingSetDesiredCapacityType
 */
- (AWSTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request;

/**
 <p> Sets the health status of a specified instance that belongs to any of your Auto Scaling groups. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-configure-healthcheck.html">Configure Health Checks for Your Auto Scaling group</a>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceHealth service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingSetInstanceHealthQuery
 */
- (AWSTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request;

/**
 <p> Suspends Auto Scaling processes for an Auto Scaling group. To suspend specific process types, specify them by name with the <code>ScalingProcesses.member.N</code> parameter. To suspend all process types, omit the <code>ScalingProcesses.member.N</code> parameter. </p><important><p> Suspending either of the two primary process types, <code>Launch</code> or <code>Terminate</code>, can prevent other process types from functioning properly. </p></important><p> To resume processes that have been suspended, use <a>ResumeProcesses</a> For more information on suspending and resuming Auto Scaling process, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspend and Resume Auto Scaling Process</a>. </p>
 
 @param request A container for the necessary parameters to execute the SuspendProcesses service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p> Terminates the specified instance. Optionally, the desired group size can be adjusted. </p><note> This call simply registers a termination request. The termination of the instance cannot happen immediately. </note>
 
 @param request A container for the necessary parameters to execute the TerminateInstanceInAutoScalingGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivityType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`.
 
 @see AWSAutoScalingTerminateInstanceInAutoScalingGroupType
 @see AWSAutoScalingActivityType
 */
- (AWSTask *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request;

/**
 <p> Updates the configuration for the specified <a>AutoScalingGroup</a>. </p><note><p> To update an Auto Scaling group with a launch configuration that has the <code>InstanceMonitoring</code> flag set to <code>False</code>, you must first ensure that collection of group metrics is disabled. Otherwise, calls to <a>UpdateAutoScalingGroup</a> will fail. If you have previously enabled group metrics collection, you can disable collection of all group metrics by calling <a>DisableMetricsCollection</a>. </p></note><p> The new settings are registered upon the completion of this call. Any launch configuration settings take effect on any triggers after this call returns. Scaling activities that are currently in progress aren't affected. </p><note><ul><li><p>If a new value is specified for <i>MinSize</i> without specifying the value for <i>DesiredCapacity</i>, and if the new <i>MinSize</i> is larger than the current size of the Auto Scaling Group, there will be an implicit call to <a>SetDesiredCapacity</a> to set the group to the new <i>MinSize</i>. </p></li><li><p>If a new value is specified for <i>MaxSize</i> without specifying the value for <i>DesiredCapacity</i>, and the new <i>MaxSize</i> is smaller than the current size of the Auto Scaling Group, there will be an implicit call to <a>SetDesiredCapacity</a> to set the group to the new <i>MaxSize</i>. </p></li><li><p>All other optional parameters are left unchanged if not passed in the request.</p></li></ul></note>
 
 @param request A container for the necessary parameters to execute the UpdateAutoScalingGroup service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domian and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`.
 
 @see AWSAutoScalingUpdateAutoScalingGroupType
 */
- (AWSTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request;

@end
