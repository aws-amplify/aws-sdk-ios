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
#import "AWSa2i-runtime.sagemakerModel.h"
#import "AWSa2i-runtime.sagemakerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSa2i-runtime.sagemaker
FOUNDATION_EXPORT NSString *const AWSa2i-runtime.sagemakerSDKVersion;

/**
 <important><p>Amazon Augmented AI is in preview release and is subject to change. We do not recommend using this product in production environments.</p></important><p>Amazon Augmented AI (Amazon A2I) adds the benefit of human judgment to any machine learning application. When an AI application can't evaluate data with a high degree of confidence, human reviewers can take over. This human review is called a human review workflow. To create and start a human review workflow, you need three resources: a <i>worker task template</i>, a <i>flow definition</i>, and a <i>human loop</i>.</p><p>For information about these resources and prerequisites for using Amazon A2I, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-getting-started.html">Get Started with Amazon Augmented AI</a> in the Amazon SageMaker Developer Guide.</p><p>This API reference includes information about API actions and data types that you can use to interact with Amazon A2I programmatically. Use this guide to:</p><ul><li><p>Start a human loop with the <code>StartHumanLoop</code> operation when using Amazon A2I with a <i>custom task type</i>. To learn more about the difference between custom and built-in task types, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-task-types-general.html">Use Task Types </a>. To learn how to start a human loop using this API, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-start-human-loop.html#a2i-instructions-starthumanloop">Create and Start a Human Loop for a Custom Task Type </a> in the Amazon SageMaker Developer Guide.</p></li><li><p>Manage your human loops. You can list all human loops that you have created, describe individual human loops, and stop and delete human loops. To learn more, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-monitor-humanloop-results.html">Monitor and Manage Your Human Loop </a> in the Amazon SageMaker Developer Guide.</p></li></ul><p>Amazon A2I integrates APIs from various AWS services to create and start human review workflows for those services. To learn how Amazon A2I uses these APIs, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-api-references.html">Use APIs in Amazon A2I</a> in the Amazon SageMaker Developer Guide.</p>
 */
@interface AWSa2i-runtime.sagemaker : AWSService

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

     let a2i-runtime.sagemaker = AWSa2i-runtime.sagemaker.default()

 *Objective-C*

     AWSa2i-runtime.sagemaker *a2i-runtime.sagemaker = [AWSa2i-runtime.sagemaker defaulta2i-runtime.sagemaker];

 @return The default service client.
 */
+ (instancetype)defaulta2i-runtime.sagemaker;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSa2i-runtime.sagemaker.register(with: configuration!, forKey: "USWest2a2i-runtime.sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:@"USWest2a2i-runtime.sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let a2i-runtime.sagemaker = AWSa2i-runtime.sagemaker(forKey: "USWest2a2i-runtime.sagemaker")

 *Objective-C*

     AWSa2i-runtime.sagemaker *a2i-runtime.sagemaker = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:@"USWest2a2i-runtime.sagemaker"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registera2i-runtime.sagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registera2i-runtime.sagemakerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSa2i-runtime.sagemaker.register(with: configuration!, forKey: "USWest2a2i-runtime.sagemaker")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:@"USWest2a2i-runtime.sagemaker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let a2i-runtime.sagemaker = AWSa2i-runtime.sagemaker(forKey: "USWest2a2i-runtime.sagemaker")

 *Objective-C*

     AWSa2i-runtime.sagemaker *a2i-runtime.sagemaker = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:@"USWest2a2i-runtime.sagemaker"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)a2i-runtime.sagemakerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removea2i-runtime.sagemakerForKey:(NSString *)key;

/**
 <p>Deletes the specified human loop for a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHumanLoop service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSa2i-runtime.sagemakerDeleteHumanLoopResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerDeleteHumanLoopRequest
 @see AWSa2i-runtime.sagemakerDeleteHumanLoopResponse
 */
- (AWSTask<AWSa2i-runtime.sagemakerDeleteHumanLoopResponse *> *)deleteHumanLoop:(AWSa2i-runtime.sagemakerDeleteHumanLoopRequest *)request;

/**
 <p>Deletes the specified human loop for a flow definition.</p>
 
 @param request A container for the necessary parameters to execute the DeleteHumanLoop service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerDeleteHumanLoopRequest
 @see AWSa2i-runtime.sagemakerDeleteHumanLoopResponse
 */
