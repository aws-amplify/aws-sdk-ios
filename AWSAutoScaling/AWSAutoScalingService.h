//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

//! SDK version for AWSAutoScaling
FOUNDATION_EXPORT NSString *const AWSAutoScalingSDKVersion;

/**
 <fullname>Amazon EC2 Auto Scaling</fullname><p>Amazon EC2 Auto Scaling is designed to automatically launch and terminate EC2 instances based on user-defined scaling policies, scheduled actions, and health checks.</p><p>For more information, see the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/">Amazon EC2 Auto Scaling User Guide</a> and the <a href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/Welcome.html">Amazon EC2 Auto Scaling API Reference</a>.</p>
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

     let AutoScaling = AWSAutoScaling.default()

 *Objective-C*

     AWSAutoScaling *AutoScaling = [AWSAutoScaling defaultAutoScaling];

 @return The default service client.
 */
+ (instancetype)defaultAutoScaling;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAutoScaling.register(with: configuration!, forKey: "USWest2AutoScaling")
 
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

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAutoScaling.register(with: configuration!, forKey: "USWest2AutoScaling")
 
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
 <p>Attaches one or more EC2 instances to the specified Auto Scaling group.</p><p>When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails.</p><p>If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html">Attach EC2 instances to your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachInstancesQuery
 */
- (AWSTask *)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request;

/**
 <p>Attaches one or more EC2 instances to the specified Auto Scaling group.</p><p>When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails.</p><p>If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html">Attach EC2 instances to your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachInstancesQuery
 */
- (void)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancerTargetGroups</code>. You can use both the original <code>AttachLoadBalancerTargetGroups</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Attaches one or more target groups to the specified Auto Scaling group.</p><p>This operation is used with the following load balancer types: </p><ul><li><p>Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS. </p></li><li><p>Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP. </p></li><li><p>Gateway Load Balancer - Operates at the network layer (layer 3).</p></li></ul><p>To describe the target groups for an Auto Scaling group, call the <a>DescribeLoadBalancerTargetGroups</a> API. To detach the target group from the Auto Scaling group, call the <a>DetachLoadBalancerTargetGroups</a> API.</p><p>This operation is additive and does not detach existing target groups or Classic Load Balancers from the Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAttachLoadBalancerTargetGroupsResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsType
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsResultType
 */
- (AWSTask<AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *> *)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request;

/**
 <note><p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancerTargetGroups</code>. You can use both the original <code>AttachLoadBalancerTargetGroups</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Attaches one or more target groups to the specified Auto Scaling group.</p><p>This operation is used with the following load balancer types: </p><ul><li><p>Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS. </p></li><li><p>Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP. </p></li><li><p>Gateway Load Balancer - Operates at the network layer (layer 3).</p></li></ul><p>To describe the target groups for an Auto Scaling group, call the <a>DescribeLoadBalancerTargetGroups</a> API. To detach the target group from the Auto Scaling group, call the <a>DetachLoadBalancerTargetGroups</a> API.</p><p>This operation is additive and does not detach existing target groups or Classic Load Balancers from the Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsType
 @see AWSAutoScalingAttachLoadBalancerTargetGroupsResultType
 */
- (void)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAttachLoadBalancerTargetGroupsResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancers</code>. You can use both the original <code>AttachLoadBalancers</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto Scaling registers the running instances with these Classic Load Balancers.</p><p>To describe the load balancers for an Auto Scaling group, call the <a>DescribeLoadBalancers</a> API. To detach a load balancer from the Auto Scaling group, call the <a>DetachLoadBalancers</a> API.</p><p>This operation is additive and does not detach existing Classic Load Balancers or target groups from the Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAttachLoadBalancersResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachLoadBalancersType
 @see AWSAutoScalingAttachLoadBalancersResultType
 */
- (AWSTask<AWSAutoScalingAttachLoadBalancersResultType *> *)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request;

/**
 <note><p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancers</code>. You can use both the original <code>AttachLoadBalancers</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto Scaling registers the running instances with these Classic Load Balancers.</p><p>To describe the load balancers for an Auto Scaling group, call the <a>DescribeLoadBalancers</a> API. To detach a load balancer from the Auto Scaling group, call the <a>DetachLoadBalancers</a> API.</p><p>This operation is additive and does not detach existing Classic Load Balancers or target groups from the Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the AttachLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachLoadBalancersType
 @see AWSAutoScalingAttachLoadBalancersResultType
 */
- (void)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAttachLoadBalancersResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Attaches one or more traffic sources to the specified Auto Scaling group.</p><p>You can use any of the following as traffic sources for an Auto Scaling group:</p><ul><li><p>Application Load Balancer</p></li><li><p>Classic Load Balancer</p></li><li><p>Gateway Load Balancer</p></li><li><p>Network Load Balancer</p></li><li><p>VPC Lattice</p></li></ul><p>This operation is additive and does not detach existing traffic sources from the Auto Scaling group. </p><p>After the operation completes, use the <a>DescribeTrafficSources</a> API to return details about the state of the attachments between traffic sources and your Auto Scaling group. To detach a traffic source from the Auto Scaling group, call the <a>DetachTrafficSources</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AttachTrafficSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAttachTrafficSourcesResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachTrafficSourcesType
 @see AWSAutoScalingAttachTrafficSourcesResultType
 */
- (AWSTask<AWSAutoScalingAttachTrafficSourcesResultType *> *)attachTrafficSources:(AWSAutoScalingAttachTrafficSourcesType *)request;

/**
 <p>Attaches one or more traffic sources to the specified Auto Scaling group.</p><p>You can use any of the following as traffic sources for an Auto Scaling group:</p><ul><li><p>Application Load Balancer</p></li><li><p>Classic Load Balancer</p></li><li><p>Gateway Load Balancer</p></li><li><p>Network Load Balancer</p></li><li><p>VPC Lattice</p></li></ul><p>This operation is additive and does not detach existing traffic sources from the Auto Scaling group. </p><p>After the operation completes, use the <a>DescribeTrafficSources</a> API to return details about the state of the attachments between traffic sources and your Auto Scaling group. To detach a traffic source from the Auto Scaling group, call the <a>DetachTrafficSources</a> API.</p>
 
 @param request A container for the necessary parameters to execute the AttachTrafficSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingAttachTrafficSourcesType
 @see AWSAutoScalingAttachTrafficSourcesResultType
 */
