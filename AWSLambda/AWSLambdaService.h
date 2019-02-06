//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSLambdaModel.h"
#import "AWSLambdaResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLambda
FOUNDATION_EXPORT NSString *const AWSLambdaSDKVersion;

/**
 <fullname>AWS Lambda</fullname><p><b>Overview</b></p><p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS Lambda</a>, and for information about how the service works, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 */
@interface AWSLambda : AWSService

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

     let Lambda = AWSLambda.default()

 *Objective-C*

     AWSLambda *Lambda = [AWSLambda defaultLambda];

 @return The default service client.
 */
+ (instancetype)defaultLambda;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLambda.register(with: configuration!, forKey: "USWest2Lambda")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLambda registerLambdaWithConfiguration:configuration forKey:@"USWest2Lambda"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lambda = AWSLambda(forKey: "USWest2Lambda")

 *Objective-C*

     AWSLambda *Lambda = [AWSLambda LambdaForKey:@"USWest2Lambda"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLambdaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLambdaWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSLambda.register(with: configuration!, forKey: "USWest2Lambda")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLambda registerLambdaWithConfiguration:configuration forKey:@"USWest2Lambda"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Lambda = AWSLambda(forKey: "USWest2Lambda")

 *Objective-C*

     AWSLambda *Lambda = [AWSLambda LambdaForKey:@"USWest2Lambda"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LambdaForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeLambdaForKey:(NSString *)key;

/**
 <p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use the <i>push</i> model. In a <i>push</i> model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source permission to invoke the Lambda function. </p><p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAddPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (AWSTask<AWSLambdaAddPermissionResponse *> *)addPermission:(AWSLambdaAddPermissionRequest *)request;

/**
 <p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use the <i>push</i> model. In a <i>push</i> model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source permission to invoke the Lambda function. </p><p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (void)addPermission:(AWSLambdaAddPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAddPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an alias that points to the specified Lambda function version. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>Alias names are unique for a given function. This requires permission for the lambda:CreateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)createAlias:(AWSLambdaCreateAliasRequest *)request;

/**
 <p>Creates an alias that points to the specified Lambda function version. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>Alias names are unique for a given function. This requires permission for the lambda:CreateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)createAlias:(AWSLambdaCreateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Identifies a poll-based event source for a Lambda function. It can be either an Amazon Kinesis or DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the event source.</p><p>This association between a poll-based source and a Lambda function is called the event source mapping.</p><p>You provide mapping information (for example, which stream or SQS queue to read from and which Lambda function to invoke) in the request body.</p><p>Amazon Kinesis or DynamoDB stream event sources can be associated with multiple AWS Lambda functions and a given Lambda function can be associated with multiple AWS event sources. For Amazon SQS, you can configure multiple queues as event sources for a single Lambda function, but an SQS queue can be mapped only to a single Lambda function.</p><p>You can configure an SQS queue in an account separate from your Lambda function's account. Also the queue needs to reside in the same AWS region as your function. </p><p>If you are using versioning, you can specify a specific function version or an alias via the function name parameter. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaCreateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request;

/**
 <p>Identifies a poll-based event source for a Lambda function. It can be either an Amazon Kinesis or DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the event source.</p><p>This association between a poll-based source and a Lambda function is called the event source mapping.</p><p>You provide mapping information (for example, which stream or SQS queue to read from and which Lambda function to invoke) in the request body.</p><p>Amazon Kinesis or DynamoDB stream event sources can be associated with multiple AWS Lambda functions and a given Lambda function can be associated with multiple AWS event sources. For Amazon SQS, you can configure multiple queues as event sources for a single Lambda function, but an SQS queue can be mapped only to a single Lambda function.</p><p>You can configure an SQS queue in an account separate from your Lambda function's account. Also the queue needs to reside in the same AWS region as your function. </p><p>If you are using versioning, you can specify a specific function version or an alias via the function name parameter. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaCreateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Lambda function. The function configuration is created from the request parameters, and the code for the function is provided by a .zip file. The function name is case-sensitive.</p><p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaCreateFunctionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)createFunction:(AWSLambdaCreateFunctionRequest *)request;

/**
 <p>Creates a new Lambda function. The function configuration is created from the request parameters, and the code for the function is provided by a .zip file. The function name is case-sensitive.</p><p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaCreateFunctionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)createFunction:(AWSLambdaCreateFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified Lambda function alias. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:DeleteAlias action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteAliasRequest
 */
- (AWSTask *)deleteAlias:(AWSLambdaDeleteAliasRequest *)request;

/**
 <p>Deletes the specified Lambda function alias. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:DeleteAlias action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteAliasRequest
 */
- (void)deleteAlias:(AWSLambdaDeleteAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p><p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request;

/**
 <p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p><p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted. Event source mappings are not deleted.</p><p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (AWSTask *)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request;

/**
 <p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted. Event source mappings are not deleted.</p><p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (void)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes concurrent execution limits from this function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaDeleteFunctionConcurrencyRequest
 */
- (AWSTask *)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request;

/**
 <p>Removes concurrent execution limits from this function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaDeleteFunctionConcurrencyRequest
 */
- (void)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details about your account's <a href="http://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a> and usage in a region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetAccountSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetAccountSettingsRequest
 @see AWSLambdaGetAccountSettingsResponse
 */
- (AWSTask<AWSLambdaGetAccountSettingsResponse *> *)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request;

/**
 <p>Retrieves details about your account's <a href="http://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a> and usage in a region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetAccountSettingsRequest
 @see AWSLambdaGetAccountSettingsResponse
 */
- (void)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetAccountSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the <code>lambda:GetAlias</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)getAlias:(AWSLambdaGetAliasRequest *)request;

/**
 <p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the <code>lambda:GetAlias</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)getAlias:(AWSLambdaGetAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p><p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request;

/**
 <p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p><p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p><p>Use the <code>Qualifier</code> parameter to retrieve a published version of the function. Otherwise, returns the unpublished version (<code>$LATEST</code>). For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (AWSTask<AWSLambdaGetFunctionResponse *> *)getFunction:(AWSLambdaGetFunctionRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p><p>Use the <code>Qualifier</code> parameter to retrieve a published version of the function. Otherwise, returns the unpublished version (<code>$LATEST</code>). For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (void)getFunction:(AWSLambdaGetFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p><p>If you are using the versioning feature, you can retrieve this information for a specific function version by using the optional <code>Qualifier</code> parameter and specifying the function version or alias that points to it. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p><p>If you are using the versioning feature, you can retrieve this information for a specific function version by using the optional <code>Qualifier</code> parameter and specifying the function version or alias that points to it. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the resource policy associated with the specified Lambda function.</p><p>This action requires permission for the <code>lambda:GetPolicy action.</code></p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (AWSTask<AWSLambdaGetPolicyResponse *> *)getPolicy:(AWSLambdaGetPolicyRequest *)request;

/**
 <p>Returns the resource policy associated with the specified Lambda function.</p><p>This action requires permission for the <code>lambda:GetPolicy action.</code></p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (void)getPolicy:(AWSLambdaGetPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invokes a Lambda function. For an example, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/with-dynamodb-create-function.html#with-dbb-invoke-manually">Create the Lambda Function and Test It Manually</a>. </p><p>Specify just a function name to invoke the latest version of the function. To invoke a published version, use the <code>Qualifier</code> parameter to specify a <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version or alias</a>.</p><p>If you use the <code>RequestResponse</code> (synchronous) invocation option, the function will be invoked only once. If you use the <code>Event</code> (asynchronous) invocation option, the function will be invoked at least once in response to an event and the function must be idempotent to handle this.</p><p>For functions with a long timeout, your client may be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p><p>The <code>TooManyRequestsException</code> noted below will return the following: <code>ConcurrentInvocationLimitExceeded</code> will be returned if you have no functions with reserved concurrency and have exceeded your account concurrent limit or if a function without reserved concurrency exceeds the account's unreserved concurrency limit. <code>ReservedFunctionConcurrentInvocationLimitExceeded</code> will be returned when a function with reserved concurrency exceeds its configured concurrency limit. </p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvocationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorEC2Unexpected`, `AWSLambdaErrorSubnetIPAddressLimitReached`, `AWSLambdaErrorENILimitReached`, `AWSLambdaErrorEC2Throttled`, `AWSLambdaErrorEC2AccessDenied`, `AWSLambdaErrorInvalidSubnetID`, `AWSLambdaErrorInvalidSecurityGroupID`, `AWSLambdaErrorInvalidZipFile`, `AWSLambdaErrorKMSDisabled`, `AWSLambdaErrorKMSInvalidState`, `AWSLambdaErrorKMSAccessDenied`, `AWSLambdaErrorKMSNotFound`, `AWSLambdaErrorInvalidRuntime`.
 
 @see AWSLambdaInvocationRequest
 @see AWSLambdaInvocationResponse
 */
- (AWSTask<AWSLambdaInvocationResponse *> *)invoke:(AWSLambdaInvocationRequest *)request;

/**
 <p>Invokes a Lambda function. For an example, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/with-dynamodb-create-function.html#with-dbb-invoke-manually">Create the Lambda Function and Test It Manually</a>. </p><p>Specify just a function name to invoke the latest version of the function. To invoke a published version, use the <code>Qualifier</code> parameter to specify a <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version or alias</a>.</p><p>If you use the <code>RequestResponse</code> (synchronous) invocation option, the function will be invoked only once. If you use the <code>Event</code> (asynchronous) invocation option, the function will be invoked at least once in response to an event and the function must be idempotent to handle this.</p><p>For functions with a long timeout, your client may be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p><p>The <code>TooManyRequestsException</code> noted below will return the following: <code>ConcurrentInvocationLimitExceeded</code> will be returned if you have no functions with reserved concurrency and have exceeded your account concurrent limit or if a function without reserved concurrency exceeds the account's unreserved concurrency limit. <code>ReservedFunctionConcurrentInvocationLimitExceeded</code> will be returned when a function with reserved concurrency exceeds its configured concurrency limit. </p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorEC2Unexpected`, `AWSLambdaErrorSubnetIPAddressLimitReached`, `AWSLambdaErrorENILimitReached`, `AWSLambdaErrorEC2Throttled`, `AWSLambdaErrorEC2AccessDenied`, `AWSLambdaErrorInvalidSubnetID`, `AWSLambdaErrorInvalidSecurityGroupID`, `AWSLambdaErrorInvalidZipFile`, `AWSLambdaErrorKMSDisabled`, `AWSLambdaErrorKMSInvalidState`, `AWSLambdaErrorKMSAccessDenied`, `AWSLambdaErrorKMSNotFound`, `AWSLambdaErrorInvalidRuntime`.
 
 @see AWSLambdaInvocationRequest
 @see AWSLambdaInvocationResponse
 */
- (void)invoke:(AWSLambdaInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaInvocationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <important><p>For asynchronous function invocation, use <a>Invoke</a>.</p></important><p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch Logs console.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the InvokeAsync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvokeAsyncResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorInvalidRuntime`.
 
 @see AWSLambdaInvokeAsyncRequest
 @see AWSLambdaInvokeAsyncResponse
 */
- (AWSTask<AWSLambdaInvokeAsyncResponse *> *)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request;

/**
 <important><p>For asynchronous function invocation, use <a>Invoke</a>.</p></important><p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch Logs console.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the InvokeAsync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorInvalidRuntime`.
 
 @see AWSLambdaInvokeAsyncRequest
 @see AWSLambdaInvokeAsyncResponse
 */
- (void)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaInvokeAsyncResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:ListAliases action.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListAliasesRequest
 @see AWSLambdaListAliasesResponse
 */
- (AWSTask<AWSLambdaListAliasesResponse *> *)listAliases:(AWSLambdaListAliasesRequest *)request;

/**
 <p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:ListAliases action.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListAliasesRequest
 @see AWSLambdaListAliasesResponse
 */
- (void)listAliases:(AWSLambdaListAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>). </p><p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p><p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListEventSourceMappings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListEventSourceMappingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListEventSourceMappingsRequest
 @see AWSLambdaListEventSourceMappingsResponse
 */
- (AWSTask<AWSLambdaListEventSourceMappingsResponse *> *)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request;

/**
 <p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>). </p><p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p><p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListEventSourceMappings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListEventSourceMappingsRequest
 @see AWSLambdaListEventSourceMappingsResponse
 */
- (void)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListEventSourceMappingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p><p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p><p>If you are using the versioning feature, you can list all of your functions or only <code>$LATEST</code> versions. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListFunctions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaListFunctionsRequest
 @see AWSLambdaListFunctionsResponse
 */
- (AWSTask<AWSLambdaListFunctionsResponse *> *)listFunctions:(AWSLambdaListFunctionsRequest *)request;

/**
 <p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p><p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p><p>If you are using the versioning feature, you can list all of your functions or only <code>$LATEST</code> versions. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListFunctions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaListFunctionsRequest
 @see AWSLambdaListFunctionsResponse
 */
- (void)listFunctions:(AWSLambdaListFunctionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListFunctionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags assigned to a function when supplied the function ARN (Amazon Resource Name). For more information on Tagging, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListTagsRequest
 @see AWSLambdaListTagsResponse
 */
- (AWSTask<AWSLambdaListTagsResponse *> *)listTags:(AWSLambdaListTagsRequest *)request;

/**
 <p>Returns a list of tags assigned to a function when supplied the function ARN (Amazon Resource Name). For more information on Tagging, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListTagsRequest
 @see AWSLambdaListTagsResponse
 */
- (void)listTags:(AWSLambdaListTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all versions of a function. For information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListVersionsByFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListVersionsByFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListVersionsByFunctionRequest
 @see AWSLambdaListVersionsByFunctionResponse
 */
- (AWSTask<AWSLambdaListVersionsByFunctionResponse *> *)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request;

/**
 <p>Lists all versions of a function. For information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListVersionsByFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListVersionsByFunctionRequest
 @see AWSLambdaListVersionsByFunctionResponse
 */
- (void)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListVersionsByFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Publishes a version of your function from the current snapshot of $LATEST. That is, AWS Lambda takes a snapshot of the function code and configuration information from $LATEST and publishes a new version. The code and configuration cannot be modified after publication. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the PublishVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaPublishVersionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)publishVersion:(AWSLambdaPublishVersionRequest *)request;

/**
 <p>Publishes a version of your function from the current snapshot of $LATEST. That is, AWS Lambda takes a snapshot of the function code and configuration information from $LATEST and publishes a new version. The code and configuration cannot be modified after publication. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p>
 
 @param request A container for the necessary parameters to execute the PublishVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaPublishVersionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)publishVersion:(AWSLambdaPublishVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets a limit on the number of concurrent executions available to this function. It is a subset of your account's total concurrent execution limit per region. Note that Lambda automatically reserves a buffer of 100 concurrent executions for functions without any reserved concurrency limit. This means if your account limit is 1000, you have a total of 900 available to allocate to individual functions. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaConcurrency`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaPutFunctionConcurrencyRequest
 @see AWSLambdaConcurrency
 */
- (AWSTask<AWSLambdaConcurrency *> *)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request;

/**
 <p>Sets a limit on the number of concurrent executions available to this function. It is a subset of your account's total concurrent execution limit per region. Note that Lambda automatically reserves a buffer of 100 concurrent executions for functions without any reserved concurrency limit. This means if your account limit is 1000, you have a total of 900 available to allocate to individual functions. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaPutFunctionConcurrencyRequest
 @see AWSLambdaConcurrency
 */
- (void)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaConcurrency * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes permissions from a function. You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you added the permission. When you remove permissions, disable the event source mapping or trigger configuration first to avoid errors.</p><p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>You need permission for the <code>lambda:RemovePermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (AWSTask *)removePermission:(AWSLambdaRemovePermissionRequest *)request;

/**
 <p>Removes permissions from a function. You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you added the permission. When you remove permissions, disable the event source mapping or trigger configuration first to avoid errors.</p><p>Permissions apply to the Amazon Resource Name (ARN) used to invoke the function, which can be unqualified (the unpublished version of the function), or include a version or alias. If a client uses a version or alias to invoke a function, use the <code>Qualifier</code> parameter to apply permissions to that ARN. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>You need permission for the <code>lambda:RemovePermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (void)removePermission:(AWSLambdaRemovePermissionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Creates a list of tags (key-value pairs) on the Lambda function. Requires the Lambda function ARN (Amazon Resource Name). If a key is specified without a value, Lambda creates a tag with the specified key and a value of null. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSLambdaTagResourceRequest *)request;

/**
 <p>Creates a list of tags (key-value pairs) on the Lambda function. Requires the Lambda function ARN (Amazon Resource Name). If a key is specified without a value, Lambda creates a tag with the specified key and a value of null. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaTagResourceRequest
 */
- (void)tagResource:(AWSLambdaTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes tags from a Lambda function. Requires the function ARN (Amazon Resource Name). For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSLambdaUntagResourceRequest *)request;

/**
 <p>Removes tags from a Lambda function. Requires the function ARN (Amazon Resource Name). For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/tagging.html">Tagging Lambda Functions</a> in the <b>AWS Lambda Developer Guide</b>. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUntagResourceRequest
 */
- (void)untagResource:(AWSLambdaUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Using this API you can update the function version to which the alias points and the alias description. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:UpdateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)updateAlias:(AWSLambdaUpdateAliasRequest *)request;

/**
 <p>Using this API you can update the function version to which the alias points and the alias description. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">Introduction to AWS Lambda Aliases</a>.</p><p>This requires permission for the lambda:UpdateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)updateAlias:(AWSLambdaUpdateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping.</p><p>If you disable the event source mapping, AWS Lambda stops polling. If you enable again, it will resume polling from the time it had stopped polling, so you don't lose processing of any records. However, if you delete event source mapping and create it again, it will reset.</p><p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaUpdateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request;

/**
 <p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping.</p><p>If you disable the event source mapping, AWS Lambda stops polling. If you enable again, it will resume polling from the time it had stopped polling, so you don't lose processing of any records. However, if you delete event source mapping and create it again, it will reset.</p><p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaUpdateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration.</p><p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionCodeRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request;

/**
 <p>Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration.</p><p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionCodeRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code.</p><p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request;

/**
 <p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code.</p><p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">AWS Lambda Function Versioning and Aliases</a>. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
