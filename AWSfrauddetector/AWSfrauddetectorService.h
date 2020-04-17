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
#import "AWSfrauddetectorModel.h"
#import "AWSfrauddetectorResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSfrauddetector
FOUNDATION_EXPORT NSString *const AWSfrauddetectorSDKVersion;

/**
 <p>This is the Amazon Fraud Detector API Reference. This guide is for developers who need detailed information about Amazon Fraud Detector API actions, data types, and errors. For more information about Amazon Fraud Detector features, see the <a href="https://docs.aws.amazon.com/frauddetector/latest/ug/">Amazon Fraud Detector User Guide</a>.</p>
 */
@interface AWSfrauddetector : AWSService

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

     let frauddetector = AWSfrauddetector.default()

 *Objective-C*

     AWSfrauddetector *frauddetector = [AWSfrauddetector defaultfrauddetector];

 @return The default service client.
 */
+ (instancetype)defaultfrauddetector;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSfrauddetector.register(with: configuration!, forKey: "USWest2frauddetector")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:@"USWest2frauddetector"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let frauddetector = AWSfrauddetector(forKey: "USWest2frauddetector")

 *Objective-C*

     AWSfrauddetector *frauddetector = [AWSfrauddetector frauddetectorForKey:@"USWest2frauddetector"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerfrauddetectorWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerfrauddetectorWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSfrauddetector.register(with: configuration!, forKey: "USWest2frauddetector")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSfrauddetector registerfrauddetectorWithConfiguration:configuration forKey:@"USWest2frauddetector"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let frauddetector = AWSfrauddetector(forKey: "USWest2frauddetector")

 *Objective-C*

     AWSfrauddetector *frauddetector = [AWSfrauddetector frauddetectorForKey:@"USWest2frauddetector"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)frauddetectorForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removefrauddetectorForKey:(NSString *)key;

/**
 <p>Creates a batch of variables.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreateVariable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorBatchCreateVariableResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorBatchCreateVariableRequest
 @see AWSfrauddetectorBatchCreateVariableResult
 */
- (AWSTask<AWSfrauddetectorBatchCreateVariableResult *> *)batchCreateVariable:(AWSfrauddetectorBatchCreateVariableRequest *)request;

/**
 <p>Creates a batch of variables.</p>
 
 @param request A container for the necessary parameters to execute the BatchCreateVariable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorBatchCreateVariableRequest
 @see AWSfrauddetectorBatchCreateVariableResult
 */
- (void)batchCreateVariable:(AWSfrauddetectorBatchCreateVariableRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorBatchCreateVariableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a batch of variables.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetVariable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorBatchGetVariableResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorBatchGetVariableRequest
 @see AWSfrauddetectorBatchGetVariableResult
 */
- (AWSTask<AWSfrauddetectorBatchGetVariableResult *> *)batchGetVariable:(AWSfrauddetectorBatchGetVariableRequest *)request;

/**
 <p>Gets a batch of variables.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetVariable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorBatchGetVariableRequest
 @see AWSfrauddetectorBatchGetVariableResult
 */
- (void)batchGetVariable:(AWSfrauddetectorBatchGetVariableRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorBatchGetVariableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a detector version. The detector version starts in a <code>DRAFT</code> status.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetectorVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorCreateDetectorVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateDetectorVersionRequest
 @see AWSfrauddetectorCreateDetectorVersionResult
 */
- (AWSTask<AWSfrauddetectorCreateDetectorVersionResult *> *)createDetectorVersion:(AWSfrauddetectorCreateDetectorVersionRequest *)request;

/**
 <p>Creates a detector version. The detector version starts in a <code>DRAFT</code> status.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetectorVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateDetectorVersionRequest
 @see AWSfrauddetectorCreateDetectorVersionResult
 */
- (void)createDetectorVersion:(AWSfrauddetectorCreateDetectorVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorCreateDetectorVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a version of the model using the specified model type. </p>
 
 @param request A container for the necessary parameters to execute the CreateModelVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorCreateModelVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateModelVersionRequest
 @see AWSfrauddetectorCreateModelVersionResult
 */
- (AWSTask<AWSfrauddetectorCreateModelVersionResult *> *)createModelVersion:(AWSfrauddetectorCreateModelVersionRequest *)request;

/**
 <p>Creates a version of the model using the specified model type. </p>
 
 @param request A container for the necessary parameters to execute the CreateModelVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateModelVersionRequest
 @see AWSfrauddetectorCreateModelVersionResult
 */
- (void)createModelVersion:(AWSfrauddetectorCreateModelVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorCreateModelVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a rule for use with the specified detector. </p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorCreateRuleResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateRuleRequest
 @see AWSfrauddetectorCreateRuleResult
 */
- (AWSTask<AWSfrauddetectorCreateRuleResult *> *)createRule:(AWSfrauddetectorCreateRuleRequest *)request;

/**
 <p>Creates a rule for use with the specified detector. </p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateRuleRequest
 @see AWSfrauddetectorCreateRuleResult
 */
- (void)createRule:(AWSfrauddetectorCreateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorCreateRuleResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a variable.</p>
 
 @param request A container for the necessary parameters to execute the CreateVariable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorCreateVariableResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateVariableRequest
 @see AWSfrauddetectorCreateVariableResult
 */
- (AWSTask<AWSfrauddetectorCreateVariableResult *> *)createVariable:(AWSfrauddetectorCreateVariableRequest *)request;

/**
 <p>Creates a variable.</p>
 
 @param request A container for the necessary parameters to execute the CreateVariable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorCreateVariableRequest
 @see AWSfrauddetectorCreateVariableResult
 */
- (void)createVariable:(AWSfrauddetectorCreateVariableRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorCreateVariableResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the detector. Before deleting a detector, you must first delete all detector versions and rule versions associated with the detector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDeleteDetectorResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorConflict`, `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteDetectorRequest
 @see AWSfrauddetectorDeleteDetectorResult
 */
- (AWSTask<AWSfrauddetectorDeleteDetectorResult *> *)deleteDetector:(AWSfrauddetectorDeleteDetectorRequest *)request;

/**
 <p>Deletes the detector. Before deleting a detector, you must first delete all detector versions and rule versions associated with the detector.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorConflict`, `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteDetectorRequest
 @see AWSfrauddetectorDeleteDetectorResult
 */
- (void)deleteDetector:(AWSfrauddetectorDeleteDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDeleteDetectorResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the detector version. You cannot delete detector versions that are in <code>ACTIVE</code> status.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetectorVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDeleteDetectorVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`, `AWSfrauddetectorErrorConflict`.
 
 @see AWSfrauddetectorDeleteDetectorVersionRequest
 @see AWSfrauddetectorDeleteDetectorVersionResult
 */
- (AWSTask<AWSfrauddetectorDeleteDetectorVersionResult *> *)deleteDetectorVersion:(AWSfrauddetectorDeleteDetectorVersionRequest *)request;

/**
 <p>Deletes the detector version. You cannot delete detector versions that are in <code>ACTIVE</code> status.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetectorVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`, `AWSfrauddetectorErrorConflict`.
 
 @see AWSfrauddetectorDeleteDetectorVersionRequest
 @see AWSfrauddetectorDeleteDetectorVersionResult
 */
- (void)deleteDetectorVersion:(AWSfrauddetectorDeleteDetectorVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDeleteDetectorVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified event.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEvent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDeleteEventResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteEventRequest
 @see AWSfrauddetectorDeleteEventResult
 */
- (AWSTask<AWSfrauddetectorDeleteEventResult *> *)deleteEvent:(AWSfrauddetectorDeleteEventRequest *)request;

/**
 <p>Deletes the specified event.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEvent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteEventRequest
 @see AWSfrauddetectorDeleteEventResult
 */
- (void)deleteEvent:(AWSfrauddetectorDeleteEventRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDeleteEventResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the rule version. You cannot delete a rule version if it is used by an <code>ACTIVE</code> or <code>INACTIVE</code> detector version.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRuleVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDeleteRuleVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorConflict`, `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteRuleVersionRequest
 @see AWSfrauddetectorDeleteRuleVersionResult
 */
- (AWSTask<AWSfrauddetectorDeleteRuleVersionResult *> *)deleteRuleVersion:(AWSfrauddetectorDeleteRuleVersionRequest *)request;

/**
 <p>Deletes the rule version. You cannot delete a rule version if it is used by an <code>ACTIVE</code> or <code>INACTIVE</code> detector version.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRuleVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorConflict`, `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDeleteRuleVersionRequest
 @see AWSfrauddetectorDeleteRuleVersionResult
 */
- (void)deleteRuleVersion:(AWSfrauddetectorDeleteRuleVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDeleteRuleVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all versions for a specified detector.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDescribeDetectorResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDescribeDetectorRequest
 @see AWSfrauddetectorDescribeDetectorResult
 */
- (AWSTask<AWSfrauddetectorDescribeDetectorResult *> *)describeDetector:(AWSfrauddetectorDescribeDetectorRequest *)request;

/**
 <p>Gets all versions for a specified detector.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDescribeDetectorRequest
 @see AWSfrauddetectorDescribeDetectorResult
 */
- (void)describeDetector:(AWSfrauddetectorDescribeDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDescribeDetectorResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all of the model versions for the specified model type or for the specified model type and model ID. You can also get details for a single, specified model version. </p>
 
 @param request A container for the necessary parameters to execute the DescribeModelVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorDescribeModelVersionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDescribeModelVersionsRequest
 @see AWSfrauddetectorDescribeModelVersionsResult
 */
- (AWSTask<AWSfrauddetectorDescribeModelVersionsResult *> *)describeModelVersions:(AWSfrauddetectorDescribeModelVersionsRequest *)request;

/**
 <p>Gets all of the model versions for the specified model type or for the specified model type and model ID. You can also get details for a single, specified model version. </p>
 
 @param request A container for the necessary parameters to execute the DescribeModelVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorDescribeModelVersionsRequest
 @see AWSfrauddetectorDescribeModelVersionsResult
 */
- (void)describeModelVersions:(AWSfrauddetectorDescribeModelVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorDescribeModelVersionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a particular detector version. </p>
 
 @param request A container for the necessary parameters to execute the GetDetectorVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetDetectorVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetDetectorVersionRequest
 @see AWSfrauddetectorGetDetectorVersionResult
 */
- (AWSTask<AWSfrauddetectorGetDetectorVersionResult *> *)getDetectorVersion:(AWSfrauddetectorGetDetectorVersionRequest *)request;

/**
 <p>Gets a particular detector version. </p>
 
 @param request A container for the necessary parameters to execute the GetDetectorVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetDetectorVersionRequest
 @see AWSfrauddetectorGetDetectorVersionResult
 */
- (void)getDetectorVersion:(AWSfrauddetectorGetDetectorVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetDetectorVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all of detectors. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetEventTypesResponse</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetDetectors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetDetectorsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetDetectorsRequest
 @see AWSfrauddetectorGetDetectorsResult
 */
- (AWSTask<AWSfrauddetectorGetDetectorsResult *> *)getDetectors:(AWSfrauddetectorGetDetectorsRequest *)request;

/**
 <p>Gets all of detectors. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetEventTypesResponse</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetDetectors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetDetectorsRequest
 @see AWSfrauddetectorGetDetectorsResult
 */
- (void)getDetectors:(AWSfrauddetectorGetDetectorsRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetDetectorsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the details for one or more Amazon SageMaker models that have been imported into the service. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetExternalModelsResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetExternalModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetExternalModelsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetExternalModelsRequest
 @see AWSfrauddetectorGetExternalModelsResult
 */
- (AWSTask<AWSfrauddetectorGetExternalModelsResult *> *)getExternalModels:(AWSfrauddetectorGetExternalModelsRequest *)request;

/**
 <p>Gets the details for one or more Amazon SageMaker models that have been imported into the service. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 5 and 10. To get the next page results, provide the pagination token from the <code>GetExternalModelsResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetExternalModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetExternalModelsRequest
 @see AWSfrauddetectorGetExternalModelsResult
 */
- (void)getExternalModels:(AWSfrauddetectorGetExternalModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetExternalModelsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a model version. </p>
 
 @param request A container for the necessary parameters to execute the GetModelVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetModelVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetModelVersionRequest
 @see AWSfrauddetectorGetModelVersionResult
 */
- (AWSTask<AWSfrauddetectorGetModelVersionResult *> *)getModelVersion:(AWSfrauddetectorGetModelVersionRequest *)request;

/**
 <p>Gets a model version. </p>
 
 @param request A container for the necessary parameters to execute the GetModelVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetModelVersionRequest
 @see AWSfrauddetectorGetModelVersionResult
 */
- (void)getModelVersion:(AWSfrauddetectorGetModelVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetModelVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all of the models for the AWS account, or the specified model type, or gets a single model for the specified model type, model ID combination. </p>
 
 @param request A container for the necessary parameters to execute the GetModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetModelsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetModelsRequest
 @see AWSfrauddetectorGetModelsResult
 */
- (AWSTask<AWSfrauddetectorGetModelsResult *> *)getModels:(AWSfrauddetectorGetModelsRequest *)request;

/**
 <p>Gets all of the models for the AWS account, or the specified model type, or gets a single model for the specified model type, model ID combination. </p>
 
 @param request A container for the necessary parameters to execute the GetModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetModelsRequest
 @see AWSfrauddetectorGetModelsResult
 */
- (void)getModels:(AWSfrauddetectorGetModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetModelsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets one or more outcomes. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 50 and 100. To get the next page results, provide the pagination token from the <code>GetOutcomesResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetOutcomes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetOutcomesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetOutcomesRequest
 @see AWSfrauddetectorGetOutcomesResult
 */
- (AWSTask<AWSfrauddetectorGetOutcomesResult *> *)getOutcomes:(AWSfrauddetectorGetOutcomesRequest *)request;

/**
 <p>Gets one or more outcomes. This is a paginated API. If you provide a null <code>maxSizePerPage</code>, this actions retrieves a maximum of 10 records per page. If you provide a <code>maxSizePerPage</code>, the value must be between 50 and 100. To get the next page results, provide the pagination token from the <code>GetOutcomesResult</code> as part of your request. A null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetOutcomes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetOutcomesRequest
 @see AWSfrauddetectorGetOutcomesResult
 */
- (void)getOutcomes:(AWSfrauddetectorGetOutcomesRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetOutcomesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Evaluates an event against a detector version. If a version ID is not provided, the detector’s (<code>ACTIVE</code>) version is used. </p>
 
 @param request A container for the necessary parameters to execute the GetPrediction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetPredictionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetPredictionRequest
 @see AWSfrauddetectorGetPredictionResult
 */
- (AWSTask<AWSfrauddetectorGetPredictionResult *> *)getPrediction:(AWSfrauddetectorGetPredictionRequest *)request;

/**
 <p>Evaluates an event against a detector version. If a version ID is not provided, the detector’s (<code>ACTIVE</code>) version is used. </p>
 
 @param request A container for the necessary parameters to execute the GetPrediction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetPredictionRequest
 @see AWSfrauddetectorGetPredictionResult
 */
- (void)getPrediction:(AWSfrauddetectorGetPredictionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetPredictionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all rules available for the specified detector.</p>
 
 @param request A container for the necessary parameters to execute the GetRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetRulesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetRulesRequest
 @see AWSfrauddetectorGetRulesResult
 */
- (AWSTask<AWSfrauddetectorGetRulesResult *> *)getRules:(AWSfrauddetectorGetRulesRequest *)request;

/**
 <p>Gets all rules available for the specified detector.</p>
 
 @param request A container for the necessary parameters to execute the GetRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetRulesRequest
 @see AWSfrauddetectorGetRulesResult
 */
- (void)getRules:(AWSfrauddetectorGetRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetRulesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets all of the variables or the specific variable. This is a paginated API. Providing null <code>maxSizePerPage</code> results in retrieving maximum of 100 records per page. If you provide <code>maxSizePerPage</code> the value must be between 50 and 100. To get the next page result, a provide a pagination token from <code>GetVariablesResult</code> as part of your request. Null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetVariables service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorGetVariablesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetVariablesRequest
 @see AWSfrauddetectorGetVariablesResult
 */
- (AWSTask<AWSfrauddetectorGetVariablesResult *> *)getVariables:(AWSfrauddetectorGetVariablesRequest *)request;

/**
 <p>Gets all of the variables or the specific variable. This is a paginated API. Providing null <code>maxSizePerPage</code> results in retrieving maximum of 100 records per page. If you provide <code>maxSizePerPage</code> the value must be between 50 and 100. To get the next page result, a provide a pagination token from <code>GetVariablesResult</code> as part of your request. Null pagination token fetches the records from the beginning. </p>
 
 @param request A container for the necessary parameters to execute the GetVariables service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorGetVariablesRequest
 @see AWSfrauddetectorGetVariablesResult
 */
- (void)getVariables:(AWSfrauddetectorGetVariablesRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorGetVariablesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a detector. </p>
 
 @param request A container for the necessary parameters to execute the PutDetector service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorPutDetectorResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutDetectorRequest
 @see AWSfrauddetectorPutDetectorResult
 */
- (AWSTask<AWSfrauddetectorPutDetectorResult *> *)putDetector:(AWSfrauddetectorPutDetectorRequest *)request;

/**
 <p>Creates or updates a detector. </p>
 
 @param request A container for the necessary parameters to execute the PutDetector service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutDetectorRequest
 @see AWSfrauddetectorPutDetectorResult
 */
- (void)putDetector:(AWSfrauddetectorPutDetectorRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorPutDetectorResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the configuration of the model endpoint, including the IAM role and/or the mapped variables. </p>
 
 @param request A container for the necessary parameters to execute the PutExternalModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorPutExternalModelResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutExternalModelRequest
 @see AWSfrauddetectorPutExternalModelResult
 */
- (AWSTask<AWSfrauddetectorPutExternalModelResult *> *)putExternalModel:(AWSfrauddetectorPutExternalModelRequest *)request;

/**
 <p>Creates or updates an Amazon SageMaker model endpoint. You can also use this action to update the configuration of the model endpoint, including the IAM role and/or the mapped variables. </p>
 
 @param request A container for the necessary parameters to execute the PutExternalModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutExternalModelRequest
 @see AWSfrauddetectorPutExternalModelResult
 */
- (void)putExternalModel:(AWSfrauddetectorPutExternalModelRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorPutExternalModelResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates a model. </p>
 
 @param request A container for the necessary parameters to execute the PutModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorPutModelResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutModelRequest
 @see AWSfrauddetectorPutModelResult
 */
- (AWSTask<AWSfrauddetectorPutModelResult *> *)putModel:(AWSfrauddetectorPutModelRequest *)request;

/**
 <p>Creates or updates a model. </p>
 
 @param request A container for the necessary parameters to execute the PutModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutModelRequest
 @see AWSfrauddetectorPutModelResult
 */
- (void)putModel:(AWSfrauddetectorPutModelRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorPutModelResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or updates an outcome. </p>
 
 @param request A container for the necessary parameters to execute the PutOutcome service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorPutOutcomeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutOutcomeRequest
 @see AWSfrauddetectorPutOutcomeResult
 */
- (AWSTask<AWSfrauddetectorPutOutcomeResult *> *)putOutcome:(AWSfrauddetectorPutOutcomeRequest *)request;

/**
 <p>Creates or updates an outcome. </p>
 
 @param request A container for the necessary parameters to execute the PutOutcome service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorPutOutcomeRequest
 @see AWSfrauddetectorPutOutcomeResult
 */
- (void)putOutcome:(AWSfrauddetectorPutOutcomeRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorPutOutcomeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates a detector version. The detector version attributes that you can update include models, external model endpoints, rules, and description. You can only update a <code>DRAFT</code> detector version.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateDetectorVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionRequest
 @see AWSfrauddetectorUpdateDetectorVersionResult
 */
- (AWSTask<AWSfrauddetectorUpdateDetectorVersionResult *> *)updateDetectorVersion:(AWSfrauddetectorUpdateDetectorVersionRequest *)request;

/**
 <p> Updates a detector version. The detector version attributes that you can update include models, external model endpoints, rules, and description. You can only update a <code>DRAFT</code> detector version.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionRequest
 @see AWSfrauddetectorUpdateDetectorVersionResult
 */
- (void)updateDetectorVersion:(AWSfrauddetectorUpdateDetectorVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateDetectorVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the detector version's description. You can update the metadata for any detector version (<code>DRAFT, ACTIVE,</code> or <code>INACTIVE</code>). </p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersionMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateDetectorVersionMetadataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionMetadataRequest
 @see AWSfrauddetectorUpdateDetectorVersionMetadataResult
 */
- (AWSTask<AWSfrauddetectorUpdateDetectorVersionMetadataResult *> *)updateDetectorVersionMetadata:(AWSfrauddetectorUpdateDetectorVersionMetadataRequest *)request;

/**
 <p>Updates the detector version's description. You can update the metadata for any detector version (<code>DRAFT, ACTIVE,</code> or <code>INACTIVE</code>). </p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersionMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionMetadataRequest
 @see AWSfrauddetectorUpdateDetectorVersionMetadataResult
 */
- (void)updateDetectorVersionMetadata:(AWSfrauddetectorUpdateDetectorVersionMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateDetectorVersionMetadataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the detector version’s status. You can perform the following promotions or demotions using <code>UpdateDetectorVersionStatus</code>: <code>DRAFT</code> to <code>ACTIVE</code>, <code>ACTIVE</code> to <code>INACTIVE</code>, and <code>INACTIVE</code> to <code>ACTIVE</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersionStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateDetectorVersionStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionStatusRequest
 @see AWSfrauddetectorUpdateDetectorVersionStatusResult
 */
- (AWSTask<AWSfrauddetectorUpdateDetectorVersionStatusResult *> *)updateDetectorVersionStatus:(AWSfrauddetectorUpdateDetectorVersionStatusRequest *)request;

/**
 <p>Updates the detector version’s status. You can perform the following promotions or demotions using <code>UpdateDetectorVersionStatus</code>: <code>DRAFT</code> to <code>ACTIVE</code>, <code>ACTIVE</code> to <code>INACTIVE</code>, and <code>INACTIVE</code> to <code>ACTIVE</code>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorVersionStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateDetectorVersionStatusRequest
 @see AWSfrauddetectorUpdateDetectorVersionStatusResult
 */
- (void)updateDetectorVersionStatus:(AWSfrauddetectorUpdateDetectorVersionStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateDetectorVersionStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a model version. You can update the description and status attributes using this action. You can perform the following status updates: </p><ol><li><p>Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code></p></li><li><p>Change <code>ACTIVE</code> back to <code>TRAINING_COMPLETE</code></p></li></ol>
 
 @param request A container for the necessary parameters to execute the UpdateModelVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateModelVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateModelVersionRequest
 @see AWSfrauddetectorUpdateModelVersionResult
 */
- (AWSTask<AWSfrauddetectorUpdateModelVersionResult *> *)updateModelVersion:(AWSfrauddetectorUpdateModelVersionRequest *)request;

/**
 <p>Updates a model version. You can update the description and status attributes using this action. You can perform the following status updates: </p><ol><li><p>Change the <code>TRAINING_COMPLETE</code> status to <code>ACTIVE</code></p></li><li><p>Change <code>ACTIVE</code> back to <code>TRAINING_COMPLETE</code></p></li></ol>
 
 @param request A container for the necessary parameters to execute the UpdateModelVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateModelVersionRequest
 @see AWSfrauddetectorUpdateModelVersionResult
 */
- (void)updateModelVersion:(AWSfrauddetectorUpdateModelVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateModelVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a rule's metadata. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateRuleMetadataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateRuleMetadataRequest
 @see AWSfrauddetectorUpdateRuleMetadataResult
 */
- (AWSTask<AWSfrauddetectorUpdateRuleMetadataResult *> *)updateRuleMetadata:(AWSfrauddetectorUpdateRuleMetadataRequest *)request;

/**
 <p>Updates a rule's metadata. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateRuleMetadataRequest
 @see AWSfrauddetectorUpdateRuleMetadataResult
 */
- (void)updateRuleMetadata:(AWSfrauddetectorUpdateRuleMetadataRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateRuleMetadataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a rule version resulting in a new rule version. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateRuleVersionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateRuleVersionRequest
 @see AWSfrauddetectorUpdateRuleVersionResult
 */
- (AWSTask<AWSfrauddetectorUpdateRuleVersionResult *> *)updateRuleVersion:(AWSfrauddetectorUpdateRuleVersionRequest *)request;

/**
 <p>Updates a rule version resulting in a new rule version. </p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateRuleVersionRequest
 @see AWSfrauddetectorUpdateRuleVersionResult
 */
- (void)updateRuleVersion:(AWSfrauddetectorUpdateRuleVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateRuleVersionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a variable.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVariable service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSfrauddetectorUpdateVariableResult`. On failed execution, `task.error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateVariableRequest
 @see AWSfrauddetectorUpdateVariableResult
 */
- (AWSTask<AWSfrauddetectorUpdateVariableResult *> *)updateVariable:(AWSfrauddetectorUpdateVariableRequest *)request;

/**
 <p>Updates a variable.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVariable service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSfrauddetectorErrorDomain` domain and the following error code: `AWSfrauddetectorErrorValidation`, `AWSfrauddetectorErrorResourceNotFound`, `AWSfrauddetectorErrorInternalServer`, `AWSfrauddetectorErrorThrottling`.
 
 @see AWSfrauddetectorUpdateVariableRequest
 @see AWSfrauddetectorUpdateVariableResult
 */
- (void)updateVariable:(AWSfrauddetectorUpdateVariableRequest *)request completionHandler:(void (^ _Nullable)(AWSfrauddetectorUpdateVariableResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