- (void)attachTrafficSources:(AWSAutoScalingAttachTrafficSourcesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAttachTrafficSourcesResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes one or more scheduled actions for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingBatchDeleteScheduledActionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingBatchDeleteScheduledActionType
 @see AWSAutoScalingBatchDeleteScheduledActionAnswer
 */
- (AWSTask<AWSAutoScalingBatchDeleteScheduledActionAnswer *> *)batchDeleteScheduledAction:(AWSAutoScalingBatchDeleteScheduledActionType *)request;

/**
 <p>Deletes one or more scheduled actions for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the BatchDeleteScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingBatchDeleteScheduledActionType
 @see AWSAutoScalingBatchDeleteScheduledActionAnswer
 */
- (void)batchDeleteScheduledAction:(AWSAutoScalingBatchDeleteScheduledActionType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingBatchDeleteScheduledActionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates one or more scheduled scaling actions for an Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutScheduledUpdateGroupAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingBatchPutScheduledUpdateGroupActionType
 @see AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer
 */
- (AWSTask<AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer *> *)batchPutScheduledUpdateGroupAction:(AWSAutoScalingBatchPutScheduledUpdateGroupActionType *)request;

/**
 <p>Creates or updates one or more scheduled scaling actions for an Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the BatchPutScheduledUpdateGroupAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingBatchPutScheduledUpdateGroupActionType
 @see AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer
 */
- (void)batchPutScheduledUpdateGroupAction:(AWSAutoScalingBatchPutScheduledUpdateGroupActionType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback is not in progress, an <code>ActiveInstanceRefreshNotFound</code> error occurs.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>When you cancel an instance refresh, this does not roll back any changes that it made. Use the <a>RollbackInstanceRefresh</a> API to roll back instead.</p>
 
 @param request A container for the necessary parameters to execute the CancelInstanceRefresh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingCancelInstanceRefreshAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorActiveInstanceRefreshNotFound`.
 
 @see AWSAutoScalingCancelInstanceRefreshType
 @see AWSAutoScalingCancelInstanceRefreshAnswer
 */
- (AWSTask<AWSAutoScalingCancelInstanceRefreshAnswer *> *)cancelInstanceRefresh:(AWSAutoScalingCancelInstanceRefreshType *)request;

/**
 <p>Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback is not in progress, an <code>ActiveInstanceRefreshNotFound</code> error occurs.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>When you cancel an instance refresh, this does not roll back any changes that it made. Use the <a>RollbackInstanceRefresh</a> API to roll back instead.</p>
 
 @param request A container for the necessary parameters to execute the CancelInstanceRefresh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorActiveInstanceRefreshNotFound`.
 
 @see AWSAutoScalingCancelInstanceRefreshType
 @see AWSAutoScalingCancelInstanceRefreshAnswer
 */
- (void)cancelInstanceRefresh:(AWSAutoScalingCancelInstanceRefreshType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingCancelInstanceRefreshAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Completes the lifecycle action for the specified token or instance with the specified result.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</p></li><li><p><b>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</b></p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteLifecycleAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingCompleteLifecycleActionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCompleteLifecycleActionType
 @see AWSAutoScalingCompleteLifecycleActionAnswer
 */
- (AWSTask<AWSAutoScalingCompleteLifecycleActionAnswer *> *)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request;

/**
 <p>Completes the lifecycle action for the specified token or instance with the specified result.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</p></li><li><p><b>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</b></p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteLifecycleAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCompleteLifecycleActionType
 @see AWSAutoScalingCompleteLifecycleActionAnswer
 */
- (void)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingCompleteLifecycleActionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><b>We strongly recommend using a launch template when calling this operation to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b></p><p>Creates an Auto Scaling group with the specified name and attributes. </p><p>If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For introductory exercises for creating an Auto Scaling group, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html">Getting started with Amazon EC2 Auto Scaling</a> and <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html">Tutorial: Set up a scaled and load-balanced application</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html">Auto Scaling groups</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Every Auto Scaling group has three size properties (<code>DesiredCapacity</code>, <code>MaxSize</code>, and <code>MinSize</code>). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingCreateAutoScalingGroupType
 */
- (AWSTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request;

/**
 <p><b>We strongly recommend using a launch template when calling this operation to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b></p><p>Creates an Auto Scaling group with the specified name and attributes. </p><p>If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For introductory exercises for creating an Auto Scaling group, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html">Getting started with Amazon EC2 Auto Scaling</a> and <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html">Tutorial: Set up a scaled and load-balanced application</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html">Auto Scaling groups</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Every Auto Scaling group has three size properties (<code>DesiredCapacity</code>, <code>MaxSize</code>, and <code>MinSize</code>). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances.</p>
 
 @param request A container for the necessary parameters to execute the CreateAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingCreateAutoScalingGroupType
 */
- (void)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a launch configuration.</p><p>If you exceed your maximum limit of launch configurations, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html">Launch configurations</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><note><p>Amazon EC2 Auto Scaling configures instances launched as part of an Auto Scaling group using either a launch template or a launch configuration. We strongly recommend that you do not use launch configurations. They do not provide full functionality for Amazon EC2 Auto Scaling or Amazon EC2. For information about using launch templates, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateLaunchConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateLaunchConfigurationType
 */
- (AWSTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request;

/**
 <p>Creates a launch configuration.</p><p>If you exceed your maximum limit of launch configurations, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html">Launch configurations</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><note><p>Amazon EC2 Auto Scaling configures instances launched as part of an Auto Scaling group using either a launch template or a launch configuration. We strongly recommend that you do not use launch configurations. They do not provide full functionality for Amazon EC2 Auto Scaling or Amazon EC2. For information about using launch templates, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateLaunchConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingCreateLaunchConfigurationType
 */
- (void)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates tags for the specified Auto Scaling group.</p><p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrUpdateTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingCreateOrUpdateTagsType
 */
- (AWSTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request;

/**
 <p>Creates or updates tags for the specified Auto Scaling group.</p><p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateOrUpdateTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingCreateOrUpdateTagsType
 */
- (void)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Auto Scaling group.</p><p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed. The force delete operation will also terminate the EC2 instances. If the group has a warm pool, the force delete option also deletes the warm pool.</p><p>To remove instances from the Auto Scaling group before deleting it, call the <a>DetachInstances</a> API with the list of instances and the option to decrement the desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances.</p><p>To terminate all instances before deleting the Auto Scaling group, call the <a>UpdateAutoScalingGroup</a> API and set the minimum size and desired capacity of the Auto Scaling group to zero.</p><p>If the group has scaling policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-process-shutdown.html">Delete your Auto Scaling infrastructure</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDeleteAutoScalingGroupType
 */
- (AWSTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request;

/**
 <p>Deletes the specified Auto Scaling group.</p><p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed. The force delete operation will also terminate the EC2 instances. If the group has a warm pool, the force delete option also deletes the warm pool.</p><p>To remove instances from the Auto Scaling group before deleting it, call the <a>DetachInstances</a> API with the list of instances and the option to decrement the desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances.</p><p>To terminate all instances before deleting the Auto Scaling group, call the <a>UpdateAutoScalingGroup</a> API and set the minimum size and desired capacity of the Auto Scaling group to zero.</p><p>If the group has scaling policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-process-shutdown.html">Delete your Auto Scaling infrastructure</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
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
 <p>Deletes the specified scaling policy.</p><p>Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html">Deleting a scaling policy</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingDeletePolicyType
 */
- (AWSTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request;

/**
 <p>Deletes the specified scaling policy.</p><p>Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html">Deleting a scaling policy</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeletePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
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

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingDeleteTagsType
 */
- (AWSTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request;

/**
 <p>Deletes the specified tags.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingDeleteTagsType
 */
- (void)deleteTags:(AWSAutoScalingDeleteTagsType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the warm pool for the specified Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWarmPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDeleteWarmPoolAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingDeleteWarmPoolType
 @see AWSAutoScalingDeleteWarmPoolAnswer
 */
- (AWSTask<AWSAutoScalingDeleteWarmPoolAnswer *> *)deleteWarmPool:(AWSAutoScalingDeleteWarmPoolType *)request;

/**
 <p>Deletes the warm pool for the specified Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWarmPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceInUse`.
 
 @see AWSAutoScalingDeleteWarmPoolType
 @see AWSAutoScalingDeleteWarmPoolAnswer
 */
- (void)deleteWarmPool:(AWSAutoScalingDeleteWarmPoolType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDeleteWarmPoolAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the current Amazon EC2 Auto Scaling resource quotas for your account.</p><p>When you establish an Amazon Web Services account, the account has initial quotas on the maximum number of Auto Scaling groups and launch configurations that you can create in a given Region. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAccountLimitsAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAccountLimitsAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAccountLimitsAnswer *> *)describeAccountLimits:(AWSRequest *)request;

/**
 <p>Describes the current Amazon EC2 Auto Scaling resource quotas for your account.</p><p>When you establish an Amazon Web Services account, the account has initial quotas on the maximum number of Auto Scaling groups and launch configurations that you can create in a given Region. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountLimits service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAccountLimitsAnswer
 */
- (void)describeAccountLimits:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAccountLimitsAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available adjustment types for step scaling and simple scaling policies.</p><p>The following adjustment types are supported:</p><ul><li><p><code>ChangeInCapacity</code></p></li><li><p><code>ExactCapacity</code></p></li><li><p><code>PercentChangeInCapacity</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAdjustmentTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAdjustmentTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAdjustmentTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAdjustmentTypesAnswer *> *)describeAdjustmentTypes:(AWSRequest *)request;

/**
 <p>Describes the available adjustment types for step scaling and simple scaling policies.</p><p>The following adjustment types are supported:</p><ul><li><p><code>ChangeInCapacity</code></p></li><li><p><code>ExactCapacity</code></p></li><li><p><code>PercentChangeInCapacity</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeAdjustmentTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAdjustmentTypesAnswer
 */
- (void)describeAdjustmentTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAdjustmentTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the Auto Scaling groups in the account and Region.</p><p>If you specify Auto Scaling group names, the output includes information for only the specified Auto Scaling groups. If you specify filters, the output includes information for only those Auto Scaling groups that meet the filter criteria. If you do not specify group names or filters, the output includes information for all Auto Scaling groups. </p><p>This operation also returns information about instances in Auto Scaling groups. To retrieve information about the instances in a warm pool, you must call the <a>DescribeWarmPool</a> API. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingGroupsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAutoScalingGroupNamesType
 @see AWSAutoScalingAutoScalingGroupsType
 */
- (AWSTask<AWSAutoScalingAutoScalingGroupsType *> *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request;

/**
 <p>Gets information about the Auto Scaling groups in the account and Region.</p><p>If you specify Auto Scaling group names, the output includes information for only the specified Auto Scaling groups. If you specify filters, the output includes information for only those Auto Scaling groups that meet the filter criteria. If you do not specify group names or filters, the output includes information for all Auto Scaling groups. </p><p>This operation also returns information about instances in Auto Scaling groups. To retrieve information about the instances in a warm pool, you must call the <a>DescribeWarmPool</a> API. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingAutoScalingGroupNamesType
 @see AWSAutoScalingAutoScalingGroupsType
 */
- (void)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAutoScalingGroupsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the Auto Scaling instances in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingAutoScalingInstancesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeAutoScalingInstancesType
 @see AWSAutoScalingAutoScalingInstancesType
 */
- (AWSTask<AWSAutoScalingAutoScalingInstancesType *> *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request;

/**
 <p>Gets information about the Auto Scaling instances in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeAutoScalingInstancesType
 @see AWSAutoScalingAutoScalingInstancesType
 */
- (void)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingAutoScalingInstancesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the notification types that are supported by Amazon EC2 Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingNotificationTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *> *)describeAutoScalingNotificationTypes:(AWSRequest *)request;

/**
 <p>Describes the notification types that are supported by Amazon EC2 Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAutoScalingNotificationTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer
 */
- (void)describeAutoScalingNotificationTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the instance refreshes for the specified Auto Scaling group.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>To help you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns information about the instance refreshes you previously initiated, including their status, start time, end time, the percentage of the instance refresh that is complete, and the number of instances remaining to update before the instance refresh is complete. If a rollback is initiated while an instance refresh is in progress, Amazon EC2 Auto Scaling also returns information about the rollback of the instance refresh.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceRefreshes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeInstanceRefreshesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeInstanceRefreshesType
 @see AWSAutoScalingDescribeInstanceRefreshesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeInstanceRefreshesAnswer *> *)describeInstanceRefreshes:(AWSAutoScalingDescribeInstanceRefreshesType *)request;

/**
 <p>Gets information about the instance refreshes for the specified Auto Scaling group.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>To help you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns information about the instance refreshes you previously initiated, including their status, start time, end time, the percentage of the instance refresh that is complete, and the number of instances remaining to update before the instance refresh is complete. If a rollback is initiated while an instance refresh is in progress, Amazon EC2 Auto Scaling also returns information about the rollback of the instance refresh.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInstanceRefreshes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeInstanceRefreshesType
 @see AWSAutoScalingDescribeInstanceRefreshesAnswer
 */
- (void)describeInstanceRefreshes:(AWSAutoScalingDescribeInstanceRefreshesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeInstanceRefreshesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the launch configurations in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingLaunchConfigurationsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNamesType
 @see AWSAutoScalingLaunchConfigurationsType
 */
- (AWSTask<AWSAutoScalingLaunchConfigurationsType *> *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request;

/**
 <p>Gets information about the launch configurations in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLaunchConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingLaunchConfigurationNamesType
 @see AWSAutoScalingLaunchConfigurationsType
 */
- (void)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingLaunchConfigurationsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available types of lifecycle hooks.</p><p>The following hook types are supported:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCHING</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATING</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHookTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHookTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeLifecycleHookTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeLifecycleHookTypesAnswer *> *)describeLifecycleHookTypes:(AWSRequest *)request;

/**
 <p>Describes the available types of lifecycle hooks.</p><p>The following hook types are supported:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCHING</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATING</code></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHookTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeLifecycleHookTypesAnswer
 */
- (void)describeLifecycleHookTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLifecycleHookTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the lifecycle hooks for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHooks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLifecycleHooksAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLifecycleHooksType
 @see AWSAutoScalingDescribeLifecycleHooksAnswer
 */
- (AWSTask<AWSAutoScalingDescribeLifecycleHooksAnswer *> *)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request;

/**
 <p>Gets information about the lifecycle hooks for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLifecycleHooks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeLifecycleHooksType
 @see AWSAutoScalingDescribeLifecycleHooksAnswer
 */
- (void)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLifecycleHooksAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancerTargetGroups</code>. You can use both the original <code>DescribeLoadBalancerTargetGroups</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p></note><p>Gets information about the Elastic Load Balancing target groups for the specified Auto Scaling group.</p><p>To determine the attachment status of the target group, use the <code>State</code> element in the response. When you attach a target group to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the target group is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the target group doesn't enter the <code>InService</code> state. </p><p>Target groups also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your target group state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p><p>For help with failed health checks, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p><note><p>You can use this operation to describe target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse
 */
- (AWSTask<AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *> *)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request;

/**
 <note><p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancerTargetGroups</code>. You can use both the original <code>DescribeLoadBalancerTargetGroups</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p></note><p>Gets information about the Elastic Load Balancing target groups for the specified Auto Scaling group.</p><p>To determine the attachment status of the target group, use the <code>State</code> element in the response. When you attach a target group to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the target group is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the target group doesn't enter the <code>InService</code> state. </p><p>Target groups also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your target group state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p><p>For help with failed health checks, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p><note><p>You can use this operation to describe target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest
 @see AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse
 */
- (void)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DescribeTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancers</code>. You can use both the original <code>DescribeLoadBalancers</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p></note><p>Gets information about the load balancers for the specified Auto Scaling group.</p><p>This operation describes only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DescribeLoadBalancerTargetGroups</a> API instead.</p><p>To determine the attachment status of the load balancer, use the <code>State</code> element in the response. When you attach a load balancer to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the load balancer is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the load balancer doesn't enter the <code>InService</code> state. </p><p>Load balancers also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your load balancer state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p><p>For help with failed health checks, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeLoadBalancersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeLoadBalancersRequest
 @see AWSAutoScalingDescribeLoadBalancersResponse
 */
- (AWSTask<AWSAutoScalingDescribeLoadBalancersResponse *> *)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request;

/**
 <note><p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DescribeTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancers</code>. You can use both the original <code>DescribeLoadBalancers</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p></note><p>Gets information about the load balancers for the specified Auto Scaling group.</p><p>This operation describes only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DescribeLoadBalancerTargetGroups</a> API instead.</p><p>To determine the attachment status of the load balancer, use the <code>State</code> element in the response. When you attach a load balancer to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the load balancer is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the load balancer doesn't enter the <code>InService</code> state. </p><p>Load balancers also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your load balancer state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p><p>For help with failed health checks, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeLoadBalancersRequest
 @see AWSAutoScalingDescribeLoadBalancersResponse
 */
- (void)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeLoadBalancersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricCollectionTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeMetricCollectionTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeMetricCollectionTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeMetricCollectionTypesAnswer *> *)describeMetricCollectionTypes:(AWSRequest *)request;

/**
 <p>Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMetricCollectionTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeMetricCollectionTypesAnswer
 */
- (void)describeMetricCollectionTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeMetricCollectionTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the Amazon SNS notifications that are configured for one or more Auto Scaling groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotificationConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeNotificationConfigurationsAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeNotificationConfigurationsType
 @see AWSAutoScalingDescribeNotificationConfigurationsAnswer
 */
- (AWSTask<AWSAutoScalingDescribeNotificationConfigurationsAnswer *> *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request;

/**
 <p>Gets information about the Amazon SNS notifications that are configured for one or more Auto Scaling groups.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNotificationConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeNotificationConfigurationsType
 @see AWSAutoScalingDescribeNotificationConfigurationsAnswer
 */
- (void)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeNotificationConfigurationsAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the scaling policies in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPoliciesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingDescribePoliciesType
 @see AWSAutoScalingPoliciesType
 */
- (AWSTask<AWSAutoScalingPoliciesType *> *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request;

/**
 <p>Gets information about the scaling policies in the account and Region.</p>
 
 @param request A container for the necessary parameters to execute the DescribePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingDescribePoliciesType
 @see AWSAutoScalingPoliciesType
 */
- (void)describePolicies:(AWSAutoScalingDescribePoliciesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPoliciesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the scaling activities in the account and Region.</p><p>When scaling events occur, you see a record of the scaling activity in the scaling activities. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html">Verifying a scaling activity for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If the scaling event succeeds, the value of the <code>StatusCode</code> element in the response is <code>Successful</code>. If an attempt to launch instances failed, the <code>StatusCode</code> value is <code>Failed</code> or <code>Cancelled</code> and the <code>StatusMessage</code> element in the response indicates the cause of the failure. For help interpreting the <code>StatusMessage</code>, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html">Troubleshooting Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivitiesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScalingActivitiesType
 @see AWSAutoScalingActivitiesType
 */
- (AWSTask<AWSAutoScalingActivitiesType *> *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request;

/**
 <p>Gets information about the scaling activities in the account and Region.</p><p>When scaling events occur, you see a record of the scaling activity in the scaling activities. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html">Verifying a scaling activity for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If the scaling event succeeds, the value of the <code>StatusCode</code> element in the response is <code>Successful</code>. If an attempt to launch instances failed, the <code>StatusCode</code> value is <code>Failed</code> or <code>Cancelled</code> and the <code>StatusMessage</code> element in the response indicates the cause of the failure. For help interpreting the <code>StatusMessage</code>, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html">Troubleshooting Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScalingActivitiesType
 @see AWSAutoScalingActivitiesType
 */
- (void)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingActivitiesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the scaling process types for use with the <a>ResumeProcesses</a> and <a>SuspendProcesses</a> APIs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingProcessTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingProcessesType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingProcessesType
 */
- (AWSTask<AWSAutoScalingProcessesType *> *)describeScalingProcessTypes:(AWSRequest *)request;

/**
 <p>Describes the scaling process types for use with the <a>ResumeProcesses</a> and <a>SuspendProcesses</a> APIs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingProcessTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingProcessesType
 */
- (void)describeScalingProcessTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingProcessesType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the scheduled actions that haven't run or that have not reached their end time.</p><p>To describe the scaling activities for scheduled actions that have already run, call the <a>DescribeScalingActivities</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingScheduledActionsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScheduledActionsType
 @see AWSAutoScalingScheduledActionsType
 */
- (AWSTask<AWSAutoScalingScheduledActionsType *> *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request;

/**
 <p>Gets information about the scheduled actions that haven't run or that have not reached their end time.</p><p>To describe the scaling activities for scheduled actions that have already run, call the <a>DescribeScalingActivities</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeScheduledActionsType
 @see AWSAutoScalingScheduledActionsType
 */
- (void)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingScheduledActionsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified tags.</p><p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p><p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingTagsType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeTagsType
 @see AWSAutoScalingTagsType
 */
- (AWSTask<AWSAutoScalingTagsType *> *)describeTags:(AWSAutoScalingDescribeTagsType *)request;

/**
 <p>Describes the specified tags.</p><p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p><p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeTagsType
 @see AWSAutoScalingTagsType
 */
- (void)describeTags:(AWSAutoScalingDescribeTagsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingTagsType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the termination policies supported by Amazon EC2 Auto Scaling.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html">Work with Amazon EC2 Auto Scaling termination policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTerminationPolicyTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeTerminationPolicyTypesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeTerminationPolicyTypesAnswer
 */
- (AWSTask<AWSAutoScalingDescribeTerminationPolicyTypesAnswer *> *)describeTerminationPolicyTypes:(AWSRequest *)request;

/**
 <p>Describes the termination policies supported by Amazon EC2 Auto Scaling.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html">Work with Amazon EC2 Auto Scaling termination policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTerminationPolicyTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSRequest
 @see AWSAutoScalingDescribeTerminationPolicyTypesAnswer
 */
- (void)describeTerminationPolicyTypes:(AWSRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeTerminationPolicyTypesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the traffic sources for the specified Auto Scaling group.</p><p>You can optionally provide a traffic source type. If you provide a traffic source type, then the results only include that traffic source type.</p><p>If you do not provide a traffic source type, then the results include all the traffic sources for the specified Auto Scaling group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeTrafficSourcesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeTrafficSourcesRequest
 @see AWSAutoScalingDescribeTrafficSourcesResponse
 */
- (AWSTask<AWSAutoScalingDescribeTrafficSourcesResponse *> *)describeTrafficSources:(AWSAutoScalingDescribeTrafficSourcesRequest *)request;

/**
 <p>Gets information about the traffic sources for the specified Auto Scaling group.</p><p>You can optionally provide a traffic source type. If you provide a traffic source type, then the results only include that traffic source type.</p><p>If you do not provide a traffic source type, then the results include all the traffic sources for the specified Auto Scaling group. </p>
 
 @param request A container for the necessary parameters to execute the DescribeTrafficSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInvalidNextToken`.
 
 @see AWSAutoScalingDescribeTrafficSourcesRequest
 @see AWSAutoScalingDescribeTrafficSourcesResponse
 */
- (void)describeTrafficSources:(AWSAutoScalingDescribeTrafficSourcesRequest *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeTrafficSourcesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a warm pool and its instances.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWarmPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDescribeWarmPoolAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeWarmPoolType
 @see AWSAutoScalingDescribeWarmPoolAnswer
 */
- (AWSTask<AWSAutoScalingDescribeWarmPoolAnswer *> *)describeWarmPool:(AWSAutoScalingDescribeWarmPoolType *)request;

/**
 <p>Gets information about a warm pool and its instances.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWarmPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorInvalidNextToken`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDescribeWarmPoolType
 @see AWSAutoScalingDescribeWarmPoolAnswer
 */
- (void)describeWarmPool:(AWSAutoScalingDescribeWarmPoolType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDescribeWarmPoolAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more instances from the specified Auto Scaling group.</p><p>After the instances are detached, you can manage them independent of the Auto Scaling group.</p><p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are detached.</p><p>If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html">Detach EC2 instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstances service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachInstancesAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachInstancesQuery
 @see AWSAutoScalingDetachInstancesAnswer
 */
- (AWSTask<AWSAutoScalingDetachInstancesAnswer *> *)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request;

/**
 <p>Removes one or more instances from the specified Auto Scaling group.</p><p>After the instances are detached, you can manage them independent of the Auto Scaling group.</p><p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are detached.</p><p>If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html">Detach EC2 instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DetachInstances service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachInstancesQuery
 @see AWSAutoScalingDetachInstancesAnswer
 */
- (void)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachInstancesAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancerTargetGroups</code>. You can use both the original <code>DetachLoadBalancerTargetGroups</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Detaches one or more target groups from the specified Auto Scaling group.</p><p>When you detach a target group, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the target group using the <a>DescribeLoadBalancerTargetGroups</a> API call. The instances remain running.</p><note><p>You can use this operation to detach target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerTargetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachLoadBalancerTargetGroupsResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsType
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsResultType
 */
- (AWSTask<AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *> *)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request;

/**
 <note><p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancerTargetGroups</code>. You can use both the original <code>DetachLoadBalancerTargetGroups</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Detaches one or more target groups from the specified Auto Scaling group.</p><p>When you detach a target group, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the target group using the <a>DescribeLoadBalancerTargetGroups</a> API call. The instances remain running.</p><note><p>You can use this operation to detach target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancerTargetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsType
 @see AWSAutoScalingDetachLoadBalancerTargetGroupsResultType
 */
- (void)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachLoadBalancerTargetGroupsResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancers</code>. You can use both the original <code>DetachLoadBalancers</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Detaches one or more Classic Load Balancers from the specified Auto Scaling group.</p><p>This operation detaches only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DetachLoadBalancerTargetGroups</a> API instead.</p><p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using the <a>DescribeLoadBalancers</a> API call. The instances remain running.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachLoadBalancersResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancersType
 @see AWSAutoScalingDetachLoadBalancersResultType
 */
- (AWSTask<AWSAutoScalingDetachLoadBalancersResultType *> *)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request;

/**
 <note><p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancers</code>. You can use both the original <code>DetachLoadBalancers</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p></note><p>Detaches one or more Classic Load Balancers from the specified Auto Scaling group.</p><p>This operation detaches only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DetachLoadBalancerTargetGroups</a> API instead.</p><p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using the <a>DescribeLoadBalancers</a> API call. The instances remain running.</p>
 
 @param request A container for the necessary parameters to execute the DetachLoadBalancers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachLoadBalancersType
 @see AWSAutoScalingDetachLoadBalancersResultType
 */
- (void)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachLoadBalancersResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detaches one or more traffic sources from the specified Auto Scaling group.</p><p>When you detach a taffic, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the traffic source using the <a>DescribeTrafficSources</a> API call. The instances continue to run.</p>
 
 @param request A container for the necessary parameters to execute the DetachTrafficSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingDetachTrafficSourcesResultType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachTrafficSourcesType
 @see AWSAutoScalingDetachTrafficSourcesResultType
 */
- (AWSTask<AWSAutoScalingDetachTrafficSourcesResultType *> *)detachTrafficSources:(AWSAutoScalingDetachTrafficSourcesType *)request;

/**
 <p>Detaches one or more traffic sources from the specified Auto Scaling group.</p><p>When you detach a taffic, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the traffic source using the <a>DescribeTrafficSources</a> API call. The instances continue to run.</p>
 
 @param request A container for the necessary parameters to execute the DetachTrafficSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDetachTrafficSourcesType
 @see AWSAutoScalingDetachTrafficSourcesResultType
 */
- (void)detachTrafficSources:(AWSAutoScalingDetachTrafficSourcesType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingDetachTrafficSourcesResultType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables group metrics collection for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DisableMetricsCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDisableMetricsCollectionQuery
 */
- (AWSTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request;

/**
 <p>Disables group metrics collection for the specified Auto Scaling group.</p>
 
 @param request A container for the necessary parameters to execute the DisableMetricsCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingDisableMetricsCollectionQuery
 */
- (void)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Enables group metrics collection for the specified Auto Scaling group.</p><p>You can use these metrics to track changes in an Auto Scaling group and to set alarms on threshold values. You can view group metrics using the Amazon EC2 Auto Scaling console or the CloudWatch console. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html">Monitor CloudWatch metrics for your Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableMetricsCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnableMetricsCollectionQuery
 */
- (AWSTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request;

/**
 <p>Enables group metrics collection for the specified Auto Scaling group.</p><p>You can use these metrics to track changes in an Auto Scaling group and to set alarms on threshold values. You can view group metrics using the Amazon EC2 Auto Scaling console or the CloudWatch console. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html">Monitor CloudWatch metrics for your Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnableMetricsCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnableMetricsCollectionQuery
 */
- (void)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Moves the specified instances into the standby state.</p><p>If you choose to decrement the desired capacity of the Auto Scaling group, the instances can enter standby as long as the desired capacity of the Auto Scaling group after the instances are placed into standby is equal to or greater than the minimum capacity of the group.</p><p>If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto Scaling group launches new instances to replace the instances on standby.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnterStandby service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingEnterStandbyAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnterStandbyQuery
 @see AWSAutoScalingEnterStandbyAnswer
 */
- (AWSTask<AWSAutoScalingEnterStandbyAnswer *> *)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request;

/**
 <p>Moves the specified instances into the standby state.</p><p>If you choose to decrement the desired capacity of the Auto Scaling group, the instances can enter standby as long as the desired capacity of the Auto Scaling group after the instances are placed into standby is equal to or greater than the minimum capacity of the group.</p><p>If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto Scaling group launches new instances to replace the instances on standby.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the EnterStandby service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingEnterStandbyQuery
 @see AWSAutoScalingEnterStandbyAnswer
 */
- (void)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingEnterStandbyAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Executes the specified policy. This can be useful for testing the design of your scaling policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecutePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExecutePolicyType
 */
- (AWSTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request;

/**
 <p>Executes the specified policy. This can be useful for testing the design of your scaling policy.</p>
 
 @param request A container for the necessary parameters to execute the ExecutePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExecutePolicyType
 */
- (void)executePolicy:(AWSAutoScalingExecutePolicyType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Moves the specified instances out of the standby state.</p><p>After you put the instances back in service, the desired capacity is incremented.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExitStandby service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingExitStandbyAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExitStandbyQuery
 @see AWSAutoScalingExitStandbyAnswer
 */
- (AWSTask<AWSAutoScalingExitStandbyAnswer *> *)exitStandby:(AWSAutoScalingExitStandbyQuery *)request;

/**
 <p>Moves the specified instances out of the standby state.</p><p>After you put the instances back in service, the desired capacity is incremented.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ExitStandby service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingExitStandbyQuery
 @see AWSAutoScalingExitStandbyAnswer
 */
- (void)exitStandby:(AWSAutoScalingExitStandbyQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingExitStandbyAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the forecast data for a predictive scaling policy.</p><p>Load forecasts are predictions of the hourly load values using historical load data from CloudWatch and an analysis of historical trends. Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an hourly basis, based on the hourly load forecast.</p><p>A minimum of 24 hours of data is required to create the initial forecasts. However, having a full 14 days of historical data results in more accurate forecasts.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetPredictiveScalingForecast service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingGetPredictiveScalingForecastAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingGetPredictiveScalingForecastType
 @see AWSAutoScalingGetPredictiveScalingForecastAnswer
 */
- (AWSTask<AWSAutoScalingGetPredictiveScalingForecastAnswer *> *)getPredictiveScalingForecast:(AWSAutoScalingGetPredictiveScalingForecastType *)request;

/**
 <p>Retrieves the forecast data for a predictive scaling policy.</p><p>Load forecasts are predictions of the hourly load values using historical load data from CloudWatch and an analysis of historical trends. Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an hourly basis, based on the hourly load forecast.</p><p>A minimum of 24 hours of data is required to create the initial forecasts. However, having a full 14 days of historical data results in more accurate forecasts.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetPredictiveScalingForecast service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingGetPredictiveScalingForecastType
 @see AWSAutoScalingGetPredictiveScalingForecastAnswer
 */
- (void)getPredictiveScalingForecast:(AWSAutoScalingGetPredictiveScalingForecastType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingGetPredictiveScalingForecastAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a lifecycle hook for the specified Auto Scaling group.</p><p>Lifecycle hooks let you create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the corresponding lifecycle event occurs.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p><b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b></p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state using the <a>RecordLifecycleActionHeartbeat</a> API call.</p></li><li><p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails.</p><p>You can view the lifecycle hooks for an Auto Scaling group using the <a>DescribeLifecycleHooks</a> API call. If you are no longer using a lifecycle hook, you can delete it by calling the <a>DeleteLifecycleHook</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleHook service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPutLifecycleHookAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutLifecycleHookType
 @see AWSAutoScalingPutLifecycleHookAnswer
 */
- (AWSTask<AWSAutoScalingPutLifecycleHookAnswer *> *)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request;

/**
 <p>Creates or updates a lifecycle hook for the specified Auto Scaling group.</p><p>Lifecycle hooks let you create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the corresponding lifecycle event occurs.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p><b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b></p></li><li><p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state using the <a>RecordLifecycleActionHeartbeat</a> API call.</p></li><li><p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails.</p><p>You can view the lifecycle hooks for an Auto Scaling group using the <a>DescribeLifecycleHooks</a> API call. If you are no longer using a lifecycle hook, you can delete it by calling the <a>DeleteLifecycleHook</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutLifecycleHook service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutLifecycleHookType
 @see AWSAutoScalingPutLifecycleHookAnswer
 */
- (void)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPutLifecycleHookAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address.</p><p>This configuration overwrites any existing configuration.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html">Getting Amazon SNS notifications when your Auto Scaling group scales</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingPutNotificationConfigurationType
 */
- (AWSTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request;

/**
 <p>Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address.</p><p>This configuration overwrites any existing configuration.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html">Getting Amazon SNS notifications when your Auto Scaling group scales</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the PutNotificationConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingPutNotificationConfigurationType
 */
- (void)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to scale an Auto Scaling group based on configurable metrics. If no policies are defined, the dynamic scaling and predictive scaling features are not used. </p><p>For more information about using dynamic scaling, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html">Target tracking scaling policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For more information about using predictive scaling, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>You can view the scaling policies for an Auto Scaling group using the <a>DescribePolicies</a> API call. If you are no longer using a scaling policy, you can delete it by calling the <a>DeletePolicy</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPolicyARNType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingPutScalingPolicyType
 @see AWSAutoScalingPolicyARNType
 */
- (AWSTask<AWSAutoScalingPolicyARNType *> *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request;

/**
 <p>Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to scale an Auto Scaling group based on configurable metrics. If no policies are defined, the dynamic scaling and predictive scaling features are not used. </p><p>For more information about using dynamic scaling, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html">Target tracking scaling policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>For more information about using predictive scaling, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>You can view the scaling policies for an Auto Scaling group using the <a>DescribePolicies</a> API call. If you are no longer using a scaling policy, you can delete it by calling the <a>DeletePolicy</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingPutScalingPolicyType
 @see AWSAutoScalingPolicyARNType
 */
- (void)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPolicyARNType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scheduled scaling action for an Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html">Scheduled scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>You can view the scheduled actions for an Auto Scaling group using the <a>DescribeScheduledActions</a> API call. If you are no longer using a scheduled action, you can delete it by calling the <a>DeleteScheduledAction</a> API.</p><p>If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error message.</p>
 
 @param request A container for the necessary parameters to execute the PutScheduledUpdateGroupAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScheduledUpdateGroupActionType
 */
- (AWSTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request;

/**
 <p>Creates or updates a scheduled scaling action for an Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html">Scheduled scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>You can view the scheduled actions for an Auto Scaling group using the <a>DescribeScheduledActions</a> API call. If you are no longer using a scheduled action, you can delete it by calling the <a>DeleteScheduledAction</a> API.</p><p>If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error message.</p>
 
 @param request A container for the necessary parameters to execute the PutScheduledUpdateGroupAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorAlreadyExists`, `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutScheduledUpdateGroupActionType
 */
- (void)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its new desired capacity. For more information and example configurations, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>This operation must be called from the Region in which the Auto Scaling group was created. This operation cannot be called on an Auto Scaling group that has a mixed instances policy or a launch template or launch configuration that requests Spot Instances.</p><p>You can view the instances in the warm pool using the <a>DescribeWarmPool</a> API call. If you are no longer using a warm pool, you can delete it by calling the <a>DeleteWarmPool</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutWarmPool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingPutWarmPoolAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutWarmPoolType
 @see AWSAutoScalingPutWarmPoolAnswer
 */
- (AWSTask<AWSAutoScalingPutWarmPoolAnswer *> *)putWarmPool:(AWSAutoScalingPutWarmPoolType *)request;

/**
 <p>Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its new desired capacity. For more information and example configurations, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>This operation must be called from the Region in which the Auto Scaling group was created. This operation cannot be called on an Auto Scaling group that has a mixed instances policy or a launch template or launch configuration that requests Spot Instances.</p><p>You can view the instances in the warm pool using the <a>DescribeWarmPool</a> API call. If you are no longer using a warm pool, you can delete it by calling the <a>DeleteWarmPool</a> API.</p>
 
 @param request A container for the necessary parameters to execute the PutWarmPool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingPutWarmPoolType
 @see AWSAutoScalingPutWarmPoolAnswer
 */
- (void)putWarmPool:(AWSAutoScalingPutWarmPoolType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingPutWarmPoolAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using the <a>PutLifecycleHook</a> API call.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p><b>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</b></p></li><li><p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RecordLifecycleActionHeartbeat service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingRecordLifecycleActionHeartbeatAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingRecordLifecycleActionHeartbeatType
 @see AWSAutoScalingRecordLifecycleActionHeartbeatAnswer
 */
- (AWSTask<AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *> *)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request;

/**
 <p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using the <a>PutLifecycleHook</a> API call.</p><p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p><ol><li><p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p></li><li><p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p></li><li><p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p></li><li><p><b>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</b></p></li><li><p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p></li></ol><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RecordLifecycleActionHeartbeat service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingRecordLifecycleActionHeartbeatType
 @see AWSAutoScalingRecordLifecycleActionHeartbeatAnswer
 */
- (void)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingRecordLifecycleActionHeartbeatAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resumes the specified suspended auto scaling processes, or all suspended process, for the specified Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResumeProcesses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p>Resumes the specified suspended auto scaling processes, or all suspended process, for the specified Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ResumeProcesses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (void)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon EC2 Auto Scaling replaces any instances that were replaced during the instance refresh. This restores your Auto Scaling group to the configuration that it was using before the start of the instance refresh. </p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>A rollback is not supported in the following situations: </p><ul><li><p>There is no desired configuration specified for the instance refresh.</p></li><li><p>The Auto Scaling group has a launch template that uses an Amazon Web Services Systems Manager parameter instead of an AMI ID for the <code>ImageId</code> property.</p></li><li><p>The Auto Scaling group uses the launch template's <code>$Latest</code> or <code>$Default</code> version.</p></li></ul><p>When you receive a successful response from this operation, Amazon EC2 Auto Scaling immediately begins replacing instances. You can check the status of this operation through the <a>DescribeInstanceRefreshes</a> API operation. </p>
 
 @param request A container for the necessary parameters to execute the RollbackInstanceRefresh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingRollbackInstanceRefreshAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorActiveInstanceRefreshNotFound`, `AWSAutoScalingErrorIrreversibleInstanceRefresh`.
 
 @see AWSAutoScalingRollbackInstanceRefreshType
 @see AWSAutoScalingRollbackInstanceRefreshAnswer
 */
- (AWSTask<AWSAutoScalingRollbackInstanceRefreshAnswer *> *)rollbackInstanceRefresh:(AWSAutoScalingRollbackInstanceRefreshType *)request;

/**
 <p>Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon EC2 Auto Scaling replaces any instances that were replaced during the instance refresh. This restores your Auto Scaling group to the configuration that it was using before the start of the instance refresh. </p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p><p>A rollback is not supported in the following situations: </p><ul><li><p>There is no desired configuration specified for the instance refresh.</p></li><li><p>The Auto Scaling group has a launch template that uses an Amazon Web Services Systems Manager parameter instead of an AMI ID for the <code>ImageId</code> property.</p></li><li><p>The Auto Scaling group uses the launch template's <code>$Latest</code> or <code>$Default</code> version.</p></li></ul><p>When you receive a successful response from this operation, Amazon EC2 Auto Scaling immediately begins replacing instances. You can check the status of this operation through the <a>DescribeInstanceRefreshes</a> API operation. </p>
 
 @param request A container for the necessary parameters to execute the RollbackInstanceRefresh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorActiveInstanceRefreshNotFound`, `AWSAutoScalingErrorIrreversibleInstanceRefresh`.
 
 @see AWSAutoScalingRollbackInstanceRefreshType
 @see AWSAutoScalingRollbackInstanceRefreshAnswer
 */
- (void)rollbackInstanceRefresh:(AWSAutoScalingRollbackInstanceRefreshType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingRollbackInstanceRefreshAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the size of the specified Auto Scaling group.</p><p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html">Manual scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetDesiredCapacity service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetDesiredCapacityType
 */
- (AWSTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request;

/**
 <p>Sets the size of the specified Auto Scaling group.</p><p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html">Manual scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetDesiredCapacity service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetDesiredCapacityType
 */
- (void)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Sets the health status of the specified instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceHealth service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceHealthQuery
 */
- (AWSTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request;

/**
 <p>Sets the health status of the specified instance.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceHealth service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceHealthQuery
 */
- (void)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the instance protection settings of the specified instances. This operation cannot be called on instances in a warm pool.</p><p>For more information about preventing instances that are part of an Auto Scaling group from terminating on scale in, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceProtection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingSetInstanceProtectionAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceProtectionQuery
 @see AWSAutoScalingSetInstanceProtectionAnswer
 */
- (AWSTask<AWSAutoScalingSetInstanceProtectionAnswer *> *)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request;

/**
 <p>Updates the instance protection settings of the specified instances. This operation cannot be called on instances in a warm pool.</p><p>For more information about preventing instances that are part of an Auto Scaling group from terminating on scale in, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the call fails.</p>
 
 @param request A container for the necessary parameters to execute the SetInstanceProtection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingSetInstanceProtectionQuery
 @see AWSAutoScalingSetInstanceProtectionAnswer
 */
- (void)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingSetInstanceProtectionAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an instance refresh. During an instance refresh, Amazon EC2 Auto Scaling performs a rolling update of instances in an Auto Scaling group. Instances are terminated first and then replaced, which temporarily reduces the capacity available within your Auto Scaling group.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data script. You just need to create a new launch template that specifies the new AMI or user data script. Then start an instance refresh to immediately begin the process of updating instances in the group. </p><p>If successful, the request's response contains a unique ID that you can use to track the progress of the instance refresh. To query its status, call the <a>DescribeInstanceRefreshes</a> API. To describe the instance refreshes that have already run, call the <a>DescribeInstanceRefreshes</a> API. To cancel an instance refresh that is in progress, use the <a>CancelInstanceRefresh</a> API. </p><p>An instance refresh might fail for several reasons, such as EC2 launch failures, misconfigured health checks, or not ignoring or allowing the termination of instances that are in <code>Standby</code> state or protected from scale in. You can monitor for failed EC2 launches using the scaling activities. To find the scaling activities, call the <a>DescribeScalingActivities</a> API.</p><p>If you enable auto rollback, your Auto Scaling group will be rolled back automatically when the instance refresh fails. You can enable this feature before starting an instance refresh by specifying the <code>AutoRollback</code> property in the instance refresh preferences. Otherwise, to roll back an instance refresh before it finishes, use the <a>RollbackInstanceRefresh</a> API. </p>
 
 @param request A container for the necessary parameters to execute the StartInstanceRefresh service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingStartInstanceRefreshAnswer`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInstanceRefreshInProgress`.
 
 @see AWSAutoScalingStartInstanceRefreshType
 @see AWSAutoScalingStartInstanceRefreshAnswer
 */
- (AWSTask<AWSAutoScalingStartInstanceRefreshAnswer *> *)startInstanceRefresh:(AWSAutoScalingStartInstanceRefreshType *)request;

/**
 <p>Starts an instance refresh. During an instance refresh, Amazon EC2 Auto Scaling performs a rolling update of instances in an Auto Scaling group. Instances are terminated first and then replaced, which temporarily reduces the capacity available within your Auto Scaling group.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data script. You just need to create a new launch template that specifies the new AMI or user data script. Then start an instance refresh to immediately begin the process of updating instances in the group. </p><p>If successful, the request's response contains a unique ID that you can use to track the progress of the instance refresh. To query its status, call the <a>DescribeInstanceRefreshes</a> API. To describe the instance refreshes that have already run, call the <a>DescribeInstanceRefreshes</a> API. To cancel an instance refresh that is in progress, use the <a>CancelInstanceRefresh</a> API. </p><p>An instance refresh might fail for several reasons, such as EC2 launch failures, misconfigured health checks, or not ignoring or allowing the termination of instances that are in <code>Standby</code> state or protected from scale in. You can monitor for failed EC2 launches using the scaling activities. To find the scaling activities, call the <a>DescribeScalingActivities</a> API.</p><p>If you enable auto rollback, your Auto Scaling group will be rolled back automatically when the instance refresh fails. You can enable this feature before starting an instance refresh by specifying the <code>AutoRollback</code> property in the instance refresh preferences. Otherwise, to roll back an instance refresh before it finishes, use the <a>RollbackInstanceRefresh</a> API. </p>
 
 @param request A container for the necessary parameters to execute the StartInstanceRefresh service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorLimitExceeded`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorInstanceRefreshInProgress`.
 
 @see AWSAutoScalingStartInstanceRefreshType
 @see AWSAutoScalingStartInstanceRefreshAnswer
 */
- (void)startInstanceRefresh:(AWSAutoScalingStartInstanceRefreshType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingStartInstanceRefreshAnswer * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling group.</p><p>If you suspend either the <code>Launch</code> or <code>Terminate</code> process types, it can prevent other process types from functioning properly. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>To resume processes that have been suspended, call the <a>ResumeProcesses</a> API.</p>
 
 @param request A container for the necessary parameters to execute the SuspendProcesses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (AWSTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request;

/**
 <p>Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling group.</p><p>If you suspend either the <code>Launch</code> or <code>Terminate</code> process types, it can prevent other process types from functioning properly. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>To resume processes that have been suspended, call the <a>ResumeProcesses</a> API.</p>
 
 @param request A container for the necessary parameters to execute the SuspendProcesses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorResourceInUse`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingScalingProcessQuery
 */
- (void)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Terminates the specified instance and optionally adjusts the desired group size. This operation cannot be called on instances in a warm pool.</p><p>This call simply makes a termination request. The instance is not terminated immediately. When an instance is terminated, the instance status changes to <code>terminated</code>. You can't connect to or start an instance after you've terminated it.</p><p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are terminated. </p><p>By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might terminate instances in other zones. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage">Rebalancing activities</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstanceInAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAutoScalingActivityType`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingTerminateInstanceInAutoScalingGroupType
 @see AWSAutoScalingActivityType
 */
- (AWSTask<AWSAutoScalingActivityType *> *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request;

/**
 <p>Terminates the specified instance and optionally adjusts the desired group size. This operation cannot be called on instances in a warm pool.</p><p>This call simply makes a termination request. The instance is not terminated immediately. When an instance is terminated, the instance status changes to <code>terminated</code>. You can't connect to or start an instance after you've terminated it.</p><p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are terminated. </p><p>By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might terminate instances in other zones. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage">Rebalancing activities</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the TerminateInstanceInAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`.
 
 @see AWSAutoScalingTerminateInstanceInAutoScalingGroupType
 @see AWSAutoScalingActivityType
 */
- (void)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(AWSAutoScalingActivityType * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p><b>We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b></p><p>Updates the configuration for the specified Auto Scaling group.</p><p>To update an Auto Scaling group, specify the name of the group and the property that you want to change. Any properties that you don't specify are not changed by this update request. The new settings take effect on any scaling activities after this call returns. </p><p>If you associate a new launch configuration or template with an Auto Scaling group, all new instances will get the updated configuration. Existing instances continue to run with the configuration that they were originally launched with. When you update a group to specify a mixed instances policy instead of a launch configuration or template, existing instances may be replaced to match the new purchasing options that you specified in the policy. For example, if the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that updating your group does not compromise the performance or availability of your application.</p><p>Note the following about changing <code>DesiredCapacity</code>, <code>MaxSize</code>, or <code>MinSize</code>:</p><ul><li><p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate.</p></li><li><p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MinSize</code> value.</p></li><li><p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MaxSize</code> value.</p></li></ul><p>To see which properties have been set, call the <a>DescribeAutoScalingGroups</a> API. To view the scaling policies for an Auto Scaling group, call the <a>DescribePolicies</a> API. If the group has scaling policies, you can update them by calling the <a>PutScalingPolicy</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAutoScalingGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingUpdateAutoScalingGroupType
 */
- (AWSTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request;

/**
 <p><b>We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b></p><p>Updates the configuration for the specified Auto Scaling group.</p><p>To update an Auto Scaling group, specify the name of the group and the property that you want to change. Any properties that you don't specify are not changed by this update request. The new settings take effect on any scaling activities after this call returns. </p><p>If you associate a new launch configuration or template with an Auto Scaling group, all new instances will get the updated configuration. Existing instances continue to run with the configuration that they were originally launched with. When you update a group to specify a mixed instances policy instead of a launch configuration or template, existing instances may be replaced to match the new purchasing options that you specified in the policy. For example, if the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that updating your group does not compromise the performance or availability of your application.</p><p>Note the following about changing <code>DesiredCapacity</code>, <code>MaxSize</code>, or <code>MinSize</code>:</p><ul><li><p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate.</p></li><li><p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MinSize</code> value.</p></li><li><p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MaxSize</code> value.</p></li></ul><p>To see which properties have been set, call the <a>DescribeAutoScalingGroups</a> API. To view the scaling policies for an Auto Scaling group, call the <a>DescribePolicies</a> API. If the group has scaling policies, you can update them by calling the <a>PutScalingPolicy</a> API.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAutoScalingGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAutoScalingErrorDomain` domain and the following error code: `AWSAutoScalingErrorScalingActivityInProgress`, `AWSAutoScalingErrorResourceContention`, `AWSAutoScalingErrorServiceLinkedRoleFailure`.
 
 @see AWSAutoScalingUpdateAutoScalingGroupType
 */
- (void)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
