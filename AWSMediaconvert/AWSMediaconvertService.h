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
#import "AWSMediaconvertModel.h"
#import "AWSMediaconvertResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMediaconvert
FOUNDATION_EXPORT NSString *const AWSMediaconvertSDKVersion;

/**
 AWS Elemental MediaConvert
 */
@interface AWSMediaconvert : AWSService

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

     let Mediaconvert = AWSMediaconvert.default()

 *Objective-C*

     AWSMediaconvert *Mediaconvert = [AWSMediaconvert defaultMediaconvert];

 @return The default service client.
 */
+ (instancetype)defaultMediaconvert;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMediaconvert.register(with: configuration!, forKey: "USWest2Mediaconvert")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:@"USWest2Mediaconvert"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Mediaconvert = AWSMediaconvert(forKey: "USWest2Mediaconvert")

 *Objective-C*

     AWSMediaconvert *Mediaconvert = [AWSMediaconvert MediaconvertForKey:@"USWest2Mediaconvert"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMediaconvertWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMediaconvertWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMediaconvert.register(with: configuration!, forKey: "USWest2Mediaconvert")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMediaconvert registerMediaconvertWithConfiguration:configuration forKey:@"USWest2Mediaconvert"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Mediaconvert = AWSMediaconvert(forKey: "USWest2Mediaconvert")

 *Objective-C*

     AWSMediaconvert *Mediaconvert = [AWSMediaconvert MediaconvertForKey:@"USWest2Mediaconvert"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MediaconvertForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMediaconvertForKey:(NSString *)key;

/**
 Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental MediaConvert.
 
 @param request A container for the necessary parameters to execute the AssociateCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertAssociateCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertAssociateCertificateRequest
 @see AWSMediaconvertAssociateCertificateResponse
 */
- (AWSTask<AWSMediaconvertAssociateCertificateResponse *> *)associateCertificate:(AWSMediaconvertAssociateCertificateRequest *)request;

/**
 Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN) with AWS Elemental MediaConvert.
 
 @param request A container for the necessary parameters to execute the AssociateCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertAssociateCertificateRequest
 @see AWSMediaconvertAssociateCertificateResponse
 */
- (void)associateCertificate:(AWSMediaconvertAssociateCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertAssociateCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently cancel a job. Once you have canceled a job, you can't start it again.
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertCancelJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCancelJobRequest
 @see AWSMediaconvertCancelJobResponse
 */
- (AWSTask<AWSMediaconvertCancelJobResponse *> *)cancelJob:(AWSMediaconvertCancelJobRequest *)request;

/**
 Permanently cancel a job. Once you have canceled a job, you can't start it again.
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCancelJobRequest
 @see AWSMediaconvertCancelJobResponse
 */
- (void)cancelJob:(AWSMediaconvertCancelJobRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertCancelJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new transcoding job. For information about jobs and job settings, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertCreateJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateJobRequest
 @see AWSMediaconvertCreateJobResponse
 */
- (AWSTask<AWSMediaconvertCreateJobResponse *> *)createJob:(AWSMediaconvertCreateJobRequest *)request;

/**
 Create a new transcoding job. For information about jobs and job settings, see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateJobRequest
 @see AWSMediaconvertCreateJobResponse
 */
- (void)createJob:(AWSMediaconvertCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertCreateJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new job template. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertCreateJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateJobTemplateRequest
 @see AWSMediaconvertCreateJobTemplateResponse
 */
- (AWSTask<AWSMediaconvertCreateJobTemplateResponse *> *)createJobTemplate:(AWSMediaconvertCreateJobTemplateRequest *)request;

/**
 Create a new job template. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreateJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateJobTemplateRequest
 @see AWSMediaconvertCreateJobTemplateResponse
 */
- (void)createJobTemplate:(AWSMediaconvertCreateJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertCreateJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new preset. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreatePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertCreatePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreatePresetRequest
 @see AWSMediaconvertCreatePresetResponse
 */
- (AWSTask<AWSMediaconvertCreatePresetResponse *> *)createPreset:(AWSMediaconvertCreatePresetRequest *)request;

/**
 Create a new preset. For information about job templates see the User Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
 
 @param request A container for the necessary parameters to execute the CreatePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreatePresetRequest
 @see AWSMediaconvertCreatePresetResponse
 */
- (void)createPreset:(AWSMediaconvertCreatePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertCreatePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Create a new transcoding queue. For information about queues, see Working With Queues in the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertCreateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateQueueRequest
 @see AWSMediaconvertCreateQueueResponse
 */
- (AWSTask<AWSMediaconvertCreateQueueResponse *> *)createQueue:(AWSMediaconvertCreateQueueRequest *)request;

/**
 Create a new transcoding queue. For information about queues, see Working With Queues in the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
 
 @param request A container for the necessary parameters to execute the CreateQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertCreateQueueRequest
 @see AWSMediaconvertCreateQueueResponse
 */
- (void)createQueue:(AWSMediaconvertCreateQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertCreateQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a job template you have created.
 
 @param request A container for the necessary parameters to execute the DeleteJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertDeleteJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeleteJobTemplateRequest
 @see AWSMediaconvertDeleteJobTemplateResponse
 */
- (AWSTask<AWSMediaconvertDeleteJobTemplateResponse *> *)deleteJobTemplate:(AWSMediaconvertDeleteJobTemplateRequest *)request;

/**
 Permanently delete a job template you have created.
 
 @param request A container for the necessary parameters to execute the DeleteJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeleteJobTemplateRequest
 @see AWSMediaconvertDeleteJobTemplateResponse
 */
- (void)deleteJobTemplate:(AWSMediaconvertDeleteJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertDeleteJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a preset you have created.
 
 @param request A container for the necessary parameters to execute the DeletePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertDeletePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeletePresetRequest
 @see AWSMediaconvertDeletePresetResponse
 */
- (AWSTask<AWSMediaconvertDeletePresetResponse *> *)deletePreset:(AWSMediaconvertDeletePresetRequest *)request;

/**
 Permanently delete a preset you have created.
 
 @param request A container for the necessary parameters to execute the DeletePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeletePresetRequest
 @see AWSMediaconvertDeletePresetResponse
 */
- (void)deletePreset:(AWSMediaconvertDeletePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertDeletePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Permanently delete a queue you have created.
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertDeleteQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeleteQueueRequest
 @see AWSMediaconvertDeleteQueueResponse
 */
- (AWSTask<AWSMediaconvertDeleteQueueResponse *> *)deleteQueue:(AWSMediaconvertDeleteQueueRequest *)request;

/**
 Permanently delete a queue you have created.
 
 @param request A container for the necessary parameters to execute the DeleteQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDeleteQueueRequest
 @see AWSMediaconvertDeleteQueueResponse
 */
- (void)deleteQueue:(AWSMediaconvertDeleteQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertDeleteQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Send an request with an empty body to the regional API endpoint to get your account API endpoint.
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertDescribeEndpointsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDescribeEndpointsRequest
 @see AWSMediaconvertDescribeEndpointsResponse
 */
- (AWSTask<AWSMediaconvertDescribeEndpointsResponse *> *)describeEndpoints:(AWSMediaconvertDescribeEndpointsRequest *)request;

/**
 Send an request with an empty body to the regional API endpoint to get your account API endpoint.
 
 @param request A container for the necessary parameters to execute the DescribeEndpoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDescribeEndpointsRequest
 @see AWSMediaconvertDescribeEndpointsResponse
 */
- (void)describeEndpoints:(AWSMediaconvertDescribeEndpointsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertDescribeEndpointsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the DisassociateCertificate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertDisassociateCertificateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDisassociateCertificateRequest
 @see AWSMediaconvertDisassociateCertificateResponse
 */
- (AWSTask<AWSMediaconvertDisassociateCertificateResponse *> *)disassociateCertificate:(AWSMediaconvertDisassociateCertificateRequest *)request;

/**
 Removes an association between the Amazon Resource Name (ARN) of an AWS Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the DisassociateCertificate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertDisassociateCertificateRequest
 @see AWSMediaconvertDisassociateCertificateResponse
 */
- (void)disassociateCertificate:(AWSMediaconvertDisassociateCertificateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertDisassociateCertificateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific completed transcoding job.
 
 @param request A container for the necessary parameters to execute the GetJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertGetJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetJobRequest
 @see AWSMediaconvertGetJobResponse
 */
- (AWSTask<AWSMediaconvertGetJobResponse *> *)getJob:(AWSMediaconvertGetJobRequest *)request;

/**
 Retrieve the JSON for a specific completed transcoding job.
 
 @param request A container for the necessary parameters to execute the GetJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetJobRequest
 @see AWSMediaconvertGetJobResponse
 */
- (void)getJob:(AWSMediaconvertGetJobRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertGetJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific job template.
 
 @param request A container for the necessary parameters to execute the GetJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertGetJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetJobTemplateRequest
 @see AWSMediaconvertGetJobTemplateResponse
 */
- (AWSTask<AWSMediaconvertGetJobTemplateResponse *> *)getJobTemplate:(AWSMediaconvertGetJobTemplateRequest *)request;

/**
 Retrieve the JSON for a specific job template.
 
 @param request A container for the necessary parameters to execute the GetJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetJobTemplateRequest
 @see AWSMediaconvertGetJobTemplateResponse
 */
- (void)getJobTemplate:(AWSMediaconvertGetJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertGetJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific preset.
 
 @param request A container for the necessary parameters to execute the GetPreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertGetPresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetPresetRequest
 @see AWSMediaconvertGetPresetResponse
 */
- (AWSTask<AWSMediaconvertGetPresetResponse *> *)getPreset:(AWSMediaconvertGetPresetRequest *)request;

/**
 Retrieve the JSON for a specific preset.
 
 @param request A container for the necessary parameters to execute the GetPreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetPresetRequest
 @see AWSMediaconvertGetPresetResponse
 */
- (void)getPreset:(AWSMediaconvertGetPresetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertGetPresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the JSON for a specific queue.
 
 @param request A container for the necessary parameters to execute the GetQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertGetQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetQueueRequest
 @see AWSMediaconvertGetQueueResponse
 */
- (AWSTask<AWSMediaconvertGetQueueResponse *> *)getQueue:(AWSMediaconvertGetQueueRequest *)request;

/**
 Retrieve the JSON for a specific queue.
 
 @param request A container for the necessary parameters to execute the GetQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertGetQueueRequest
 @see AWSMediaconvertGetQueueResponse
 */
- (void)getQueue:(AWSMediaconvertGetQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertGetQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your job templates. This will return the templates themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string returned with the array
 
 @param request A container for the necessary parameters to execute the ListJobTemplates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertListJobTemplatesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListJobTemplatesRequest
 @see AWSMediaconvertListJobTemplatesResponse
 */
- (AWSTask<AWSMediaconvertListJobTemplatesResponse *> *)listJobTemplates:(AWSMediaconvertListJobTemplatesRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your job templates. This will return the templates themselves, not just a list of them. To retrieve the next twenty templates, use the nextToken string returned with the array
 
 @param request A container for the necessary parameters to execute the ListJobTemplates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListJobTemplatesRequest
 @see AWSMediaconvertListJobTemplatesResponse
 */
- (void)listJobTemplates:(AWSMediaconvertListJobTemplatesRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertListJobTemplatesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertListJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListJobsRequest
 @see AWSMediaconvertListJobsResponse
 */
- (AWSTask<AWSMediaconvertListJobsResponse *> *)listJobs:(AWSMediaconvertListJobsRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your most recently created jobs. This array includes in-process, completed, and errored jobs. This will return the jobs themselves, not just a list of the jobs. To retrieve the twenty next most recent jobs, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListJobsRequest
 @see AWSMediaconvertListJobsResponse
 */
- (void)listJobs:(AWSMediaconvertListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertListJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListPresets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertListPresetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListPresetsRequest
 @see AWSMediaconvertListPresetsResponse
 */
- (AWSTask<AWSMediaconvertListPresetsResponse *> *)listPresets:(AWSMediaconvertListPresetsRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your presets. This will return the presets themselves, not just a list of them. To retrieve the next twenty presets, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListPresets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListPresetsRequest
 @see AWSMediaconvertListPresetsResponse
 */
- (void)listPresets:(AWSMediaconvertListPresetsRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertListPresetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListQueues service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertListQueuesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListQueuesRequest
 @see AWSMediaconvertListQueuesResponse
 */
- (AWSTask<AWSMediaconvertListQueuesResponse *> *)listQueues:(AWSMediaconvertListQueuesRequest *)request;

/**
 Retrieve a JSON array of up to twenty of your queues. This will return the queues themselves, not just a list of them. To retrieve the next twenty queues, use the nextToken string returned with the array.
 
 @param request A container for the necessary parameters to execute the ListQueues service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListQueuesRequest
 @see AWSMediaconvertListQueuesResponse
 */
- (void)listQueues:(AWSMediaconvertListQueuesRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertListQueuesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Retrieve the tags for a MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListTagsForResourceRequest
 @see AWSMediaconvertListTagsForResourceResponse
 */
- (AWSTask<AWSMediaconvertListTagsForResourceResponse *> *)listTagsForResource:(AWSMediaconvertListTagsForResourceRequest *)request;

/**
 Retrieve the tags for a MediaConvert resource.
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertListTagsForResourceRequest
 @see AWSMediaconvertListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSMediaconvertListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertTagResourceRequest
 @see AWSMediaconvertTagResourceResponse
 */
- (AWSTask<AWSMediaconvertTagResourceResponse *> *)tagResource:(AWSMediaconvertTagResourceRequest *)request;

/**
 Add tags to a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertTagResourceRequest
 @see AWSMediaconvertTagResourceResponse
 */
- (void)tagResource:(AWSMediaconvertTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUntagResourceRequest
 @see AWSMediaconvertUntagResourceResponse
 */
- (AWSTask<AWSMediaconvertUntagResourceResponse *> *)untagResource:(AWSMediaconvertUntagResourceRequest *)request;

/**
 Remove tags from a MediaConvert queue, preset, or job template. For information about tagging, see the User Guide at https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUntagResourceRequest
 @see AWSMediaconvertUntagResourceResponse
 */
- (void)untagResource:(AWSMediaconvertUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing job templates.
 
 @param request A container for the necessary parameters to execute the UpdateJobTemplate service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertUpdateJobTemplateResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdateJobTemplateRequest
 @see AWSMediaconvertUpdateJobTemplateResponse
 */
- (AWSTask<AWSMediaconvertUpdateJobTemplateResponse *> *)updateJobTemplate:(AWSMediaconvertUpdateJobTemplateRequest *)request;

/**
 Modify one of your existing job templates.
 
 @param request A container for the necessary parameters to execute the UpdateJobTemplate service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdateJobTemplateRequest
 @see AWSMediaconvertUpdateJobTemplateResponse
 */
- (void)updateJobTemplate:(AWSMediaconvertUpdateJobTemplateRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertUpdateJobTemplateResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing presets.
 
 @param request A container for the necessary parameters to execute the UpdatePreset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertUpdatePresetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdatePresetRequest
 @see AWSMediaconvertUpdatePresetResponse
 */
- (AWSTask<AWSMediaconvertUpdatePresetResponse *> *)updatePreset:(AWSMediaconvertUpdatePresetRequest *)request;

/**
 Modify one of your existing presets.
 
 @param request A container for the necessary parameters to execute the UpdatePreset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdatePresetRequest
 @see AWSMediaconvertUpdatePresetResponse
 */
- (void)updatePreset:(AWSMediaconvertUpdatePresetRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertUpdatePresetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 Modify one of your existing queues.
 
 @param request A container for the necessary parameters to execute the UpdateQueue service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMediaconvertUpdateQueueResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdateQueueRequest
 @see AWSMediaconvertUpdateQueueResponse
 */
- (AWSTask<AWSMediaconvertUpdateQueueResponse *> *)updateQueue:(AWSMediaconvertUpdateQueueRequest *)request;

/**
 Modify one of your existing queues.
 
 @param request A container for the necessary parameters to execute the UpdateQueue service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMediaconvertErrorDomain` domain and the following error code: `AWSMediaconvertErrorBadRequest`, `AWSMediaconvertErrorInternalServerError`, `AWSMediaconvertErrorForbidden`, `AWSMediaconvertErrorNotFound`, `AWSMediaconvertErrorTooManyRequests`, `AWSMediaconvertErrorConflict`.
 
 @see AWSMediaconvertUpdateQueueRequest
 @see AWSMediaconvertUpdateQueueResponse
 */
- (void)updateQueue:(AWSMediaconvertUpdateQueueRequest *)request completionHandler:(void (^ _Nullable)(AWSMediaconvertUpdateQueueResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
