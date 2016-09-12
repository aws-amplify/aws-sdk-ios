//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSAutoScalingModel.h"
#import "AWSAutoScalingResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>Auto Scaling</fullname><p>Auto Scaling is designed to automatically launch or terminate EC2 instances based on user-defined policies, schedules, and health checks. Use this service in conjunction with the Amazon CloudWatch and Elastic Load Balancing services.</p>
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
 Retrieves the service client associated with the key. You need to call `+ registerAutoScalingWithConfiguration:forKey:` before invoking this method.

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
 <p>Attaches one or more EC2 instances to the specified Auto Scaling group.</p><p>When you attach instances, Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails.</p><p>If there is a Classic load balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-instance-asg.html">Attach EC2 Instances to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachInstancesQuery
 */
- (AWSTask *)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request;

/**
 <p>Attaches one or more EC2 instances to the specified Auto Scaling group.</p><p>When you attach instances, Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails.</p><p>If there is a Classic load balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-instance-asg.html">Attach EC2 Instances to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachInstancesQuery
 */
- (void)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Attaches one or more target groups to the specified Auto Scaling group.</p><p>To describe the target groups for an Auto Scaling group, use <a>DescribeLoadBalancerTargetGroups</a>. To detach the target group from the Auto Scaling group, use <a>DetachLoadBalancerTargetGroups</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-load-balancer-asg.html">Attach a Load Balancer to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAttachLoadBalancerTargetGroupsResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsType
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsResultType
 */
- (AWSTask<AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *> *)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request;

/**
 <p>Attaches one or more target groups to the specified Auto Scaling group.</p><p>To describe the target groups for an Auto Scaling group, use <a>DescribeLoadBalancerTargetGroups</a>. To detach the target group from the Auto Scaling group, use <a>DetachLoadBalancerTargetGroups</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-load-balancer-asg.html">Attach a Load Balancer to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsType
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsResultType
 */
- (void)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAttachLoadBalancerTargetGroupsResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches one or more Classic load balancers to the specified Auto Scaling group.</p><p>To attach an Application load balancer instead, see <a>AttachLoadBalancerTargetGroups</a>.</p><p>To describe the load balancers for an Auto Scaling group, use <a>DescribeLoadBalancers</a>. To detach the load balancer from the Auto Scaling group, use <a>DetachLoadBalancers</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-load-balancer-asg.html">Attach a Load Balancer to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAttachLoadBalancersResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachLoadBalancersType
 @see AWSAutoScalingAttachLoadBalancersResultType
 */
- (AWSTask<AWSAutoScalingAttachLoadBalancersResultType *> *)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request;

/**
 <p>Attaches one or more Classic load balancers to the specified Auto Scaling group.</p><p>To attach an Application load balancer instead, see <a>AttachLoadBalancerTargetGroups</a>.</p><p>To describe the load balancers for an Auto Scaling group, use <a>DescribeLoadBalancers</a>. To detach the load balancer from the Auto Scaling group, use <a>DetachLoadBalancers</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/attach-load-balancer-asg.html">Attach a Load Balancer to Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAttachLoadBalancersType
 @see AWSAutoScalingAttachLoadBalancersResultType
 */
- (void)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAttachLoadBalancersResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Completes the lifecycle action for the specified token or instance with the specified result.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p></li><li><p><b>If you finish before the timeout period ends, complete the lifecycle action.</b></p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteLifecycleAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingCompleteLifecycleActionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCompleteLifecycleActionType
 @see AWSAutoScalingCompleteLifecycleActionAnswer
 */
- (AWSTask<AWSAutoScalingCompleteLifecycleActionAnswer *> *)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request;

/**
 <p>Completes the lifecycle action for the specified token or instance with the specified result.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p></li><li><p><b>If you finish before the timeout period ends, complete the lifecycle action.</b></p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteLifecycleAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCompleteLifecycleActionType
 @see AWSAutoScalingCompleteLifecycleActionAnswer
 */
- (void)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingCompleteLifecycleActionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Auto Scaling group with the specified name and attributes.</p><p>If you exceed your maximum limit of Auto Scaling groups, which by default is 20 per region, the call fails. For information about viewing and updating this limit, see <a>DescribeAccountLimits</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroup.html">Auto Scaling Groups</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateAutoScalingGroupType
 */
