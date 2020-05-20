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
#import "AWSApplicationautoscalingModel.h"
#import "AWSApplicationautoscalingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSApplicationautoscaling
FOUNDATION_EXPORT NSString *const AWSApplicationautoscalingSDKVersion;

/**
 <p>With Application Auto Scaling, you can configure automatic scaling for the following resources:</p><ul><li><p>Amazon ECS services</p></li><li><p>Amazon EC2 Spot Fleet requests</p></li><li><p>Amazon EMR clusters</p></li><li><p>Amazon AppStream 2.0 fleets</p></li><li><p>Amazon DynamoDB tables and global secondary indexes throughput capacity</p></li><li><p>Amazon Aurora Replicas</p></li><li><p>Amazon SageMaker endpoint variants</p></li><li><p>Custom resources provided by your own applications or services</p></li><li><p>Amazon Comprehend document classification endpoints</p></li><li><p>AWS Lambda function provisioned concurrency</p></li><li><p>Amazon Keyspaces (for Apache Cassandra) tables</p></li></ul><p><b>API Summary</b></p><p>The Application Auto Scaling service API includes three key sets of actions: </p><ul><li><p>Register and manage scalable targets - Register AWS or custom resources as scalable targets (a resource that Application Auto Scaling can scale), set minimum and maximum capacity limits, and retrieve information on existing scalable targets.</p></li><li><p>Configure and manage automatic scaling - Define scaling policies to dynamically scale your resources in response to CloudWatch alarms, schedule one-time or recurring scaling actions, and retrieve your recent scaling activity history.</p></li><li><p>Suspend and resume scaling - Temporarily suspend and later resume automatic scaling by calling the <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_RegisterScalableTarget.html">RegisterScalableTarget</a> API action for any Application Auto Scaling scalable target. You can suspend and resume (individually or in combination) scale-out activities that are triggered by a scaling policy, scale-in activities that are triggered by a scaling policy, and scheduled scaling.</p></li></ul><p>To learn more about Application Auto Scaling, including information about granting IAM users required permissions for Application Auto Scaling actions, see the <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application Auto Scaling User Guide</a>.</p>
 */
@interface AWSApplicationautoscaling : AWSService

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

     let Applicationautoscaling = AWSApplicationautoscaling.default()

 *Objective-C*

     AWSApplicationautoscaling *Applicationautoscaling = [AWSApplicationautoscaling defaultApplicationautoscaling];

 @return The default service client.
 */
