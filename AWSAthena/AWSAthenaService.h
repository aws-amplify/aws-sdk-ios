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
#import "AWSAthenaModel.h"
#import "AWSAthenaResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAthena
FOUNDATION_EXPORT NSString *const AWSAthenaSDKVersion;

/**
 <p>Amazon Athena is an interactive query service that lets you use standard SQL to analyze data directly in Amazon S3. You can point Athena at your data in Amazon S3 and run ad-hoc queries and get results in seconds. Athena is serverless, so there is no infrastructure to set up or manage. You pay only for the queries you run. Athena scales automatically—executing queries in parallel—so results are fast, even with large datasets and complex queries. For more information, see <a href="http://docs.aws.amazon.com/athena/latest/ug/what-is.html">What is Amazon Athena</a> in the <i>Amazon Athena User Guide</i>.</p><p>If you connect to Athena using the JDBC driver, use version 1.1.0 of the driver or later with the Amazon Athena API. Earlier version drivers do not support the API. For more information and to download the driver, see <a href="https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html">Accessing Amazon Athena with JDBC</a>.</p><p>For code samples using the AWS SDK for Java, see <a href="https://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 */
@interface AWSAthena : AWSService

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

     let Athena = AWSAthena.default()

 *Objective-C*

     AWSAthena *Athena = [AWSAthena defaultAthena];

 @return The default service client.
 */
