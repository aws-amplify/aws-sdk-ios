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
#import "AWSmediaconvertModel.h"
#import "AWSmediaconvertResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSmediaconvert
FOUNDATION_EXPORT NSString *const AWSmediaconvertSDKVersion;

/**
 AWS Elemental MediaConvert
 */
@interface AWSmediaconvert : AWSService

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

     let mediaconvert = AWSmediaconvert.default()

 *Objective-C*

     AWSmediaconvert *mediaconvert = [AWSmediaconvert defaultmediaconvert];

 @return The default service client.
 */
+ (instancetype)defaultmediaconvert;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmediaconvert.register(with: configuration!, forKey: "USWest2mediaconvert")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmediaconvert registermediaconvertWithConfiguration:configuration forKey:@"USWest2mediaconvert"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mediaconvert = AWSmediaconvert(forKey: "USWest2mediaconvert")

 *Objective-C*

     AWSmediaconvert *mediaconvert = [AWSmediaconvert mediaconvertForKey:@"USWest2mediaconvert"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registermediaconvertWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registermediaconvertWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSmediaconvert.register(with: configuration!, forKey: "USWest2mediaconvert")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSmediaconvert registermediaconvertWithConfiguration:configuration forKey:@"USWest2mediaconvert"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let mediaconvert = AWSmediaconvert(forKey: "USWest2mediaconvert")

 *Objective-C*

     AWSmediaconvert *mediaconvert = [AWSmediaconvert mediaconvertForKey:@"USWest2mediaconvert"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)mediaconvertForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removemediaconvertForKey:(NSString *)key;

/**
 Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental MediaConvert.
 
 @param request A container for the necessary parameters to execute the AssociateCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertAssociateCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertAssociateCertificateRequest
 @see AWSmediaconvertAssociateCertificateResponse
 */
- (AWSTask<AWSmediaconvertAssociateCertificateResponse *> *)associateCertificate:(AWSmediaconvertAssociateCertificateRequest *)request;

/**
 Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental MediaConvert.
 
 @param request A container for the necessary parameters to execute the AssociateCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertAssociateCertificateRequest
 @see AWSmediaconvertAssociateCertificateResponse
 */
- (void)associateCertificate:(AWSmediaconvertAssociateCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertAssociateCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently cancel a job. Once you have canceled a job, you can't start it again.
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertCancelJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCancelJobRequest
 @see AWSmediaconvertCancelJobResponse
 */
- (AWSTask<AWSmediaconvertCancelJobResponse *> *)cancelJob:(AWSmediaconvertCancelJobRequest *)request;

/**
 Permanently cancel a job. Once you have canceled a job, you can't start it again.
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCancelJobRequest
 @see AWSmediaconvertCancelJobResponse
 */
- (void)cancelJob:(AWSmediaconvertCancelJobRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertCancelJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new transcoding job. For information about jobs and job settings, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateJobRequest
 @see AWSmediaconvertCreateJobResponse
 */
- (AWSTask<AWSmediaconvertCreateJobResponse *> *)createJob:(AWSmediaconvertCreateJobRequest *)request;

/**
 Create a new transcoding job. For information about jobs and job settings, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateJobRequest
 @see AWSmediaconvertCreateJobResponse
 */
- (void)createJob:(AWSmediaconvertCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new job template. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertCreateJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateJobTemplateRequest
 @see AWSmediaconvertCreateJobTemplateResponse
 */
- (AWSTask<AWSmediaconvertCreateJobTemplateResponse *> *)createJobTemplate:(AWSmediaconvertCreateJobTemplateRequest *)request;

/**
 Create a new job template. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateJobTemplateRequest
 @see AWSmediaconvertCreateJobTemplateResponse
 */
- (void)createJobTemplate:(AWSmediaconvertCreateJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertCreateJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new preset. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreatePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertCreatePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreatePresetRequest
 @see AWSmediaconvertCreatePresetResponse
 */
- (AWSTask<AWSmediaconvertCreatePresetResponse *> *)createPreset:(AWSmediaconvertCreatePresetRequest *)request;

/**
 Create a new preset. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreatePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreatePresetRequest
 @see AWSmediaconvertCreatePresetResponse
 */
- (void)createPreset:(AWSmediaconvertCreatePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertCreatePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new transcoding queue. For information about queues, see Working With Queues in the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertCreateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateQueueRequest
 @see AWSmediaconvertCreateQueueResponse
 */
- (AWSTask<AWSmediaconvertCreateQueueResponse *> *)createQueue:(AWSmediaconvertCreateQueueRequest *)request;

/**
 Create a new transcoding queue. For information about queues, see Working With Queues in the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertCreateQueueRequest
 @see AWSmediaconvertCreateQueueResponse
 */
- (void)createQueue:(AWSmediaconvertCreateQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertCreateQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a job template you have created.
 
 @param request A container for the necessary parameters to execute the DeleteJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertDeleteJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeleteJobTemplateRequest
 @see AWSmediaconvertDeleteJobTemplateResponse
 */
- (AWSTask<AWSmediaconvertDeleteJobTemplateResponse *> *)deleteJobTemplate:(AWSmediaconvertDeleteJobTemplateRequest *)request;

/**
 Permanently delete a job template you have created.
 
 @param request A container for the necessary parameters to execute the DeleteJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeleteJobTemplateRequest
 @see AWSmediaconvertDeleteJobTemplateResponse
 */
- (void)deleteJobTemplate:(AWSmediaconvertDeleteJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertDeleteJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a preset you have created.
 
 @param request A container for the necessary parameters to execute the DeletePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertDeletePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeletePresetRequest
 @see AWSmediaconvertDeletePresetResponse
 */
- (AWSTask<AWSmediaconvertDeletePresetResponse *> *)deletePreset:(AWSmediaconvertDeletePresetRequest *)request;

/**
 Permanently delete a preset you have created.
 
 @param request A container for the necessary parameters to execute the DeletePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeletePresetRequest
 @see AWSmediaconvertDeletePresetResponse
 */
- (void)deletePreset:(AWSmediaconvertDeletePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertDeletePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a queue you have created.
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertDeleteQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeleteQueueRequest
 @see AWSmediaconvertDeleteQueueResponse
 */
- (AWSTask<AWSmediaconvertDeleteQueueResponse *> *)deleteQueue:(AWSmediaconvertDeleteQueueRequest *)request;

/**
 Permanently delete a queue you have created.
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDeleteQueueRequest
 @see AWSmediaconvertDeleteQueueResponse
 */
- (void)deleteQueue:(AWSmediaconvertDeleteQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertDeleteQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Send an request with an empty body to the regional API endpoint to get your account API endpoint.
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertDescribeEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDescribeEndpointsRequest
 @see AWSmediaconvertDescribeEndpointsResponse
 */
- (AWSTask<AWSmediaconvertDescribeEndpointsResponse *> *)describeEndpoints:(AWSmediaconvertDescribeEndpointsRequest *)request;

/**
 Send an request with an empty body to the regional API endpoint to get your account API endpoint.
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDescribeEndpointsRequest
 @see AWSmediaconvertDescribeEndpointsResponse
 */
- (void)describeEndpoints:(AWSmediaconvertDescribeEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertDescribeEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the DisassociateCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertDisassociateCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDisassociateCertificateRequest
 @see AWSmediaconvertDisassociateCertificateResponse
 */
- (AWSTask<AWSmediaconvertDisassociateCertificateResponse *> *)disassociateCertificate:(AWSmediaconvertDisassociateCertificateRequest *)request;

/**
 Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the DisassociateCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertDisassociateCertificateRequest
 @see AWSmediaconvertDisassociateCertificateResponse
 */
- (void)disassociateCertificate:(AWSmediaconvertDisassociateCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertDisassociateCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific completed transcoding job.
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetJobRequest
 @see AWSmediaconvertGetJobResponse
 */
- (AWSTask<AWSmediaconvertGetJobResponse *> *)getJob:(AWSmediaconvertGetJobRequest *)request;

/**
 Retrieve the JSON for a specific completed transcoding job.
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetJobRequest
 @see AWSmediaconvertGetJobResponse
 */
- (void)getJob:(AWSmediaconvertGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific job template.
 
 @param request A container for the necessary parameters to execute the GetJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertGetJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetJobTemplateRequest
 @see AWSmediaconvertGetJobTemplateResponse
 */
- (AWSTask<AWSmediaconvertGetJobTemplateResponse *> *)getJobTemplate:(AWSmediaconvertGetJobTemplateRequest *)request;

/**
 Retrieve the JSON for a specific job template.
 
 @param request A container for the necessary parameters to execute the GetJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetJobTemplateRequest
 @see AWSmediaconvertGetJobTemplateResponse
 */
- (void)getJobTemplate:(AWSmediaconvertGetJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertGetJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific preset.
 
 @param request A container for the necessary parameters to execute the GetPreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertGetPresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetPresetRequest
 @see AWSmediaconvertGetPresetResponse
 */
- (AWSTask<AWSmediaconvertGetPresetResponse *> *)getPreset:(AWSmediaconvertGetPresetRequest *)request;

/**
 Retrieve the JSON for a specific preset.
 
 @param request A container for the necessary parameters to execute the GetPreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetPresetRequest
 @see AWSmediaconvertGetPresetResponse
 */
- (void)getPreset:(AWSmediaconvertGetPresetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertGetPresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific queue.
 
 @param request A container for the necessary parameters to execute the GetQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertGetQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetQueueRequest
 @see AWSmediaconvertGetQueueResponse
 */
- (AWSTask<AWSmediaconvertGetQueueResponse *> *)getQueue:(AWSmediaconvertGetQueueRequest *)request;

/**
 Retrieve the JSON for a specific queue.
 
 @param request A container for the necessary parameters to execute the GetQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertGetQueueRequest
 @see AWSmediaconvertGetQueueResponse
 */
- (void)getQueue:(AWSmediaconvertGetQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertGetQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your job templates. This will return the templates themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string returned with the array
 
 @param request A container for the necessary parameters to execute the ListJobTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertListJobTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListJobTemplatesRequest
 @see AWSmediaconvertListJobTemplatesResponse
 */
- (AWSTask<AWSmediaconvertListJobTemplatesResponse *> *)listJobTemplates:(AWSmediaconvertListJobTemplatesRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your job templates. This will return the templates themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string returned with the array
 
 @param request A container for the necessary parameters to execute the ListJobTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListJobTemplatesRequest
 @see AWSmediaconvertListJobTemplatesResponse
 */
- (void)listJobTemplates:(AWSmediaconvertListJobTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertListJobTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListJobsRequest
 @see AWSmediaconvertListJobsResponse
 */
- (AWSTask<AWSmediaconvertListJobsResponse *> *)listJobs:(AWSmediaconvertListJobsRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListJobsRequest
 @see AWSmediaconvertListJobsResponse
 */
- (void)listJobs:(AWSmediaconvertListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListPresets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertListPresetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListPresetsRequest
 @see AWSmediaconvertListPresetsResponse
 */
- (AWSTask<AWSmediaconvertListPresetsResponse *> *)listPresets:(AWSmediaconvertListPresetsRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListPresets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListPresetsRequest
 @see AWSmediaconvertListPresetsResponse
 */
- (void)listPresets:(AWSmediaconvertListPresetsRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertListPresetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertListQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListQueuesRequest
 @see AWSmediaconvertListQueuesResponse
 */
- (AWSTask<AWSmediaconvertListQueuesResponse *> *)listQueues:(AWSmediaconvertListQueuesRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListQueuesRequest
 @see AWSmediaconvertListQueuesResponse
 */
- (void)listQueues:(AWSmediaconvertListQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertListQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the tags for a MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListTagsForResourceRequest
 @see AWSmediaconvertListTagsForResourceResponse
 */
- (AWSTask<AWSmediaconvertListTagsForResourceResponse *> *)listTagsForResource:(AWSmediaconvertListTagsForResourceRequest *)request;

/**
 Retrieve the tags for a MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertListTagsForResourceRequest
 @see AWSmediaconvertListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSmediaconvertListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertTagResourceRequest
 @see AWSmediaconvertTagResourceResponse
 */
- (AWSTask<AWSmediaconvertTagResourceResponse *> *)tagResource:(AWSmediaconvertTagResourceRequest *)request;

/**
 Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertTagResourceRequest
 @see AWSmediaconvertTagResourceResponse
 */
- (void)tagResource:(AWSmediaconvertTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUntagResourceRequest
 @see AWSmediaconvertUntagResourceResponse
 */
- (AWSTask<AWSmediaconvertUntagResourceResponse *> *)untagResource:(AWSmediaconvertUntagResourceRequest *)request;

/**
 Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUntagResourceRequest
 @see AWSmediaconvertUntagResourceResponse
 */
- (void)untagResource:(AWSmediaconvertUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing job templates.
 
 @param request A container for the necessary parameters to execute the UpdateJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertUpdateJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdateJobTemplateRequest
 @see AWSmediaconvertUpdateJobTemplateResponse
 */
- (AWSTask<AWSmediaconvertUpdateJobTemplateResponse *> *)updateJobTemplate:(AWSmediaconvertUpdateJobTemplateRequest *)request;

/**
 Modify one of your existing job templates.
 
 @param request A container for the necessary parameters to execute the UpdateJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdateJobTemplateRequest
 @see AWSmediaconvertUpdateJobTemplateResponse
 */
- (void)updateJobTemplate:(AWSmediaconvertUpdateJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertUpdateJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing presets.
 
 @param request A container for the necessary parameters to execute the UpdatePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertUpdatePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdatePresetRequest
 @see AWSmediaconvertUpdatePresetResponse
 */
- (AWSTask<AWSmediaconvertUpdatePresetResponse *> *)updatePreset:(AWSmediaconvertUpdatePresetRequest *)request;

/**
 Modify one of your existing presets.
 
 @param request A container for the necessary parameters to execute the UpdatePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdatePresetRequest
 @see AWSmediaconvertUpdatePresetResponse
 */
- (void)updatePreset:(AWSmediaconvertUpdatePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertUpdatePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing queues.
 
 @param request A container for the necessary parameters to execute the UpdateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSmediaconvertUpdateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdateQueueRequest
 @see AWSmediaconvertUpdateQueueResponse
 */
- (AWSTask<AWSmediaconvertUpdateQueueResponse *> *)updateQueue:(AWSmediaconvertUpdateQueueRequest *)request;

/**
 Modify one of your existing queues.
 
 @param request A container for the necessary parameters to execute the UpdateQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSmediaconvertErrorDomain` domain and the following error code: `AWSmediaconvertErrorBadRequest`, `AWSmediaconvertErrorInternalServerError`, `AWSmediaconvertErrorForbidden`, `AWSmediaconvertErrorNotFound`, `AWSmediaconvertErrorTooManyRequests`, `AWSmediaconvertErrorConflict`.
 
 @see AWSmediaconvertUpdateQueueRequest
 @see AWSmediaconvertUpdateQueueResponse
 */
- (void)updateQueue:(AWSmediaconvertUpdateQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSmediaconvertUpdateQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
