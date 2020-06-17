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
#import "AWSSnowballModel.h"
#import "AWSSnowballResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSnowball
FOUNDATION_EXPORT NSString *const AWSSnowballSDKVersion;

/**
 <p>AWS Snowball is a petabyte-scale data transport solution that uses secure devices to transfer large amounts of data between your on-premises data centers and Amazon Simple Storage Service (Amazon S3). The Snowball commands described here provide access to the same functionality that is available in the AWS Snowball Management Console, which enables you to create and manage jobs for Snowball. To transfer data locally with a Snowball device, you'll need to use the Snowball client or the Amazon S3 API adapter for Snowball. For more information, see the <a href="https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html">User Guide</a>.</p>
 */
@interface AWSSnowball : AWSService

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

     let Snowball = AWSSnowball.default()

 *Objective-C*

     AWSSnowball *Snowball = [AWSSnowball defaultSnowball];

 @return The default service client.
 */
+ (instancetype)defaultSnowball;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSnowball.register(with: configuration!, forKey: "USWest2Snowball")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSnowball registerSnowballWithConfiguration:configuration forKey:@"USWest2Snowball"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Snowball = AWSSnowball(forKey: "USWest2Snowball")

 *Objective-C*

     AWSSnowball *Snowball = [AWSSnowball SnowballForKey:@"USWest2Snowball"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSnowballWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSnowballWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSnowball.register(with: configuration!, forKey: "USWest2Snowball")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSnowball registerSnowballWithConfiguration:configuration forKey:@"USWest2Snowball"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Snowball = AWSSnowball(forKey: "USWest2Snowball")

 *Objective-C*

     AWSSnowball *Snowball = [AWSSnowball SnowballForKey:@"USWest2Snowball"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SnowballForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSnowballForKey:(NSString *)key;

/**
 <p>Cancels a cluster job. You can only cancel a cluster job while it's in the <code>AwaitingQuorum</code> status. You'll have at least an hour after creating a cluster job to cancel it.</p>
 
 @param request A container for the necessary parameters to execute the CancelCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballCancelClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballCancelClusterRequest
 @see AWSSnowballCancelClusterResult
 */
- (AWSTask<AWSSnowballCancelClusterResult *> *)cancelCluster:(AWSSnowballCancelClusterRequest *)request;

/**
 <p>Cancels a cluster job. You can only cancel a cluster job while it's in the <code>AwaitingQuorum</code> status. You'll have at least an hour after creating a cluster job to cancel it.</p>
 
 @param request A container for the necessary parameters to execute the CancelCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballCancelClusterRequest
 @see AWSSnowballCancelClusterResult
 */
- (void)cancelCluster:(AWSSnowballCancelClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballCancelClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels the specified job. You can only cancel a job before its <code>JobState</code> value changes to <code>PreparingAppliance</code>. Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action returns a job's <code>JobState</code> as part of the response element data returned.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballCancelJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`.
 
 @see AWSSnowballCancelJobRequest
 @see AWSSnowballCancelJobResult
 */
- (AWSTask<AWSSnowballCancelJobResult *> *)cancelJob:(AWSSnowballCancelJobRequest *)request;

/**
 <p>Cancels the specified job. You can only cancel a job before its <code>JobState</code> value changes to <code>PreparingAppliance</code>. Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action returns a job's <code>JobState</code> as part of the response element data returned.</p>
 
 @param request A container for the necessary parameters to execute the CancelJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`.
 
 @see AWSSnowballCancelJobRequest
 @see AWSSnowballCancelJobResult
 */
- (void)cancelJob:(AWSSnowballCancelJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballCancelJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an address for a Snowball to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballCreateAddressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidAddress`, `AWSSnowballErrorUnsupportedAddress`.
 
 @see AWSSnowballCreateAddressRequest
 @see AWSSnowballCreateAddressResult
 */
- (AWSTask<AWSSnowballCreateAddressResult *> *)createAddress:(AWSSnowballCreateAddressRequest *)request;

/**
 <p>Creates an address for a Snowball to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.</p>
 
 @param request A container for the necessary parameters to execute the CreateAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidAddress`, `AWSSnowballErrorUnsupportedAddress`.
 
 @see AWSSnowballCreateAddressRequest
 @see AWSSnowballCreateAddressResult
 */
- (void)createAddress:(AWSSnowballCreateAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballCreateAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty cluster. Each cluster supports five nodes. You use the <a>CreateJob</a> action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballCreateClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballCreateClusterRequest
 @see AWSSnowballCreateClusterResult
 */
- (AWSTask<AWSSnowballCreateClusterResult *> *)createCluster:(AWSSnowballCreateClusterRequest *)request;

/**
 <p>Creates an empty cluster. Each cluster supports five nodes. You use the <a>CreateJob</a> action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.</p>
 
 @param request A container for the necessary parameters to execute the CreateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballCreateClusterRequest
 @see AWSSnowballCreateClusterResult
 */
- (void)createCluster:(AWSSnowballCreateClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballCreateClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you're creating a job for a node in a cluster, you only need to provide the <code>clusterId</code> value; the other job attributes are inherited from the cluster. </p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballCreateJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorClusterLimitExceeded`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballCreateJobRequest
 @see AWSSnowballCreateJobResult
 */
- (AWSTask<AWSSnowballCreateJobResult *> *)createJob:(AWSSnowballCreateJobRequest *)request;

/**
 <p>Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you're creating a job for a node in a cluster, you only need to provide the <code>clusterId</code> value; the other job attributes are inherited from the cluster. </p>
 
 @param request A container for the necessary parameters to execute the CreateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorClusterLimitExceeded`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballCreateJobRequest
 @see AWSSnowballCreateJobResult
 */
- (void)createJob:(AWSSnowballCreateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballCreateJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Takes an <code>AddressId</code> and returns specific details about that address in the form of an <code>Address</code> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddress service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballDescribeAddressResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeAddressRequest
 @see AWSSnowballDescribeAddressResult
 */
- (AWSTask<AWSSnowballDescribeAddressResult *> *)describeAddress:(AWSSnowballDescribeAddressRequest *)request;

/**
 <p>Takes an <code>AddressId</code> and returns specific details about that address in the form of an <code>Address</code> object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddress service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeAddressRequest
 @see AWSSnowballDescribeAddressResult
 */
- (void)describeAddress:(AWSSnowballDescribeAddressRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballDescribeAddressResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a specified number of <code>ADDRESS</code> objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballDescribeAddressesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballDescribeAddressesRequest
 @see AWSSnowballDescribeAddressesResult
 */
- (AWSTask<AWSSnowballDescribeAddressesResult *> *)describeAddresses:(AWSSnowballDescribeAddressesRequest *)request;

/**
 <p>Returns a specified number of <code>ADDRESS</code> objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAddresses service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballDescribeAddressesRequest
 @see AWSSnowballDescribeAddressesResult
 */
- (void)describeAddresses:(AWSSnowballDescribeAddressesRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballDescribeAddressesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific cluster including shipping information, cluster status, and other important metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballDescribeClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeClusterRequest
 @see AWSSnowballDescribeClusterResult
 */
- (AWSTask<AWSSnowballDescribeClusterResult *> *)describeCluster:(AWSSnowballDescribeClusterRequest *)request;

/**
 <p>Returns information about a specific cluster including shipping information, cluster status, and other important metadata.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeClusterRequest
 @see AWSSnowballDescribeClusterResult
 */
- (void)describeCluster:(AWSSnowballDescribeClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballDescribeClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a specific job including shipping information, job status, and other important metadata. </p>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballDescribeJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeJobRequest
 @see AWSSnowballDescribeJobResult
 */
- (AWSTask<AWSSnowballDescribeJobResult *> *)describeJob:(AWSSnowballDescribeJobRequest *)request;

/**
 <p>Returns information about a specific job including shipping information, job status, and other important metadata. </p>
 
 @param request A container for the necessary parameters to execute the DescribeJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`.
 
 @see AWSSnowballDescribeJobRequest
 @see AWSSnowballDescribeJobResult
 */
- (void)describeJob:(AWSSnowballDescribeJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballDescribeJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the <code>GetJobManifest</code> action.</p><p>The manifest is an encrypted file that you can download after your job enters the <code>WithCustomer</code> status. The manifest is decrypted by using the <code>UnlockCode</code> code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of an <code>UnlockCode</code> value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p><p>The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.</p>
 
 @param request A container for the necessary parameters to execute the GetJobManifest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballGetJobManifestResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetJobManifestRequest
 @see AWSSnowballGetJobManifestResult
 */
- (AWSTask<AWSSnowballGetJobManifestResult *> *)getJobManifest:(AWSSnowballGetJobManifestRequest *)request;

/**
 <p>Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified <code>JobId</code> value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the <code>GetJobManifest</code> action.</p><p>The manifest is an encrypted file that you can download after your job enters the <code>WithCustomer</code> status. The manifest is decrypted by using the <code>UnlockCode</code> code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of an <code>UnlockCode</code> value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p><p>The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.</p>
 
 @param request A container for the necessary parameters to execute the GetJobManifest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetJobManifestRequest
 @see AWSSnowballGetJobManifestResult
 */
- (void)getJobManifest:(AWSSnowballGetJobManifestRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballGetJobManifestResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the <code>UnlockCode</code> code value for the specified job. A particular <code>UnlockCode</code> value can be accessed for up to 90 days after the associated job has been created.</p><p>The <code>UnlockCode</code> value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of the <code>UnlockCode</code> in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p>
 
 @param request A container for the necessary parameters to execute the GetJobUnlockCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballGetJobUnlockCodeResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetJobUnlockCodeRequest
 @see AWSSnowballGetJobUnlockCodeResult
 */
- (AWSTask<AWSSnowballGetJobUnlockCodeResult *> *)getJobUnlockCode:(AWSSnowballGetJobUnlockCodeRequest *)request;

/**
 <p>Returns the <code>UnlockCode</code> code value for the specified job. A particular <code>UnlockCode</code> value can be accessed for up to 90 days after the associated job has been created.</p><p>The <code>UnlockCode</code> value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.</p><p>As a best practice, we recommend that you don't save a copy of the <code>UnlockCode</code> in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.</p>
 
 @param request A container for the necessary parameters to execute the GetJobUnlockCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetJobUnlockCodeRequest
 @see AWSSnowballGetJobUnlockCodeResult
 */
- (void)getJobUnlockCode:(AWSSnowballGetJobUnlockCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballGetJobUnlockCodeResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.</p><p>The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.</p>
 
 @param request A container for the necessary parameters to execute the GetSnowballUsage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballGetSnowballUsageResult`.
 
 @see AWSSnowballGetSnowballUsageRequest
 @see AWSSnowballGetSnowballUsageResult
 */
- (AWSTask<AWSSnowballGetSnowballUsageResult *> *)getSnowballUsage:(AWSSnowballGetSnowballUsageRequest *)request;

/**
 <p>Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.</p><p>The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.</p>
 
 @param request A container for the necessary parameters to execute the GetSnowballUsage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSSnowballGetSnowballUsageRequest
 @see AWSSnowballGetSnowballUsageResult
 */
- (void)getSnowballUsage:(AWSSnowballGetSnowballUsageRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballGetSnowballUsageResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an Amazon S3 presigned URL for an update file associated with a specified <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSoftwareUpdates service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballGetSoftwareUpdatesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetSoftwareUpdatesRequest
 @see AWSSnowballGetSoftwareUpdatesResult
 */
- (AWSTask<AWSSnowballGetSoftwareUpdatesResult *> *)getSoftwareUpdates:(AWSSnowballGetSoftwareUpdatesRequest *)request;

/**
 <p>Returns an Amazon S3 presigned URL for an update file associated with a specified <code>JobId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSoftwareUpdates service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`.
 
 @see AWSSnowballGetSoftwareUpdatesRequest
 @see AWSSnowballGetSoftwareUpdatesResult
 */
- (void)getSoftwareUpdates:(AWSSnowballGetSoftwareUpdatesRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballGetSoftwareUpdatesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballListClusterJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListClusterJobsRequest
 @see AWSSnowballListClusterJobsResult
 */
- (AWSTask<AWSSnowballListClusterJobsResult *> *)listClusterJobs:(AWSSnowballListClusterJobsRequest *)request;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusterJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListClusterJobsRequest
 @see AWSSnowballListClusterJobsResult
 */
- (void)listClusterJobs:(AWSSnowballListClusterJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballListClusterJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>ClusterListEntry</code> objects of the specified length. Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballListClustersResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListClustersRequest
 @see AWSSnowballListClustersResult
 */
- (AWSTask<AWSSnowballListClustersResult *> *)listClusters:(AWSSnowballListClustersRequest *)request;

/**
 <p>Returns an array of <code>ClusterListEntry</code> objects of the specified length. Each <code>ClusterListEntry</code> object contains a cluster's state, a cluster's ID, and other important status information.</p>
 
 @param request A container for the necessary parameters to execute the ListClusters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListClustersRequest
 @see AWSSnowballListClustersResult
 */
- (void)listClusters:(AWSSnowballListClustersRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballListClustersResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that are owned by your AWS account that would be supported for use on a Snowball Edge device. Currently, supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the ListCompatibleImages service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballListCompatibleImagesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballListCompatibleImagesRequest
 @see AWSSnowballListCompatibleImagesResult
 */
- (AWSTask<AWSSnowballListCompatibleImagesResult *> *)listCompatibleImages:(AWSSnowballListCompatibleImagesRequest *)request;

/**
 <p>This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that are owned by your AWS account that would be supported for use on a Snowball Edge device. Currently, supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.</p>
 
 @param request A container for the necessary parameters to execute the ListCompatibleImages service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballListCompatibleImagesRequest
 @see AWSSnowballListCompatibleImagesResult
 */
- (void)listCompatibleImages:(AWSSnowballListCompatibleImagesRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballListCompatibleImagesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballListJobsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListJobsRequest
 @see AWSSnowballListJobsResult
 */
- (AWSTask<AWSSnowballListJobsResult *> *)listJobs:(AWSSnowballListJobsRequest *)request;

/**
 <p>Returns an array of <code>JobListEntry</code> objects of the specified length. Each <code>JobListEntry</code> object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.</p>
 
 @param request A container for the necessary parameters to execute the ListJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidNextToken`.
 
 @see AWSSnowballListJobsRequest
 @see AWSSnowballListJobsResult
 */
- (void)listJobs:(AWSSnowballListJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballListJobsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>While a cluster's <code>ClusterState</code> value is in the <code>AwaitingQuorum</code> state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCluster service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballUpdateClusterResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballUpdateClusterRequest
 @see AWSSnowballUpdateClusterResult
 */
- (AWSTask<AWSSnowballUpdateClusterResult *> *)updateCluster:(AWSSnowballUpdateClusterRequest *)request;

/**
 <p>While a cluster's <code>ClusterState</code> value is in the <code>AwaitingQuorum</code> state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCluster service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballUpdateClusterRequest
 @see AWSSnowballUpdateClusterResult
 */
- (void)updateCluster:(AWSSnowballUpdateClusterRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballUpdateClusterResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>While a job's <code>JobState</code> value is <code>New</code>, you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSnowballUpdateJobResult`. On failed execution, `task.error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorClusterLimitExceeded`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballUpdateJobRequest
 @see AWSSnowballUpdateJobResult
 */
- (AWSTask<AWSSnowballUpdateJobResult *> *)updateJob:(AWSSnowballUpdateJobRequest *)request;

/**
 <p>While a job's <code>JobState</code> value is <code>New</code>, you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.</p>
 
 @param request A container for the necessary parameters to execute the UpdateJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSnowballErrorDomain` domain and the following error code: `AWSSnowballErrorInvalidResource`, `AWSSnowballErrorInvalidJobState`, `AWSSnowballErrorKMSRequestFailed`, `AWSSnowballErrorInvalidInputCombination`, `AWSSnowballErrorClusterLimitExceeded`, `AWSSnowballErrorEc2RequestFailed`.
 
 @see AWSSnowballUpdateJobRequest
 @see AWSSnowballUpdateJobResult
 */
- (void)updateJob:(AWSSnowballUpdateJobRequest *)request completionHandler:(void (^ _Nullable)(AWSSnowballUpdateJobResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
