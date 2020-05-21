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
#import "AWSSyntheticsModel.h"
#import "AWSSyntheticsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSynthetics
FOUNDATION_EXPORT NSString *const AWSSyntheticsSDKVersion;

/**
 <fullname>Amazon CloudWatch Synthetics</fullname><p>You can use Amazon CloudWatch Synthetics to continually monitor your services. You can create and manage <i>canaries</i>, which are modular, lightweight scripts that monitor your endpoints and APIs from the outside-in. You can set up your canaries to run 24 hours a day, once per minute. The canaries help you check the availability and latency of your web services and troubleshoot anomalies by investigating load time data, screenshots of the UI, logs, and metrics. The canaries seamlessly integrate with CloudWatch ServiceLens to help you trace the causes of impacted nodes in your applications. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ServiceLens.html">Using ServiceLens to Monitor the Health of Your Applications</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>Before you create and manage canaries, be aware of the security considerations. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security Considerations for Synthetics Canaries</a>.</p>
 */
@interface AWSSynthetics : AWSService

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

     let Synthetics = AWSSynthetics.default()

 *Objective-C*

     AWSSynthetics *Synthetics = [AWSSynthetics defaultSynthetics];

 @return The default service client.
 */
+ (instancetype)defaultSynthetics;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSynthetics.register(with: configuration!, forKey: "USWest2Synthetics")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSynthetics registerSyntheticsWithConfiguration:configuration forKey:@"USWest2Synthetics"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Synthetics = AWSSynthetics(forKey: "USWest2Synthetics")

 *Objective-C*

     AWSSynthetics *Synthetics = [AWSSynthetics SyntheticsForKey:@"USWest2Synthetics"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSyntheticsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSyntheticsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSynthetics.register(with: configuration!, forKey: "USWest2Synthetics")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSynthetics registerSyntheticsWithConfiguration:configuration forKey:@"USWest2Synthetics"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Synthetics = AWSSynthetics(forKey: "USWest2Synthetics")

 *Objective-C*

     AWSSynthetics *Synthetics = [AWSSynthetics SyntheticsForKey:@"USWest2Synthetics"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SyntheticsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSyntheticsForKey:(NSString *)key;

/**
 <p>Creates a canary. Canaries are scripts that monitor your endpoints and APIs from the outside-in. Canaries help you check the availability and latency of your web services and troubleshoot anomalies by investigating load time data, screenshots of the UI, logs, and metrics. You can set up a canary to run continuously or just once. </p><p>Do not use <code>CreateCanary</code> to modify an existing canary. Use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_UpdateCanary.html">UpdateCanary</a> instead.</p><p>To create canaries, you must have the <code>CloudWatchSyntheticsFullAccess</code> policy. If you are creating a new IAM role for the canary, you also need the the <code>iam:CreateRole</code>, <code>iam:CreatePolicy</code> and <code>iam:AttachRolePolicy</code> permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Roles">Necessary Roles and Permissions</a>.</p><p>Do not include secrets or proprietary information in your canary names. The canary name makes up part of the Amazon Resource Name (ARN) for the canary, and the ARN is included in outbound calls over the internet. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security Considerations for Synthetics Canaries</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsCreateCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsCreateCanaryRequest
 @see AWSSyntheticsCreateCanaryResponse
 */
- (AWSTask<AWSSyntheticsCreateCanaryResponse *> *)createCanary:(AWSSyntheticsCreateCanaryRequest *)request;

/**
 <p>Creates a canary. Canaries are scripts that monitor your endpoints and APIs from the outside-in. Canaries help you check the availability and latency of your web services and troubleshoot anomalies by investigating load time data, screenshots of the UI, logs, and metrics. You can set up a canary to run continuously or just once. </p><p>Do not use <code>CreateCanary</code> to modify an existing canary. Use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_UpdateCanary.html">UpdateCanary</a> instead.</p><p>To create canaries, you must have the <code>CloudWatchSyntheticsFullAccess</code> policy. If you are creating a new IAM role for the canary, you also need the the <code>iam:CreateRole</code>, <code>iam:CreatePolicy</code> and <code>iam:AttachRolePolicy</code> permissions. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Roles">Necessary Roles and Permissions</a>.</p><p>Do not include secrets or proprietary information in your canary names. The canary name makes up part of the Amazon Resource Name (ARN) for the canary, and the ARN is included in outbound calls over the internet. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/servicelens_canaries_security.html">Security Considerations for Synthetics Canaries</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsCreateCanaryRequest
 @see AWSSyntheticsCreateCanaryResponse
 */
- (void)createCanary:(AWSSyntheticsCreateCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsCreateCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Permanently deletes the specified canary.</p><p>When you delete a canary, resources used and created by the canary are not automatically deleted. After you delete a canary that you do not intend to use again, you should also delete the following:</p><ul><li><p>The Lambda functions and layers used by this canary. These have the prefix <code>cwsyn-<i>MyCanaryName</i></code>.</p></li><li><p>The CloudWatch alarms created for this canary. These alarms have a name of <code>Synthetics-SharpDrop-Alarm-<i>MyCanaryName</i></code>.</p></li><li><p>Amazon S3 objects and buckets, such as the canary's artifact location.</p></li><li><p>IAM roles created for the canary. If they were created in the console, these roles have the name <code> role/service-role/CloudWatchSyntheticsRole-<i>MyCanaryName</i></code>.</p></li><li><p>CloudWatch Logs log groups created for the canary. These logs groups have the name <code>/aws/lambda/cwsyn-<i>MyCanaryName</i></code>. </p></li></ul><p>Before you delete a canary, you might want to use <code>GetCanary</code> to display the information about this canary. Make note of the information returned by this operation so that you can delete these resources after you delete the canary.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsDeleteCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsDeleteCanaryRequest
 @see AWSSyntheticsDeleteCanaryResponse
 */
- (AWSTask<AWSSyntheticsDeleteCanaryResponse *> *)deleteCanary:(AWSSyntheticsDeleteCanaryRequest *)request;

/**
 <p>Permanently deletes the specified canary.</p><p>When you delete a canary, resources used and created by the canary are not automatically deleted. After you delete a canary that you do not intend to use again, you should also delete the following:</p><ul><li><p>The Lambda functions and layers used by this canary. These have the prefix <code>cwsyn-<i>MyCanaryName</i></code>.</p></li><li><p>The CloudWatch alarms created for this canary. These alarms have a name of <code>Synthetics-SharpDrop-Alarm-<i>MyCanaryName</i></code>.</p></li><li><p>Amazon S3 objects and buckets, such as the canary's artifact location.</p></li><li><p>IAM roles created for the canary. If they were created in the console, these roles have the name <code> role/service-role/CloudWatchSyntheticsRole-<i>MyCanaryName</i></code>.</p></li><li><p>CloudWatch Logs log groups created for the canary. These logs groups have the name <code>/aws/lambda/cwsyn-<i>MyCanaryName</i></code>. </p></li></ul><p>Before you delete a canary, you might want to use <code>GetCanary</code> to display the information about this canary. Make note of the information returned by this operation so that you can delete these resources after you delete the canary.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsDeleteCanaryRequest
 @see AWSSyntheticsDeleteCanaryResponse
 */
- (void)deleteCanary:(AWSSyntheticsDeleteCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsDeleteCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This operation returns a list of the canaries in your account, along with full details about each canary.</p><p>This operation does not have resource-level authorization, so if a user is able to use <code>DescribeCanaries</code>, the user can see all of the canaries in the account. A deny policy can only be used to restrict access to all canaries. It cannot be used on specific resources. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCanaries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsDescribeCanariesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeCanariesRequest
 @see AWSSyntheticsDescribeCanariesResponse
 */
- (AWSTask<AWSSyntheticsDescribeCanariesResponse *> *)describeCanaries:(AWSSyntheticsDescribeCanariesRequest *)request;

/**
 <p>This operation returns a list of the canaries in your account, along with full details about each canary.</p><p>This operation does not have resource-level authorization, so if a user is able to use <code>DescribeCanaries</code>, the user can see all of the canaries in the account. A deny policy can only be used to restrict access to all canaries. It cannot be used on specific resources. </p>
 
 @param request A container for the necessary parameters to execute the DescribeCanaries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeCanariesRequest
 @see AWSSyntheticsDescribeCanariesResponse
 */
- (void)describeCanaries:(AWSSyntheticsDescribeCanariesRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsDescribeCanariesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this operation to see information from the most recent run of each canary that you have created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCanariesLastRun service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsDescribeCanariesLastRunResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeCanariesLastRunRequest
 @see AWSSyntheticsDescribeCanariesLastRunResponse
 */
- (AWSTask<AWSSyntheticsDescribeCanariesLastRunResponse *> *)describeCanariesLastRun:(AWSSyntheticsDescribeCanariesLastRunRequest *)request;

/**
 <p>Use this operation to see information from the most recent run of each canary that you have created.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCanariesLastRun service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeCanariesLastRunRequest
 @see AWSSyntheticsDescribeCanariesLastRunResponse
 */
- (void)describeCanariesLastRun:(AWSSyntheticsDescribeCanariesLastRunRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsDescribeCanariesLastRunResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of Synthetics canary runtime versions. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRuntimeVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsDescribeRuntimeVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeRuntimeVersionsRequest
 @see AWSSyntheticsDescribeRuntimeVersionsResponse
 */
- (AWSTask<AWSSyntheticsDescribeRuntimeVersionsResponse *> *)describeRuntimeVersions:(AWSSyntheticsDescribeRuntimeVersionsRequest *)request;

/**
 <p>Returns a list of Synthetics canary runtime versions. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_Library.html"> Canary Runtime Versions</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRuntimeVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsDescribeRuntimeVersionsRequest
 @see AWSSyntheticsDescribeRuntimeVersionsResponse
 */
- (void)describeRuntimeVersions:(AWSSyntheticsDescribeRuntimeVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsDescribeRuntimeVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves complete information about one canary. You must specify the name of the canary that you want. To get a list of canaries and their names, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsGetCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsGetCanaryRequest
 @see AWSSyntheticsGetCanaryResponse
 */
- (AWSTask<AWSSyntheticsGetCanaryResponse *> *)getCanary:(AWSSyntheticsGetCanaryRequest *)request;

/**
 <p>Retrieves complete information about one canary. You must specify the name of the canary that you want. To get a list of canaries and their names, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_DescribeCanaries.html">DescribeCanaries</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsGetCanaryRequest
 @see AWSSyntheticsGetCanaryResponse
 */
- (void)getCanary:(AWSSyntheticsGetCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsGetCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of runs for a specified canary.</p>
 
 @param request A container for the necessary parameters to execute the GetCanaryRuns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsGetCanaryRunsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`.
 
 @see AWSSyntheticsGetCanaryRunsRequest
 @see AWSSyntheticsGetCanaryRunsResponse
 */
- (AWSTask<AWSSyntheticsGetCanaryRunsResponse *> *)getCanaryRuns:(AWSSyntheticsGetCanaryRunsRequest *)request;

/**
 <p>Retrieves a list of runs for a specified canary.</p>
 
 @param request A container for the necessary parameters to execute the GetCanaryRuns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`.
 
 @see AWSSyntheticsGetCanaryRunsRequest
 @see AWSSyntheticsGetCanaryRunsResponse
 */
- (void)getCanaryRuns:(AWSSyntheticsGetCanaryRunsRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsGetCanaryRunsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Displays the tags associated with a canary.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsListTagsForResourceRequest
 @see AWSSyntheticsListTagsForResourceResponse
 */
- (AWSTask<AWSSyntheticsListTagsForResourceResponse *> *)listTagsForResource:(AWSSyntheticsListTagsForResourceRequest *)request;

/**
 <p>Displays the tags associated with a canary.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsListTagsForResourceRequest
 @see AWSSyntheticsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSSyntheticsListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this operation to run a canary that has already been created. The frequency of the canary runs is determined by the value of the canary's <code>Schedule</code>. To see a canary's schedule, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanary.html">GetCanary</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsStartCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsStartCanaryRequest
 @see AWSSyntheticsStartCanaryResponse
 */
- (AWSTask<AWSSyntheticsStartCanaryResponse *> *)startCanary:(AWSSyntheticsStartCanaryRequest *)request;

/**
 <p>Use this operation to run a canary that has already been created. The frequency of the canary runs is determined by the value of the canary's <code>Schedule</code>. To see a canary's schedule, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_GetCanary.html">GetCanary</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsStartCanaryRequest
 @see AWSSyntheticsStartCanaryResponse
 */
- (void)startCanary:(AWSSyntheticsStartCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsStartCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the canary to prevent all future runs. If the canary is currently running, Synthetics stops waiting for the current run of the specified canary to complete. The run that is in progress completes on its own, publishes metrics, and uploads artifacts, but it is not recorded in Synthetics as a completed run.</p><p>You can use <code>StartCanary</code> to start it running again with the canary’s current schedule at any point in the future. </p>
 
 @param request A container for the necessary parameters to execute the StopCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsStopCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsStopCanaryRequest
 @see AWSSyntheticsStopCanaryResponse
 */
- (AWSTask<AWSSyntheticsStopCanaryResponse *> *)stopCanary:(AWSSyntheticsStopCanaryRequest *)request;

/**
 <p>Stops the canary to prevent all future runs. If the canary is currently running, Synthetics stops waiting for the current run of the specified canary to complete. The run that is in progress completes on its own, publishes metrics, and uploads artifacts, but it is not recorded in Synthetics as a completed run.</p><p>You can use <code>StartCanary</code> to start it running again with the canary’s current schedule at any point in the future. </p>
 
 @param request A container for the necessary parameters to execute the StopCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsStopCanaryRequest
 @see AWSSyntheticsStopCanaryResponse
 */
- (void)stopCanary:(AWSSyntheticsStopCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsStopCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified canary. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.</p><p>Tags don't have any semantic meaning to AWS and are interpreted strictly as strings of characters.</p><p>You can use the <code>TagResource</code> action with a canary that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a canary.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsTagResourceRequest
 @see AWSSyntheticsTagResourceResponse
 */
- (AWSTask<AWSSyntheticsTagResourceResponse *> *)tagResource:(AWSSyntheticsTagResourceRequest *)request;

/**
 <p>Assigns one or more tags (key-value pairs) to the specified canary. </p><p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.</p><p>Tags don't have any semantic meaning to AWS and are interpreted strictly as strings of characters.</p><p>You can use the <code>TagResource</code> action with a canary that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p><p>You can associate as many as 50 tags with a canary.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsTagResourceRequest
 @see AWSSyntheticsTagResourceResponse
 */
- (void)tagResource:(AWSSyntheticsTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified canary.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsUntagResourceRequest
 @see AWSSyntheticsUntagResourceResponse
 */
- (AWSTask<AWSSyntheticsUntagResourceResponse *> *)untagResource:(AWSSyntheticsUntagResourceRequest *)request;

/**
 <p>Removes one or more tags from the specified canary.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorValidation`.
 
 @see AWSSyntheticsUntagResourceRequest
 @see AWSSyntheticsUntagResourceResponse
 */
- (void)untagResource:(AWSSyntheticsUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this operation to change the settings of a canary that has already been created.</p><p>You can't use this operation to update the tags of an existing canary. To change the tags of an existing canary, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html">TagResource</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCanary service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSyntheticsUpdateCanaryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsUpdateCanaryRequest
 @see AWSSyntheticsUpdateCanaryResponse
 */
- (AWSTask<AWSSyntheticsUpdateCanaryResponse *> *)updateCanary:(AWSSyntheticsUpdateCanaryRequest *)request;

/**
 <p>Use this operation to change the settings of a canary that has already been created.</p><p>You can't use this operation to update the tags of an existing canary. To change the tags of an existing canary, use <a href="https://docs.aws.amazon.com/AmazonSynthetics/latest/APIReference/API_TagResource.html">TagResource</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCanary service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSyntheticsErrorDomain` domain and the following error code: `AWSSyntheticsErrorInternalServer`, `AWSSyntheticsErrorValidation`, `AWSSyntheticsErrorResourceNotFound`, `AWSSyntheticsErrorConflict`.
 
 @see AWSSyntheticsUpdateCanaryRequest
 @see AWSSyntheticsUpdateCanaryResponse
 */
- (void)updateCanary:(AWSSyntheticsUpdateCanaryRequest *)request completionHandler:(void (^ _Nullable)(AWSSyntheticsUpdateCanaryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
