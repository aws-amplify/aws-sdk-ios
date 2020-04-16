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
#import "AWSsnowballModel.h"
#import "AWSsnowballResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSsnowball
FOUNDATION_EXPORT NSString *const AWSsnowballSDKVersion;

/**
 <p>AWS Snowball is a petabyte-scale data transport solution that uses secure devices to transfer large amounts of data between your on-premises data centers and Amazon Simple Storage Service (Amazon S3). The Snowball commands described here provide access to the same functionality that is available in the AWS Snowball Management Console, which enables you to create and manage jobs for Snowball. To transfer data locally with a Snowball device, you'll need to use the Snowball client or the Amazon S3 API adapter for Snowball. For more information, see the <a href="https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html">User Guide</a>.</p>
 */
@interface AWSsnowball : AWSService

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

     let snowball = AWSsnowball.default()

 *Objective-C*

     AWSsnowball *snowball = [AWSsnowball defaultsnowball];

 @return The default service client.
 */
+ (instancetype)defaultsnowball;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSsnowball.register(with: configuration!, forKey: "USWest2snowball")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSsnowball registersnowballWithConfiguration:configuration forKey:@"USWest2snowball"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let snowball = AWSsnowball(forKey: "USWest2snowball")

 *Objective-C*

     AWSsnowball *snowball = [AWSsnowball snowballForKey:@"USWest2snowball"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registersnowballWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registersnowballWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSsnowball.register(with: configuration!, forKey: "USWest2snowball")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSsnowball registersnowballWithConfiguration:configuration forKey:@"USWest2snowball"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let snowball = AWSsnowball(forKey: "USWest2snowball")

 *Objective-C*

     AWSsnowball *snowball = [AWSsnowball snowballForKey:@"USWest2snowball"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)snowballForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removesnowballForKey:(NSString *)key;

/**
 <p>Cancels a cluster job. You can only cancel a cluster job while it's in the <code>AwaitingQuorum</code> status. You'll have at least an hour after creating a cluster job to cancel it.</p>
 
 @param request A container for the necessary parameters to execute the CancelCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballCancelClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballCancelClusterRequest
 @see AWSsnowballCancelClusterResult
 */
- (AWSTask<AWSsnowballCancelClusterResult *> *)cancelCluster:(AWSsnowballCancelClusterRequest *)request;

/**
 <p>Cancels a cluster job. You can only cancel a cluster job while it's in the <code>AwaitingQuorum</code> status. You'll have at least an hour after creating a cluster job to cancel it.</p>
 
 @param request A container for the necessary parameters to execute the CancelCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballCancelClusterRequest
 @see AWSsnowballCancelClusterResult
 */
- (void)cancelCluster:(AWSsnowballCancelClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballCancelClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the specified job. You can only cancel a job before its <code>JobState</code> value changes to <code>PreparingAppliance</code>. Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action returns a job's <code>JobState</code> as part of the response element data returned.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballCancelJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`.
 
 @see AWSsnowballCancelJobRequest
 @see AWSsnowballCancelJobResult
 */
- (AWSTask<AWSsnowballCancelJobResult *> *)cancelJob:(AWSsnowballCancelJobRequest *)request;

/**
 <p>Cancels the specified job. You can only cancel a job before its <code>JobState</code> value changes to <code>PreparingAppliance</code>. Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action returns a job's <code>JobState</code> as part of the response element data returned.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`.
 
 @see AWSsnowballCancelJobRequest
 @see AWSsnowballCancelJobResult
 */
- (void)cancelJob:(AWSsnowballCancelJobRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballCancelJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an address for a Snowball to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballCreateAddressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidAddress`, `AWSsnowballErrorUnsupportedAddress`.
 
 @see AWSsnowballCreateAddressRequest
 @see AWSsnowballCreateAddressResult
 */
- (AWSTask<AWSsnowballCreateAddressResult *> *)createAddress:(AWSsnowballCreateAddressRequest *)request;

/**
 <p>Creates an address for a Snowball to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidAddress`, `AWSsnowballErrorUnsupportedAddress`.
 
 @see AWSsnowballCreateAddressRequest
 @see AWSsnowballCreateAddressResult
 */
- (void)createAddress:(AWSsnowballCreateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballCreateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty cluster. Each cluster supports five nodes. You use the <a>CreateJob</a> action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballCreateClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballCreateClusterRequest
 @see AWSsnowballCreateClusterResult
 */
- (AWSTask<AWSsnowballCreateClusterResult *> *)createCluster:(AWSsnowballCreateClusterRequest *)request;

/**
 <p>Creates an empty cluster. Each cluster supports five nodes. You use the <a>CreateJob</a> action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballCreateClusterRequest
 @see AWSsnowballCreateClusterResult
 */
- (void)createCluster:(AWSsnowballCreateClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballCreateClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you're creating a job for a node in a cluster, you only need to provide the <code>clusterId</code> value; the other job attributes are inherited from the cluster. </p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballCreateJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorClusterLimitExceeded`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballCreateJobRequest
 @see AWSsnowballCreateJobResult
 */
- (AWSTask<AWSsnowballCreateJobResult *> *)createJob:(AWSsnowballCreateJobRequest *)request;

/**
 <p>Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you're creating a job for a node in a cluster, you only need to provide the <code>clusterId</code> value; the other job attributes are inherited from the cluster. </p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorClusterLimitExceeded`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballCreateJobRequest
 @see AWSsnowballCreateJobResult
 */
- (void)createJob:(AWSsnowballCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballCreateJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Takes an <code>AddressId</code> and returns specific details about that address in the form of an <code>Address</code> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballDescribeAddressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeAddressRequest
 @see AWSsnowballDescribeAddressResult
 */
- (AWSTask<AWSsnowballDescribeAddressResult *> *)describeAddress:(AWSsnowballDescribeAddressRequest *)request;

/**
 <p>Takes an <code>AddressId</code> and returns specific details about that address in the form of an <code>Address</code> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeAddressRequest
 @see AWSsnowballDescribeAddressResult
 */
- (void)describeAddress:(AWSsnowballDescribeAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballDescribeAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a specified number of <code>ADDRESS</code> objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballDescribeAddressesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballDescribeAddressesRequest
 @see AWSsnowballDescribeAddressesResult
 */
- (AWSTask<AWSsnowballDescribeAddressesResult *> *)describeAddresses:(AWSsnowballDescribeAddressesRequest *)request;

/**
 <p>Returns a specified number of <code>ADDRESS</code> objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballDescribeAddressesRequest
 @see AWSsnowballDescribeAddressesResult
 */
- (void)describeAddresses:(AWSsnowballDescribeAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballDescribeAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific cluster including shipping information, cluster status, and other important metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballDescribeClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeClusterRequest
 @see AWSsnowballDescribeClusterResult
 */
- (AWSTask<AWSsnowballDescribeClusterResult *> *)describeCluster:(AWSsnowballDescribeClusterRequest *)request;

/**
 <p>Returns information about a specific cluster including shipping information, cluster status, and other important metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeClusterRequest
 @see AWSsnowballDescribeClusterResult
 */
- (void)describeCluster:(AWSsnowballDescribeClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballDescribeClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific job including shipping information, job status, and other important metadata. </p>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballDescribeJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeJobRequest
 @see AWSsnowballDescribeJobResult
 */
- (AWSTask<AWSsnowballDescribeJobResult *> *)describeJob:(AWSsnowballDescribeJobRequest *)request;

/**
 <p>Returns information about a specific job including shipping information, job status, and other important metadata. </p>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`.
 
 @see AWSsnowballDescribeJobRequest
 @see AWSsnowballDescribeJobResult
 */
- (void)describeJob:(AWSsnowballDescribeJobRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballDescribeJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the <code>GetJobManifest</code> action.</p><p>The manifest is an encrypted file that you can download after your job enters the <code>WithCustomer</code> status. The manifest is decrypted by using the <code>UnlockCode</code> code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of an <code>UnlockCode</code> value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p><p>The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.</p>
 
 @param request A container for the necessary parameters to execute the GetJobManifest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballGetJobManifestResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetJobManifestRequest
 @see AWSsnowballGetJobManifestResult
 */
- (AWSTask<AWSsnowballGetJobManifestResult *> *)getJobManifest:(AWSsnowballGetJobManifestRequest *)request;

/**
 <p>Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the <code>GetJobManifest</code> action.</p><p>The manifest is an encrypted file that you can download after your job enters the <code>WithCustomer</code> status. The manifest is decrypted by using the <code>UnlockCode</code> code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of an <code>UnlockCode</code> value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p><p>The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.</p>
 
 @param request A container for the necessary parameters to execute the GetJobManifest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetJobManifestRequest
 @see AWSsnowballGetJobManifestResult
 */
- (void)getJobManifest:(AWSsnowballGetJobManifestRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballGetJobManifestResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the <code>UnlockCode</code> code value for the specified job. A particular <code>UnlockCode</code> value can be accessed for up to 90 days after the associated job has been created.</p><p>The <code>UnlockCode</code> value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of the <code>UnlockCode</code> in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p>
 
 @param request A container for the necessary parameters to execute the GetJobUnlockCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballGetJobUnlockCodeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetJobUnlockCodeRequest
 @see AWSsnowballGetJobUnlockCodeResult
 */
- (AWSTask<AWSsnowballGetJobUnlockCodeResult *> *)getJobUnlockCode:(AWSsnowballGetJobUnlockCodeRequest *)request;

/**
 <p>Returns the <code>UnlockCode</code> code value for the specified job. A particular <code>UnlockCode</code> value can be accessed for up to 90 days after the associated job has been created.</p><p>The <code>UnlockCode</code> value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of the <code>UnlockCode</code> in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p>
 
 @param request A container for the necessary parameters to execute the GetJobUnlockCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetJobUnlockCodeRequest
 @see AWSsnowballGetJobUnlockCodeResult
 */
- (void)getJobUnlockCode:(AWSsnowballGetJobUnlockCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballGetJobUnlockCodeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.</p><p>The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.</p>
 
 @param request A container for the necessary parameters to execute the GetSnowballUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballGetSnowballUsageResult`.
 
 @see AWSsnowballGetSnowballUsageRequest
 @see AWSsnowballGetSnowballUsageResult
 */
- (AWSTask<AWSsnowballGetSnowballUsageResult *> *)getSnowballUsage:(AWSsnowballGetSnowballUsageRequest *)request;

/**
 <p>Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.</p><p>The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.</p>
 
 @param request A container for the necessary parameters to execute the GetSnowballUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSsnowballGetSnowballUsageRequest
 @see AWSsnowballGetSnowballUsageResult
 */
- (void)getSnowballUsage:(AWSsnowballGetSnowballUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballGetSnowballUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an Amazon S3 presigned URL for an update file associated with a specified <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSoftwareUpdates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballGetSoftwareUpdatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetSoftwareUpdatesRequest
 @see AWSsnowballGetSoftwareUpdatesResult
 */
- (AWSTask<AWSsnowballGetSoftwareUpdatesResult *> *)getSoftwareUpdates:(AWSsnowballGetSoftwareUpdatesRequest *)request;

/**
 <p>Returns an Amazon S3 presigned URL for an update file associated with a specified <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSoftwareUpdates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`.
 
 @see AWSsnowballGetSoftwareUpdatesRequest
 @see AWSsnowballGetSoftwareUpdatesResult
 */
- (void)getSoftwareUpdates:(AWSsnowballGetSoftwareUpdatesRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballGetSoftwareUpdatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballListClusterJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListClusterJobsRequest
 @see AWSsnowballListClusterJobsResult
 */
- (AWSTask<AWSsnowballListClusterJobsResult *> *)listClusterJobs:(AWSsnowballListClusterJobsRequest *)request;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListClusterJobsRequest
 @see AWSsnowballListClusterJobsResult
 */
- (void)listClusterJobs:(AWSsnowballListClusterJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballListClusterJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>ClusterListEntry</code> objects of the specified length. Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballListClustersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListClustersRequest
 @see AWSsnowballListClustersResult
 */
- (AWSTask<AWSsnowballListClustersResult *> *)listClusters:(AWSsnowballListClustersRequest *)request;

/**
 <p>Returns an array of <code>ClusterListEntry</code> objects of the specified length. Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListClustersRequest
 @see AWSsnowballListClustersResult
 */
- (void)listClusters:(AWSsnowballListClustersRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballListClustersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that are owned by your AWS account that would be supported for use on a Snowball Edge device. Currently, supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the ListCompatibleImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballListCompatibleImagesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballListCompatibleImagesRequest
 @see AWSsnowballListCompatibleImagesResult
 */
- (AWSTask<AWSsnowballListCompatibleImagesResult *> *)listCompatibleImages:(AWSsnowballListCompatibleImagesRequest *)request;

/**
 <p>This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that are owned by your AWS account that would be supported for use on a Snowball Edge device. Currently, supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the ListCompatibleImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballListCompatibleImagesRequest
 @see AWSsnowballListCompatibleImagesResult
 */
- (void)listCompatibleImages:(AWSsnowballListCompatibleImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballListCompatibleImagesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballListJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListJobsRequest
 @see AWSsnowballListJobsResult
 */
- (AWSTask<AWSsnowballListJobsResult *> *)listJobs:(AWSsnowballListJobsRequest *)request;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidNextToken`.
 
 @see AWSsnowballListJobsRequest
 @see AWSsnowballListJobsResult
 */
- (void)listJobs:(AWSsnowballListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballListJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>While a cluster's <code>ClusterState</code> value is in the <code>AwaitingQuorum</code> state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballUpdateClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballUpdateClusterRequest
 @see AWSsnowballUpdateClusterResult
 */
- (AWSTask<AWSsnowballUpdateClusterResult *> *)updateCluster:(AWSsnowballUpdateClusterRequest *)request;

/**
 <p>While a cluster's <code>ClusterState</code> value is in the <code>AwaitingQuorum</code> state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballUpdateClusterRequest
 @see AWSsnowballUpdateClusterResult
 */
- (void)updateCluster:(AWSsnowballUpdateClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballUpdateClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>While a job's <code>JobState</code> value is <code>New</code>, you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSsnowballUpdateJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorClusterLimitExceeded`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballUpdateJobRequest
 @see AWSsnowballUpdateJobResult
 */
- (AWSTask<AWSsnowballUpdateJobResult *> *)updateJob:(AWSsnowballUpdateJobRequest *)request;

/**
 <p>While a job's <code>JobState</code> value is <code>New</code>, you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSsnowballErrorDomain` domain and the following error code: `AWSsnowballErrorInvalidResource`, `AWSsnowballErrorInvalidJobState`, `AWSsnowballErrorKMSRequestFailed`, `AWSsnowballErrorInvalidInputCombination`, `AWSsnowballErrorClusterLimitExceeded`, `AWSsnowballErrorEc2RequestFailed`.
 
 @see AWSsnowballUpdateJobRequest
 @see AWSsnowballUpdateJobResult
 */
- (void)updateJob:(AWSsnowballUpdateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSsnowballUpdateJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
