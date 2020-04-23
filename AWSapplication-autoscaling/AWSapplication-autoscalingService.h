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
#import "AWSapplication-autoscalingModel.h"
#import "AWSapplication-autoscalingResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapplication-autoscaling
FOUNDATION_EXPORT NSString *const AWSapplication-autoscalingSDKVersion;

/**
 <p>With Application Auto Scaling, you can configure automatic scaling for the following resources:</p><ul><li><p>Amazon ECS services</p></li><li><p>Amazon EC2 Spot Fleet requests</p></li><li><p>Amazon EMR clusters</p></li><li><p>Amazon AppStream 2.0 fleets</p></li><li><p>Amazon DynamoDB tables and global secondary indexes throughput capacity</p></li><li><p>Amazon Aurora Replicas</p></li><li><p>Amazon SageMaker endpoint variants</p></li><li><p>Custom resources provided by your own applications or services</p></li><li><p>Amazon Comprehend document classification endpoints</p></li><li><p>AWS Lambda function provisioned concurrency</p></li><li><p>Amazon Keyspaces for Apache Cassandra tables</p></li></ul><p><b>API Summary</b></p><p>The Application Auto Scaling service API includes three key sets of actions: </p><ul><li><p>Register and manage scalable targets - Register AWS or custom resources as scalable targets (a resource that Application Auto Scaling can scale), set minimum and maximum capacity limits, and retrieve information on existing scalable targets.</p></li><li><p>Configure and manage automatic scaling - Define scaling policies to dynamically scale your resources in response to CloudWatch alarms, schedule one-time or recurring scaling actions, and retrieve your recent scaling activity history.</p></li><li><p>Suspend and resume scaling - Temporarily suspend and later resume automatic scaling by calling the <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_RegisterScalableTarget.html">RegisterScalableTarget</a> API action for any Application Auto Scaling scalable target. You can suspend and resume (individually or in combination) scale-out activities that are triggered by a scaling policy, scale-in activities that are triggered by a scaling policy, and scheduled scaling.</p></li></ul><p>To learn more about Application Auto Scaling, including information about granting IAM users required permissions for Application Auto Scaling actions, see the <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application Auto Scaling User Guide</a>.</p>
 */
@interface AWSapplication-autoscaling : AWSService

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

     let application-autoscaling = AWSapplication-autoscaling.default()

 *Objective-C*

     AWSapplication-autoscaling *application-autoscaling = [AWSapplication-autoscaling defaultapplication-autoscaling];

 @return The default service client.
 */
