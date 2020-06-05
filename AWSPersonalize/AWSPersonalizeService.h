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
#import "AWSPersonalizeModel.h"
#import "AWSPersonalizeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSPersonalize
FOUNDATION_EXPORT NSString *const AWSPersonalizeSDKVersion;

/**
 <p>Amazon Personalize is a machine learning service that makes it easy to add individualized recommendations to customers.</p>
 */
@interface AWSPersonalize : AWSService

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

     let Personalize = AWSPersonalize.default()

 *Objective-C*

     AWSPersonalize *Personalize = [AWSPersonalize defaultPersonalize];

 @return The default service client.
 */
+ (instancetype)defaultPersonalize;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPersonalize.register(with: configuration!, forKey: "USWest2Personalize")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:@"USWest2Personalize"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Personalize = AWSPersonalize(forKey: "USWest2Personalize")

 *Objective-C*

     AWSPersonalize *Personalize = [AWSPersonalize PersonalizeForKey:@"USWest2Personalize"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPersonalizeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerPersonalizeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPersonalize.register(with: configuration!, forKey: "USWest2Personalize")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:@"USWest2Personalize"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Personalize = AWSPersonalize(forKey: "USWest2Personalize")

 *Objective-C*

     AWSPersonalize *Personalize = [AWSPersonalize PersonalizeForKey:@"USWest2Personalize"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)PersonalizeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePersonalizeForKey:(NSString *)key;

/**
 <p>Creates a batch inference job. The operation can handle up to 50 million records and the input file must be in JSON format. For more information, see <a>recommendations-batch</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateBatchInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateBatchInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateBatchInferenceJobRequest
 @see AWSPersonalizeCreateBatchInferenceJobResponse
 */
- (AWSTask<AWSPersonalizeCreateBatchInferenceJobResponse *> *)createBatchInferenceJob:(AWSPersonalizeCreateBatchInferenceJobRequest *)request;

/**
 <p>Creates a batch inference job. The operation can handle up to 50 million records and the input file must be in JSON format. For more information, see <a>recommendations-batch</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateBatchInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateBatchInferenceJobRequest
 @see AWSPersonalizeCreateBatchInferenceJobResponse
 */
- (void)createBatchInferenceJob:(AWSPersonalizeCreateBatchInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateBatchInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a campaign by deploying a solution version. When a client calls the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> and <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html">GetPersonalizedRanking</a> APIs, a campaign is specified in the request.</p><p><b>Minimum Provisioned TPS and Auto-Scaling</b></p><p>A transaction is a single <code>GetRecommendations</code> or <code>GetPersonalizedRanking</code> call. Transactions per second (TPS) is the throughput and unit of billing for Amazon Personalize. The minimum provisioned TPS (<code>minProvisionedTPS</code>) specifies the baseline throughput provisioned by Amazon Personalize, and thus, the minimum billing charge. If your TPS increases beyond <code>minProvisionedTPS</code>, Amazon Personalize auto-scales the provisioned capacity up and down, but never below <code>minProvisionedTPS</code>, to maintain a 70% utilization. There's a short time delay while the capacity is increased that might cause loss of transactions. It's recommended to start with a low <code>minProvisionedTPS</code>, track your usage using Amazon CloudWatch metrics, and then increase the <code>minProvisionedTPS</code> as necessary.</p><p><b>Status</b></p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the campaign status, call <a>DescribeCampaign</a>.</p><note><p>Wait until the <code>status</code> of the campaign is <code>ACTIVE</code> before asking the campaign for recommendations.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListCampaigns</a></p></li><li><p><a>DescribeCampaign</a></p></li><li><p><a>UpdateCampaign</a></p></li><li><p><a>DeleteCampaign</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateCampaignRequest
 @see AWSPersonalizeCreateCampaignResponse
 */
- (AWSTask<AWSPersonalizeCreateCampaignResponse *> *)createCampaign:(AWSPersonalizeCreateCampaignRequest *)request;

/**
 <p>Creates a campaign by deploying a solution version. When a client calls the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> and <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html">GetPersonalizedRanking</a> APIs, a campaign is specified in the request.</p><p><b>Minimum Provisioned TPS and Auto-Scaling</b></p><p>A transaction is a single <code>GetRecommendations</code> or <code>GetPersonalizedRanking</code> call. Transactions per second (TPS) is the throughput and unit of billing for Amazon Personalize. The minimum provisioned TPS (<code>minProvisionedTPS</code>) specifies the baseline throughput provisioned by Amazon Personalize, and thus, the minimum billing charge. If your TPS increases beyond <code>minProvisionedTPS</code>, Amazon Personalize auto-scales the provisioned capacity up and down, but never below <code>minProvisionedTPS</code>, to maintain a 70% utilization. There's a short time delay while the capacity is increased that might cause loss of transactions. It's recommended to start with a low <code>minProvisionedTPS</code>, track your usage using Amazon CloudWatch metrics, and then increase the <code>minProvisionedTPS</code> as necessary.</p><p><b>Status</b></p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the campaign status, call <a>DescribeCampaign</a>.</p><note><p>Wait until the <code>status</code> of the campaign is <code>ACTIVE</code> before asking the campaign for recommendations.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListCampaigns</a></p></li><li><p><a>DescribeCampaign</a></p></li><li><p><a>UpdateCampaign</a></p></li><li><p><a>DeleteCampaign</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateCampaignRequest
 @see AWSPersonalizeCreateCampaignResponse
 */
- (void)createCampaign:(AWSPersonalizeCreateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty dataset and adds it to the specified dataset group. Use <a>CreateDatasetImportJob</a> to import your training data to a dataset.</p><p>There are three types of datasets:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul><p>Each dataset type has an associated schema with required field types. Only the <code>Interactions</code> dataset is required in order to train a model (also referred to as creating a solution).</p><p>A dataset can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the dataset, call <a>DescribeDataset</a>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>CreateDatasetGroup</a></p></li><li><p><a>ListDatasets</a></p></li><li><p><a>DescribeDataset</a></p></li><li><p><a>DeleteDataset</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDataset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateDatasetRequest
 @see AWSPersonalizeCreateDatasetResponse
 */
- (AWSTask<AWSPersonalizeCreateDatasetResponse *> *)createDataset:(AWSPersonalizeCreateDatasetRequest *)request;

/**
 <p>Creates an empty dataset and adds it to the specified dataset group. Use <a>CreateDatasetImportJob</a> to import your training data to a dataset.</p><p>There are three types of datasets:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul><p>Each dataset type has an associated schema with required field types. Only the <code>Interactions</code> dataset is required in order to train a model (also referred to as creating a solution).</p><p>A dataset can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the dataset, call <a>DescribeDataset</a>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>CreateDatasetGroup</a></p></li><li><p><a>ListDatasets</a></p></li><li><p><a>DescribeDataset</a></p></li><li><p><a>DeleteDataset</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDataset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateDatasetRequest
 @see AWSPersonalizeCreateDatasetResponse
 */
- (void)createDataset:(AWSPersonalizeCreateDatasetRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateDatasetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an empty dataset group. A dataset group contains related datasets that supply data for training a model. A dataset group can contain at most three datasets, one for each type of dataset:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul><p>To train a model (create a solution), a dataset group that contains an <code>Interactions</code> dataset is required. Call <a>CreateDataset</a> to add a dataset to the group.</p><p>A dataset group can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING</p></li></ul><p>To get the status of the dataset group, call <a>DescribeDatasetGroup</a>. If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the creation failed.</p><note><p>You must wait until the <code>status</code> of the dataset group is <code>ACTIVE</code> before adding a dataset to the group.</p></note><p>You can specify an AWS Key Management Service (KMS) key to encrypt the datasets in the group. If you specify a KMS key, you must also include an AWS Identity and Access Management (IAM) role that has permission to access the key.</p><p class="title"><b>APIs that require a dataset group ARN in the request</b></p><ul><li><p><a>CreateDataset</a></p></li><li><p><a>CreateEventTracker</a></p></li><li><p><a>CreateSolution</a></p></li></ul><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListDatasetGroups</a></p></li><li><p><a>DescribeDatasetGroup</a></p></li><li><p><a>DeleteDatasetGroup</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDatasetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateDatasetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateDatasetGroupRequest
 @see AWSPersonalizeCreateDatasetGroupResponse
 */
- (AWSTask<AWSPersonalizeCreateDatasetGroupResponse *> *)createDatasetGroup:(AWSPersonalizeCreateDatasetGroupRequest *)request;

/**
 <p>Creates an empty dataset group. A dataset group contains related datasets that supply data for training a model. A dataset group can contain at most three datasets, one for each type of dataset:</p><ul><li><p>Interactions</p></li><li><p>Items</p></li><li><p>Users</p></li></ul><p>To train a model (create a solution), a dataset group that contains an <code>Interactions</code> dataset is required. Call <a>CreateDataset</a> to add a dataset to the group.</p><p>A dataset group can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING</p></li></ul><p>To get the status of the dataset group, call <a>DescribeDatasetGroup</a>. If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the creation failed.</p><note><p>You must wait until the <code>status</code> of the dataset group is <code>ACTIVE</code> before adding a dataset to the group.</p></note><p>You can specify an AWS Key Management Service (KMS) key to encrypt the datasets in the group. If you specify a KMS key, you must also include an AWS Identity and Access Management (IAM) role that has permission to access the key.</p><p class="title"><b>APIs that require a dataset group ARN in the request</b></p><ul><li><p><a>CreateDataset</a></p></li><li><p><a>CreateEventTracker</a></p></li><li><p><a>CreateSolution</a></p></li></ul><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListDatasetGroups</a></p></li><li><p><a>DescribeDatasetGroup</a></p></li><li><p><a>DeleteDatasetGroup</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDatasetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateDatasetGroupRequest
 @see AWSPersonalizeCreateDatasetGroupResponse
 */
- (void)createDatasetGroup:(AWSPersonalizeCreateDatasetGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateDatasetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a job that imports training data from your data source (an Amazon S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize to import the training data, you must specify an AWS Identity and Access Management (IAM) role that has permission to read from the data source.</p><important><p>The dataset import job replaces any previous data in the dataset.</p></important><p><b>Status</b></p><p>A dataset import job can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul><p>To get the status of the import job, call <a>DescribeDatasetImportJob</a>, providing the Amazon Resource Name (ARN) of the dataset import job. The dataset import is complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the job failed.</p><note><p>Importing takes time. You must wait until the status shows as ACTIVE before training a model using the dataset.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListDatasetImportJobs</a></p></li><li><p><a>DescribeDatasetImportJob</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDatasetImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateDatasetImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateDatasetImportJobRequest
 @see AWSPersonalizeCreateDatasetImportJobResponse
 */
- (AWSTask<AWSPersonalizeCreateDatasetImportJobResponse *> *)createDatasetImportJob:(AWSPersonalizeCreateDatasetImportJobRequest *)request;

/**
 <p>Creates a job that imports training data from your data source (an Amazon S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize to import the training data, you must specify an AWS Identity and Access Management (IAM) role that has permission to read from the data source.</p><important><p>The dataset import job replaces any previous data in the dataset.</p></important><p><b>Status</b></p><p>A dataset import job can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul><p>To get the status of the import job, call <a>DescribeDatasetImportJob</a>, providing the Amazon Resource Name (ARN) of the dataset import job. The dataset import is complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the job failed.</p><note><p>Importing takes time. You must wait until the status shows as ACTIVE before training a model using the dataset.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListDatasetImportJobs</a></p></li><li><p><a>DescribeDatasetImportJob</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateDatasetImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateDatasetImportJobRequest
 @see AWSPersonalizeCreateDatasetImportJobResponse
 */
- (void)createDatasetImportJob:(AWSPersonalizeCreateDatasetImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateDatasetImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an event tracker that you use when sending event data to the specified dataset group using the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a> API.</p><p>When Amazon Personalize creates an event tracker, it also creates an <i>event-interactions</i> dataset in the dataset group associated with the event tracker. The event-interactions dataset stores the event data from the <code>PutEvents</code> call. The contents of this dataset are not available to the user.</p><note><p>Only one event tracker can be associated with a dataset group. You will get an error if you call <code>CreateEventTracker</code> using the same dataset group as an existing event tracker.</p></note><p>When you send event data you include your tracking ID. The tracking ID identifies the customer and authorizes the customer to send the data.</p><p>The event tracker can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the event tracker, call <a>DescribeEventTracker</a>.</p><note><p>The event tracker must be in the ACTIVE state before using the tracking ID.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListEventTrackers</a></p></li><li><p><a>DescribeEventTracker</a></p></li><li><p><a>DeleteEventTracker</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateEventTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateEventTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateEventTrackerRequest
 @see AWSPersonalizeCreateEventTrackerResponse
 */
- (AWSTask<AWSPersonalizeCreateEventTrackerResponse *> *)createEventTracker:(AWSPersonalizeCreateEventTrackerRequest *)request;

/**
 <p>Creates an event tracker that you use when sending event data to the specified dataset group using the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a> API.</p><p>When Amazon Personalize creates an event tracker, it also creates an <i>event-interactions</i> dataset in the dataset group associated with the event tracker. The event-interactions dataset stores the event data from the <code>PutEvents</code> call. The contents of this dataset are not available to the user.</p><note><p>Only one event tracker can be associated with a dataset group. You will get an error if you call <code>CreateEventTracker</code> using the same dataset group as an existing event tracker.</p></note><p>When you send event data you include your tracking ID. The tracking ID identifies the customer and authorizes the customer to send the data.</p><p>The event tracker can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the event tracker, call <a>DescribeEventTracker</a>.</p><note><p>The event tracker must be in the ACTIVE state before using the tracking ID.</p></note><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListEventTrackers</a></p></li><li><p><a>DescribeEventTracker</a></p></li><li><p><a>DeleteEventTracker</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateEventTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateEventTrackerRequest
 @see AWSPersonalizeCreateEventTrackerResponse
 */
- (void)createEventTracker:(AWSPersonalizeCreateEventTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateEventTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a recommendation filter. For more information, see Using Filters with Amazon Personalize.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateFilterRequest
 @see AWSPersonalizeCreateFilterResponse
 */
- (AWSTask<AWSPersonalizeCreateFilterResponse *> *)createFilter:(AWSPersonalizeCreateFilterRequest *)request;

/**
 <p>Creates a recommendation filter. For more information, see Using Filters with Amazon Personalize.</p>
 
 @param request A container for the necessary parameters to execute the CreateFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateFilterRequest
 @see AWSPersonalizeCreateFilterResponse
 */
- (void)createFilter:(AWSPersonalizeCreateFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Personalize schema from the specified schema string. The schema you create must be in Avro JSON format.</p><p>Amazon Personalize recognizes three schema variants. Each schema is associated with a dataset type and has a set of required field and keywords. You specify a schema when you call <a>CreateDataset</a>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSchemas</a></p></li><li><p><a>DescribeSchema</a></p></li><li><p><a>DeleteSchema</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateSchemaRequest
 @see AWSPersonalizeCreateSchemaResponse
 */
- (AWSTask<AWSPersonalizeCreateSchemaResponse *> *)createSchema:(AWSPersonalizeCreateSchemaRequest *)request;

/**
 <p>Creates an Amazon Personalize schema from the specified schema string. The schema you create must be in Avro JSON format.</p><p>Amazon Personalize recognizes three schema variants. Each schema is associated with a dataset type and has a set of required field and keywords. You specify a schema when you call <a>CreateDataset</a>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSchemas</a></p></li><li><p><a>DescribeSchema</a></p></li><li><p><a>DeleteSchema</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorLimitExceeded`.
 
 @see AWSPersonalizeCreateSchemaRequest
 @see AWSPersonalizeCreateSchemaResponse
 */
- (void)createSchema:(AWSPersonalizeCreateSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the configuration for training a model. A trained model is known as a solution. After the configuration is created, you train the model (create a solution) by calling the <a>CreateSolutionVersion</a> operation. Every time you call <code>CreateSolutionVersion</code>, a new version of the solution is created.</p><p>After creating a solution version, you check its accuracy by calling <a>GetSolutionMetrics</a>. When you are satisfied with the version, you deploy it using <a>CreateCampaign</a>. The campaign provides recommendations to a client through the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> API.</p><p>To train a model, Amazon Personalize requires training data and a recipe. The training data comes from the dataset group that you provide in the request. A recipe specifies the training algorithm and a feature transformation. You can specify one of the predefined recipes provided by Amazon Personalize. Alternatively, you can specify <code>performAutoML</code> and Amazon Personalize will analyze your data and select the optimum USER_PERSONALIZATION recipe for you.</p><p><b>Status</b></p><p>A solution can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the solution, call <a>DescribeSolution</a>. Wait until the status shows as ACTIVE before calling <code>CreateSolutionVersion</code>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSolutions</a></p></li><li><p><a>CreateSolutionVersion</a></p></li><li><p><a>DescribeSolution</a></p></li><li><p><a>DeleteSolution</a></p></li></ul><ul><li><p><a>ListSolutionVersions</a></p></li><li><p><a>DescribeSolutionVersion</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSolution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateSolutionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateSolutionRequest
 @see AWSPersonalizeCreateSolutionResponse
 */
- (AWSTask<AWSPersonalizeCreateSolutionResponse *> *)createSolution:(AWSPersonalizeCreateSolutionRequest *)request;

/**
 <p>Creates the configuration for training a model. A trained model is known as a solution. After the configuration is created, you train the model (create a solution) by calling the <a>CreateSolutionVersion</a> operation. Every time you call <code>CreateSolutionVersion</code>, a new version of the solution is created.</p><p>After creating a solution version, you check its accuracy by calling <a>GetSolutionMetrics</a>. When you are satisfied with the version, you deploy it using <a>CreateCampaign</a>. The campaign provides recommendations to a client through the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> API.</p><p>To train a model, Amazon Personalize requires training data and a recipe. The training data comes from the dataset group that you provide in the request. A recipe specifies the training algorithm and a feature transformation. You can specify one of the predefined recipes provided by Amazon Personalize. Alternatively, you can specify <code>performAutoML</code> and Amazon Personalize will analyze your data and select the optimum USER_PERSONALIZATION recipe for you.</p><p><b>Status</b></p><p>A solution can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>To get the status of the solution, call <a>DescribeSolution</a>. Wait until the status shows as ACTIVE before calling <code>CreateSolutionVersion</code>.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSolutions</a></p></li><li><p><a>CreateSolutionVersion</a></p></li><li><p><a>DescribeSolution</a></p></li><li><p><a>DeleteSolution</a></p></li></ul><ul><li><p><a>ListSolutionVersions</a></p></li><li><p><a>DescribeSolutionVersion</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSolution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceAlreadyExists`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorLimitExceeded`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateSolutionRequest
 @see AWSPersonalizeCreateSolutionResponse
 */
- (void)createSolution:(AWSPersonalizeCreateSolutionRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateSolutionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Trains or retrains an active solution. A solution is created using the <a>CreateSolution</a> operation and must be in the ACTIVE state before calling <code>CreateSolutionVersion</code>. A new version of the solution is created every time you call this operation.</p><p><b>Status</b></p><p>A solution version can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul><p>To get the status of the version, call <a>DescribeSolutionVersion</a>. Wait until the status shows as ACTIVE before calling <code>CreateCampaign</code>.</p><p>If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the job failed.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSolutionVersions</a></p></li><li><p><a>DescribeSolutionVersion</a></p></li></ul><ul><li><p><a>ListSolutions</a></p></li><li><p><a>CreateSolution</a></p></li><li><p><a>DescribeSolution</a></p></li><li><p><a>DeleteSolution</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSolutionVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeCreateSolutionVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateSolutionVersionRequest
 @see AWSPersonalizeCreateSolutionVersionResponse
 */
- (AWSTask<AWSPersonalizeCreateSolutionVersionResponse *> *)createSolutionVersion:(AWSPersonalizeCreateSolutionVersionRequest *)request;

/**
 <p>Trains or retrains an active solution. A solution is created using the <a>CreateSolution</a> operation and must be in the ACTIVE state before calling <code>CreateSolutionVersion</code>. A new version of the solution is created every time you call this operation.</p><p><b>Status</b></p><p>A solution version can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li></ul><p>To get the status of the version, call <a>DescribeSolutionVersion</a>. Wait until the status shows as ACTIVE before calling <code>CreateCampaign</code>.</p><p>If the status shows as CREATE FAILED, the response includes a <code>failureReason</code> key, which describes why the job failed.</p><p class="title"><b>Related APIs</b></p><ul><li><p><a>ListSolutionVersions</a></p></li><li><p><a>DescribeSolutionVersion</a></p></li></ul><ul><li><p><a>ListSolutions</a></p></li><li><p><a>CreateSolution</a></p></li><li><p><a>DescribeSolution</a></p></li><li><p><a>DeleteSolution</a></p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateSolutionVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeCreateSolutionVersionRequest
 @see AWSPersonalizeCreateSolutionVersionResponse
 */
- (void)createSolutionVersion:(AWSPersonalizeCreateSolutionVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeCreateSolutionVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a campaign by deleting the solution deployment. The solution that the campaign is based on is not deleted and can be redeployed when needed. A deleted campaign can no longer be specified in a <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> request. For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteCampaignRequest
 */
- (AWSTask *)deleteCampaign:(AWSPersonalizeDeleteCampaignRequest *)request;

/**
 <p>Removes a campaign by deleting the solution deployment. The solution that the campaign is based on is not deleted and can be redeployed when needed. A deleted campaign can no longer be specified in a <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> request. For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteCampaignRequest
 */
- (void)deleteCampaign:(AWSPersonalizeDeleteCampaignRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dataset. You can't delete a dataset if an associated <code>DatasetImportJob</code> or <code>SolutionVersion</code> is in the CREATE PENDING or IN PROGRESS state. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteDatasetRequest
 */
- (AWSTask *)deleteDataset:(AWSPersonalizeDeleteDatasetRequest *)request;

/**
 <p>Deletes a dataset. You can't delete a dataset if an associated <code>DatasetImportJob</code> or <code>SolutionVersion</code> is in the CREATE PENDING or IN PROGRESS state. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteDatasetRequest
 */
- (void)deleteDataset:(AWSPersonalizeDeleteDatasetRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a dataset group. Before you delete a dataset group, you must delete the following:</p><ul><li><p>All associated event trackers.</p></li><li><p>All associated solutions.</p></li><li><p>All datasets in the dataset group.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteDatasetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteDatasetGroupRequest
 */
- (AWSTask *)deleteDatasetGroup:(AWSPersonalizeDeleteDatasetGroupRequest *)request;

/**
 <p>Deletes a dataset group. Before you delete a dataset group, you must delete the following:</p><ul><li><p>All associated event trackers.</p></li><li><p>All associated solutions.</p></li><li><p>All datasets in the dataset group.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DeleteDatasetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteDatasetGroupRequest
 */
- (void)deleteDatasetGroup:(AWSPersonalizeDeleteDatasetGroupRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the event tracker. Does not delete the event-interactions dataset from the associated dataset group. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteEventTrackerRequest
 */
- (AWSTask *)deleteEventTracker:(AWSPersonalizeDeleteEventTrackerRequest *)request;

/**
 <p>Deletes the event tracker. Does not delete the event-interactions dataset from the associated dataset group. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteEventTrackerRequest
 */
- (void)deleteEventTracker:(AWSPersonalizeDeleteEventTrackerRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDeleteFilterRequest
 */
- (AWSTask *)deleteFilter:(AWSPersonalizeDeleteFilterRequest *)request;

/**
 <p>Deletes a filter.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDeleteFilterRequest
 */
- (void)deleteFilter:(AWSPersonalizeDeleteFilterRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a schema. Before deleting a schema, you must delete all datasets referencing the schema. For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteSchemaRequest
 */
- (AWSTask *)deleteSchema:(AWSPersonalizeDeleteSchemaRequest *)request;

/**
 <p>Deletes a schema. Before deleting a schema, you must delete all datasets referencing the schema. For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteSchemaRequest
 */
- (void)deleteSchema:(AWSPersonalizeDeleteSchemaRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes all versions of a solution and the <code>Solution</code> object itself. Before deleting a solution, you must delete all campaigns based on the solution. To determine what campaigns are using the solution, call <a>ListCampaigns</a> and supply the Amazon Resource Name (ARN) of the solution. You can't delete a solution if an associated <code>SolutionVersion</code> is in the CREATE PENDING or IN PROGRESS state. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSolution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteSolutionRequest
 */
- (AWSTask *)deleteSolution:(AWSPersonalizeDeleteSolutionRequest *)request;

/**
 <p>Deletes all versions of a solution and the <code>Solution</code> object itself. Before deleting a solution, you must delete all campaigns based on the solution. To determine what campaigns are using the solution, call <a>ListCampaigns</a> and supply the Amazon Resource Name (ARN) of the solution. You can't delete a solution if an associated <code>SolutionVersion</code> is in the CREATE PENDING or IN PROGRESS state. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteSolution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeDeleteSolutionRequest
 */
- (void)deleteSolution:(AWSPersonalizeDeleteSolutionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Describes the given algorithm.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeAlgorithmResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeAlgorithmRequest
 @see AWSPersonalizeDescribeAlgorithmResponse
 */
- (AWSTask<AWSPersonalizeDescribeAlgorithmResponse *> *)describeAlgorithm:(AWSPersonalizeDescribeAlgorithmRequest *)request;

/**
 <p>Describes the given algorithm.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAlgorithm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeAlgorithmRequest
 @see AWSPersonalizeDescribeAlgorithmResponse
 */
- (void)describeAlgorithm:(AWSPersonalizeDescribeAlgorithmRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeAlgorithmResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), status, input and output configurations, and the ARN of the solution version used to generate the recommendations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBatchInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeBatchInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeBatchInferenceJobRequest
 @see AWSPersonalizeDescribeBatchInferenceJobResponse
 */
- (AWSTask<AWSPersonalizeDescribeBatchInferenceJobResponse *> *)describeBatchInferenceJob:(AWSPersonalizeDescribeBatchInferenceJobRequest *)request;

/**
 <p>Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), status, input and output configurations, and the ARN of the solution version used to generate the recommendations.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBatchInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeBatchInferenceJobRequest
 @see AWSPersonalizeDescribeBatchInferenceJobResponse
 */
- (void)describeBatchInferenceJob:(AWSPersonalizeDescribeBatchInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeBatchInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the given campaign, including its status.</p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>When the <code>status</code> is <code>CREATE FAILED</code>, the response includes the <code>failureReason</code> key, which describes why.</p><p>For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeCampaignRequest
 @see AWSPersonalizeDescribeCampaignResponse
 */
- (AWSTask<AWSPersonalizeDescribeCampaignResponse *> *)describeCampaign:(AWSPersonalizeDescribeCampaignRequest *)request;

/**
 <p>Describes the given campaign, including its status.</p><p>A campaign can be in one of the following states:</p><ul><li><p>CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED</p></li><li><p>DELETE PENDING &gt; DELETE IN_PROGRESS</p></li></ul><p>When the <code>status</code> is <code>CREATE FAILED</code>, the response includes the <code>failureReason</code> key, which describes why.</p><p>For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeCampaignRequest
 @see AWSPersonalizeDescribeCampaignResponse
 */
- (void)describeCampaign:(AWSPersonalizeDescribeCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the given dataset. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataset service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetRequest
 @see AWSPersonalizeDescribeDatasetResponse
 */
- (AWSTask<AWSPersonalizeDescribeDatasetResponse *> *)describeDataset:(AWSPersonalizeDescribeDatasetRequest *)request;

/**
 <p>Describes the given dataset. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataset service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetRequest
 @see AWSPersonalizeDescribeDatasetResponse
 */
- (void)describeDataset:(AWSPersonalizeDescribeDatasetRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeDatasetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the given dataset group. For more information on dataset groups, see <a>CreateDatasetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDatasetGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeDatasetGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetGroupRequest
 @see AWSPersonalizeDescribeDatasetGroupResponse
 */
- (AWSTask<AWSPersonalizeDescribeDatasetGroupResponse *> *)describeDatasetGroup:(AWSPersonalizeDescribeDatasetGroupRequest *)request;

/**
 <p>Describes the given dataset group. For more information on dataset groups, see <a>CreateDatasetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDatasetGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetGroupRequest
 @see AWSPersonalizeDescribeDatasetGroupResponse
 */
- (void)describeDatasetGroup:(AWSPersonalizeDescribeDatasetGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeDatasetGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the dataset import job created by <a>CreateDatasetImportJob</a>, including the import job status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDatasetImportJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeDatasetImportJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetImportJobRequest
 @see AWSPersonalizeDescribeDatasetImportJobResponse
 */
- (AWSTask<AWSPersonalizeDescribeDatasetImportJobResponse *> *)describeDatasetImportJob:(AWSPersonalizeDescribeDatasetImportJobRequest *)request;

/**
 <p>Describes the dataset import job created by <a>CreateDatasetImportJob</a>, including the import job status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDatasetImportJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeDatasetImportJobRequest
 @see AWSPersonalizeDescribeDatasetImportJobResponse
 */
- (void)describeDatasetImportJob:(AWSPersonalizeDescribeDatasetImportJobRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeDatasetImportJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an event tracker. The response includes the <code>trackingId</code> and <code>status</code> of the event tracker. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventTracker service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeEventTrackerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeEventTrackerRequest
 @see AWSPersonalizeDescribeEventTrackerResponse
 */
- (AWSTask<AWSPersonalizeDescribeEventTrackerResponse *> *)describeEventTracker:(AWSPersonalizeDescribeEventTrackerRequest *)request;

/**
 <p>Describes an event tracker. The response includes the <code>trackingId</code> and <code>status</code> of the event tracker. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEventTracker service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeEventTrackerRequest
 @see AWSPersonalizeDescribeEventTrackerResponse
 */
- (void)describeEventTracker:(AWSPersonalizeDescribeEventTrackerRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeEventTrackerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the given feature transformation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFeatureTransformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeFeatureTransformationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeFeatureTransformationRequest
 @see AWSPersonalizeDescribeFeatureTransformationResponse
 */
- (AWSTask<AWSPersonalizeDescribeFeatureTransformationResponse *> *)describeFeatureTransformation:(AWSPersonalizeDescribeFeatureTransformationRequest *)request;

/**
 <p>Describes the given feature transformation.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFeatureTransformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeFeatureTransformationRequest
 @see AWSPersonalizeDescribeFeatureTransformationResponse
 */
- (void)describeFeatureTransformation:(AWSPersonalizeDescribeFeatureTransformationRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeFeatureTransformationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a filter's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFilter service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeFilterResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeFilterRequest
 @see AWSPersonalizeDescribeFilterResponse
 */
- (AWSTask<AWSPersonalizeDescribeFilterResponse *> *)describeFilter:(AWSPersonalizeDescribeFilterRequest *)request;

/**
 <p>Describes a filter's properties.</p>
 
 @param request A container for the necessary parameters to execute the DescribeFilter service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeFilterRequest
 @see AWSPersonalizeDescribeFilterResponse
 */
- (void)describeFilter:(AWSPersonalizeDescribeFilterRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeFilterResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a recipe.</p><p>A recipe contains three items:</p><ul><li><p>An algorithm that trains a model.</p></li><li><p>Hyperparameters that govern the training.</p></li><li><p>Feature transformation information for modifying the input data before training.</p></li></ul><p>Amazon Personalize provides a set of predefined recipes. You specify a recipe when you create a solution with the <a>CreateSolution</a> API. <code>CreateSolution</code> trains a model by using the algorithm in the specified recipe and a training dataset. The solution, when deployed as a campaign, can provide recommendations using the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecipe service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeRecipeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeRecipeRequest
 @see AWSPersonalizeDescribeRecipeResponse
 */
- (AWSTask<AWSPersonalizeDescribeRecipeResponse *> *)describeRecipe:(AWSPersonalizeDescribeRecipeRequest *)request;

/**
 <p>Describes a recipe.</p><p>A recipe contains three items:</p><ul><li><p>An algorithm that trains a model.</p></li><li><p>Hyperparameters that govern the training.</p></li><li><p>Feature transformation information for modifying the input data before training.</p></li></ul><p>Amazon Personalize provides a set of predefined recipes. You specify a recipe when you create a solution with the <a>CreateSolution</a> API. <code>CreateSolution</code> trains a model by using the algorithm in the specified recipe and a training dataset. The solution, when deployed as a campaign, can provide recommendations using the <a href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a> API.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRecipe service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeRecipeRequest
 @see AWSPersonalizeDescribeRecipeResponse
 */
- (void)describeRecipe:(AWSPersonalizeDescribeRecipeRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeRecipeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a schema. For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSchema service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeSchemaResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSchemaRequest
 @see AWSPersonalizeDescribeSchemaResponse
 */
- (AWSTask<AWSPersonalizeDescribeSchemaResponse *> *)describeSchema:(AWSPersonalizeDescribeSchemaRequest *)request;

/**
 <p>Describes a schema. For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSchema service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSchemaRequest
 @see AWSPersonalizeDescribeSchemaResponse
 */
- (void)describeSchema:(AWSPersonalizeDescribeSchemaRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeSchemaResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a solution. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSolution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeSolutionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSolutionRequest
 @see AWSPersonalizeDescribeSolutionResponse
 */
- (AWSTask<AWSPersonalizeDescribeSolutionResponse *> *)describeSolution:(AWSPersonalizeDescribeSolutionRequest *)request;

/**
 <p>Describes a solution. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSolution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSolutionRequest
 @see AWSPersonalizeDescribeSolutionResponse
 */
- (void)describeSolution:(AWSPersonalizeDescribeSolutionRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeSolutionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a specific version of a solution. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSolutionVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeDescribeSolutionVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSolutionVersionRequest
 @see AWSPersonalizeDescribeSolutionVersionResponse
 */
- (AWSTask<AWSPersonalizeDescribeSolutionVersionResponse *> *)describeSolutionVersion:(AWSPersonalizeDescribeSolutionVersionRequest *)request;

/**
 <p>Describes a specific version of a solution. For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSolutionVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`.
 
 @see AWSPersonalizeDescribeSolutionVersionRequest
 @see AWSPersonalizeDescribeSolutionVersionResponse
 */
- (void)describeSolutionVersion:(AWSPersonalizeDescribeSolutionVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeDescribeSolutionVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the metrics for the specified solution version.</p>
 
 @param request A container for the necessary parameters to execute the GetSolutionMetrics service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeGetSolutionMetricsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeGetSolutionMetricsRequest
 @see AWSPersonalizeGetSolutionMetricsResponse
 */
- (AWSTask<AWSPersonalizeGetSolutionMetricsResponse *> *)getSolutionMetrics:(AWSPersonalizeGetSolutionMetricsRequest *)request;

/**
 <p>Gets the metrics for the specified solution version.</p>
 
 @param request A container for the necessary parameters to execute the GetSolutionMetrics service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeGetSolutionMetricsRequest
 @see AWSPersonalizeGetSolutionMetricsResponse
 */
- (void)getSolutionMetrics:(AWSPersonalizeGetSolutionMetricsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeGetSolutionMetricsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the batch inference jobs that have been performed off of a solution version.</p>
 
 @param request A container for the necessary parameters to execute the ListBatchInferenceJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListBatchInferenceJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListBatchInferenceJobsRequest
 @see AWSPersonalizeListBatchInferenceJobsResponse
 */
- (AWSTask<AWSPersonalizeListBatchInferenceJobsResponse *> *)listBatchInferenceJobs:(AWSPersonalizeListBatchInferenceJobsRequest *)request;

/**
 <p>Gets a list of the batch inference jobs that have been performed off of a solution version.</p>
 
 @param request A container for the necessary parameters to execute the ListBatchInferenceJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListBatchInferenceJobsRequest
 @see AWSPersonalizeListBatchInferenceJobsResponse
 */
- (void)listBatchInferenceJobs:(AWSPersonalizeListBatchInferenceJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListBatchInferenceJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of campaigns that use the given solution. When a solution is not specified, all the campaigns associated with the account are listed. The response provides the properties for each campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCampaigns service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListCampaignsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListCampaignsRequest
 @see AWSPersonalizeListCampaignsResponse
 */
- (AWSTask<AWSPersonalizeListCampaignsResponse *> *)listCampaigns:(AWSPersonalizeListCampaignsRequest *)request;

/**
 <p>Returns a list of campaigns that use the given solution. When a solution is not specified, all the campaigns associated with the account are listed. The response provides the properties for each campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListCampaigns service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListCampaignsRequest
 @see AWSPersonalizeListCampaignsResponse
 */
- (void)listCampaigns:(AWSPersonalizeListCampaignsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListCampaignsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of dataset groups. The response provides the properties for each dataset group, including the Amazon Resource Name (ARN). For more information on dataset groups, see <a>CreateDatasetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasetGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListDatasetGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetGroupsRequest
 @see AWSPersonalizeListDatasetGroupsResponse
 */
- (AWSTask<AWSPersonalizeListDatasetGroupsResponse *> *)listDatasetGroups:(AWSPersonalizeListDatasetGroupsRequest *)request;

/**
 <p>Returns a list of dataset groups. The response provides the properties for each dataset group, including the Amazon Resource Name (ARN). For more information on dataset groups, see <a>CreateDatasetGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasetGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetGroupsRequest
 @see AWSPersonalizeListDatasetGroupsResponse
 */
- (void)listDatasetGroups:(AWSPersonalizeListDatasetGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListDatasetGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of dataset import jobs that use the given dataset. When a dataset is not specified, all the dataset import jobs associated with the account are listed. The response provides the properties for each dataset import job, including the Amazon Resource Name (ARN). For more information on dataset import jobs, see <a>CreateDatasetImportJob</a>. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasetImportJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListDatasetImportJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetImportJobsRequest
 @see AWSPersonalizeListDatasetImportJobsResponse
 */
- (AWSTask<AWSPersonalizeListDatasetImportJobsResponse *> *)listDatasetImportJobs:(AWSPersonalizeListDatasetImportJobsRequest *)request;

/**
 <p>Returns a list of dataset import jobs that use the given dataset. When a dataset is not specified, all the dataset import jobs associated with the account are listed. The response provides the properties for each dataset import job, including the Amazon Resource Name (ARN). For more information on dataset import jobs, see <a>CreateDatasetImportJob</a>. For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasetImportJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetImportJobsRequest
 @see AWSPersonalizeListDatasetImportJobsResponse
 */
- (void)listDatasetImportJobs:(AWSPersonalizeListDatasetImportJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListDatasetImportJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of datasets contained in the given dataset group. The response provides the properties for each dataset, including the Amazon Resource Name (ARN). For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListDatasetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetsRequest
 @see AWSPersonalizeListDatasetsResponse
 */
- (AWSTask<AWSPersonalizeListDatasetsResponse *> *)listDatasets:(AWSPersonalizeListDatasetsRequest *)request;

/**
 <p>Returns the list of datasets contained in the given dataset group. The response provides the properties for each dataset, including the Amazon Resource Name (ARN). For more information on datasets, see <a>CreateDataset</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListDatasetsRequest
 @see AWSPersonalizeListDatasetsResponse
 */
- (void)listDatasets:(AWSPersonalizeListDatasetsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListDatasetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of event trackers associated with the account. The response provides the properties for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListEventTrackers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListEventTrackersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListEventTrackersRequest
 @see AWSPersonalizeListEventTrackersResponse
 */
- (AWSTask<AWSPersonalizeListEventTrackersResponse *> *)listEventTrackers:(AWSPersonalizeListEventTrackersRequest *)request;

/**
 <p>Returns the list of event trackers associated with the account. The response provides the properties for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. For more information on event trackers, see <a>CreateEventTracker</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListEventTrackers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListEventTrackersRequest
 @see AWSPersonalizeListEventTrackersResponse
 */
- (void)listEventTrackers:(AWSPersonalizeListEventTrackersRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListEventTrackersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all filters that belong to a given dataset group.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListFiltersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListFiltersRequest
 @see AWSPersonalizeListFiltersResponse
 */
- (AWSTask<AWSPersonalizeListFiltersResponse *> *)listFilters:(AWSPersonalizeListFiltersRequest *)request;

/**
 <p>Lists all filters that belong to a given dataset group.</p>
 
 @param request A container for the necessary parameters to execute the ListFilters service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListFiltersRequest
 @see AWSPersonalizeListFiltersResponse
 */
- (void)listFilters:(AWSPersonalizeListFiltersRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListFiltersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of available recipes. The response provides the properties for each recipe, including the recipe's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the ListRecipes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListRecipesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListRecipesRequest
 @see AWSPersonalizeListRecipesResponse
 */
- (AWSTask<AWSPersonalizeListRecipesResponse *> *)listRecipes:(AWSPersonalizeListRecipesRequest *)request;

/**
 <p>Returns a list of available recipes. The response provides the properties for each recipe, including the recipe's Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the ListRecipes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListRecipesRequest
 @see AWSPersonalizeListRecipesResponse
 */
- (void)listRecipes:(AWSPersonalizeListRecipesRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListRecipesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the list of schemas associated with the account. The response provides the properties for each schema, including the Amazon Resource Name (ARN). For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemas service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListSchemasResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSchemasRequest
 @see AWSPersonalizeListSchemasResponse
 */
- (AWSTask<AWSPersonalizeListSchemasResponse *> *)listSchemas:(AWSPersonalizeListSchemasRequest *)request;

/**
 <p>Returns the list of schemas associated with the account. The response provides the properties for each schema, including the Amazon Resource Name (ARN). For more information on schemas, see <a>CreateSchema</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSchemas service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSchemasRequest
 @see AWSPersonalizeListSchemasResponse
 */
- (void)listSchemas:(AWSPersonalizeListSchemasRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListSchemasResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of solution versions for the given solution. When a solution is not specified, all the solution versions associated with the account are listed. The response provides the properties for each solution version, including the Amazon Resource Name (ARN). For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSolutionVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListSolutionVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSolutionVersionsRequest
 @see AWSPersonalizeListSolutionVersionsResponse
 */
- (AWSTask<AWSPersonalizeListSolutionVersionsResponse *> *)listSolutionVersions:(AWSPersonalizeListSolutionVersionsRequest *)request;

/**
 <p>Returns a list of solution versions for the given solution. When a solution is not specified, all the solution versions associated with the account are listed. The response provides the properties for each solution version, including the Amazon Resource Name (ARN). For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSolutionVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSolutionVersionsRequest
 @see AWSPersonalizeListSolutionVersionsResponse
 */
- (void)listSolutionVersions:(AWSPersonalizeListSolutionVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListSolutionVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of solutions that use the given dataset group. When a dataset group is not specified, all the solutions associated with the account are listed. The response provides the properties for each solution, including the Amazon Resource Name (ARN). For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSolutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeListSolutionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSolutionsRequest
 @see AWSPersonalizeListSolutionsResponse
 */
- (AWSTask<AWSPersonalizeListSolutionsResponse *> *)listSolutions:(AWSPersonalizeListSolutionsRequest *)request;

/**
 <p>Returns a list of solutions that use the given dataset group. When a dataset group is not specified, all the solutions associated with the account are listed. The response provides the properties for each solution, including the Amazon Resource Name (ARN). For more information on solutions, see <a>CreateSolution</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListSolutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorInvalidNextToken`.
 
 @see AWSPersonalizeListSolutionsRequest
 @see AWSPersonalizeListSolutionsResponse
 */
- (void)listSolutions:(AWSPersonalizeListSolutionsRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeListSolutionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a campaign by either deploying a new solution or changing the value of the campaign's <code>minProvisionedTPS</code> parameter.</p><p>To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check the campaign status using the <a>DescribeCampaign</a> API.</p><note><p>You must wait until the <code>status</code> of the updated campaign is <code>ACTIVE</code> before asking the campaign for recommendations.</p></note><p>For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSPersonalizeUpdateCampaignResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeUpdateCampaignRequest
 @see AWSPersonalizeUpdateCampaignResponse
 */
- (AWSTask<AWSPersonalizeUpdateCampaignResponse *> *)updateCampaign:(AWSPersonalizeUpdateCampaignRequest *)request;

/**
 <p>Updates a campaign by either deploying a new solution or changing the value of the campaign's <code>minProvisionedTPS</code> parameter.</p><p>To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check the campaign status using the <a>DescribeCampaign</a> API.</p><note><p>You must wait until the <code>status</code> of the updated campaign is <code>ACTIVE</code> before asking the campaign for recommendations.</p></note><p>For more information on campaigns, see <a>CreateCampaign</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateCampaign service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSPersonalizeErrorDomain` domain and the following error code: `AWSPersonalizeErrorInvalidInput`, `AWSPersonalizeErrorResourceNotFound`, `AWSPersonalizeErrorResourceInUse`.
 
 @see AWSPersonalizeUpdateCampaignRequest
 @see AWSPersonalizeUpdateCampaignResponse
 */
- (void)updateCampaign:(AWSPersonalizeUpdateCampaignRequest *)request completionHandler:(void (^ _Nullable)(AWSPersonalizeUpdateCampaignResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
