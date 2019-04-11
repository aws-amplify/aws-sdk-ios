//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSMachineLearningModel.h"
#import "AWSMachineLearningResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSMachineLearning
FOUNDATION_EXPORT NSString *const AWSMachineLearningSDKVersion;

/**
 Definition of the public APIs exposed by Amazon Machine Learning
 */
@interface AWSMachineLearning : AWSService

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

     let MachineLearning = AWSMachineLearning.default()

 *Objective-C*

     AWSMachineLearning *MachineLearning = [AWSMachineLearning defaultMachineLearning];

 @return The default service client.
 */
+ (instancetype)defaultMachineLearning;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMachineLearning.register(with: configuration!, forKey: "USWest2MachineLearning")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:@"USWest2MachineLearning"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let MachineLearning = AWSMachineLearning(forKey: "USWest2MachineLearning")

 *Objective-C*

     AWSMachineLearning *MachineLearning = [AWSMachineLearning MachineLearningForKey:@"USWest2MachineLearning"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerMachineLearningWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerMachineLearningWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSMachineLearning.register(with: configuration!, forKey: "USWest2MachineLearning")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:@"USWest2MachineLearning"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let MachineLearning = AWSMachineLearning(forKey: "USWest2MachineLearning")

 *Objective-C*

     AWSMachineLearning *MachineLearning = [AWSMachineLearning MachineLearningForKey:@"USWest2MachineLearning"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)MachineLearningForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeMachineLearningForKey:(NSString *)key;

/**
 <p>Adds one or more tags to an object, up to a limit of 10. Each tag consists of a key and an optional value. If you add a tag using a key that is already associated with the ML object, <code>AddTags</code> updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningAddTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInvalidTag`, `AWSMachineLearningErrorTagLimitExceeded`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningAddTagsInput
 @see AWSMachineLearningAddTagsOutput
 */
- (AWSTask<AWSMachineLearningAddTagsOutput *> *)addTags:(AWSMachineLearningAddTagsInput *)request;

/**
 <p>Adds one or more tags to an object, up to a limit of 10. Each tag consists of a key and an optional value. If you add a tag using a key that is already associated with the ML object, <code>AddTags</code> updates the tag's value.</p>
 
 @param request A container for the necessary parameters to execute the AddTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInvalidTag`, `AWSMachineLearningErrorTagLimitExceeded`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningAddTagsInput
 @see AWSMachineLearningAddTagsOutput
 */
- (void)addTags:(AWSMachineLearningAddTagsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningAddTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates predictions for a group of observations. The observations to process exist in one or more data files referenced by a <code>DataSource</code>. This operation creates a new <code>BatchPrediction</code>, and uses an <code>MLModel</code> and the data files referenced by the <code>DataSource</code> as information sources. </p><p><code>CreateBatchPrediction</code> is an asynchronous operation. In response to <code>CreateBatchPrediction</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>BatchPrediction</code> status to <code>PENDING</code>. After the <code>BatchPrediction</code> completes, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can poll for status updates by using the <a>GetBatchPrediction</a> operation and checking the <code>Status</code> parameter of the result. After the <code>COMPLETED</code> status appears, the results are available in the location specified by the <code>OutputUri</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the CreateBatchPrediction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateBatchPredictionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateBatchPredictionInput
 @see AWSMachineLearningCreateBatchPredictionOutput
 */
- (AWSTask<AWSMachineLearningCreateBatchPredictionOutput *> *)createBatchPrediction:(AWSMachineLearningCreateBatchPredictionInput *)request;

/**
 <p>Generates predictions for a group of observations. The observations to process exist in one or more data files referenced by a <code>DataSource</code>. This operation creates a new <code>BatchPrediction</code>, and uses an <code>MLModel</code> and the data files referenced by the <code>DataSource</code> as information sources. </p><p><code>CreateBatchPrediction</code> is an asynchronous operation. In response to <code>CreateBatchPrediction</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>BatchPrediction</code> status to <code>PENDING</code>. After the <code>BatchPrediction</code> completes, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can poll for status updates by using the <a>GetBatchPrediction</a> operation and checking the <code>Status</code> parameter of the result. After the <code>COMPLETED</code> status appears, the results are available in the location specified by the <code>OutputUri</code> parameter.</p>
 
 @param request A container for the necessary parameters to execute the CreateBatchPrediction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateBatchPredictionInput
 @see AWSMachineLearningCreateBatchPredictionOutput
 */
- (void)createBatchPrediction:(AWSMachineLearningCreateBatchPredictionInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateBatchPredictionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <code>DataSource</code> object from an <a href="http://aws.amazon.com/rds/"> Amazon Relational Database Service</a> (Amazon RDS). A <code>DataSource</code> references data that can be used to perform <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromRDS</code> is an asynchronous operation. In response to <code>CreateDataSourceFromRDS</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> is created and ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in the <code>COMPLETED</code> or <code>PENDING</code> state can be used only to perform <code>&gt;CreateMLModel</code>&gt;, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML cannot accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromRDS service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateDataSourceFromRDSOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromRDSInput
 @see AWSMachineLearningCreateDataSourceFromRDSOutput
 */
- (AWSTask<AWSMachineLearningCreateDataSourceFromRDSOutput *> *)createDataSourceFromRDS:(AWSMachineLearningCreateDataSourceFromRDSInput *)request;

/**
 <p>Creates a <code>DataSource</code> object from an <a href="http://aws.amazon.com/rds/"> Amazon Relational Database Service</a> (Amazon RDS). A <code>DataSource</code> references data that can be used to perform <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromRDS</code> is an asynchronous operation. In response to <code>CreateDataSourceFromRDS</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> is created and ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in the <code>COMPLETED</code> or <code>PENDING</code> state can be used only to perform <code>&gt;CreateMLModel</code>&gt;, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML cannot accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromRDS service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromRDSInput
 @see AWSMachineLearningCreateDataSourceFromRDSOutput
 */
- (void)createDataSourceFromRDS:(AWSMachineLearningCreateDataSourceFromRDSInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateDataSourceFromRDSOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <code>DataSource</code> from a database hosted on an Amazon Redshift cluster. A <code>DataSource</code> references data that can be used to perform either <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromRedshift</code> is an asynchronous operation. In response to <code>CreateDataSourceFromRedshift</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> is created and ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in <code>COMPLETED</code> or <code>PENDING</code> states can be used to perform only <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML can't accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p><p>The observations should be contained in the database hosted on an Amazon Redshift cluster and should be specified by a <code>SelectSqlQuery</code> query. Amazon ML executes an <code>Unload</code> command in Amazon Redshift to transfer the result set of the <code>SelectSqlQuery</code> query to <code>S3StagingLocation</code>.</p><p>After the <code>DataSource</code> has been created, it's ready for use in evaluations and batch predictions. If you plan to use the <code>DataSource</code> to train an <code>MLModel</code>, the <code>DataSource</code> also requires a recipe. A recipe describes how each input variable will be used in training an <code>MLModel</code>. Will the variable be included or excluded from training? Will the variable be manipulated; for example, will it be combined with another variable or will it be split apart into word combinations? The recipe provides answers to these questions.</p><?oxy_insert_start author="laurama" timestamp="20160406T153842-0700"><p>You can't change an existing datasource, but you can copy and modify the settings from an existing Amazon Redshift datasource to create a new datasource. To do so, call <code>GetDataSource</code> for an existing datasource and copy the values to a <code>CreateDataSource</code> call. Change the settings that you want to change and make sure that all required fields have the appropriate values.</p><?oxy_insert_end>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromRedshift service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateDataSourceFromRedshiftOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromRedshiftInput
 @see AWSMachineLearningCreateDataSourceFromRedshiftOutput
 */
- (AWSTask<AWSMachineLearningCreateDataSourceFromRedshiftOutput *> *)createDataSourceFromRedshift:(AWSMachineLearningCreateDataSourceFromRedshiftInput *)request;

/**
 <p>Creates a <code>DataSource</code> from a database hosted on an Amazon Redshift cluster. A <code>DataSource</code> references data that can be used to perform either <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromRedshift</code> is an asynchronous operation. In response to <code>CreateDataSourceFromRedshift</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> is created and ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in <code>COMPLETED</code> or <code>PENDING</code> states can be used to perform only <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML can't accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p><p>The observations should be contained in the database hosted on an Amazon Redshift cluster and should be specified by a <code>SelectSqlQuery</code> query. Amazon ML executes an <code>Unload</code> command in Amazon Redshift to transfer the result set of the <code>SelectSqlQuery</code> query to <code>S3StagingLocation</code>.</p><p>After the <code>DataSource</code> has been created, it's ready for use in evaluations and batch predictions. If you plan to use the <code>DataSource</code> to train an <code>MLModel</code>, the <code>DataSource</code> also requires a recipe. A recipe describes how each input variable will be used in training an <code>MLModel</code>. Will the variable be included or excluded from training? Will the variable be manipulated; for example, will it be combined with another variable or will it be split apart into word combinations? The recipe provides answers to these questions.</p><?oxy_insert_start author="laurama" timestamp="20160406T153842-0700"><p>You can't change an existing datasource, but you can copy and modify the settings from an existing Amazon Redshift datasource to create a new datasource. To do so, call <code>GetDataSource</code> for an existing datasource and copy the values to a <code>CreateDataSource</code> call. Change the settings that you want to change and make sure that all required fields have the appropriate values.</p><?oxy_insert_end>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromRedshift service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromRedshiftInput
 @see AWSMachineLearningCreateDataSourceFromRedshiftOutput
 */
- (void)createDataSourceFromRedshift:(AWSMachineLearningCreateDataSourceFromRedshiftInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateDataSourceFromRedshiftOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <code>DataSource</code> object. A <code>DataSource</code> references data that can be used to perform <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromS3</code> is an asynchronous operation. In response to <code>CreateDataSourceFromS3</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> has been created and is ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in the <code>COMPLETED</code> or <code>PENDING</code> state can be used to perform only <code>CreateMLModel</code>, <code>CreateEvaluation</code> or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML can't accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p><p>The observation data used in a <code>DataSource</code> should be ready to use; that is, it should have a consistent structure, and missing data values should be kept to a minimum. The observation data must reside in one or more .csv files in an Amazon Simple Storage Service (Amazon S3) location, along with a schema that describes the data items by name and type. The same schema must be used for all of the data files referenced by the <code>DataSource</code>. </p><p>After the <code>DataSource</code> has been created, it's ready to use in evaluations and batch predictions. If you plan to use the <code>DataSource</code> to train an <code>MLModel</code>, the <code>DataSource</code> also needs a recipe. A recipe describes how each input variable will be used in training an <code>MLModel</code>. Will the variable be included or excluded from training? Will the variable be manipulated; for example, will it be combined with another variable or will it be split apart into word combinations? The recipe provides answers to these questions.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromS3 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateDataSourceFromS3Output`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromS3Input
 @see AWSMachineLearningCreateDataSourceFromS3Output
 */
- (AWSTask<AWSMachineLearningCreateDataSourceFromS3Output *> *)createDataSourceFromS3:(AWSMachineLearningCreateDataSourceFromS3Input *)request;

/**
 <p>Creates a <code>DataSource</code> object. A <code>DataSource</code> references data that can be used to perform <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code> operations.</p><p><code>CreateDataSourceFromS3</code> is an asynchronous operation. In response to <code>CreateDataSourceFromS3</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>DataSource</code> status to <code>PENDING</code>. After the <code>DataSource</code> has been created and is ready for use, Amazon ML sets the <code>Status</code> parameter to <code>COMPLETED</code>. <code>DataSource</code> in the <code>COMPLETED</code> or <code>PENDING</code> state can be used to perform only <code>CreateMLModel</code>, <code>CreateEvaluation</code> or <code>CreateBatchPrediction</code> operations. </p><p> If Amazon ML can't accept the input source, it sets the <code>Status</code> parameter to <code>FAILED</code> and includes an error message in the <code>Message</code> attribute of the <code>GetDataSource</code> operation response. </p><p>The observation data used in a <code>DataSource</code> should be ready to use; that is, it should have a consistent structure, and missing data values should be kept to a minimum. The observation data must reside in one or more .csv files in an Amazon Simple Storage Service (Amazon S3) location, along with a schema that describes the data items by name and type. The same schema must be used for all of the data files referenced by the <code>DataSource</code>. </p><p>After the <code>DataSource</code> has been created, it's ready to use in evaluations and batch predictions. If you plan to use the <code>DataSource</code> to train an <code>MLModel</code>, the <code>DataSource</code> also needs a recipe. A recipe describes how each input variable will be used in training an <code>MLModel</code>. Will the variable be included or excluded from training? Will the variable be manipulated; for example, will it be combined with another variable or will it be split apart into word combinations? The recipe provides answers to these questions.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataSourceFromS3 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateDataSourceFromS3Input
 @see AWSMachineLearningCreateDataSourceFromS3Output
 */
- (void)createDataSourceFromS3:(AWSMachineLearningCreateDataSourceFromS3Input *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateDataSourceFromS3Output * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new <code>Evaluation</code> of an <code>MLModel</code>. An <code>MLModel</code> is evaluated on a set of observations associated to a <code>DataSource</code>. Like a <code>DataSource</code> for an <code>MLModel</code>, the <code>DataSource</code> for an <code>Evaluation</code> contains values for the <code>Target Variable</code>. The <code>Evaluation</code> compares the predicted result for each observation to the actual outcome and provides a summary so that you know how effective the <code>MLModel</code> functions on the test data. Evaluation generates a relevant performance metric, such as BinaryAUC, RegressionRMSE or MulticlassAvgFScore based on the corresponding <code>MLModelType</code>: <code>BINARY</code>, <code>REGRESSION</code> or <code>MULTICLASS</code>. </p><p><code>CreateEvaluation</code> is an asynchronous operation. In response to <code>CreateEvaluation</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the evaluation status to <code>PENDING</code>. After the <code>Evaluation</code> is created and ready for use, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can use the <code>GetEvaluation</code> operation to check progress of the evaluation during the creation operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateEvaluationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateEvaluationInput
 @see AWSMachineLearningCreateEvaluationOutput
 */
- (AWSTask<AWSMachineLearningCreateEvaluationOutput *> *)createEvaluation:(AWSMachineLearningCreateEvaluationInput *)request;

/**
 <p>Creates a new <code>Evaluation</code> of an <code>MLModel</code>. An <code>MLModel</code> is evaluated on a set of observations associated to a <code>DataSource</code>. Like a <code>DataSource</code> for an <code>MLModel</code>, the <code>DataSource</code> for an <code>Evaluation</code> contains values for the <code>Target Variable</code>. The <code>Evaluation</code> compares the predicted result for each observation to the actual outcome and provides a summary so that you know how effective the <code>MLModel</code> functions on the test data. Evaluation generates a relevant performance metric, such as BinaryAUC, RegressionRMSE or MulticlassAvgFScore based on the corresponding <code>MLModelType</code>: <code>BINARY</code>, <code>REGRESSION</code> or <code>MULTICLASS</code>. </p><p><code>CreateEvaluation</code> is an asynchronous operation. In response to <code>CreateEvaluation</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the evaluation status to <code>PENDING</code>. After the <code>Evaluation</code> is created and ready for use, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can use the <code>GetEvaluation</code> operation to check progress of the evaluation during the creation operation.</p>
 
 @param request A container for the necessary parameters to execute the CreateEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateEvaluationInput
 @see AWSMachineLearningCreateEvaluationOutput
 */
- (void)createEvaluation:(AWSMachineLearningCreateEvaluationInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateEvaluationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new <code>MLModel</code> using the <code>DataSource</code> and the recipe as information sources. </p><p>An <code>MLModel</code> is nearly immutable. Users can update only the <code>MLModelName</code> and the <code>ScoreThreshold</code> in an <code>MLModel</code> without creating a new <code>MLModel</code>. </p><p><code>CreateMLModel</code> is an asynchronous operation. In response to <code>CreateMLModel</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>MLModel</code> status to <code>PENDING</code>. After the <code>MLModel</code> has been created and ready is for use, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can use the <code>GetMLModel</code> operation to check the progress of the <code>MLModel</code> during the creation operation.</p><p><code>CreateMLModel</code> requires a <code>DataSource</code> with computed statistics, which can be created by setting <code>ComputeStatistics</code> to <code>true</code> in <code>CreateDataSourceFromRDS</code>, <code>CreateDataSourceFromS3</code>, or <code>CreateDataSourceFromRedshift</code> operations. </p>
 
 @param request A container for the necessary parameters to execute the CreateMLModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateMLModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateMLModelInput
 @see AWSMachineLearningCreateMLModelOutput
 */
- (AWSTask<AWSMachineLearningCreateMLModelOutput *> *)createMLModel:(AWSMachineLearningCreateMLModelInput *)request;

/**
 <p>Creates a new <code>MLModel</code> using the <code>DataSource</code> and the recipe as information sources. </p><p>An <code>MLModel</code> is nearly immutable. Users can update only the <code>MLModelName</code> and the <code>ScoreThreshold</code> in an <code>MLModel</code> without creating a new <code>MLModel</code>. </p><p><code>CreateMLModel</code> is an asynchronous operation. In response to <code>CreateMLModel</code>, Amazon Machine Learning (Amazon ML) immediately returns and sets the <code>MLModel</code> status to <code>PENDING</code>. After the <code>MLModel</code> has been created and ready is for use, Amazon ML sets the status to <code>COMPLETED</code>. </p><p>You can use the <code>GetMLModel</code> operation to check the progress of the <code>MLModel</code> during the creation operation.</p><p><code>CreateMLModel</code> requires a <code>DataSource</code> with computed statistics, which can be created by setting <code>ComputeStatistics</code> to <code>true</code> in <code>CreateDataSourceFromRDS</code>, <code>CreateDataSourceFromS3</code>, or <code>CreateDataSourceFromRedshift</code> operations. </p>
 
 @param request A container for the necessary parameters to execute the CreateMLModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorIdempotentParameterMismatch`.
 
 @see AWSMachineLearningCreateMLModelInput
 @see AWSMachineLearningCreateMLModelOutput
 */
- (void)createMLModel:(AWSMachineLearningCreateMLModelInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateMLModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a real-time endpoint for the <code>MLModel</code>. The endpoint contains the URI of the <code>MLModel</code>; that is, the location to send real-time prediction requests for the specified <code>MLModel</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRealtimeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningCreateRealtimeEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningCreateRealtimeEndpointInput
 @see AWSMachineLearningCreateRealtimeEndpointOutput
 */
- (AWSTask<AWSMachineLearningCreateRealtimeEndpointOutput *> *)createRealtimeEndpoint:(AWSMachineLearningCreateRealtimeEndpointInput *)request;

/**
 <p>Creates a real-time endpoint for the <code>MLModel</code>. The endpoint contains the URI of the <code>MLModel</code>; that is, the location to send real-time prediction requests for the specified <code>MLModel</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRealtimeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningCreateRealtimeEndpointInput
 @see AWSMachineLearningCreateRealtimeEndpointOutput
 */
- (void)createRealtimeEndpoint:(AWSMachineLearningCreateRealtimeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningCreateRealtimeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the DELETED status to a <code>BatchPrediction</code>, rendering it unusable.</p><p>After using the <code>DeleteBatchPrediction</code> operation, you can use the <a>GetBatchPrediction</a> operation to verify that the status of the <code>BatchPrediction</code> changed to DELETED.</p><p><b>Caution:</b> The result of the <code>DeleteBatchPrediction</code> operation is irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBatchPrediction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteBatchPredictionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteBatchPredictionInput
 @see AWSMachineLearningDeleteBatchPredictionOutput
 */
- (AWSTask<AWSMachineLearningDeleteBatchPredictionOutput *> *)deleteBatchPrediction:(AWSMachineLearningDeleteBatchPredictionInput *)request;

/**
 <p>Assigns the DELETED status to a <code>BatchPrediction</code>, rendering it unusable.</p><p>After using the <code>DeleteBatchPrediction</code> operation, you can use the <a>GetBatchPrediction</a> operation to verify that the status of the <code>BatchPrediction</code> changed to DELETED.</p><p><b>Caution:</b> The result of the <code>DeleteBatchPrediction</code> operation is irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBatchPrediction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteBatchPredictionInput
 @see AWSMachineLearningDeleteBatchPredictionOutput
 */
- (void)deleteBatchPrediction:(AWSMachineLearningDeleteBatchPredictionInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteBatchPredictionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the DELETED status to a <code>DataSource</code>, rendering it unusable.</p><p>After using the <code>DeleteDataSource</code> operation, you can use the <a>GetDataSource</a> operation to verify that the status of the <code>DataSource</code> changed to DELETED.</p><p><b>Caution:</b> The results of the <code>DeleteDataSource</code> operation are irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteDataSourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteDataSourceInput
 @see AWSMachineLearningDeleteDataSourceOutput
 */
- (AWSTask<AWSMachineLearningDeleteDataSourceOutput *> *)deleteDataSource:(AWSMachineLearningDeleteDataSourceInput *)request;

/**
 <p>Assigns the DELETED status to a <code>DataSource</code>, rendering it unusable.</p><p>After using the <code>DeleteDataSource</code> operation, you can use the <a>GetDataSource</a> operation to verify that the status of the <code>DataSource</code> changed to DELETED.</p><p><b>Caution:</b> The results of the <code>DeleteDataSource</code> operation are irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteDataSourceInput
 @see AWSMachineLearningDeleteDataSourceOutput
 */
- (void)deleteDataSource:(AWSMachineLearningDeleteDataSourceInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteDataSourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the <code>DELETED</code> status to an <code>Evaluation</code>, rendering it unusable.</p><p>After invoking the <code>DeleteEvaluation</code> operation, you can use the <code>GetEvaluation</code> operation to verify that the status of the <code>Evaluation</code> changed to <code>DELETED</code>.</p><caution><title>Caution</title><p>The results of the <code>DeleteEvaluation</code> operation are irreversible.</p></caution>
 
 @param request A container for the necessary parameters to execute the DeleteEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteEvaluationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteEvaluationInput
 @see AWSMachineLearningDeleteEvaluationOutput
 */
- (AWSTask<AWSMachineLearningDeleteEvaluationOutput *> *)deleteEvaluation:(AWSMachineLearningDeleteEvaluationInput *)request;

/**
 <p>Assigns the <code>DELETED</code> status to an <code>Evaluation</code>, rendering it unusable.</p><p>After invoking the <code>DeleteEvaluation</code> operation, you can use the <code>GetEvaluation</code> operation to verify that the status of the <code>Evaluation</code> changed to <code>DELETED</code>.</p><caution><title>Caution</title><p>The results of the <code>DeleteEvaluation</code> operation are irreversible.</p></caution>
 
 @param request A container for the necessary parameters to execute the DeleteEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteEvaluationInput
 @see AWSMachineLearningDeleteEvaluationOutput
 */
- (void)deleteEvaluation:(AWSMachineLearningDeleteEvaluationInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteEvaluationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns the <code>DELETED</code> status to an <code>MLModel</code>, rendering it unusable.</p><p>After using the <code>DeleteMLModel</code> operation, you can use the <code>GetMLModel</code> operation to verify that the status of the <code>MLModel</code> changed to DELETED.</p><p><b>Caution:</b> The result of the <code>DeleteMLModel</code> operation is irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteMLModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteMLModelInput
 @see AWSMachineLearningDeleteMLModelOutput
 */
- (AWSTask<AWSMachineLearningDeleteMLModelOutput *> *)deleteMLModel:(AWSMachineLearningDeleteMLModelInput *)request;

/**
 <p>Assigns the <code>DELETED</code> status to an <code>MLModel</code>, rendering it unusable.</p><p>After using the <code>DeleteMLModel</code> operation, you can use the <code>GetMLModel</code> operation to verify that the status of the <code>MLModel</code> changed to DELETED.</p><p><b>Caution:</b> The result of the <code>DeleteMLModel</code> operation is irreversible.</p>
 
 @param request A container for the necessary parameters to execute the DeleteMLModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteMLModelInput
 @see AWSMachineLearningDeleteMLModelOutput
 */
- (void)deleteMLModel:(AWSMachineLearningDeleteMLModelInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteMLModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a real time endpoint of an <code>MLModel</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRealtimeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteRealtimeEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteRealtimeEndpointInput
 @see AWSMachineLearningDeleteRealtimeEndpointOutput
 */
- (AWSTask<AWSMachineLearningDeleteRealtimeEndpointOutput *> *)deleteRealtimeEndpoint:(AWSMachineLearningDeleteRealtimeEndpointInput *)request;

/**
 <p>Deletes a real time endpoint of an <code>MLModel</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteRealtimeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteRealtimeEndpointInput
 @see AWSMachineLearningDeleteRealtimeEndpointOutput
 */
- (void)deleteRealtimeEndpoint:(AWSMachineLearningDeleteRealtimeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteRealtimeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified tags associated with an ML object. After this operation is complete, you can't recover deleted tags.</p><p>If you specify a tag that doesn't exist, Amazon ML ignores it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDeleteTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInvalidTag`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteTagsInput
 @see AWSMachineLearningDeleteTagsOutput
 */
- (AWSTask<AWSMachineLearningDeleteTagsOutput *> *)deleteTags:(AWSMachineLearningDeleteTagsInput *)request;

/**
 <p>Deletes the specified tags associated with an ML object. After this operation is complete, you can't recover deleted tags.</p><p>If you specify a tag that doesn't exist, Amazon ML ignores it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInvalidTag`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDeleteTagsInput
 @see AWSMachineLearningDeleteTagsOutput
 */
- (void)deleteTags:(AWSMachineLearningDeleteTagsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDeleteTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <code>BatchPrediction</code> operations that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBatchPredictions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDescribeBatchPredictionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeBatchPredictionsInput
 @see AWSMachineLearningDescribeBatchPredictionsOutput
 */
- (AWSTask<AWSMachineLearningDescribeBatchPredictionsOutput *> *)describeBatchPredictions:(AWSMachineLearningDescribeBatchPredictionsInput *)request;

/**
 <p>Returns a list of <code>BatchPrediction</code> operations that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBatchPredictions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeBatchPredictionsInput
 @see AWSMachineLearningDescribeBatchPredictionsOutput
 */
- (void)describeBatchPredictions:(AWSMachineLearningDescribeBatchPredictionsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDescribeBatchPredictionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <code>DataSource</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSources service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDescribeDataSourcesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeDataSourcesInput
 @see AWSMachineLearningDescribeDataSourcesOutput
 */
- (AWSTask<AWSMachineLearningDescribeDataSourcesOutput *> *)describeDataSources:(AWSMachineLearningDescribeDataSourcesInput *)request;

/**
 <p>Returns a list of <code>DataSource</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataSources service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeDataSourcesInput
 @see AWSMachineLearningDescribeDataSourcesOutput
 */
- (void)describeDataSources:(AWSMachineLearningDescribeDataSourcesInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDescribeDataSourcesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <code>DescribeEvaluations</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvaluations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDescribeEvaluationsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeEvaluationsInput
 @see AWSMachineLearningDescribeEvaluationsOutput
 */
- (AWSTask<AWSMachineLearningDescribeEvaluationsOutput *> *)describeEvaluations:(AWSMachineLearningDescribeEvaluationsInput *)request;

/**
 <p>Returns a list of <code>DescribeEvaluations</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEvaluations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeEvaluationsInput
 @see AWSMachineLearningDescribeEvaluationsOutput
 */
- (void)describeEvaluations:(AWSMachineLearningDescribeEvaluationsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDescribeEvaluationsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <code>MLModel</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMLModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDescribeMLModelsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeMLModelsInput
 @see AWSMachineLearningDescribeMLModelsOutput
 */
- (AWSTask<AWSMachineLearningDescribeMLModelsOutput *> *)describeMLModels:(AWSMachineLearningDescribeMLModelsInput *)request;

/**
 <p>Returns a list of <code>MLModel</code> that match the search criteria in the request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMLModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeMLModelsInput
 @see AWSMachineLearningDescribeMLModelsOutput
 */
- (void)describeMLModels:(AWSMachineLearningDescribeMLModelsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDescribeMLModelsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes one or more of the tags for your Amazon ML object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningDescribeTagsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeTagsInput
 @see AWSMachineLearningDescribeTagsOutput
 */
- (AWSTask<AWSMachineLearningDescribeTagsOutput *> *)describeTags:(AWSMachineLearningDescribeTagsInput *)request;

/**
 <p>Describes one or more of the tags for your Amazon ML object.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningDescribeTagsInput
 @see AWSMachineLearningDescribeTagsOutput
 */
- (void)describeTags:(AWSMachineLearningDescribeTagsInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningDescribeTagsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>BatchPrediction</code> that includes detailed metadata, status, and data file information for a <code>Batch Prediction</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetBatchPrediction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningGetBatchPredictionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetBatchPredictionInput
 @see AWSMachineLearningGetBatchPredictionOutput
 */
- (AWSTask<AWSMachineLearningGetBatchPredictionOutput *> *)getBatchPrediction:(AWSMachineLearningGetBatchPredictionInput *)request;

/**
 <p>Returns a <code>BatchPrediction</code> that includes detailed metadata, status, and data file information for a <code>Batch Prediction</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetBatchPrediction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetBatchPredictionInput
 @see AWSMachineLearningGetBatchPredictionOutput
 */
- (void)getBatchPrediction:(AWSMachineLearningGetBatchPredictionInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningGetBatchPredictionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a <code>DataSource</code> that includes metadata and data file information, as well as the current status of the <code>DataSource</code>.</p><p><code>GetDataSource</code> provides results in normal or verbose format. The verbose format adds the schema description and the list of files pointed to by the DataSource to the normal format.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningGetDataSourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetDataSourceInput
 @see AWSMachineLearningGetDataSourceOutput
 */
- (AWSTask<AWSMachineLearningGetDataSourceOutput *> *)getDataSource:(AWSMachineLearningGetDataSourceInput *)request;

/**
 <p>Returns a <code>DataSource</code> that includes metadata and data file information, as well as the current status of the <code>DataSource</code>.</p><p><code>GetDataSource</code> provides results in normal or verbose format. The verbose format adds the schema description and the list of files pointed to by the DataSource to the normal format.</p>
 
 @param request A container for the necessary parameters to execute the GetDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetDataSourceInput
 @see AWSMachineLearningGetDataSourceOutput
 */
- (void)getDataSource:(AWSMachineLearningGetDataSourceInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningGetDataSourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an <code>Evaluation</code> that includes metadata as well as the current status of the <code>Evaluation</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningGetEvaluationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetEvaluationInput
 @see AWSMachineLearningGetEvaluationOutput
 */
- (AWSTask<AWSMachineLearningGetEvaluationOutput *> *)getEvaluation:(AWSMachineLearningGetEvaluationInput *)request;

/**
 <p>Returns an <code>Evaluation</code> that includes metadata as well as the current status of the <code>Evaluation</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetEvaluationInput
 @see AWSMachineLearningGetEvaluationOutput
 */
- (void)getEvaluation:(AWSMachineLearningGetEvaluationInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningGetEvaluationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an <code>MLModel</code> that includes detailed metadata, data source information, and the current status of the <code>MLModel</code>.</p><p><code>GetMLModel</code> provides results in normal or verbose format. </p>
 
 @param request A container for the necessary parameters to execute the GetMLModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningGetMLModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetMLModelInput
 @see AWSMachineLearningGetMLModelOutput
 */
- (AWSTask<AWSMachineLearningGetMLModelOutput *> *)getMLModel:(AWSMachineLearningGetMLModelInput *)request;

/**
 <p>Returns an <code>MLModel</code> that includes detailed metadata, data source information, and the current status of the <code>MLModel</code>.</p><p><code>GetMLModel</code> provides results in normal or verbose format. </p>
 
 @param request A container for the necessary parameters to execute the GetMLModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetMLModelInput
 @see AWSMachineLearningGetMLModelOutput
 */
- (void)getMLModel:(AWSMachineLearningGetMLModelInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningGetMLModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a prediction for the observation using the specified <code>ML Model</code>.</p><note><title>Note</title><p>Not all response parameters will be populated. Whether a response parameter is populated depends on the type of model requested.</p></note>
 
 @param request A container for the necessary parameters to execute the Predict service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningPredictOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorLimitExceeded`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorPredictorNotMounted`.
 
 @see AWSMachineLearningPredictInput
 @see AWSMachineLearningPredictOutput
 */
- (AWSTask<AWSMachineLearningPredictOutput *> *)predict:(AWSMachineLearningPredictInput *)request;

/**
 <p>Generates a prediction for the observation using the specified <code>ML Model</code>.</p><note><title>Note</title><p>Not all response parameters will be populated. Whether a response parameter is populated depends on the type of model requested.</p></note>
 
 @param request A container for the necessary parameters to execute the Predict service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorLimitExceeded`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorPredictorNotMounted`.
 
 @see AWSMachineLearningPredictInput
 @see AWSMachineLearningPredictOutput
 */
- (void)predict:(AWSMachineLearningPredictInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningPredictOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the <code>BatchPredictionName</code> of a <code>BatchPrediction</code>.</p><p>You can use the <code>GetBatchPrediction</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBatchPrediction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningUpdateBatchPredictionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateBatchPredictionInput
 @see AWSMachineLearningUpdateBatchPredictionOutput
 */
- (AWSTask<AWSMachineLearningUpdateBatchPredictionOutput *> *)updateBatchPrediction:(AWSMachineLearningUpdateBatchPredictionInput *)request;

/**
 <p>Updates the <code>BatchPredictionName</code> of a <code>BatchPrediction</code>.</p><p>You can use the <code>GetBatchPrediction</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBatchPrediction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateBatchPredictionInput
 @see AWSMachineLearningUpdateBatchPredictionOutput
 */
- (void)updateBatchPrediction:(AWSMachineLearningUpdateBatchPredictionInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningUpdateBatchPredictionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the <code>DataSourceName</code> of a <code>DataSource</code>.</p><p>You can use the <code>GetDataSource</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningUpdateDataSourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateDataSourceInput
 @see AWSMachineLearningUpdateDataSourceOutput
 */
- (AWSTask<AWSMachineLearningUpdateDataSourceOutput *> *)updateDataSource:(AWSMachineLearningUpdateDataSourceInput *)request;

/**
 <p>Updates the <code>DataSourceName</code> of a <code>DataSource</code>.</p><p>You can use the <code>GetDataSource</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataSource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateDataSourceInput
 @see AWSMachineLearningUpdateDataSourceOutput
 */
- (void)updateDataSource:(AWSMachineLearningUpdateDataSourceInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningUpdateDataSourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the <code>EvaluationName</code> of an <code>Evaluation</code>.</p><p>You can use the <code>GetEvaluation</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEvaluation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningUpdateEvaluationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateEvaluationInput
 @see AWSMachineLearningUpdateEvaluationOutput
 */
- (AWSTask<AWSMachineLearningUpdateEvaluationOutput *> *)updateEvaluation:(AWSMachineLearningUpdateEvaluationInput *)request;

/**
 <p>Updates the <code>EvaluationName</code> of an <code>Evaluation</code>.</p><p>You can use the <code>GetEvaluation</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEvaluation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateEvaluationInput
 @see AWSMachineLearningUpdateEvaluationOutput
 */
- (void)updateEvaluation:(AWSMachineLearningUpdateEvaluationInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningUpdateEvaluationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the <code>MLModelName</code> and the <code>ScoreThreshold</code> of an <code>MLModel</code>.</p><p>You can use the <code>GetMLModel</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningUpdateMLModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateMLModelInput
 @see AWSMachineLearningUpdateMLModelOutput
 */
- (AWSTask<AWSMachineLearningUpdateMLModelOutput *> *)updateMLModel:(AWSMachineLearningUpdateMLModelInput *)request;

/**
 <p>Updates the <code>MLModelName</code> and the <code>ScoreThreshold</code> of an <code>MLModel</code>.</p><p>You can use the <code>GetMLModel</code> operation to view the contents of the updated data element.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMLModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningUpdateMLModelInput
 @see AWSMachineLearningUpdateMLModelOutput
 */
- (void)updateMLModel:(AWSMachineLearningUpdateMLModelInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningUpdateMLModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