- (void)deleteHumanLoop:(AWSa2i-runtime.sagemakerDeleteHumanLoopRequest *)request completionHandler:(void (^ _Nullable)(AWSa2i-runtime.sagemakerDeleteHumanLoopResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the specified human loop.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanLoop service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSa2i-runtime.sagemakerDescribeHumanLoopResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerDescribeHumanLoopRequest
 @see AWSa2i-runtime.sagemakerDescribeHumanLoopResponse
 */
- (AWSTask<AWSa2i-runtime.sagemakerDescribeHumanLoopResponse *> *)describeHumanLoop:(AWSa2i-runtime.sagemakerDescribeHumanLoopRequest *)request;

/**
 <p>Returns information about the specified human loop.</p>
 
 @param request A container for the necessary parameters to execute the DescribeHumanLoop service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerDescribeHumanLoopRequest
 @see AWSa2i-runtime.sagemakerDescribeHumanLoopResponse
 */
- (void)describeHumanLoop:(AWSa2i-runtime.sagemakerDescribeHumanLoopRequest *)request completionHandler:(void (^ _Nullable)(AWSa2i-runtime.sagemakerDescribeHumanLoopResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about human loops, given the specified parameters. If a human loop was deleted, it will not be included.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanLoops service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSa2i-runtime.sagemakerListHumanLoopsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerListHumanLoopsRequest
 @see AWSa2i-runtime.sagemakerListHumanLoopsResponse
 */
- (AWSTask<AWSa2i-runtime.sagemakerListHumanLoopsResponse *> *)listHumanLoops:(AWSa2i-runtime.sagemakerListHumanLoopsRequest *)request;

/**
 <p>Returns information about human loops, given the specified parameters. If a human loop was deleted, it will not be included.</p>
 
 @param request A container for the necessary parameters to execute the ListHumanLoops service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerListHumanLoopsRequest
 @see AWSa2i-runtime.sagemakerListHumanLoopsResponse
 */
- (void)listHumanLoops:(AWSa2i-runtime.sagemakerListHumanLoopsRequest *)request completionHandler:(void (^ _Nullable)(AWSa2i-runtime.sagemakerListHumanLoopsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a human loop, provided that at least one activation condition is met.</p>
 
 @param request A container for the necessary parameters to execute the StartHumanLoop service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSa2i-runtime.sagemakerStartHumanLoopResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorServiceQuotaExceeded`, `AWSa2i-runtime.sagemakerErrorInternalServer`, `AWSa2i-runtime.sagemakerErrorConflict`.
 
 @see AWSa2i-runtime.sagemakerStartHumanLoopRequest
 @see AWSa2i-runtime.sagemakerStartHumanLoopResponse
 */
- (AWSTask<AWSa2i-runtime.sagemakerStartHumanLoopResponse *> *)startHumanLoop:(AWSa2i-runtime.sagemakerStartHumanLoopRequest *)request;

/**
 <p>Starts a human loop, provided that at least one activation condition is met.</p>
 
 @param request A container for the necessary parameters to execute the StartHumanLoop service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorServiceQuotaExceeded`, `AWSa2i-runtime.sagemakerErrorInternalServer`, `AWSa2i-runtime.sagemakerErrorConflict`.
 
 @see AWSa2i-runtime.sagemakerStartHumanLoopRequest
 @see AWSa2i-runtime.sagemakerStartHumanLoopResponse
 */
- (void)startHumanLoop:(AWSa2i-runtime.sagemakerStartHumanLoopRequest *)request completionHandler:(void (^ _Nullable)(AWSa2i-runtime.sagemakerStartHumanLoopResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops the specified human loop.</p>
 
 @param request A container for the necessary parameters to execute the StopHumanLoop service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSa2i-runtime.sagemakerStopHumanLoopResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerStopHumanLoopRequest
 @see AWSa2i-runtime.sagemakerStopHumanLoopResponse
 */
- (AWSTask<AWSa2i-runtime.sagemakerStopHumanLoopResponse *> *)stopHumanLoop:(AWSa2i-runtime.sagemakerStopHumanLoopRequest *)request;

/**
 <p>Stops the specified human loop.</p>
 
 @param request A container for the necessary parameters to execute the StopHumanLoop service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSa2i-runtime.sagemakerErrorDomain` domain and the following error code: `AWSa2i-runtime.sagemakerErrorValidation`, `AWSa2i-runtime.sagemakerErrorResourceNotFound`, `AWSa2i-runtime.sagemakerErrorThrottling`, `AWSa2i-runtime.sagemakerErrorInternalServer`.
 
 @see AWSa2i-runtime.sagemakerStopHumanLoopRequest
 @see AWSa2i-runtime.sagemakerStopHumanLoopResponse
 */
- (void)stopHumanLoop:(AWSa2i-runtime.sagemakerStopHumanLoopRequest *)request completionHandler:(void (^ _Nullable)(AWSa2i-runtime.sagemakerStopHumanLoopResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