+ (instancetype)defaultAthena;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAthena.register(with: configuration!, forKey: "USWest2Athena")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAthena registerAthenaWithConfiguration:configuration forKey:@"USWest2Athena"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Athena = AWSAthena(forKey: "USWest2Athena")

 *Objective-C*

     AWSAthena *Athena = [AWSAthena AthenaForKey:@"USWest2Athena"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAthenaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAthenaWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAthena.register(with: configuration!, forKey: "USWest2Athena")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAthena registerAthenaWithConfiguration:configuration forKey:@"USWest2Athena"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Athena = AWSAthena(forKey: "USWest2Athena")

 *Objective-C*

     AWSAthena *Athena = [AWSAthena AthenaForKey:@"USWest2Athena"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AthenaForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAthenaForKey:(NSString *)key;

/**
 <p>Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use <a>ListNamedQueriesInput</a> to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under <a>UnprocessedNamedQueryId</a>. Named queries differ from executed queries. Use <a>BatchGetQueryExecutionInput</a> to get details about each unique query execution, and <a>ListQueryExecutionsInput</a> to get a list of query execution IDs.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetNamedQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaBatchGetNamedQueryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaBatchGetNamedQueryInput
 @see AWSAthenaBatchGetNamedQueryOutput
 */
- (AWSTask<AWSAthenaBatchGetNamedQueryOutput *> *)batchGetNamedQuery:(AWSAthenaBatchGetNamedQueryInput *)request;

/**
 <p>Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use <a>ListNamedQueriesInput</a> to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under <a>UnprocessedNamedQueryId</a>. Named queries differ from executed queries. Use <a>BatchGetQueryExecutionInput</a> to get details about each unique query execution, and <a>ListQueryExecutionsInput</a> to get a list of query execution IDs.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetNamedQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaBatchGetNamedQueryInput
 @see AWSAthenaBatchGetNamedQueryOutput
 */
- (void)batchGetNamedQuery:(AWSAthenaBatchGetNamedQueryInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaBatchGetNamedQueryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use <a>ListQueryExecutionsInput$WorkGroup</a>. Query executions differ from named (saved) queries. Use <a>BatchGetNamedQueryInput</a> to get details about named queries.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetQueryExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaBatchGetQueryExecutionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaBatchGetQueryExecutionInput
 @see AWSAthenaBatchGetQueryExecutionOutput
 */
- (AWSTask<AWSAthenaBatchGetQueryExecutionOutput *> *)batchGetQueryExecution:(AWSAthenaBatchGetQueryExecutionInput *)request;

/**
 <p>Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use <a>ListQueryExecutionsInput$WorkGroup</a>. Query executions differ from named (saved) queries. Use <a>BatchGetNamedQueryInput</a> to get details about named queries.</p>
 
 @param request A container for the necessary parameters to execute the BatchGetQueryExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaBatchGetQueryExecutionInput
 @see AWSAthenaBatchGetQueryExecutionOutput
 */
- (void)batchGetQueryExecution:(AWSAthenaBatchGetQueryExecutionInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaBatchGetQueryExecutionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates (registers) a data catalog with the specified name and properties. Catalogs created are visible to all users of the same AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataCatalog service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaCreateDataCatalogOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateDataCatalogInput
 @see AWSAthenaCreateDataCatalogOutput
 */
- (AWSTask<AWSAthenaCreateDataCatalogOutput *> *)createDataCatalog:(AWSAthenaCreateDataCatalogInput *)request;

/**
 <p>Creates (registers) a data catalog with the specified name and properties. Catalogs created are visible to all users of the same AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataCatalog service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateDataCatalogInput
 @see AWSAthenaCreateDataCatalogOutput
 */
- (void)createDataCatalog:(AWSAthenaCreateDataCatalogInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaCreateDataCatalogOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a named query in the specified workgroup. Requires that you have access to the workgroup.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNamedQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaCreateNamedQueryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateNamedQueryInput
 @see AWSAthenaCreateNamedQueryOutput
 */
- (AWSTask<AWSAthenaCreateNamedQueryOutput *> *)createNamedQuery:(AWSAthenaCreateNamedQueryInput *)request;

/**
 <p>Creates a named query in the specified workgroup. Requires that you have access to the workgroup.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateNamedQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateNamedQueryInput
 @see AWSAthenaCreateNamedQueryOutput
 */
- (void)createNamedQuery:(AWSAthenaCreateNamedQueryInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaCreateNamedQueryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a workgroup with the specified name.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaCreateWorkGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateWorkGroupInput
 @see AWSAthenaCreateWorkGroupOutput
 */
- (AWSTask<AWSAthenaCreateWorkGroupOutput *> *)createWorkGroup:(AWSAthenaCreateWorkGroupInput *)request;

/**
 <p>Creates a workgroup with the specified name.</p>
 
 @param request A container for the necessary parameters to execute the CreateWorkGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaCreateWorkGroupInput
 @see AWSAthenaCreateWorkGroupOutput
 */
- (void)createWorkGroup:(AWSAthenaCreateWorkGroupInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaCreateWorkGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a data catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataCatalog service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaDeleteDataCatalogOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteDataCatalogInput
 @see AWSAthenaDeleteDataCatalogOutput
 */
- (AWSTask<AWSAthenaDeleteDataCatalogOutput *> *)deleteDataCatalog:(AWSAthenaDeleteDataCatalogInput *)request;

/**
 <p>Deletes a data catalog.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataCatalog service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteDataCatalogInput
 @see AWSAthenaDeleteDataCatalogOutput
 */
- (void)deleteDataCatalog:(AWSAthenaDeleteDataCatalogInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaDeleteDataCatalogOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the named query if you have access to the workgroup in which the query was saved.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNamedQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaDeleteNamedQueryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteNamedQueryInput
 @see AWSAthenaDeleteNamedQueryOutput
 */
- (AWSTask<AWSAthenaDeleteNamedQueryOutput *> *)deleteNamedQuery:(AWSAthenaDeleteNamedQueryInput *)request;

/**
 <p>Deletes the named query if you have access to the workgroup in which the query was saved.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteNamedQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteNamedQueryInput
 @see AWSAthenaDeleteNamedQueryOutput
 */
- (void)deleteNamedQuery:(AWSAthenaDeleteNamedQueryInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaDeleteNamedQueryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaDeleteWorkGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteWorkGroupInput
 @see AWSAthenaDeleteWorkGroupOutput
 */
- (AWSTask<AWSAthenaDeleteWorkGroupOutput *> *)deleteWorkGroup:(AWSAthenaDeleteWorkGroupInput *)request;

/**
 <p>Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteWorkGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaDeleteWorkGroupInput
 @see AWSAthenaDeleteWorkGroupOutput
 */
- (void)deleteWorkGroup:(AWSAthenaDeleteWorkGroupInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaDeleteWorkGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the specified data catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalog service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetDataCatalogOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetDataCatalogInput
 @see AWSAthenaGetDataCatalogOutput
 */
- (AWSTask<AWSAthenaGetDataCatalogOutput *> *)getDataCatalog:(AWSAthenaGetDataCatalogInput *)request;

/**
 <p>Returns the specified data catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDataCatalog service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetDataCatalogInput
 @see AWSAthenaGetDataCatalogOutput
 */
- (void)getDataCatalog:(AWSAthenaGetDataCatalogInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetDataCatalogOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a database object for the specfied database and data catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetDatabaseOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaGetDatabaseInput
 @see AWSAthenaGetDatabaseOutput
 */
- (AWSTask<AWSAthenaGetDatabaseOutput *> *)getDatabase:(AWSAthenaGetDatabaseInput *)request;

/**
 <p>Returns a database object for the specfied database and data catalog.</p>
 
 @param request A container for the necessary parameters to execute the GetDatabase service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaGetDatabaseInput
 @see AWSAthenaGetDatabaseOutput
 */
- (void)getDatabase:(AWSAthenaGetDatabaseInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetDatabaseOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.</p>
 
 @param request A container for the necessary parameters to execute the GetNamedQuery service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetNamedQueryOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetNamedQueryInput
 @see AWSAthenaGetNamedQueryOutput
 */
- (AWSTask<AWSAthenaGetNamedQueryOutput *> *)getNamedQuery:(AWSAthenaGetNamedQueryInput *)request;

/**
 <p>Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.</p>
 
 @param request A container for the necessary parameters to execute the GetNamedQuery service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetNamedQueryInput
 @see AWSAthenaGetNamedQueryOutput
 */
- (void)getNamedQuery:(AWSAthenaGetNamedQueryInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetNamedQueryOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.</p>
 
 @param request A container for the necessary parameters to execute the GetQueryExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetQueryExecutionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetQueryExecutionInput
 @see AWSAthenaGetQueryExecutionOutput
 */
- (AWSTask<AWSAthenaGetQueryExecutionOutput *> *)getQueryExecution:(AWSAthenaGetQueryExecutionInput *)request;

/**
 <p>Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.</p>
 
 @param request A container for the necessary parameters to execute the GetQueryExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetQueryExecutionInput
 @see AWSAthenaGetQueryExecutionOutput
 */
- (void)getQueryExecution:(AWSAthenaGetQueryExecutionInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetQueryExecutionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Streams the results of a single query execution specified by <code>QueryExecutionId</code> from the Athena query results location in Amazon S3. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a> in the <i>Amazon Athena User Guide</i>. This request does not execute the query but returns results. Use <a>StartQueryExecution</a> to run a query.</p><p>To stream query results successfully, the IAM principal with permission to call <code>GetQueryResults</code> also must have permissions to the Amazon S3 <code>GetObject</code> action for the Athena query results location.</p><important><p>IAM principals with permission to the Amazon S3 <code>GetObject</code> action for the query results location are able to retrieve query results from Amazon S3 even if permission to the <code>GetQueryResults</code> action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied.</p></important>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetQueryResultsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetQueryResultsInput
 @see AWSAthenaGetQueryResultsOutput
 */
- (AWSTask<AWSAthenaGetQueryResultsOutput *> *)getQueryResults:(AWSAthenaGetQueryResultsInput *)request;

/**
 <p>Streams the results of a single query execution specified by <code>QueryExecutionId</code> from the Athena query results location in Amazon S3. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a> in the <i>Amazon Athena User Guide</i>. This request does not execute the query but returns results. Use <a>StartQueryExecution</a> to run a query.</p><p>To stream query results successfully, the IAM principal with permission to call <code>GetQueryResults</code> also must have permissions to the Amazon S3 <code>GetObject</code> action for the Athena query results location.</p><important><p>IAM principals with permission to the Amazon S3 <code>GetObject</code> action for the query results location are able to retrieve query results from Amazon S3 even if permission to the <code>GetQueryResults</code> action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied.</p></important>
 
 @param request A container for the necessary parameters to execute the GetQueryResults service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetQueryResultsInput
 @see AWSAthenaGetQueryResultsOutput
 */
- (void)getQueryResults:(AWSAthenaGetQueryResultsInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetQueryResultsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns table metadata for the specified catalog, database, and table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetTableMetadataOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaGetTableMetadataInput
 @see AWSAthenaGetTableMetadataOutput
 */
- (AWSTask<AWSAthenaGetTableMetadataOutput *> *)getTableMetadata:(AWSAthenaGetTableMetadataInput *)request;

/**
 <p>Returns table metadata for the specified catalog, database, and table.</p>
 
 @param request A container for the necessary parameters to execute the GetTableMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaGetTableMetadataInput
 @see AWSAthenaGetTableMetadataOutput
 */
- (void)getTableMetadata:(AWSAthenaGetTableMetadataInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetTableMetadataOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the workgroup with the specified name.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaGetWorkGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetWorkGroupInput
 @see AWSAthenaGetWorkGroupOutput
 */
- (AWSTask<AWSAthenaGetWorkGroupOutput *> *)getWorkGroup:(AWSAthenaGetWorkGroupInput *)request;

/**
 <p>Returns information about the workgroup with the specified name.</p>
 
 @param request A container for the necessary parameters to execute the GetWorkGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaGetWorkGroupInput
 @see AWSAthenaGetWorkGroupOutput
 */
- (void)getWorkGroup:(AWSAthenaGetWorkGroupInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaGetWorkGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the data catalogs in the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDataCatalogs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListDataCatalogsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListDataCatalogsInput
 @see AWSAthenaListDataCatalogsOutput
 */
- (AWSTask<AWSAthenaListDataCatalogsOutput *> *)listDataCatalogs:(AWSAthenaListDataCatalogsInput *)request;

/**
 <p>Lists the data catalogs in the current AWS account.</p>
 
 @param request A container for the necessary parameters to execute the ListDataCatalogs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListDataCatalogsInput
 @see AWSAthenaListDataCatalogsOutput
 */
- (void)listDataCatalogs:(AWSAthenaListDataCatalogsInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListDataCatalogsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the databases in the specified data catalog.</p>
 
 @param request A container for the necessary parameters to execute the ListDatabases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListDatabasesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaListDatabasesInput
 @see AWSAthenaListDatabasesOutput
 */
- (AWSTask<AWSAthenaListDatabasesOutput *> *)listDatabases:(AWSAthenaListDatabasesInput *)request;

/**
 <p>Lists the databases in the specified data catalog.</p>
 
 @param request A container for the necessary parameters to execute the ListDatabases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaListDatabasesInput
 @see AWSAthenaListDatabasesOutput
 */
- (void)listDatabases:(AWSAthenaListDatabasesInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListDatabasesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the specified workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListNamedQueries service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListNamedQueriesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListNamedQueriesInput
 @see AWSAthenaListNamedQueriesOutput
 */
- (AWSTask<AWSAthenaListNamedQueriesOutput *> *)listNamedQueries:(AWSAthenaListNamedQueriesInput *)request;

/**
 <p>Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the specified workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListNamedQueries service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListNamedQueriesInput
 @see AWSAthenaListNamedQueriesOutput
 */
- (void)listNamedQueries:(AWSAthenaListNamedQueriesInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListNamedQueriesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueryExecutions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListQueryExecutionsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListQueryExecutionsInput
 @see AWSAthenaListQueryExecutionsOutput
 */
- (AWSTask<AWSAthenaListQueryExecutionsOutput *> *)listQueryExecutions:(AWSAthenaListQueryExecutionsInput *)request;

/**
 <p>Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the ListQueryExecutions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListQueryExecutionsInput
 @see AWSAthenaListQueryExecutionsOutput
 */
- (void)listQueryExecutions:(AWSAthenaListQueryExecutionsInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListQueryExecutionsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the metadata for the tables in the specified data catalog database.</p>
 
 @param request A container for the necessary parameters to execute the ListTableMetadata service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListTableMetadataOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaListTableMetadataInput
 @see AWSAthenaListTableMetadataOutput
 */
- (AWSTask<AWSAthenaListTableMetadataOutput *> *)listTableMetadata:(AWSAthenaListTableMetadataInput *)request;

/**
 <p>Lists the metadata for the tables in the specified data catalog database.</p>
 
 @param request A container for the necessary parameters to execute the ListTableMetadata service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorMetadata`.
 
 @see AWSAthenaListTableMetadataInput
 @see AWSAthenaListTableMetadataOutput
 */
- (void)listTableMetadata:(AWSAthenaListTableMetadataInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListTableMetadataOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags associated with an Athena workgroup or data catalog resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaListTagsForResourceInput
 @see AWSAthenaListTagsForResourceOutput
 */
- (AWSTask<AWSAthenaListTagsForResourceOutput *> *)listTagsForResource:(AWSAthenaListTagsForResourceInput *)request;

/**
 <p>Lists the tags associated with an Athena workgroup or data catalog resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaListTagsForResourceInput
 @see AWSAthenaListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSAthenaListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists available workgroups for the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaListWorkGroupsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListWorkGroupsInput
 @see AWSAthenaListWorkGroupsOutput
 */
- (AWSTask<AWSAthenaListWorkGroupsOutput *> *)listWorkGroups:(AWSAthenaListWorkGroupsInput *)request;

/**
 <p>Lists available workgroups for the account.</p>
 
 @param request A container for the necessary parameters to execute the ListWorkGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaListWorkGroupsInput
 @see AWSAthenaListWorkGroupsOutput
 */
- (void)listWorkGroups:(AWSAthenaListWorkGroupsInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaListWorkGroupsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Runs the SQL query statements contained in the <code>Query</code>. Requires you to have access to the workgroup in which the query ran. Running queries against an external catalog requires <a>GetDataCatalog</a> permission to the catalog. For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartQueryExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaStartQueryExecutionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorTooManyRequests`.
 
 @see AWSAthenaStartQueryExecutionInput
 @see AWSAthenaStartQueryExecutionOutput
 */
- (AWSTask<AWSAthenaStartQueryExecutionOutput *> *)startQueryExecution:(AWSAthenaStartQueryExecutionInput *)request;

/**
 <p>Runs the SQL query statements contained in the <code>Query</code>. Requires you to have access to the workgroup in which the query ran. Running queries against an external catalog requires <a>GetDataCatalog</a> permission to the catalog. For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StartQueryExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorTooManyRequests`.
 
 @see AWSAthenaStartQueryExecutionInput
 @see AWSAthenaStartQueryExecutionOutput
 */
- (void)startQueryExecution:(AWSAthenaStartQueryExecutionInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaStartQueryExecutionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a query execution. Requires you to have access to the workgroup in which the query ran.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopQueryExecution service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaStopQueryExecutionOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaStopQueryExecutionInput
 @see AWSAthenaStopQueryExecutionOutput
 */
- (AWSTask<AWSAthenaStopQueryExecutionOutput *> *)stopQueryExecution:(AWSAthenaStopQueryExecutionInput *)request;

/**
 <p>Stops a query execution. Requires you to have access to the workgroup in which the query ran.</p><p>For code samples using the AWS SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the StopQueryExecution service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaStopQueryExecutionInput
 @see AWSAthenaStopQueryExecutionOutput
 */
- (void)stopQueryExecution:(AWSAthenaStopQueryExecutionInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaStopQueryExecutionOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaTagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaTagResourceInput
 @see AWSAthenaTagResourceOutput
 */
- (AWSTask<AWSAthenaTagResourceOutput *> *)tagResource:(AWSAthenaTagResourceInput *)request;

/**
 <p>Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaTagResourceInput
 @see AWSAthenaTagResourceOutput
 */
- (void)tagResource:(AWSAthenaTagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaTagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from a data catalog or workgroup resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaUntagResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaUntagResourceInput
 @see AWSAthenaUntagResourceOutput
 */
- (AWSTask<AWSAthenaUntagResourceOutput *> *)untagResource:(AWSAthenaUntagResourceInput *)request;

/**
 <p>Removes one or more tags from a data catalog or workgroup resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`, `AWSAthenaErrorResourceNotFound`.
 
 @see AWSAthenaUntagResourceInput
 @see AWSAthenaUntagResourceOutput
 */
- (void)untagResource:(AWSAthenaUntagResourceInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaUntagResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the data catalog that has the specified name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataCatalog service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaUpdateDataCatalogOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaUpdateDataCatalogInput
 @see AWSAthenaUpdateDataCatalogOutput
 */
- (AWSTask<AWSAthenaUpdateDataCatalogOutput *> *)updateDataCatalog:(AWSAthenaUpdateDataCatalogInput *)request;

/**
 <p>Updates the data catalog that has the specified name.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDataCatalog service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaUpdateDataCatalogInput
 @see AWSAthenaUpdateDataCatalogOutput
 */
- (void)updateDataCatalog:(AWSAthenaUpdateDataCatalogInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaUpdateDataCatalogOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the workgroup with the specified name. The workgroup's name cannot be changed.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAthenaUpdateWorkGroupOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaUpdateWorkGroupInput
 @see AWSAthenaUpdateWorkGroupOutput
 */
- (AWSTask<AWSAthenaUpdateWorkGroupOutput *> *)updateWorkGroup:(AWSAthenaUpdateWorkGroupInput *)request;

/**
 <p>Updates the workgroup with the specified name. The workgroup's name cannot be changed.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWorkGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAthenaErrorDomain` domain and the following error code: `AWSAthenaErrorInternalServer`, `AWSAthenaErrorInvalidRequest`.
 
 @see AWSAthenaUpdateWorkGroupInput
 @see AWSAthenaUpdateWorkGroupOutput
 */
- (void)updateWorkGroup:(AWSAthenaUpdateWorkGroupInput *)request completionHandler:(void (^ _Nullable)(AWSAthenaUpdateWorkGroupOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
