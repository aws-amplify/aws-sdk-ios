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
#import "AWSComputeoptimizerModel.h"
#import "AWSComputeoptimizerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSComputeoptimizer
FOUNDATION_EXPORT NSString *const AWSComputeoptimizerSDKVersion;

/**
 <p>AWS Compute Optimizer is a service that analyzes the configuration and utilization metrics of your AWS resources, such as EC2 instances and Auto Scaling groups. It reports whether your resources are optimal, and generates optimization recommendations to reduce the cost and improve the performance of your workloads. Compute Optimizer also provides recent utilization metric data, as well as projected utilization metric data for the recommendations, which you can use to evaluate which recommendation provides the best price-performance trade-off. The analysis of your usage patterns can help you decide when to move or resize your running resources, and still meet your performance and capacity requirements. For more information about Compute Optimizer, including the required permissions to use the service, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/">AWS Compute Optimizer User Guide</a>.</p>
 */
@interface AWSComputeoptimizer : AWSService

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

     let Computeoptimizer = AWSComputeoptimizer.default()

 *Objective-C*

     AWSComputeoptimizer *Computeoptimizer = [AWSComputeoptimizer defaultComputeoptimizer];

 @return The default service client.
 */
+ (instancetype)defaultComputeoptimizer;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSComputeoptimizer.register(with: configuration!, forKey: "USWest2Computeoptimizer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:@"USWest2Computeoptimizer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Computeoptimizer = AWSComputeoptimizer(forKey: "USWest2Computeoptimizer")

 *Objective-C*

     AWSComputeoptimizer *Computeoptimizer = [AWSComputeoptimizer ComputeoptimizerForKey:@"USWest2Computeoptimizer"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerComputeoptimizerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerComputeoptimizerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSComputeoptimizer.register(with: configuration!, forKey: "USWest2Computeoptimizer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:@"USWest2Computeoptimizer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Computeoptimizer = AWSComputeoptimizer(forKey: "USWest2Computeoptimizer")

 *Objective-C*

     AWSComputeoptimizer *Computeoptimizer = [AWSComputeoptimizer ComputeoptimizerForKey:@"USWest2Computeoptimizer"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ComputeoptimizerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeComputeoptimizerForKey:(NSString *)key;

/**
 <p>Describes recommendation export jobs created in the last seven days.</p><p>Use the <code>ExportAutoScalingGroupRecommendations</code> or <code>ExportEC2InstanceRecommendations</code> actions to request an export of your recommendations. Then use the <code>DescribeRecommendationExportJobs</code> action to view your export jobs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationExportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerDescribeRecommendationExportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerDescribeRecommendationExportJobsRequest
 @see AWSComputeoptimizerDescribeRecommendationExportJobsResponse
 */
- (AWSTask<AWSComputeoptimizerDescribeRecommendationExportJobsResponse *> *)describeRecommendationExportJobs:(AWSComputeoptimizerDescribeRecommendationExportJobsRequest *)request;

/**
 <p>Describes recommendation export jobs created in the last seven days.</p><p>Use the <code>ExportAutoScalingGroupRecommendations</code> or <code>ExportEC2InstanceRecommendations</code> actions to request an export of your recommendations. Then use the <code>DescribeRecommendationExportJobs</code> action to view your export jobs.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationExportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerDescribeRecommendationExportJobsRequest
 @see AWSComputeoptimizerDescribeRecommendationExportJobsResponse
 */
- (void)describeRecommendationExportJobs:(AWSComputeoptimizerDescribeRecommendationExportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerDescribeRecommendationExportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports optimization recommendations for Auto Scaling groups.</p><p>Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting Recommendations</a> in the <i>Compute Optimizer User Guide</i>.</p><p>You can have only one Auto Scaling group export job in progress per AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ExportAutoScalingGroupRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`, `AWSComputeoptimizerErrorLimitExceeded`.
 
 @see AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest
 @see AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse
 */
- (AWSTask<AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse *> *)exportAutoScalingGroupRecommendations:(AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest *)request;

/**
 <p>Exports optimization recommendations for Auto Scaling groups.</p><p>Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting Recommendations</a> in the <i>Compute Optimizer User Guide</i>.</p><p>You can have only one Auto Scaling group export job in progress per AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ExportAutoScalingGroupRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`, `AWSComputeoptimizerErrorLimitExceeded`.
 
 @see AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest
 @see AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse
 */
- (void)exportAutoScalingGroupRecommendations:(AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Exports optimization recommendations for Amazon EC2 instances.</p><p>Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting Recommendations</a> in the <i>Compute Optimizer User Guide</i>.</p><p>You can have only one Amazon EC2 instance export job in progress per AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ExportEC2InstanceRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerExportEC2InstanceRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`, `AWSComputeoptimizerErrorLimitExceeded`.
 
 @see AWSComputeoptimizerExportEC2InstanceRecommendationsRequest
 @see AWSComputeoptimizerExportEC2InstanceRecommendationsResponse
 */
- (AWSTask<AWSComputeoptimizerExportEC2InstanceRecommendationsResponse *> *)exportEC2InstanceRecommendations:(AWSComputeoptimizerExportEC2InstanceRecommendationsRequest *)request;

/**
 <p>Exports optimization recommendations for Amazon EC2 instances.</p><p>Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html">Exporting Recommendations</a> in the <i>Compute Optimizer User Guide</i>.</p><p>You can have only one Amazon EC2 instance export job in progress per AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the ExportEC2InstanceRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`, `AWSComputeoptimizerErrorLimitExceeded`.
 
 @see AWSComputeoptimizerExportEC2InstanceRecommendationsRequest
 @see AWSComputeoptimizerExportEC2InstanceRecommendationsResponse
 */
- (void)exportEC2InstanceRecommendations:(AWSComputeoptimizerExportEC2InstanceRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerExportEC2InstanceRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns Auto Scaling group recommendations.</p><p>AWS Compute Optimizer currently generates recommendations for Auto Scaling groups that are configured to run instances of the M, C, R, T, and X instance families. The service does not generate recommendations for Auto Scaling groups that have a scaling policy attached to them, or that do not have the same values for desired, minimum, and maximum capacity. In order for Compute Optimizer to analyze your Auto Scaling groups, they must be of a fixed size. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS Compute Optimizer User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAutoScalingGroupRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest
 @see AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse
 */
- (AWSTask<AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse *> *)getAutoScalingGroupRecommendations:(AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest *)request;

/**
 <p>Returns Auto Scaling group recommendations.</p><p>AWS Compute Optimizer currently generates recommendations for Auto Scaling groups that are configured to run instances of the M, C, R, T, and X instance families. The service does not generate recommendations for Auto Scaling groups that have a scaling policy attached to them, or that do not have the same values for desired, minimum, and maximum capacity. In order for Compute Optimizer to analyze your Auto Scaling groups, they must be of a fixed size. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS Compute Optimizer User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAutoScalingGroupRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest
 @see AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse
 */
- (void)getAutoScalingGroupRecommendations:(AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns Amazon EC2 instance recommendations.</p><p>AWS Compute Optimizer currently generates recommendations for Amazon Elastic Compute Cloud (Amazon EC2) and Amazon EC2 Auto Scaling. It generates recommendations for M, C, R, T, and X instance families. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS Compute Optimizer User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetEC2InstanceRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerGetEC2InstanceRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEC2InstanceRecommendationsRequest
 @see AWSComputeoptimizerGetEC2InstanceRecommendationsResponse
 */
- (AWSTask<AWSComputeoptimizerGetEC2InstanceRecommendationsResponse *> *)getEC2InstanceRecommendations:(AWSComputeoptimizerGetEC2InstanceRecommendationsRequest *)request;

/**
 <p>Returns Amazon EC2 instance recommendations.</p><p>AWS Compute Optimizer currently generates recommendations for Amazon Elastic Compute Cloud (Amazon EC2) and Amazon EC2 Auto Scaling. It generates recommendations for M, C, R, T, and X instance families. For more information, see the <a href="https://docs.aws.amazon.com/compute-optimizer/latest/ug/what-is.html">AWS Compute Optimizer User Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetEC2InstanceRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEC2InstanceRecommendationsRequest
 @see AWSComputeoptimizerGetEC2InstanceRecommendationsResponse
 */
- (void)getEC2InstanceRecommendations:(AWSComputeoptimizerGetEC2InstanceRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerGetEC2InstanceRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the projected utilization metrics of Amazon EC2 instance recommendations.</p>
 
 @param request A container for the necessary parameters to execute the GetEC2RecommendationProjectedMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest
 @see AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse
 */
- (AWSTask<AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse *> *)getEC2RecommendationProjectedMetrics:(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest *)request;

/**
 <p>Returns the projected utilization metrics of Amazon EC2 instance recommendations.</p>
 
 @param request A container for the necessary parameters to execute the GetEC2RecommendationProjectedMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorResourceNotFound`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest
 @see AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse
 */
- (void)getEC2RecommendationProjectedMetrics:(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the enrollment (opt in) status of an account to the AWS Compute Optimizer service.</p><p>If the account is the master account of an organization, this action also confirms the enrollment status of member accounts within the organization.</p>
 
 @param request A container for the necessary parameters to execute the GetEnrollmentStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerGetEnrollmentStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEnrollmentStatusRequest
 @see AWSComputeoptimizerGetEnrollmentStatusResponse
 */
- (AWSTask<AWSComputeoptimizerGetEnrollmentStatusResponse *> *)getEnrollmentStatus:(AWSComputeoptimizerGetEnrollmentStatusRequest *)request;

/**
 <p>Returns the enrollment (opt in) status of an account to the AWS Compute Optimizer service.</p><p>If the account is the master account of an organization, this action also confirms the enrollment status of member accounts within the organization.</p>
 
 @param request A container for the necessary parameters to execute the GetEnrollmentStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetEnrollmentStatusRequest
 @see AWSComputeoptimizerGetEnrollmentStatusResponse
 */
- (void)getEnrollmentStatus:(AWSComputeoptimizerGetEnrollmentStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerGetEnrollmentStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the optimization findings for an account.</p><p>For example, it returns the number of Amazon EC2 instances in an account that are under-provisioned, over-provisioned, or optimized. It also returns the number of Auto Scaling groups in an account that are not optimized, or optimized.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommendationSummaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerGetRecommendationSummariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetRecommendationSummariesRequest
 @see AWSComputeoptimizerGetRecommendationSummariesResponse
 */
- (AWSTask<AWSComputeoptimizerGetRecommendationSummariesResponse *> *)getRecommendationSummaries:(AWSComputeoptimizerGetRecommendationSummariesRequest *)request;

/**
 <p>Returns the optimization findings for an account.</p><p>For example, it returns the number of Amazon EC2 instances in an account that are under-provisioned, over-provisioned, or optimized. It also returns the number of Auto Scaling groups in an account that are not optimized, or optimized.</p>
 
 @param request A container for the necessary parameters to execute the GetRecommendationSummaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorOptInRequired`, `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerGetRecommendationSummariesRequest
 @see AWSComputeoptimizerGetRecommendationSummariesResponse
 */
- (void)getRecommendationSummaries:(AWSComputeoptimizerGetRecommendationSummariesRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerGetRecommendationSummariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the enrollment (opt in) status of an account to the AWS Compute Optimizer service.</p><p>If the account is a master account of an organization, this action can also be used to enroll member accounts within the organization.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnrollmentStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSComputeoptimizerUpdateEnrollmentStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerUpdateEnrollmentStatusRequest
 @see AWSComputeoptimizerUpdateEnrollmentStatusResponse
 */
- (AWSTask<AWSComputeoptimizerUpdateEnrollmentStatusResponse *> *)updateEnrollmentStatus:(AWSComputeoptimizerUpdateEnrollmentStatusRequest *)request;

/**
 <p>Updates the enrollment (opt in) status of an account to the AWS Compute Optimizer service.</p><p>If the account is a master account of an organization, this action can also be used to enroll member accounts within the organization.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEnrollmentStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSComputeoptimizerErrorDomain` domain and the following error code: `AWSComputeoptimizerErrorInternalServer`, `AWSComputeoptimizerErrorServiceUnavailable`, `AWSComputeoptimizerErrorAccessDenied`, `AWSComputeoptimizerErrorInvalidParameterValue`, `AWSComputeoptimizerErrorMissingAuthenticationToken`, `AWSComputeoptimizerErrorThrottling`.
 
 @see AWSComputeoptimizerUpdateEnrollmentStatusRequest
 @see AWSComputeoptimizerUpdateEnrollmentStatusResponse
 */
- (void)updateEnrollmentStatus:(AWSComputeoptimizerUpdateEnrollmentStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSComputeoptimizerUpdateEnrollmentStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