- (AWSTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request;

/**
 <p>Creates an Auto Scaling group with the specified name and attributes.</p><p>If you exceed your maximum limit of Auto Scaling groups, which by default is 20 per region, the call fails. For information about viewing and updating this limit, see <a>DescribeAccountLimits</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroup.html">Auto Scaling Groups</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateAutoScalingGroupType
 */
- (void)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a launch configuration.</p><p>If you exceed your maximum limit of launch configurations, which by default is 100 per region, the call fails. For information about viewing and updating this limit, see <a>DescribeAccountLimits</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/LaunchConfiguration.html">Launch Configurations</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateLaunchConfigurationType
 */
- (AWSTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request;

/**
 <p>Creates a launch configuration.</p><p>If you exceed your maximum limit of launch configurations, which by default is 100 per region, the call fails. For information about viewing and updating this limit, see <a>DescribeAccountLimits</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/LaunchConfiguration.html">Launch Configurations</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateLaunchConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateLaunchConfigurationType
 */
- (void)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates tags for the specified Auto Scaling group.</p><p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tagging Auto Scaling Groups and Instances</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrUpdateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateOrUpdateTagsType
 */
- (AWSTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request;

/**
 <p>Creates or updates tags for the specified Auto Scaling group.</p><p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tagging Auto Scaling Groups and Instances</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrUpdateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateOrUpdateTagsType
 */
- (void)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Auto Scaling group.</p><p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed.</p><p>If the group has policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p><p>To remove instances from the Auto Scaling group before deleting it, call <a>DetachInstances</a> with the list of instances and the option to decrement the desired capacity so that Auto Scaling does not launch replacement instances.</p><p>To terminate all instances before deleting the Auto Scaling group, call <a>UpdateAutoScalingGroup</a> and set the minimum size and desired capacity of the Auto Scaling group to zero.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteAutoScalingGroupType
 */
- (AWSTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request;

/**
 <p>Deletes the specified Auto Scaling group.</p><p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed.</p><p>If the group has policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p><p>To remove instances from the Auto Scaling group before deleting it, call <a>DetachInstances</a> with the list of instances and the option to decrement the desired capacity so that Auto Scaling does not launch replacement instances.</p><p>To terminate all instances before deleting the Auto Scaling group, call <a>UpdateAutoScalingGroup</a> and set the minimum size and desired capacity of the Auto Scaling group to zero.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteAutoScalingGroupType
 */
- (void)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified launch configuration.</p><p>The launch configuration must not be attached to an Auto Scaling group. When this call completes, the launch configuration is no longer available for use.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNameType
 */
- (AWSTask *)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request;

/**
 <p>Deletes the specified launch configuration.</p><p>The launch configuration must not be attached to an Auto Scaling group. When this call completes, the launch configuration is no longer available for use.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLaunchConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNameType
 */
- (void)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified lifecycle hook.</p><p>If there are any outstanding lifecycle actions, they are completed first (<code>ABANDON</code> for launching instances, <code>CONTINUE</code> for terminating instances).</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecycleHook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDeleteLifecycleHookAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteLifecycleHookType
 @see AWSAutoScalingDeleteLifecycleHookAnswer
 */
- (AWSTask<AWSAutoScalingDeleteLifecycleHookAnswer *> *)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request;

/**
 <p>Deletes the specified lifecycle hook.</p><p>If there are any outstanding lifecycle actions, they are completed first (<code>ABANDON</code> for launching instances, <code>CONTINUE</code> for terminating instances).</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecycleHook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteLifecycleHookType
 @see AWSAutoScalingDeleteLifecycleHookAnswer
 */
- (void)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDeleteLifecycleHookAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified notification.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotificationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteNotificationConfigurationType
 */
- (AWSTask *)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request;

/**
 <p>Deletes the specified notification.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNotificationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteNotificationConfigurationType
 */
- (void)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Auto Scaling policy.</p><p>Deleting a policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeletePolicyType
 */
- (AWSTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request;

/**
 <p>Deletes the specified Auto Scaling policy.</p><p>Deleting a policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeletePolicyType
 */
- (void)deletePolicy:(AWSAutoScalingDeletePolicyType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified scheduled action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteScheduledActionType
 */
- (AWSTask *)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request;

/**
 <p>Deletes the specified scheduled action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteScheduledActionType
 */
- (void)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified tags.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteTagsType
 */
- (AWSTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request;

/**
 <p>Deletes the specified tags.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteTagsType
 */
- (void)deleteTags:(AWSAutoScalingDeleteTagsType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes the current Auto Scaling resource limits for your AWS account.</p><p>For information about requesting an increase in these limits, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAccountLimitsAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAccountLimitsAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAccountLimitsAnswer *> *)describeAccountLimits:(AWSRequest *)request;

/**
 <p>Describes the current Auto Scaling resource limits for your AWS account.</p><p>For information about requesting an increase in these limits, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAccountLimitsAnswer
 */
- (void)describeAccountLimits:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAccountLimitsAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the policy adjustment types for use with <a>PutScalingPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAdjustmentTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAdjustmentTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAdjustmentTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAdjustmentTypesAnswer *> *)describeAdjustmentTypes:(AWSRequest *)request;

/**
 <p>Describes the policy adjustment types for use with <a>PutScalingPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAdjustmentTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAdjustmentTypesAnswer
 */
- (void)describeAdjustmentTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAdjustmentTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more Auto Scaling groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingGroupsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAutoScalingGroupNamesType
 @see AWSAutoScalingAutoScalingGroupsType
 */
- (AWSTask<AWSAutoScalingAutoScalingGroupsType *> *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request;

/**
 <p>Describes one or more Auto Scaling groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAutoScalingGroupNamesType
 @see AWSAutoScalingAutoScalingGroupsType
 */
- (void)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAutoScalingGroupsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more Auto Scaling instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingInstancesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeAutoScalingInstancesType
 @see AWSAutoScalingAutoScalingInstancesType
 */
- (AWSTask<AWSAutoScalingAutoScalingInstancesType *> *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request;

/**
 <p>Describes one or more Auto Scaling instances.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeAutoScalingInstancesType
 @see AWSAutoScalingAutoScalingInstancesType
 */
- (void)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAutoScalingInstancesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the notification types that are supported by Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingNotificationTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *> *)describeAutoScalingNotificationTypes:(AWSRequest *)request;

/**
 <p>Describes the notification types that are supported by Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingNotificationTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer
 */
- (void)describeAutoScalingNotificationTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more launch configurations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingLaunchConfigurationsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNamesType
 @see AWSAutoScalingLaunchConfigurationsType
 */
- (AWSTask<AWSAutoScalingLaunchConfigurationsType *> *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request;

/**
 <p>Describes one or more launch configurations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNamesType
 @see AWSAutoScalingLaunchConfigurationsType
 */
- (void)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingLaunchConfigurationsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available types of lifecycle hooks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHookTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHookTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeLifecycleHookTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeLifecycleHookTypesAnswer *> *)describeLifecycleHookTypes:(AWSRequest *)request;

/**
 <p>Describes the available types of lifecycle hooks.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHookTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeLifecycleHookTypesAnswer
 */
- (void)describeLifecycleHookTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLifecycleHookTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the lifecycle hooks for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHooks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHooksAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLifecycleHooksType
 @see AWSAutoScalingDescribeLifecycleHooksAnswer
 */
- (AWSTask<AWSAutoScalingDescribeLifecycleHooksAnswer *> *)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request;

/**
 <p>Describes the lifecycle hooks for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHooks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLifecycleHooksType
 @see AWSAutoScalingDescribeLifecycleHooksAnswer
 */
- (void)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLifecycleHooksAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the target groups for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse
 */
- (AWSTask<AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *> *)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request;

/**
 <p>Describes the target groups for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse
 */
- (void)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the load balancers for the specified Auto Scaling group.</p><p>Note that this operation describes only Classic load balancers. If you have Application load balancers, use <a>DescribeLoadBalancerTargetGroups</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLoadBalancersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLoadBalancersRequest
 @see AWSAutoScalingDescribeLoadBalancersResponse
 */
- (AWSTask<AWSAutoScalingDescribeLoadBalancersResponse *> *)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request;

/**
 <p>Describes the load balancers for the specified Auto Scaling group.</p><p>Note that this operation describes only Classic load balancers. If you have Application load balancers, use <a>DescribeLoadBalancerTargetGroups</a> instead.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLoadBalancersRequest
 @see AWSAutoScalingDescribeLoadBalancersResponse
 */
- (void)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLoadBalancersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available CloudWatch metrics for Auto Scaling.</p><p>Note that the <code>GroupStandbyInstances</code> metric is not returned by default. You must explicitly request this metric when calling <a>EnableMetricsCollection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricCollectionTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeMetricCollectionTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeMetricCollectionTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeMetricCollectionTypesAnswer *> *)describeMetricCollectionTypes:(AWSRequest *)request;

/**
 <p>Describes the available CloudWatch metrics for Auto Scaling.</p><p>Note that the <code>GroupStandbyInstances</code> metric is not returned by default. You must explicitly request this metric when calling <a>EnableMetricsCollection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricCollectionTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeMetricCollectionTypesAnswer
 */
- (void)describeMetricCollectionTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeMetricCollectionTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the notification actions associated with the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotificationConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeNotificationConfigurationsAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeNotificationConfigurationsType
 @see AWSAutoScalingDescribeNotificationConfigurationsAnswer
 */
- (AWSTask<AWSAutoScalingDescribeNotificationConfigurationsAnswer *> *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request;

/**
 <p>Describes the notification actions associated with the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotificationConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeNotificationConfigurationsType
 @see AWSAutoScalingDescribeNotificationConfigurationsAnswer
 */
- (void)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeNotificationConfigurationsAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the policies for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPoliciesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribePoliciesType
 @see AWSAutoScalingPoliciesType
 */
- (AWSTask<AWSAutoScalingPoliciesType *> *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request;

/**
 <p>Describes the policies for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribePoliciesType
 @see AWSAutoScalingPoliciesType
 */
- (void)describePolicies:(AWSAutoScalingDescribePoliciesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPoliciesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more scaling activities for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivitiesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScalingActivitiesType
 @see AWSAutoScalingActivitiesType
 */
- (AWSTask<AWSAutoScalingActivitiesType *> *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request;

/**
 <p>Describes one or more scaling activities for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScalingActivitiesType
 @see AWSAutoScalingActivitiesType
 */
- (void)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingActivitiesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the scaling process types for use with <a>ResumeProcesses</a> and <a>SuspendProcesses</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingProcessTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingProcessesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingProcessesType
 */
- (AWSTask<AWSAutoScalingProcessesType *> *)describeScalingProcessTypes:(AWSRequest *)request;

/**
 <p>Describes the scaling process types for use with <a>ResumeProcesses</a> and <a>SuspendProcesses</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingProcessTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingProcessesType
 */
- (void)describeScalingProcessTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingProcessesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the actions scheduled for your Auto Scaling group that haven't run. To describe the actions that have already run, use <a>DescribeScalingActivities</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingScheduledActionsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScheduledActionsType
 @see AWSAutoScalingScheduledActionsType
 */
- (AWSTask<AWSAutoScalingScheduledActionsType *> *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request;

/**
 <p>Describes the actions scheduled for your Auto Scaling group that haven't run. To describe the actions that have already run, use <a>DescribeScalingActivities</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScheduledActionsType
 @see AWSAutoScalingScheduledActionsType
 */
- (void)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingScheduledActionsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified tags.</p><p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p><p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingTagsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeTagsType
 @see AWSAutoScalingTagsType
 */
- (AWSTask<AWSAutoScalingTagsType *> *)describeTags:(AWSAutoScalingDescribeTagsType *)request;

/**
 <p>Describes the specified tags.</p><p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p><p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeTagsType
 @see AWSAutoScalingTagsType
 */
- (void)describeTags:(AWSAutoScalingDescribeTagsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingTagsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the termination policies supported by Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTerminationPolicyTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeTerminationPolicyTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeTerminationPolicyTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeTerminationPolicyTypesAnswer *> *)describeTerminationPolicyTypes:(AWSRequest *)request;

/**
 <p>Describes the termination policies supported by Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTerminationPolicyTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeTerminationPolicyTypesAnswer
 */
- (void)describeTerminationPolicyTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeTerminationPolicyTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more instances from the specified Auto Scaling group.</p><p>After the instances are detached, you can manage them independently from the rest of the Auto Scaling group.</p><p>If you do not specify the option to decrement the desired capacity, Auto Scaling launches instances to replace the ones that are detached.</p><p>If there is a Classic load balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/detach-instance-asg.html">Detach EC2 Instances from Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachInstancesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachInstancesQuery
 @see AWSAutoScalingDetachInstancesAnswer
 */
- (AWSTask<AWSAutoScalingDetachInstancesAnswer *> *)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request;

/**
 <p>Removes one or more instances from the specified Auto Scaling group.</p><p>After the instances are detached, you can manage them independently from the rest of the Auto Scaling group.</p><p>If you do not specify the option to decrement the desired capacity, Auto Scaling launches instances to replace the ones that are detached.</p><p>If there is a Classic load balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/detach-instance-asg.html">Detach EC2 Instances from Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachInstancesQuery
 @see AWSAutoScalingDetachInstancesAnswer
 */
- (void)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachInstancesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches one or more target groups from the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachLoadBalancerTargetGroupsResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsType
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsResultType
 */
- (AWSTask<AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *> *)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request;

/**
 <p>Detaches one or more target groups from the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsType
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsResultType
 */
- (void)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachLoadBalancerTargetGroupsResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches one or more Classic load balancers from the specified Auto Scaling group.</p><p>Note that this operation detaches only Classic load balancers. If you have Application load balancers, use <a>DetachLoadBalancerTargetGroups</a> instead.</p><p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using <a>DescribeLoadBalancers</a>. Note that the instances remain running.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachLoadBalancersResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancersType
 @see AWSAutoScalingDetachLoadBalancersResultType
 */
- (AWSTask<AWSAutoScalingDetachLoadBalancersResultType *> *)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request;

/**
 <p>Detaches one or more Classic load balancers from the specified Auto Scaling group.</p><p>Note that this operation detaches only Classic load balancers. If you have Application load balancers, use <a>DetachLoadBalancerTargetGroups</a> instead.</p><p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using <a>DescribeLoadBalancers</a>. Note that the instances remain running.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancersType
 @see AWSAutoScalingDetachLoadBalancersResultType
 */
- (void)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachLoadBalancersResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables monitoring of the specified metrics for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DisableMetricsCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDisableMetricsCollectionQuery
 */
- (AWSTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request;

/**
 <p>Disables monitoring of the specified metrics for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DisableMetricsCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDisableMetricsCollectionQuery
 */
- (void)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables monitoring of the specified metrics for the specified Auto Scaling group.</p><p>You can only enable metrics collection if <code>InstanceMonitoring</code> in the launch configuration for the group is set to <code>True</code>.</p>
 
 @param request A container for the necessary parameters to execute the EnableMetricsCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnableMetricsCollectionQuery
 */
- (AWSTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request;

/**
 <p>Enables monitoring of the specified metrics for the specified Auto Scaling group.</p><p>You can only enable metrics collection if <code>InstanceMonitoring</code> in the launch configuration for the group is set to <code>True</code>.</p>
 
 @param request A container for the necessary parameters to execute the EnableMetricsCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnableMetricsCollectionQuery
 */
- (void)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Moves the specified instances into <code>Standby</code> mode.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnterStandby service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingEnterStandbyAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnterStandbyQuery
 @see AWSAutoScalingEnterStandbyAnswer
 */
- (AWSTask<AWSAutoScalingEnterStandbyAnswer *> *)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request;

/**
 <p>Moves the specified instances into <code>Standby</code> mode.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnterStandby service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnterStandbyQuery
 @see AWSAutoScalingEnterStandbyAnswer
 */
- (void)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingEnterStandbyAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Executes the specified policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecutePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExecutePolicyType
 */
- (AWSTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request;

/**
 <p>Executes the specified policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecutePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExecutePolicyType
 */
- (void)executePolicy:(AWSAutoScalingExecutePolicyType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Moves the specified instances out of <code>Standby</code> mode.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExitStandby service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingExitStandbyAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExitStandbyQuery
 @see AWSAutoScalingExitStandbyAnswer
 */
- (AWSTask<AWSAutoScalingExitStandbyAnswer *> *)exitStandby:(AWSAutoScalingExitStandbyQuery *)request;

/**
 <p>Moves the specified instances out of <code>Standby</code> mode.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExitStandby service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExitStandbyQuery
 @see AWSAutoScalingExitStandbyAnswer
 */
- (void)exitStandby:(AWSAutoScalingExitStandbyQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingExitStandbyAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a lifecycle hook for the specified Auto Scaling Group.</p><p>A lifecycle hook tells Auto Scaling that you want to perform an action on an instance that is not actively in service; for example, either when the instance launches or before the instance terminates.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p><b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b></p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p></li><li><p>If you finish before the timeout period ends, complete the lifecycle action.</p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails. For information about updating this limit, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleHook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPutLifecycleHookAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutLifecycleHookType
 @see AWSAutoScalingPutLifecycleHookAnswer
 */
- (AWSTask<AWSAutoScalingPutLifecycleHookAnswer *> *)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request;

/**
 <p>Creates or updates a lifecycle hook for the specified Auto Scaling Group.</p><p>A lifecycle hook tells Auto Scaling that you want to perform an action on an instance that is not actively in service; for example, either when the instance launches or before the instance terminates.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p><b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b></p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p></li><li><p>If you finish before the timeout period ends, complete the lifecycle action.</p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails. For information about updating this limit, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleHook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutLifecycleHookType
 @see AWSAutoScalingPutLifecycleHookAnswer
 */
- (void)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPutLifecycleHookAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address.</p><p>This configuration overwrites any existing configuration.</p><p>For more information see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASGettingNotifications.html">Getting SNS Notifications When Your Auto Scaling Group Scales</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutNotificationConfigurationType
 */
- (AWSTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request;

/**
 <p>Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address.</p><p>This configuration overwrites any existing configuration.</p><p>For more information see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASGettingNotifications.html">Getting SNS Notifications When Your Auto Scaling Group Scales</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutNotificationConfigurationType
 */
- (void)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a policy for an Auto Scaling group. To update an existing policy, use the existing policy name and set the parameters you want to change. Any existing parameter not changed in an update to an existing policy is not changed in this update request.</p><p>If you exceed your maximum limit of step adjustments, which by default is 20 per region, the call fails. For information about updating this limit, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPolicyARNType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScalingPolicyType
 @see AWSAutoScalingPolicyARNType
 */
- (AWSTask<AWSAutoScalingPolicyARNType *> *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request;

/**
 <p>Creates or updates a policy for an Auto Scaling group. To update an existing policy, use the existing policy name and set the parameters you want to change. Any existing parameter not changed in an update to an existing policy is not changed in this update request.</p><p>If you exceed your maximum limit of step adjustments, which by default is 20 per region, the call fails. For information about updating this limit, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">AWS Service Limits</a> in the <i>Amazon Web Services General Reference</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScalingPolicyType
 @see AWSAutoScalingPolicyARNType
 */
- (void)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPolicyARNType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scheduled scaling action for an Auto Scaling group. When updating a scheduled scaling action, if you leave a parameter unspecified, the corresponding value remains unchanged in the affected Auto Scaling group.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/schedule_time.html">Scheduled Scaling</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutScheduledUpdateGroupAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScheduledUpdateGroupActionType
 */
- (AWSTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request;

/**
 <p>Creates or updates a scheduled scaling action for an Auto Scaling group. When updating a scheduled scaling action, if you leave a parameter unspecified, the corresponding value remains unchanged in the affected Auto Scaling group.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/schedule_time.html">Scheduled Scaling</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutScheduledUpdateGroupAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScheduledUpdateGroupActionType
 */
- (void)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using <a>PutLifecycleHook</a>.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p><b>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</b></p></li><li><p>If you finish before the timeout period ends, complete the lifecycle action.</p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RecordLifecycleActionHeartbeat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingRecordLifecycleActionHeartbeatAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingRecordLifecycleActionHeartbeatType
 @see AWSAutoScalingRecordLifecycleActionHeartbeatAnswer
 */
- (AWSTask<AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *> *)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request;

/**
 <p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using <a>PutLifecycleHook</a>.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Auto Scaling launches or terminates instances.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p><b>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</b></p></li><li><p>If you finish before the timeout period ends, complete the lifecycle action.</p></li></ol><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RecordLifecycleActionHeartbeat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingRecordLifecycleActionHeartbeatType
 @see AWSAutoScalingRecordLifecycleActionHeartbeatAnswer
 */
- (void)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingRecordLifecycleActionHeartbeatAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resumes the specified suspended Auto Scaling processes, or all suspended process, for the specified Auto Scaling group.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspending and Resuming Auto Scaling Processes</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResumeProcesses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p>Resumes the specified suspended Auto Scaling processes, or all suspended process, for the specified Auto Scaling group.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspending and Resuming Auto Scaling Processes</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResumeProcesses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (void)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the size of the specified Auto Scaling group.</p><p>For more information about desired capacity, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/WhatIsAutoScaling.html">What Is Auto Scaling?</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetDesiredCapacity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetDesiredCapacityType
 */
- (AWSTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request;

/**
 <p>Sets the size of the specified Auto Scaling group.</p><p>For more information about desired capacity, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/WhatIsAutoScaling.html">What Is Auto Scaling?</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetDesiredCapacity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetDesiredCapacityType
 */
- (void)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the health status of the specified instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html">Health Checks</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceHealthQuery
 */
- (AWSTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request;

/**
 <p>Sets the health status of the specified instance.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html">Health Checks</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceHealthQuery
 */
- (void)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the instance protection settings of the specified instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html#instance-protection">Instance Protection</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingSetInstanceProtectionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceProtectionQuery
 @see AWSAutoScalingSetInstanceProtectionAnswer
 */
- (AWSTask<AWSAutoScalingSetInstanceProtectionAnswer *> *)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request;

/**
 <p>Updates the instance protection settings of the specified instances.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html#instance-protection">Instance Protection</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceProtectionQuery
 @see AWSAutoScalingSetInstanceProtectionAnswer
 */
- (void)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingSetInstanceProtectionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Suspends the specified Auto Scaling processes, or all processes, for the specified Auto Scaling group.</p><p>Note that if you suspend either the <code>Launch</code> or <code>Terminate</code> process types, it can prevent other process types from functioning properly.</p><p>To resume processes that have been suspended, use <a>ResumeProcesses</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspending and Resuming Auto Scaling Processes</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SuspendProcesses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p>Suspends the specified Auto Scaling processes, or all processes, for the specified Auto Scaling group.</p><p>Note that if you suspend either the <code>Launch</code> or <code>Terminate</code> process types, it can prevent other process types from functioning properly.</p><p>To resume processes that have been suspended, use <a>ResumeProcesses</a>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html">Suspending and Resuming Auto Scaling Processes</a> in the <i>Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SuspendProcesses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (void)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the specified instance and optionally adjusts the desired group size.</p><p>This call simply makes a termination request. The instance is not terminated immediately.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstanceInAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivityType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingTerminateInstanceInAutoScalingGroupType
 @see AWSAutoScalingActivityType
 */
- (AWSTask<AWSAutoScalingActivityType *> *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request;

/**
 <p>Terminates the specified instance and optionally adjusts the desired group size.</p><p>This call simply makes a termination request. The instance is not terminated immediately.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstanceInAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingTerminateInstanceInAutoScalingGroupType
 @see AWSAutoScalingActivityType
 */
- (void)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingActivityType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration for the specified Auto Scaling group.</p><p>To update an Auto Scaling group with a launch configuration with <code>InstanceMonitoring</code> set to <code>False</code>, you must first disable the collection of group metrics. Otherwise, you will get an error. If you have previously enabled the collection of group metrics, you can disable it using <a>DisableMetricsCollection</a>.</p><p>The new settings are registered upon the completion of this call. Any launch configuration settings take effect on any triggers after this call returns. Scaling activities that are currently in progress aren't affected.</p><p>Note the following:</p><ul><li><p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, we implicitly call <a>SetDesiredCapacity</a> to set the size of the group to the new value of <code>MinSize</code>.</p></li><li><p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, we implicitly call <a>SetDesiredCapacity</a> to set the size of the group to the new value of <code>MaxSize</code>.</p></li><li><p>All other optional parameters are left unchanged if not specified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingUpdateAutoScalingGroupType
 */
- (AWSTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request;

/**
 <p>Updates the configuration for the specified Auto Scaling group.</p><p>To update an Auto Scaling group with a launch configuration with <code>InstanceMonitoring</code> set to <code>False</code>, you must first disable the collection of group metrics. Otherwise, you will get an error. If you have previously enabled the collection of group metrics, you can disable it using <a>DisableMetricsCollection</a>.</p><p>The new settings are registered upon the completion of this call. Any launch configuration settings take effect on any triggers after this call returns. Scaling activities that are currently in progress aren't affected.</p><p>Note the following:</p><ul><li><p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, we implicitly call <a>SetDesiredCapacity</a> to set the size of the group to the new value of <code>MinSize</code>.</p></li><li><p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, we implicitly call <a>SetDesiredCapacity</a> to set the size of the group to the new value of <code>MaxSize</code>.</p></li><li><p>All other optional parameters are left unchanged if not specified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingUpdateAutoScalingGroupType
 */
- (void)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
