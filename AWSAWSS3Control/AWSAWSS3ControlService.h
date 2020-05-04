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
#import "AWSAWSS3ControlModel.h"
#import "AWSAWSS3ControlResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAWSS3Control
FOUNDATION_EXPORT NSString *const AWSAWSS3ControlSDKVersion;

/**
 <p> AWS S3 Control provides access to Amazon S3 control plane operations. </p>
 */
@interface AWSAWSS3Control : AWSService

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

     let AWSS3Control = AWSAWSS3Control.default()

 *Objective-C*

     AWSAWSS3Control *AWSS3Control = [AWSAWSS3Control defaultAWSS3Control];

 @return The default service client.
 */
+ (instancetype)defaultAWSS3Control;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSS3Control.register(with: configuration!, forKey: "USWest2AWSS3Control")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:@"USWest2AWSS3Control"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSS3Control = AWSAWSS3Control(forKey: "USWest2AWSS3Control")

 *Objective-C*

     AWSAWSS3Control *AWSS3Control = [AWSAWSS3Control AWSS3ControlForKey:@"USWest2AWSS3Control"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAWSS3ControlWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAWSS3ControlWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSS3Control.register(with: configuration!, forKey: "USWest2AWSS3Control")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:@"USWest2AWSS3Control"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSS3Control = AWSAWSS3Control(forKey: "USWest2AWSS3Control")

 *Objective-C*

     AWSAWSS3Control *AWSS3Control = [AWSAWSS3Control AWSS3ControlForKey:@"USWest2AWSS3Control"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AWSS3ControlForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAWSS3ControlForKey:(NSString *)key;

/**
 <p>Creates an access point and associates it with the specified bucket.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlCreateAccessPointRequest
 */
- (AWSTask *)createAccessPoint:(AWSAWSS3ControlCreateAccessPointRequest *)request;

/**
 <p>Creates an access point and associates it with the specified bucket.</p>
 
 @param request A container for the necessary parameters to execute the CreateAccessPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlCreateAccessPointRequest
 */
- (void)createAccessPoint:(AWSAWSS3ControlCreateAccessPointRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>You can use Amazon S3 Batch Operations to perform large-scale Batch Operations on Amazon S3 objects. Amazon S3 Batch Operations can execute a single operation or action on lists of Amazon S3 objects that you specify. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p>Related actions include:</p><ul><li><p><a>DescribeJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlCreateJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorIdempotency`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlCreateJobRequest
 @see AWSAWSS3ControlCreateJobResult
 */
- (AWSTask<AWSAWSS3ControlCreateJobResult *> *)createJob:(AWSAWSS3ControlCreateJobRequest *)request;

/**
 <p>You can use Amazon S3 Batch Operations to perform large-scale Batch Operations on Amazon S3 objects. Amazon S3 Batch Operations can execute a single operation or action on lists of Amazon S3 objects that you specify. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p>Related actions include:</p><ul><li><p><a>DescribeJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorIdempotency`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlCreateJobRequest
 @see AWSAWSS3ControlCreateJobResult
 */
- (void)createJob:(AWSAWSS3ControlCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlCreateJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlDeleteAccessPointRequest
 */
- (AWSTask *)deleteAccessPoint:(AWSAWSS3ControlDeleteAccessPointRequest *)request;

/**
 <p>Deletes the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlDeleteAccessPointRequest
 */
- (void)deleteAccessPoint:(AWSAWSS3ControlDeleteAccessPointRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the access point policy for the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPointPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlDeleteAccessPointPolicyRequest
 */
- (AWSTask *)deleteAccessPointPolicy:(AWSAWSS3ControlDeleteAccessPointPolicyRequest *)request;

/**
 <p>Deletes the access point policy for the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAccessPointPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlDeleteAccessPointPolicyRequest
 */
- (void)deleteAccessPointPolicy:(AWSAWSS3ControlDeleteAccessPointPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes the entire tag set from the specified Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the <code>s3:DeleteJobTagging</code> action. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>GetJobTagging</a></p></li><li><p><a>PutJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteJobTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlDeleteJobTaggingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`.
 
 @see AWSAWSS3ControlDeleteJobTaggingRequest
 @see AWSAWSS3ControlDeleteJobTaggingResult
 */
- (AWSTask<AWSAWSS3ControlDeleteJobTaggingResult *> *)deleteJobTagging:(AWSAWSS3ControlDeleteJobTaggingRequest *)request;

/**
 <p>Removes the entire tag set from the specified Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the <code>s3:DeleteJobTagging</code> action. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>GetJobTagging</a></p></li><li><p><a>PutJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteJobTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`.
 
 @see AWSAWSS3ControlDeleteJobTaggingRequest
 @see AWSAWSS3ControlDeleteJobTaggingResult
 */
- (void)deleteJobTagging:(AWSAWSS3ControlDeleteJobTaggingRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlDeleteJobTaggingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublicAccessBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlDeletePublicAccessBlockRequest
 */
- (AWSTask *)deletePublicAccessBlock:(AWSAWSS3ControlDeletePublicAccessBlockRequest *)request;

/**
 <p>Removes the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublicAccessBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlDeletePublicAccessBlockRequest
 */
- (void)deletePublicAccessBlock:(AWSAWSS3ControlDeletePublicAccessBlockRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the configuration parameters and status for a Batch Operations job. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlDescribeJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlDescribeJobRequest
 @see AWSAWSS3ControlDescribeJobResult
 */
- (AWSTask<AWSAWSS3ControlDescribeJobResult *> *)describeJob:(AWSAWSS3ControlDescribeJobRequest *)request;

/**
 <p>Retrieves the configuration parameters and status for a Batch Operations job. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlDescribeJobRequest
 @see AWSAWSS3ControlDescribeJobResult
 */
- (void)describeJob:(AWSAWSS3ControlDescribeJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlDescribeJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns configuration information about the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlGetAccessPointResult`.
 
 @see AWSAWSS3ControlGetAccessPointRequest
 @see AWSAWSS3ControlGetAccessPointResult
 */
- (AWSTask<AWSAWSS3ControlGetAccessPointResult *> *)getAccessPoint:(AWSAWSS3ControlGetAccessPointRequest *)request;

/**
 <p>Returns configuration information about the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlGetAccessPointRequest
 @see AWSAWSS3ControlGetAccessPointResult
 */
- (void)getAccessPoint:(AWSAWSS3ControlGetAccessPointRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlGetAccessPointResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the access point policy associated with the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPointPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlGetAccessPointPolicyResult`.
 
 @see AWSAWSS3ControlGetAccessPointPolicyRequest
 @see AWSAWSS3ControlGetAccessPointPolicyResult
 */
- (AWSTask<AWSAWSS3ControlGetAccessPointPolicyResult *> *)getAccessPointPolicy:(AWSAWSS3ControlGetAccessPointPolicyRequest *)request;

/**
 <p>Returns the access point policy associated with the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPointPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlGetAccessPointPolicyRequest
 @see AWSAWSS3ControlGetAccessPointPolicyResult
 */
- (void)getAccessPointPolicy:(AWSAWSS3ControlGetAccessPointPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlGetAccessPointPolicyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Indicates whether the specified access point currently has a policy that allows public access. For more information about public access through access points, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPointPolicyStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlGetAccessPointPolicyStatusResult`.
 
 @see AWSAWSS3ControlGetAccessPointPolicyStatusRequest
 @see AWSAWSS3ControlGetAccessPointPolicyStatusResult
 */
- (AWSTask<AWSAWSS3ControlGetAccessPointPolicyStatusResult *> *)getAccessPointPolicyStatus:(AWSAWSS3ControlGetAccessPointPolicyStatusRequest *)request;

/**
 <p>Indicates whether the specified access point currently has a policy that allows public access. For more information about public access through access points, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the GetAccessPointPolicyStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlGetAccessPointPolicyStatusRequest
 @see AWSAWSS3ControlGetAccessPointPolicyStatusResult
 */
- (void)getAccessPointPolicyStatus:(AWSAWSS3ControlGetAccessPointPolicyStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlGetAccessPointPolicyStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the tags on an Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the <code>s3:GetJobTagging</code> action. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>PutJobTagging</a></p></li><li><p><a>DeleteJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetJobTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlGetJobTaggingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`.
 
 @see AWSAWSS3ControlGetJobTaggingRequest
 @see AWSAWSS3ControlGetJobTaggingResult
 */
- (AWSTask<AWSAWSS3ControlGetJobTaggingResult *> *)getJobTagging:(AWSAWSS3ControlGetJobTaggingRequest *)request;

/**
 <p>Returns the tags on an Amazon S3 Batch Operations job. To use this operation, you must have permission to perform the <code>s3:GetJobTagging</code> action. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>PutJobTagging</a></p></li><li><p><a>DeleteJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetJobTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`.
 
 @see AWSAWSS3ControlGetJobTaggingRequest
 @see AWSAWSS3ControlGetJobTaggingResult
 */
- (void)getJobTagging:(AWSAWSS3ControlGetJobTaggingRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlGetJobTaggingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the GetPublicAccessBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlGetPublicAccessBlockOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorNoSuchPublicAccessBlockConfiguration`.
 
 @see AWSAWSS3ControlGetPublicAccessBlockRequest
 @see AWSAWSS3ControlGetPublicAccessBlockOutput
 */
- (AWSTask<AWSAWSS3ControlGetPublicAccessBlockOutput *> *)getPublicAccessBlock:(AWSAWSS3ControlGetPublicAccessBlockRequest *)request;

/**
 <p>Retrieves the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the GetPublicAccessBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorNoSuchPublicAccessBlockConfiguration`.
 
 @see AWSAWSS3ControlGetPublicAccessBlockRequest
 @see AWSAWSS3ControlGetPublicAccessBlockOutput
 */
- (void)getPublicAccessBlock:(AWSAWSS3ControlGetPublicAccessBlockRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlGetPublicAccessBlockOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the access points currently associated with the specified bucket. You can retrieve up to 1000 access points per call. If the specified bucket has more than 1,000 access points (or the number specified in <code>maxResults</code>, whichever is less), the response will include a continuation token that you can use to list the additional access points.</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlListAccessPointsResult`.
 
 @see AWSAWSS3ControlListAccessPointsRequest
 @see AWSAWSS3ControlListAccessPointsResult
 */
- (AWSTask<AWSAWSS3ControlListAccessPointsResult *> *)listAccessPoints:(AWSAWSS3ControlListAccessPointsRequest *)request;

/**
 <p>Returns a list of the access points currently associated with the specified bucket. You can retrieve up to 1000 access points per call. If the specified bucket has more than 1,000 access points (or the number specified in <code>maxResults</code>, whichever is less), the response will include a continuation token that you can use to list the additional access points.</p>
 
 @param request A container for the necessary parameters to execute the ListAccessPoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlListAccessPointsRequest
 @see AWSAWSS3ControlListAccessPointsResult
 */
- (void)listAccessPoints:(AWSAWSS3ControlListAccessPointsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlListAccessPointsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists current Amazon S3 Batch Operations jobs and jobs that have ended within the last 30 days for the AWS account making the request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>Related actions include:</p><p/><ul><li><p><a>CreateJob</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlListJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInvalidRequest`, `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorInvalidNextToken`.
 
 @see AWSAWSS3ControlListJobsRequest
 @see AWSAWSS3ControlListJobsResult
 */
- (AWSTask<AWSAWSS3ControlListJobsResult *> *)listJobs:(AWSAWSS3ControlListJobsRequest *)request;

/**
 <p>Lists current Amazon S3 Batch Operations jobs and jobs that have ended within the last 30 days for the AWS account making the request. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>Related actions include:</p><p/><ul><li><p><a>CreateJob</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobPriority</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInvalidRequest`, `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorInvalidNextToken`.
 
 @see AWSAWSS3ControlListJobsRequest
 @see AWSAWSS3ControlListJobsResult
 */
- (void)listJobs:(AWSAWSS3ControlListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlListJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Associates an access policy with the specified access point. Each access point can have only one policy, so a request made to this API replaces any existing policy associated with the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the PutAccessPointPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlPutAccessPointPolicyRequest
 */
- (AWSTask *)putAccessPointPolicy:(AWSAWSS3ControlPutAccessPointPolicyRequest *)request;

/**
 <p>Associates an access policy with the specified access point. Each access point can have only one policy, so a request made to this API replaces any existing policy associated with the specified access point.</p>
 
 @param request A container for the necessary parameters to execute the PutAccessPointPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlPutAccessPointPolicyRequest
 */
- (void)putAccessPointPolicy:(AWSAWSS3ControlPutAccessPointPolicyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Set the supplied tag-set on an Amazon S3 Batch Operations job.</p><p>A tag is a key-value pair. You can associate Amazon S3 Batch Operations tags with any job by sending a PUT request against the tagging subresource that is associated with the job. To modify the existing tag set, you can either replace the existing tag set entirely, or make changes within the existing tag set by retrieving the existing tag set using <a>GetJobTagging</a>, modify that tag set, and use this API action to replace the tag set with the one you have modified.. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the Amazon Simple Storage Service Developer Guide. </p><p/><note><ul><li><p>If you send this request with an empty tag set, Amazon S3 deletes the existing tag set on the Batch Operations job. If you use this method, you will be charged for a Tier 1 Request (PUT). For more information, see <a href="http://aws.amazon.com/s3/pricing/">Amazon S3 pricing</a>.</p></li><li><p>For deleting existing tags for your batch operations job, <a>DeleteJobTagging</a> request is preferred because it achieves the same result without incurring charges.</p></li><li><p>A few things to consider about using tags:</p><ul><li><p>Amazon S3 limits the maximum number of tags to 50 tags per job.</p></li><li><p>You can associate up to 50 tags with a job as long as they have unique tag keys.</p></li><li><p>A tag key can be up to 128 Unicode characters in length, and tag values can be up to 256 Unicode characters in length.</p></li><li><p>The key and values are case sensitive.</p></li><li><p>For tagging-related restrictions related to characters and encodings, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined Tag Restrictions</a>.</p></li></ul></li></ul></note><p/><p>To use this operation, you must have permission to perform the <code>s3:PutJobTagging</code> action.</p><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>GetJobTagging</a></p></li><li><p><a>DeleteJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutJobTagging service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlPutJobTaggingResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorTooManyTags`.
 
 @see AWSAWSS3ControlPutJobTaggingRequest
 @see AWSAWSS3ControlPutJobTaggingResult
 */
- (AWSTask<AWSAWSS3ControlPutJobTaggingResult *> *)putJobTagging:(AWSAWSS3ControlPutJobTaggingRequest *)request;

/**
 <p>Set the supplied tag-set on an Amazon S3 Batch Operations job.</p><p>A tag is a key-value pair. You can associate Amazon S3 Batch Operations tags with any job by sending a PUT request against the tagging subresource that is associated with the job. To modify the existing tag set, you can either replace the existing tag set entirely, or make changes within the existing tag set by retrieving the existing tag set using <a>GetJobTagging</a>, modify that tag set, and use this API action to replace the tag set with the one you have modified.. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-managing-jobs.html#batch-ops-job-tags">Using Job Tags</a> in the Amazon Simple Storage Service Developer Guide. </p><p/><note><ul><li><p>If you send this request with an empty tag set, Amazon S3 deletes the existing tag set on the Batch Operations job. If you use this method, you will be charged for a Tier 1 Request (PUT). For more information, see <a href="http://aws.amazon.com/s3/pricing/">Amazon S3 pricing</a>.</p></li><li><p>For deleting existing tags for your batch operations job, <a>DeleteJobTagging</a> request is preferred because it achieves the same result without incurring charges.</p></li><li><p>A few things to consider about using tags:</p><ul><li><p>Amazon S3 limits the maximum number of tags to 50 tags per job.</p></li><li><p>You can associate up to 50 tags with a job as long as they have unique tag keys.</p></li><li><p>A tag key can be up to 128 Unicode characters in length, and tag values can be up to 256 Unicode characters in length.</p></li><li><p>The key and values are case sensitive.</p></li><li><p>For tagging-related restrictions related to characters and encodings, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined Tag Restrictions</a>.</p></li></ul></li></ul></note><p/><p>To use this operation, you must have permission to perform the <code>s3:PutJobTagging</code> action.</p><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>GetJobTagging</a></p></li><li><p><a>DeleteJobTagging</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the PutJobTagging service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorInternalService`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorTooManyTags`.
 
 @see AWSAWSS3ControlPutJobTaggingRequest
 @see AWSAWSS3ControlPutJobTaggingResult
 */
- (void)putJobTagging:(AWSAWSS3ControlPutJobTaggingRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlPutJobTaggingResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates or modifies the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the PutPublicAccessBlock service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`.
 
 @see AWSAWSS3ControlPutPublicAccessBlockRequest
 */
- (AWSTask *)putPublicAccessBlock:(AWSAWSS3ControlPutPublicAccessBlockRequest *)request;

/**
 <p>Creates or modifies the <code>PublicAccessBlock</code> configuration for an Amazon Web Services account.</p>
 
 @param request A container for the necessary parameters to execute the PutPublicAccessBlock service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSAWSS3ControlPutPublicAccessBlockRequest
 */
- (void)putPublicAccessBlock:(AWSAWSS3ControlPutPublicAccessBlockRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates an existing Amazon S3 Batch Operations job's priority. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateJobPriority service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlUpdateJobPriorityResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlUpdateJobPriorityRequest
 @see AWSAWSS3ControlUpdateJobPriorityResult
 */
- (AWSTask<AWSAWSS3ControlUpdateJobPriorityResult *> *)updateJobPriority:(AWSAWSS3ControlUpdateJobPriorityRequest *)request;

/**
 <p>Updates an existing Amazon S3 Batch Operations job's priority. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateJobPriority service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlUpdateJobPriorityRequest
 @see AWSAWSS3ControlUpdateJobPriorityResult
 */
- (void)updateJobPriority:(AWSAWSS3ControlUpdateJobPriorityRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlUpdateJobPriorityResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the status for the specified job. Use this operation to confirm that you want to run a job or to cancel an existing job. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateJobStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSS3ControlUpdateJobStatusResult`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorJobStatus`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlUpdateJobStatusRequest
 @see AWSAWSS3ControlUpdateJobStatusResult
 */
- (AWSTask<AWSAWSS3ControlUpdateJobStatusResult *> *)updateJobStatus:(AWSAWSS3ControlUpdateJobStatusRequest *)request;

/**
 <p>Updates the status for the specified job. Use this operation to confirm that you want to run a job or to cancel an existing job. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-basics.html">Amazon S3 Batch Operations</a> in the Amazon Simple Storage Service Developer Guide.</p><p/><p>Related actions include:</p><ul><li><p><a>CreateJob</a></p></li><li><p><a>ListJobs</a></p></li><li><p><a>DescribeJob</a></p></li><li><p><a>UpdateJobStatus</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateJobStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSS3ControlErrorDomain` domain and the following error code: `AWSAWSS3ControlErrorBadRequest`, `AWSAWSS3ControlErrorTooManyRequests`, `AWSAWSS3ControlErrorNotFound`, `AWSAWSS3ControlErrorJobStatus`, `AWSAWSS3ControlErrorInternalService`.
 
 @see AWSAWSS3ControlUpdateJobStatusRequest
 @see AWSAWSS3ControlUpdateJobStatusResult
 */
- (void)updateJobStatus:(AWSAWSS3ControlUpdateJobStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSS3ControlUpdateJobStatusResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