+ (instancetype)defaultapplication-autoscaling;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapplication-autoscaling.register(with: configuration!, forKey: "USWest2application-autoscaling")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:@"USWest2application-autoscaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let application-autoscaling = AWSapplication-autoscaling(forKey: "USWest2application-autoscaling")

 *Objective-C*

     AWSapplication-autoscaling *application-autoscaling = [AWSapplication-autoscaling application-autoscalingForKey:@"USWest2application-autoscaling"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapplication-autoscalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapplication-autoscalingWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapplication-autoscaling.register(with: configuration!, forKey: "USWest2application-autoscaling")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:configuration forKey:@"USWest2application-autoscaling"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let application-autoscaling = AWSapplication-autoscaling(forKey: "USWest2application-autoscaling")

 *Objective-C*

     AWSapplication-autoscaling *application-autoscaling = [AWSapplication-autoscaling application-autoscalingForKey:@"USWest2application-autoscaling"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)application-autoscalingForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapplication-autoscalingForKey:(NSString *)key;

/**
 <p>Deletes the specified scaling policy for an Application Auto Scaling scalable target.</p><p>Deleting a step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete a Step Scaling Policy</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDeleteScalingPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeleteScalingPolicyRequest
 @see AWSapplication-autoscalingDeleteScalingPolicyResponse
 */
- (AWSTask<AWSapplication-autoscalingDeleteScalingPolicyResponse *> *)deleteScalingPolicy:(AWSapplication-autoscalingDeleteScalingPolicyRequest *)request;

/**
 <p>Deletes the specified scaling policy for an Application Auto Scaling scalable target.</p><p>Deleting a step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm associated with the scaling policy, even if it no longer has an associated action.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete a Step Scaling Policy</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeleteScalingPolicyRequest
 @see AWSapplication-autoscalingDeleteScalingPolicyResponse
 */
- (void)deleteScalingPolicy:(AWSapplication-autoscalingDeleteScalingPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDeleteScalingPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified scheduled action for an Application Auto Scaling scalable target.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action">Delete a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDeleteScheduledActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeleteScheduledActionRequest
 @see AWSapplication-autoscalingDeleteScheduledActionResponse
 */
- (AWSTask<AWSapplication-autoscalingDeleteScheduledActionResponse *> *)deleteScheduledAction:(AWSapplication-autoscalingDeleteScheduledActionRequest *)request;

/**
 <p>Deletes the specified scheduled action for an Application Auto Scaling scalable target.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action">Delete a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeleteScheduledActionRequest
 @see AWSapplication-autoscalingDeleteScheduledActionResponse
 */
- (void)deleteScheduledAction:(AWSapplication-autoscalingDeleteScheduledActionRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDeleteScheduledActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. </p><note><p>Deregistering a scalable target deletes the scaling policies and the scheduled actions that are associated with it.</p></note>
 
 @param request A container for the necessary parameters to execute the DeregisterScalableTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDeregisterScalableTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeregisterScalableTargetRequest
 @see AWSapplication-autoscalingDeregisterScalableTargetResponse
 */
- (AWSTask<AWSapplication-autoscalingDeregisterScalableTargetResponse *> *)deregisterScalableTarget:(AWSapplication-autoscalingDeregisterScalableTargetRequest *)request;

/**
 <p>Deregisters an Application Auto Scaling scalable target when you have finished using it. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. </p><note><p>Deregistering a scalable target deletes the scaling policies and the scheduled actions that are associated with it.</p></note>
 
 @param request A container for the necessary parameters to execute the DeregisterScalableTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDeregisterScalableTargetRequest
 @see AWSapplication-autoscalingDeregisterScalableTargetResponse
 */
- (void)deregisterScalableTarget:(AWSapplication-autoscalingDeregisterScalableTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDeregisterScalableTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about the scalable targets in the specified namespace.</p><p>You can filter the results using <code>ResourceIds</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalableTargets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDescribeScalableTargetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalableTargetsRequest
 @see AWSapplication-autoscalingDescribeScalableTargetsResponse
 */
- (AWSTask<AWSapplication-autoscalingDescribeScalableTargetsResponse *> *)describeScalableTargets:(AWSapplication-autoscalingDescribeScalableTargetsRequest *)request;

/**
 <p>Gets information about the scalable targets in the specified namespace.</p><p>You can filter the results using <code>ResourceIds</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalableTargets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalableTargetsRequest
 @see AWSapplication-autoscalingDescribeScalableTargetsResponse
 */
- (void)describeScalableTargets:(AWSapplication-autoscalingDescribeScalableTargetsRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDescribeScalableTargetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides descriptive information about the scaling activities in the specified namespace from the previous six weeks.</p><p>You can filter the results using <code>ResourceId</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDescribeScalingActivitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalingActivitiesRequest
 @see AWSapplication-autoscalingDescribeScalingActivitiesResponse
 */
- (AWSTask<AWSapplication-autoscalingDescribeScalingActivitiesResponse *> *)describeScalingActivities:(AWSapplication-autoscalingDescribeScalingActivitiesRequest *)request;

/**
 <p>Provides descriptive information about the scaling activities in the specified namespace from the previous six weeks.</p><p>You can filter the results using <code>ResourceId</code> and <code>ScalableDimension</code>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingActivities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalingActivitiesRequest
 @see AWSapplication-autoscalingDescribeScalingActivitiesResponse
 */
- (void)describeScalingActivities:(AWSapplication-autoscalingDescribeScalingActivitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDescribeScalingActivitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Application Auto Scaling scaling policies for the specified service namespace.</p><p>You can filter the results using <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>PolicyNames</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDescribeScalingPoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorFailedResourceAccess`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalingPoliciesRequest
 @see AWSapplication-autoscalingDescribeScalingPoliciesResponse
 */
- (AWSTask<AWSapplication-autoscalingDescribeScalingPoliciesResponse *> *)describeScalingPolicies:(AWSapplication-autoscalingDescribeScalingPoliciesRequest *)request;

/**
 <p>Describes the Application Auto Scaling scaling policies for the specified service namespace.</p><p>You can filter the results using <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>PolicyNames</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScalingPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorFailedResourceAccess`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScalingPoliciesRequest
 @see AWSapplication-autoscalingDescribeScalingPoliciesResponse
 */
- (void)describeScalingPolicies:(AWSapplication-autoscalingDescribeScalingPoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDescribeScalingPoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the Application Auto Scaling scheduled actions for the specified service namespace.</p><p>You can filter the results using the <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>ScheduledActionNames</code> parameters.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingDescribeScheduledActionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScheduledActionsRequest
 @see AWSapplication-autoscalingDescribeScheduledActionsResponse
 */
- (AWSTask<AWSapplication-autoscalingDescribeScheduledActionsResponse *> *)describeScheduledActions:(AWSapplication-autoscalingDescribeScheduledActionsRequest *)request;

/**
 <p>Describes the Application Auto Scaling scheduled actions for the specified service namespace.</p><p>You can filter the results using the <code>ResourceId</code>, <code>ScalableDimension</code>, and <code>ScheduledActionNames</code> parameters.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeScheduledActions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorInvalidNextToken`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingDescribeScheduledActionsRequest
 @see AWSapplication-autoscalingDescribeScheduledActionsResponse
 */
- (void)describeScheduledActions:(AWSapplication-autoscalingDescribeScheduledActionsRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingDescribeScheduledActionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scaling policy for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy applies to the scalable target identified by those three attributes. You cannot create a scaling policy until you have registered the resource as a scalable target.</p><p>Multiple scaling policies can be in force at the same time for the same scalable target. You can have one or more target tracking scaling policies, one or more step scaling policies, or both. However, there is a chance that multiple policies could conflict, instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for both scale out and scale in. For example, if one policy increases capacity by 3, another policy increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to execute scaling policies. Any scaling policies that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingPutScalingPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorFailedResourceAccess`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingPutScalingPolicyRequest
 @see AWSapplication-autoscalingPutScalingPolicyResponse
 */
- (AWSTask<AWSapplication-autoscalingPutScalingPolicyResponse *> *)putScalingPolicy:(AWSapplication-autoscalingPutScalingPolicyRequest *)request;

/**
 <p>Creates or updates a scaling policy for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy applies to the scalable target identified by those three attributes. You cannot create a scaling policy until you have registered the resource as a scalable target.</p><p>Multiple scaling policies can be in force at the same time for the same scalable target. You can have one or more target tracking scaling policies, one or more step scaling policies, or both. However, there is a chance that multiple policies could conflict, instructing the scalable target to scale out or in at the same time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for both scale out and scale in. For example, if one policy increases capacity by 3, another policy increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target Tracking Scaling Policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to execute scaling policies. Any scaling policies that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScalingPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorFailedResourceAccess`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingPutScalingPolicyRequest
 @see AWSapplication-autoscalingPutScalingPolicyResponse
 */
- (void)putScalingPolicy:(AWSapplication-autoscalingPutScalingPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingPutScalingPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a scheduled action for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action applies to the scalable target identified by those three attributes. You cannot create a scheduled action until you have registered the resource as a scalable target.</p><p>When start and end times are specified with a recurring schedule using a cron expression or rates, they form the boundaries of when the recurring action starts and stops.</p><p>To update a scheduled action, specify the parameters that you want to change. If you don't specify start and end times, the old values are deleted.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled actions that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScheduledAction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingPutScheduledActionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingPutScheduledActionRequest
 @see AWSapplication-autoscalingPutScheduledActionResponse
 */
- (AWSTask<AWSapplication-autoscalingPutScheduledActionResponse *> *)putScheduledAction:(AWSapplication-autoscalingPutScheduledActionRequest *)request;

/**
 <p>Creates or updates a scheduled action for an Application Auto Scaling scalable target.</p><p>Each scalable target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action applies to the scalable target identified by those three attributes. You cannot create a scheduled action until you have registered the resource as a scalable target.</p><p>When start and end times are specified with a recurring schedule using a cron expression or rates, they form the boundaries of when the recurring action starts and stops.</p><p>To update a scheduled action, specify the parameters that you want to change. If you don't specify start and end times, the old values are deleted.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled Scaling</a> in the <i>Application Auto Scaling User Guide</i>.</p><note><p>If a scalable target is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled actions that were specified for the scalable target are deleted.</p></note>
 
 @param request A container for the necessary parameters to execute the PutScheduledAction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorObjectNotFound`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingPutScheduledActionRequest
 @see AWSapplication-autoscalingPutScheduledActionResponse
 */
- (void)putScheduledAction:(AWSapplication-autoscalingPutScheduledActionRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingPutScheduledActionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Registers or updates a scalable target. </p><p>A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable targets are uniquely identified by the combination of resource ID, scalable dimension, and namespace. </p><p>When you register a new scalable target, you must specify values for minimum and maximum capacity. Application Auto Scaling scaling policies will not scale capacity to values that are outside of this range.</p><p>After you register a scalable target, you do not need to register it again to use other Application Auto Scaling operations. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. You can also view the scaling policies for a service namespace by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. If you no longer need a scalable target, you can deregister it by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget</a>.</p><p>To update a scalable target, specify the parameters that you want to change. Include the parameters that identify the scalable target: resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not changed by this update request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterScalableTarget service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapplication-autoscalingRegisterScalableTargetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingRegisterScalableTargetRequest
 @see AWSapplication-autoscalingRegisterScalableTargetResponse
 */
- (AWSTask<AWSapplication-autoscalingRegisterScalableTargetResponse *> *)registerScalableTarget:(AWSapplication-autoscalingRegisterScalableTargetRequest *)request;

/**
 <p>Registers or updates a scalable target. </p><p>A scalable target is a resource that Application Auto Scaling can scale out and scale in. Scalable targets are uniquely identified by the combination of resource ID, scalable dimension, and namespace. </p><p>When you register a new scalable target, you must specify values for minimum and maximum capacity. Application Auto Scaling scaling policies will not scale capacity to values that are outside of this range.</p><p>After you register a scalable target, you do not need to register it again to use other Application Auto Scaling operations. To see which resources have been registered, use <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. You can also view the scaling policies for a service namespace by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>. If you no longer need a scalable target, you can deregister it by using <a href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget</a>.</p><p>To update a scalable target, specify the parameters that you want to change. Include the parameters that identify the scalable target: resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not changed by this update request. </p>
 
 @param request A container for the necessary parameters to execute the RegisterScalableTarget service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapplication-autoscalingErrorDomain` domain and the following error code: `AWSapplication-autoscalingErrorValidation`, `AWSapplication-autoscalingErrorLimitExceeded`, `AWSapplication-autoscalingErrorConcurrentUpdate`, `AWSapplication-autoscalingErrorInternalService`.
 
 @see AWSapplication-autoscalingRegisterScalableTargetRequest
 @see AWSapplication-autoscalingRegisterScalableTargetResponse
 */
- (void)registerScalableTarget:(AWSapplication-autoscalingRegisterScalableTargetRequest *)request completionHandler:(void (^ _Nullable)(AWSapplication-autoscalingRegisterScalableTargetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