+ (instancetype)defaultApplicationautoscaling;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSApplicationautoscaling.register(with: configuration!, forKey: "USWest2Applicationautoscaling")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:@"USWest2Applicationautoscaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Applicationautoscaling = AWSApplicationautoscaling(forKey: "USWest2Applicationautoscaling")

 *Objective-C*

     AWSApplicationautoscaling *Applicationautoscaling = [AWSApplicationautoscaling ApplicationautoscalingForKey:@"USWest2Applicationautoscaling"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerApplicationautoscalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerApplicationautoscalingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSApplicationautoscaling.register(with: configuration!, forKey: "USWest2Applicationautoscaling")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:configuration forKey:@"USWest2Applicationautoscaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Applicationautoscaling = AWSApplicationautoscaling(forKey: "USWest2Applicationautoscaling")

 *Objective-C*

     AWSApplicationautoscaling *Applicationautoscaling = [AWSApplicationautoscaling ApplicationautoscalingForKey:@"USWest2Applicationautoscaling"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ApplicationautoscalingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeApplicationautoscalingForKey:(NSString *)key;

/**
 <p>Deletes the specified scaling policy for an Application Auto Scaling scalable target.</p><p>Deleting a step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete a Step Scaling Policy</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDeleteScalingPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeleteScalingPolicyRequest
 @see AWSApplicationautoscalingDeleteScalingPolicyResponse
 */
- (AWSTask<AWSApplicationautoscalingDeleteScalingPolicyResponse *> *)deleteScalingPolicy:(AWSApplicationautoscalingDeleteScalingPolicyRequest *)request;

/**
 <p>Deletes the specified scaling policy for an Application Auto Scaling scalable target.</p><p>Deleting a step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete a Step Scaling Policy</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeleteScalingPolicyRequest
 @see AWSApplicationautoscalingDeleteScalingPolicyResponse
 */
- (void)deleteScalingPolicy:(AWSApplicationautoscalingDeleteScalingPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDeleteScalingPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified scheduled action for an Application Auto Scaling scalable target.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action">Delete a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDeleteScheduledActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeleteScheduledActionRequest
 @see AWSApplicationautoscalingDeleteScheduledActionResponse
 */
- (AWSTask<AWSApplicationautoscalingDeleteScheduledActionResponse *> *)deleteScheduledAction:(AWSApplicationautoscalingDeleteScheduledActionRequest *)request;

/**
 <p>Deletes the specified scheduled action for an Application Auto Scaling scalable target.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action">Delete a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeleteScheduledActionRequest
 @see AWSApplicationautoscalingDeleteScheduledActionResponse
 */
- (void)deleteScheduledAction:(AWSApplicationautoscalingDeleteScheduledActionRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDeleteScheduledActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. </p><note><p>Deregistering a scalable target deletes the scaling policies and the scheduled actions that are associated with it.</p></note>
 
 @param request A container for the necessary parameters to execute the DeregisterScalableTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDeregisterScalableTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeregisterScalableTargetRequest
 @see AWSApplicationautoscalingDeregisterScalableTargetResponse
 */
- (AWSTask<AWSApplicationautoscalingDeregisterScalableTargetResponse *> *)deregisterScalableTarget:(AWSApplicationautoscalingDeregisterScalableTargetRequest *)request;

/**
 <p>Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. </p><note><p>Deregistering a scalable target deletes the scaling policies and the scheduled actions that are associated with it.</p></note>
 
 @param request A container for the necessary parameters to execute the DeregisterScalableTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDeregisterScalableTargetRequest
 @see AWSApplicationautoscalingDeregisterScalableTargetResponse
 */
- (void)deregisterScalableTarget:(AWSApplicationautoscalingDeregisterScalableTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDeregisterScalableTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the scalable targets in the specified namespace.</p><p>You can filter the results using <code>ResourceIds</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalableTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDescribeScalableTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalableTargetsRequest
 @see AWSApplicationautoscalingDescribeScalableTargetsResponse
 */
- (AWSTask<AWSApplicationautoscalingDescribeScalableTargetsResponse *> *)describeScalableTargets:(AWSApplicationautoscalingDescribeScalableTargetsRequest *)request;

/**
 <p>Gets information about the scalable targets in the specified namespace.</p><p>You can filter the results using <code>ResourceIds</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalableTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalableTargetsRequest
 @see AWSApplicationautoscalingDescribeScalableTargetsResponse
 */
- (void)describeScalableTargets:(AWSApplicationautoscalingDescribeScalableTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDescribeScalableTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides descriptive information about the scaling activities in the specified namespace from the previous six weeks.</p><p>You can filter the results using <code>ResourceId</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDescribeScalingActivitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalingActivitiesRequest
 @see AWSApplicationautoscalingDescribeScalingActivitiesResponse
 */
- (AWSTask<AWSApplicationautoscalingDescribeScalingActivitiesResponse *> *)describeScalingActivities:(AWSApplicationautoscalingDescribeScalingActivitiesRequest *)request;

/**
 <p>Provides descriptive information about the scaling activities in the specified namespace from the previous six weeks.</p><p>You can filter the results using <code>ResourceId</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalingActivitiesRequest
 @see AWSApplicationautoscalingDescribeScalingActivitiesResponse
 */
- (void)describeScalingActivities:(AWSApplicationautoscalingDescribeScalingActivitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDescribeScalingActivitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Application Auto Scaling scaling policies for the specified service namespace.</p><p>You can filter the results using <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>PolicyNames</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDescribeScalingPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorFailedResourceAccess`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalingPoliciesRequest
 @see AWSApplicationautoscalingDescribeScalingPoliciesResponse
 */
- (AWSTask<AWSApplicationautoscalingDescribeScalingPoliciesResponse *> *)describeScalingPolicies:(AWSApplicationautoscalingDescribeScalingPoliciesRequest *)request;

/**
 <p>Describes the Application Auto Scaling scaling policies for the specified service namespace.</p><p>You can filter the results using <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>PolicyNames</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorFailedResourceAccess`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScalingPoliciesRequest
 @see AWSApplicationautoscalingDescribeScalingPoliciesResponse
 */
- (void)describeScalingPolicies:(AWSApplicationautoscalingDescribeScalingPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDescribeScalingPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Application Auto Scaling scheduled actions for the specified service namespace.</p><p>You can filter the results using the <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>ScheduledActionNames</code> parameters.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingDescribeScheduledActionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScheduledActionsRequest
 @see AWSApplicationautoscalingDescribeScheduledActionsResponse
 */
- (AWSTask<AWSApplicationautoscalingDescribeScheduledActionsResponse *> *)describeScheduledActions:(AWSApplicationautoscalingDescribeScheduledActionsRequest *)request;

/**
 <p>Describes the Application Auto Scaling scheduled actions for the specified service namespace.</p><p>You can filter the results using the <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>ScheduledActionNames</code> parameters.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorInvalidNextToken`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingDescribeScheduledActionsRequest
 @see AWSApplicationautoscalingDescribeScheduledActionsResponse
 */
- (void)describeScheduledActions:(AWSApplicationautoscalingDescribeScheduledActionsRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingDescribeScheduledActionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scaling policy for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy applies to the scalable target identified by those three attributes. You cannot create a scaling policy until you have registered the resource as a scalable target.</p><p>Multiple scaling policies can be in force at the same time for the same scalable target. You can have one or more target tracking scaling policies, one or more step scaling policies, or both. However, there is a chance that multiple policies could conflict, instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for both scale out and scale in. For example, if one policy increases capacity by 3, another policy increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. </p><p>We recommend caution, however, when using target tracking scaling policies with step scaling policies because conflicts between these policies can cause undesirable behavior. For example, if the step scaling policy initiates a scale-in activity before the target tracking policy is ready to scale in, the scale-in activity will not be blocked. After the scale-in activity completes, the target tracking policy could instruct the scalable target to scale out again. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to execute scaling policies. Any scaling policies that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingPutScalingPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorFailedResourceAccess`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingPutScalingPolicyRequest
 @see AWSApplicationautoscalingPutScalingPolicyResponse
 */
- (AWSTask<AWSApplicationautoscalingPutScalingPolicyResponse *> *)putScalingPolicy:(AWSApplicationautoscalingPutScalingPolicyRequest *)request;

/**
 <p>Creates or updates a scaling policy for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy applies to the scalable target identified by those three attributes. You cannot create a scaling policy until you have registered the resource as a scalable target.</p><p>Multiple scaling policies can be in force at the same time for the same scalable target. You can have one or more target tracking scaling policies, one or more step scaling policies, or both. However, there is a chance that multiple policies could conflict, instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for both scale out and scale in. For example, if one policy increases capacity by 3, another policy increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. </p><p>We recommend caution, however, when using target tracking scaling policies with step scaling policies because conflicts between these policies can cause undesirable behavior. For example, if the step scaling policy initiates a scale-in activity before the target tracking policy is ready to scale in, the scale-in activity will not be blocked. After the scale-in activity completes, the target tracking policy could instruct the scalable target to scale out again. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to execute scaling policies. Any scaling policies that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorFailedResourceAccess`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingPutScalingPolicyRequest
 @see AWSApplicationautoscalingPutScalingPolicyResponse
 */
- (void)putScalingPolicy:(AWSApplicationautoscalingPutScalingPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingPutScalingPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scheduled action for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action applies to the scalable target identified by those three attributes. You cannot create a scheduled action until you have registered the resource as a scalable target.</p><p>When start and end times are specified with a recurring schedule using a cron expression or rates, they form the boundaries of when the recurring action starts and stops.</p><p>To update a scheduled action, specify the parameters that you want to change. If you don't specify start and end times, the old values are deleted.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled actions that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingPutScheduledActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingPutScheduledActionRequest
 @see AWSApplicationautoscalingPutScheduledActionResponse
 */
- (AWSTask<AWSApplicationautoscalingPutScheduledActionResponse *> *)putScheduledAction:(AWSApplicationautoscalingPutScheduledActionRequest *)request;

/**
 <p>Creates or updates a scheduled action for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action applies to the scalable target identified by those three attributes. You cannot create a scheduled action until you have registered the resource as a scalable target.</p><p>When start and end times are specified with a recurring schedule using a cron expression or rates, they form the boundaries of when the recurring action starts and stops.</p><p>To update a scheduled action, specify the parameters that you want to change. If you don't specify start and end times, the old values are deleted.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled actions that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorObjectNotFound`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingPutScheduledActionRequest
 @see AWSApplicationautoscalingPutScheduledActionResponse
 */
- (void)putScheduledAction:(AWSApplicationautoscalingPutScheduledActionRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingPutScheduledActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers or updates a scalable target. </p><p>A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable targets are uniquely identified by the combination of resource ID, scalable dimension, and namespace. </p><p>When you register a new scalable target, you must specify values for minimum and maximum capacity. Application Auto Scaling scaling policies will not scale capacity to values that are outside of this range.</p><p>After you register a scalable target, you do not need to register it again to use other Application Auto Scaling operations. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. You can also view the scaling policies for a service namespace by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. If you no longer need a scalable target, you can deregister it by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget</a>.</p><p>To update a scalable target, specify the parameters that you want to change. Include the parameters that identify the scalable target: resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not changed by this update request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterScalableTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSApplicationautoscalingRegisterScalableTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingRegisterScalableTargetRequest
 @see AWSApplicationautoscalingRegisterScalableTargetResponse
 */
- (AWSTask<AWSApplicationautoscalingRegisterScalableTargetResponse *> *)registerScalableTarget:(AWSApplicationautoscalingRegisterScalableTargetRequest *)request;

/**
 <p>Registers or updates a scalable target. </p><p>A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable targets are uniquely identified by the combination of resource ID, scalable dimension, and namespace. </p><p>When you register a new scalable target, you must specify values for minimum and maximum capacity. Application Auto Scaling scaling policies will not scale capacity to values that are outside of this range.</p><p>After you register a scalable target, you do not need to register it again to use other Application Auto Scaling operations. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. You can also view the scaling policies for a service namespace by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. If you no longer need a scalable target, you can deregister it by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget</a>.</p><p>To update a scalable target, specify the parameters that you want to change. Include the parameters that identify the scalable target: resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not changed by this update request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterScalableTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSApplicationautoscalingErrorDomain` domain and the following error code: `AWSApplicationautoscalingErrorValidation`, `AWSApplicationautoscalingErrorLimitExceeded`, `AWSApplicationautoscalingErrorConcurrentUpdate`, `AWSApplicationautoscalingErrorInternalService`.
 
 @see AWSApplicationautoscalingRegisterScalableTargetRequest
 @see AWSApplicationautoscalingRegisterScalableTargetResponse
 */
- (void)registerScalableTarget:(AWSApplicationautoscalingRegisterScalableTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSApplicationautoscalingRegisterScalableTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
