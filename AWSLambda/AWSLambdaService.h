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
#import "AWSLambdaModel.h"
#import "AWSLambdaResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSLambda
FOUNDATION_EXPORT NSString *const AWSLambdaSDKVersion;

/**
 <fullname>AWS Lambda</fullname><p><b>Overview</b></p><p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS Lambda</a>, and for information about how the service works, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a> in the <b>AWS Lambda Developer Guide</b>.</p>
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
 <p>Adds permissions to the resource-based policy of a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Use this action to grant layer usage permission to other accounts. You can grant permission to a single account, all AWS accounts, or all accounts in an organization.</p><p>To revoke permission, call <a>RemoveLayerVersionPermission</a> with the statement ID that you specified when you added it.</p>
 
 @param request A container for the necessary parameters to execute the AddLayerVersionPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAddLayerVersionPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddLayerVersionPermissionRequest
 @see AWSLambdaAddLayerVersionPermissionResponse
 */
- (AWSTask<AWSLambdaAddLayerVersionPermissionResponse *> *)addLayerVersionPermission:(AWSLambdaAddLayerVersionPermissionRequest *)request;

/**
 <p>Adds permissions to the resource-based policy of a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Use this action to grant layer usage permission to other accounts. You can grant permission to a single account, all AWS accounts, or all accounts in an organization.</p><p>To revoke permission, call <a>RemoveLayerVersionPermission</a> with the statement ID that you specified when you added it.</p>
 
 @param request A container for the necessary parameters to execute the AddLayerVersionPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddLayerVersionPermissionRequest
 @see AWSLambdaAddLayerVersionPermissionResponse
 */
- (void)addLayerVersionPermission:(AWSLambdaAddLayerVersionPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAddLayerVersionPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Grants an AWS service or another account permission to use a function. You can apply the policy at the function level, or specify a qualifier to restrict access to a single version or alias. If you use a qualifier, the invoker must use the full Amazon Resource Name (ARN) of that version or alias to invoke the function.</p><p>To grant permission to another account, specify the account ID as the <code>Principal</code>. For AWS services, the principal is a domain-style identifier defined by the service, like <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>. For AWS services, you can also specify the ARN of the associated resource as the <code>SourceArn</code>. If you grant permission to a service principal without specifying the source, other accounts could potentially configure resources in their account to invoke your Lambda function.</p><p>This action adds a statement to a resource-based permissions policy for the function. For more information about function policies, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">Lambda Function Policies</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAddPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (AWSTask<AWSLambdaAddPermissionResponse *> *)addPermission:(AWSLambdaAddPermissionRequest *)request;

/**
 <p>Grants an AWS service or another account permission to use a function. You can apply the policy at the function level, or specify a qualifier to restrict access to a single version or alias. If you use a qualifier, the invoker must use the full Amazon Resource Name (ARN) of that version or alias to invoke the function.</p><p>To grant permission to another account, specify the account ID as the <code>Principal</code>. For AWS services, the principal is a domain-style identifier defined by the service, like <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>. For AWS services, you can also specify the ARN of the associated resource as the <code>SourceArn</code>. If you grant permission to a service principal without specifying the source, other accounts could potentially configure resources in their account to invoke your Lambda function.</p><p>This action adds a statement to a resource-based permissions policy for the function. For more information about function policies, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">Lambda Function Policies</a>. </p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (void)addPermission:(AWSLambdaAddPermissionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAddPermissionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a> for a Lambda function version. Use aliases to provide clients with a function identifier that you can update to invoke a different version.</p><p>You can also map an alias to split invocation requests between two versions. Use the <code>RoutingConfig</code> parameter to specify a second version and the percentage of invocation requests that it receives.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)createAlias:(AWSLambdaCreateAliasRequest *)request;

/**
 <p>Creates an <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a> for a Lambda function version. Use aliases to provide clients with a function identifier that you can update to invoke a different version.</p><p>You can also map an alias to split invocation requests between two versions. Use the <code>RoutingConfig</code> parameter to specify a second version and the percentage of invocation requests that it receives.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)createAlias:(AWSLambdaCreateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a mapping between an event source and an AWS Lambda function. Lambda reads items from the event source and triggers the function.</p><p>For details about each event source type, see the following topics.</p><ul><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html">Using AWS Lambda with Amazon DynamoDB</a></p></li><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html">Using AWS Lambda with Amazon Kinesis</a></p></li><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html">Using AWS Lambda with Amazon SQS</a></p></li></ul><p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p><ul><li><p><code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p></li><li><p><code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p></li><li><p><code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age.</p></li><li><p><code>MaximumRetryAttempts</code> - Discard records after the specified number of retries.</p></li><li><p><code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaCreateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request;

/**
 <p>Creates a mapping between an event source and an AWS Lambda function. Lambda reads items from the event source and triggers the function.</p><p>For details about each event source type, see the following topics.</p><ul><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html">Using AWS Lambda with Amazon DynamoDB</a></p></li><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html">Using AWS Lambda with Amazon Kinesis</a></p></li><li><p><a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html">Using AWS Lambda with Amazon SQS</a></p></li></ul><p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p><ul><li><p><code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p></li><li><p><code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p></li><li><p><code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age.</p></li><li><p><code>MaximumRetryAttempts</code> - Discard records after the specified number of retries.</p></li><li><p><code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CreateEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaCreateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Lambda function. To create a function, you need a <a href="https://docs.aws.amazon.com/lambda/latest/dg/deployment-package-v2.html">deployment package</a> and an <a href="https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution role</a>. The deployment package contains your function code. The execution role grants the function permission to use AWS services, such as Amazon CloudWatch Logs for log streaming and AWS X-Ray for request tracing.</p><p>When you create a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute or so. During this time, you can't invoke or modify the function. The <code>State</code>, <code>StateReason</code>, and <code>StateReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the function is ready to invoke. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function States</a>.</p><p>A function has an unpublished version, and can have published versions and aliases. The unpublished version changes when you update your function's code and configuration. A published version is a snapshot of your function code and configuration that can't be changed. An alias is a named resource that maps to a version, and can be changed to map to a different version. Use the <code>Publish</code> parameter to create version <code>1</code> of your function from its initial configuration.</p><p>The other parameters let you configure version-specific and function-level settings. You can modify version-specific settings later with <a>UpdateFunctionConfiguration</a>. Function-level settings apply to both the unpublished and published versions of the function, and include tags (<a>TagResource</a>) and per-function concurrency limits (<a>PutFunctionConcurrency</a>).</p><p>If another account or an AWS service invokes your function, use <a>AddPermission</a> to grant permission by creating a resource-based IAM policy. You can grant permissions at the function level, on a version, or on an alias.</p><p>To invoke your function directly, use <a>Invoke</a>. To invoke your function in response to events in other AWS services, create an event source mapping (<a>CreateEventSourceMapping</a>), or configure a function trigger in the other service. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html">Invoking Functions</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaCreateFunctionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)createFunction:(AWSLambdaCreateFunctionRequest *)request;

/**
 <p>Creates a Lambda function. To create a function, you need a <a href="https://docs.aws.amazon.com/lambda/latest/dg/deployment-package-v2.html">deployment package</a> and an <a href="https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution role</a>. The deployment package contains your function code. The execution role grants the function permission to use AWS services, such as Amazon CloudWatch Logs for log streaming and AWS X-Ray for request tracing.</p><p>When you create a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute or so. During this time, you can't invoke or modify the function. The <code>State</code>, <code>StateReason</code>, and <code>StateReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the function is ready to invoke. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function States</a>.</p><p>A function has an unpublished version, and can have published versions and aliases. The unpublished version changes when you update your function's code and configuration. A published version is a snapshot of your function code and configuration that can't be changed. An alias is a named resource that maps to a version, and can be changed to map to a different version. Use the <code>Publish</code> parameter to create version <code>1</code> of your function from its initial configuration.</p><p>The other parameters let you configure version-specific and function-level settings. You can modify version-specific settings later with <a>UpdateFunctionConfiguration</a>. Function-level settings apply to both the unpublished and published versions of the function, and include tags (<a>TagResource</a>) and per-function concurrency limits (<a>PutFunctionConcurrency</a>).</p><p>If another account or an AWS service invokes your function, use <a>AddPermission</a> to grant permission by creating a resource-based IAM policy. You can grant permissions at the function level, on a version, or on an alias.</p><p>To invoke your function directly, use <a>Invoke</a>. To invoke your function in response to events in other AWS services, create an event source mapping (<a>CreateEventSourceMapping</a>), or configure a function trigger in the other service. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html">Invoking Functions</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaCreateFunctionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)createFunction:(AWSLambdaCreateFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteAliasRequest
 */
- (AWSTask *)deleteAlias:(AWSLambdaDeleteAliasRequest *)request;

/**
 <p>Deletes a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteAliasRequest
 */
- (void)deleteAlias:(AWSLambdaDeleteAliasRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an <a href="https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html">event source mapping</a>. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p><p>When you delete an event source mapping, it enters a <code>Deleting</code> state and might not be completely deleted for several seconds.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request;

/**
 <p>Deletes an <a href="https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html">event source mapping</a>. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p><p>When you delete an event source mapping, it enters a <code>Deleting</code> state and might not be completely deleted for several seconds.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted.</p><p>To delete Lambda event source mappings that invoke a function, use <a>DeleteEventSourceMapping</a>. For AWS services and resources that invoke your function directly, delete the trigger in the service where you originally configured it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (AWSTask *)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request;

/**
 <p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted.</p><p>To delete Lambda event source mappings that invoke a function, use <a>DeleteEventSourceMapping</a>. For AWS services and resources that invoke your function directly, delete the trigger in the service where you originally configured it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (void)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes a concurrent execution limit from a function.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionConcurrencyRequest
 */
- (AWSTask *)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request;

/**
 <p>Removes a concurrent execution limit from a function.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionConcurrencyRequest
 */
- (void)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionEventInvokeConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteFunctionEventInvokeConfigRequest
 */
- (AWSTask *)deleteFunctionEventInvokeConfig:(AWSLambdaDeleteFunctionEventInvokeConfigRequest *)request;

/**
 <p>Deletes the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunctionEventInvokeConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteFunctionEventInvokeConfigRequest
 */
- (void)deleteFunctionEventInvokeConfig:(AWSLambdaDeleteFunctionEventInvokeConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Deleted versions can no longer be viewed or added to functions. To avoid breaking functions, a copy of the version remains in Lambda until no functions refer to it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLayerVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteLayerVersionRequest
 */
- (AWSTask *)deleteLayerVersion:(AWSLambdaDeleteLayerVersionRequest *)request;

/**
 <p>Deletes a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Deleted versions can no longer be viewed or added to functions. To avoid breaking functions, a copy of the version remains in Lambda until no functions refer to it.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLayerVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteLayerVersionRequest
 */
- (void)deleteLayerVersion:(AWSLambdaDeleteLayerVersionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the provisioned concurrency configuration for a function.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisionedConcurrencyConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaDeleteProvisionedConcurrencyConfigRequest
 */
- (AWSTask *)deleteProvisionedConcurrencyConfig:(AWSLambdaDeleteProvisionedConcurrencyConfigRequest *)request;

/**
 <p>Deletes the provisioned concurrency configuration for a function.</p>
 
 @param request A container for the necessary parameters to execute the DeleteProvisionedConcurrencyConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaDeleteProvisionedConcurrencyConfigRequest
 */
- (void)deleteProvisionedConcurrencyConfig:(AWSLambdaDeleteProvisionedConcurrencyConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves details about your account's <a href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a> and usage in an AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetAccountSettingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetAccountSettingsRequest
 @see AWSLambdaGetAccountSettingsResponse
 */
- (AWSTask<AWSLambdaGetAccountSettingsResponse *> *)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request;

/**
 <p>Retrieves details about your account's <a href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a> and usage in an AWS Region.</p>
 
 @param request A container for the necessary parameters to execute the GetAccountSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetAccountSettingsRequest
 @see AWSLambdaGetAccountSettingsResponse
 */
- (void)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetAccountSettingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details about a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)getAlias:(AWSLambdaGetAliasRequest *)request;

/**
 <p>Returns details about a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)getAlias:(AWSLambdaGetAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details about an event source mapping. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request;

/**
 <p>Returns details about an event source mapping. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the function or function version, with a link to download the deployment package that's valid for 10 minutes. If you specify a function version, only details that are specific to that version are returned.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (AWSTask<AWSLambdaGetFunctionResponse *> *)getFunction:(AWSLambdaGetFunctionRequest *)request;

/**
 <p>Returns information about the function or function version, with a link to download the deployment package that's valid for 10 minutes. If you specify a function version, only details that are specific to that version are returned.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (void)getFunction:(AWSLambdaGetFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns details about the reserved concurrency configuration for a function. To set a concurrency limit for a function, use <a>PutFunctionConcurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetFunctionConcurrencyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetFunctionConcurrencyRequest
 @see AWSLambdaGetFunctionConcurrencyResponse
 */
- (AWSTask<AWSLambdaGetFunctionConcurrencyResponse *> *)getFunctionConcurrency:(AWSLambdaGetFunctionConcurrencyRequest *)request;

/**
 <p>Returns details about the reserved concurrency configuration for a function. To set a concurrency limit for a function, use <a>PutFunctionConcurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaGetFunctionConcurrencyRequest
 @see AWSLambdaGetFunctionConcurrencyResponse
 */
- (void)getFunctionConcurrency:(AWSLambdaGetFunctionConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetFunctionConcurrencyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the version-specific settings of a Lambda function or version. The output includes only options that can vary between versions of a function. To modify these settings, use <a>UpdateFunctionConfiguration</a>.</p><p>To get all of a function's details, including function-level settings, use <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request;

/**
 <p>Returns the version-specific settings of a Lambda function or version. The output includes only options that can vary between versions of a function. To modify these settings, use <a>UpdateFunctionConfiguration</a>.</p><p>To get all of a function's details, including function-level settings, use <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionEventInvokeConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionEventInvokeConfig`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)getFunctionEventInvokeConfig:(AWSLambdaGetFunctionEventInvokeConfigRequest *)request;

/**
 <p>Retrieves the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionEventInvokeConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (void)getFunctionEventInvokeConfig:(AWSLambdaGetFunctionEventInvokeConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionEventInvokeConfig * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetLayerVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaGetLayerVersionRequest
 @see AWSLambdaGetLayerVersionResponse
 */
- (AWSTask<AWSLambdaGetLayerVersionResponse *> *)getLayerVersion:(AWSLambdaGetLayerVersionRequest *)request;

/**
 <p>Returns information about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaGetLayerVersionRequest
 @see AWSLambdaGetLayerVersionResponse
 */
- (void)getLayerVersion:(AWSLambdaGetLayerVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetLayerVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersionByArn service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetLayerVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaGetLayerVersionByArnRequest
 @see AWSLambdaGetLayerVersionResponse
 */
- (AWSTask<AWSLambdaGetLayerVersionResponse *> *)getLayerVersionByArn:(AWSLambdaGetLayerVersionByArnRequest *)request;

/**
 <p>Returns information about a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersionByArn service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceNotFound`.
 
 @see AWSLambdaGetLayerVersionByArnRequest
 @see AWSLambdaGetLayerVersionResponse
 */
- (void)getLayerVersionByArn:(AWSLambdaGetLayerVersionByArnRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetLayerVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the permission policy for a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetLayerVersionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetLayerVersionPolicyRequest
 @see AWSLambdaGetLayerVersionPolicyResponse
 */
- (AWSTask<AWSLambdaGetLayerVersionPolicyResponse *> *)getLayerVersionPolicy:(AWSLambdaGetLayerVersionPolicyRequest *)request;

/**
 <p>Returns the permission policy for a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLayerVersionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetLayerVersionPolicyRequest
 @see AWSLambdaGetLayerVersionPolicyResponse
 */
- (void)getLayerVersionPolicy:(AWSLambdaGetLayerVersionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetLayerVersionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the <a href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">resource-based IAM policy</a> for a function, version, or alias.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (AWSTask<AWSLambdaGetPolicyResponse *> *)getPolicy:(AWSLambdaGetPolicyRequest *)request;

/**
 <p>Returns the <a href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">resource-based IAM policy</a> for a function, version, or alias.</p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (void)getPolicy:(AWSLambdaGetPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the provisioned concurrency configuration for a function's alias or version.</p>
 
 @param request A container for the necessary parameters to execute the GetProvisionedConcurrencyConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetProvisionedConcurrencyConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`, `AWSLambdaErrorProvisionedConcurrencyConfigNotFound`.
 
 @see AWSLambdaGetProvisionedConcurrencyConfigRequest
 @see AWSLambdaGetProvisionedConcurrencyConfigResponse
 */
- (AWSTask<AWSLambdaGetProvisionedConcurrencyConfigResponse *> *)getProvisionedConcurrencyConfig:(AWSLambdaGetProvisionedConcurrencyConfigRequest *)request;

/**
 <p>Retrieves the provisioned concurrency configuration for a function's alias or version.</p>
 
 @param request A container for the necessary parameters to execute the GetProvisionedConcurrencyConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`, `AWSLambdaErrorProvisionedConcurrencyConfigNotFound`.
 
 @see AWSLambdaGetProvisionedConcurrencyConfigRequest
 @see AWSLambdaGetProvisionedConcurrencyConfigResponse
 */
- (void)getProvisionedConcurrencyConfig:(AWSLambdaGetProvisionedConcurrencyConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaGetProvisionedConcurrencyConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Invokes a Lambda function. You can invoke a function synchronously (and wait for the response), or asynchronously. To invoke a function asynchronously, set <code>InvocationType</code> to <code>Event</code>.</p><p>For <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html">synchronous invocation</a>, details about the function response, including errors, are included in the response body and headers. For either invocation type, you can find more information in the <a href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html">execution log</a> and <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html">trace</a>.</p><p>When an error occurs, your function may be invoked multiple times. Retry behavior varies by error type, client, event source, and invocation type. For example, if you invoke a function asynchronously and it returns an error, Lambda executes the function up to two more times. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html">Retry Behavior</a>.</p><p>For <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous invocation</a>, Lambda adds events to a queue before sending them to your function. If your function does not have enough capacity to keep up with the queue, events may be lost. Occasionally, your function may receive the same event multiple times, even if no error occurs. To retain events that were not processed, configure your function with a <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter queue</a>.</p><p>The status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your function from executing, such as permissions errors, <a href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limit errors</a>, or issues with your function's code and configuration. For example, Lambda returns <code>TooManyRequestsException</code> if executing the function would cause you to exceed a concurrency limit at either the account level (<code>ConcurrentInvocationLimitExceeded</code>) or function level (<code>ReservedFunctionConcurrentInvocationLimitExceeded</code>).</p><p>For functions with a long timeout, your client might be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvocationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorEC2Unexpected`, `AWSLambdaErrorSubnetIPAddressLimitReached`, `AWSLambdaErrorENILimitReached`, `AWSLambdaErrorEC2Throttled`, `AWSLambdaErrorEC2AccessDenied`, `AWSLambdaErrorInvalidSubnetID`, `AWSLambdaErrorInvalidSecurityGroupID`, `AWSLambdaErrorInvalidZipFile`, `AWSLambdaErrorKMSDisabled`, `AWSLambdaErrorKMSInvalidState`, `AWSLambdaErrorKMSAccessDenied`, `AWSLambdaErrorKMSNotFound`, `AWSLambdaErrorInvalidRuntime`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceNotReady`.
 
 @see AWSLambdaInvocationRequest
 @see AWSLambdaInvocationResponse
 */
- (AWSTask<AWSLambdaInvocationResponse *> *)invoke:(AWSLambdaInvocationRequest *)request;

/**
 <p>Invokes a Lambda function. You can invoke a function synchronously (and wait for the response), or asynchronously. To invoke a function asynchronously, set <code>InvocationType</code> to <code>Event</code>.</p><p>For <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html">synchronous invocation</a>, details about the function response, including errors, are included in the response body and headers. For either invocation type, you can find more information in the <a href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html">execution log</a> and <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html">trace</a>.</p><p>When an error occurs, your function may be invoked multiple times. Retry behavior varies by error type, client, event source, and invocation type. For example, if you invoke a function asynchronously and it returns an error, Lambda executes the function up to two more times. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html">Retry Behavior</a>.</p><p>For <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous invocation</a>, Lambda adds events to a queue before sending them to your function. If your function does not have enough capacity to keep up with the queue, events may be lost. Occasionally, your function may receive the same event multiple times, even if no error occurs. To retain events that were not processed, configure your function with a <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter queue</a>.</p><p>The status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your function from executing, such as permissions errors, <a href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limit errors</a>, or issues with your function's code and configuration. For example, Lambda returns <code>TooManyRequestsException</code> if executing the function would cause you to exceed a concurrency limit at either the account level (<code>ConcurrentInvocationLimitExceeded</code>) or function level (<code>ReservedFunctionConcurrentInvocationLimitExceeded</code>).</p><p>For functions with a long timeout, your client might be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorEC2Unexpected`, `AWSLambdaErrorSubnetIPAddressLimitReached`, `AWSLambdaErrorENILimitReached`, `AWSLambdaErrorEC2Throttled`, `AWSLambdaErrorEC2AccessDenied`, `AWSLambdaErrorInvalidSubnetID`, `AWSLambdaErrorInvalidSecurityGroupID`, `AWSLambdaErrorInvalidZipFile`, `AWSLambdaErrorKMSDisabled`, `AWSLambdaErrorKMSInvalidState`, `AWSLambdaErrorKMSAccessDenied`, `AWSLambdaErrorKMSNotFound`, `AWSLambdaErrorInvalidRuntime`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceNotReady`.
 
 @see AWSLambdaInvocationRequest
 @see AWSLambdaInvocationResponse
 */
- (void)invoke:(AWSLambdaInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaInvocationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <important><p>For asynchronous function invocation, use <a>Invoke</a>.</p></important><p>Invokes a function asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the InvokeAsync service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvokeAsyncResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorInvalidRuntime`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaInvokeAsyncRequest
 @see AWSLambdaInvokeAsyncResponse
 */
- (AWSTask<AWSLambdaInvokeAsyncResponse *> *)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request;

/**
 <important><p>For asynchronous function invocation, use <a>Invoke</a>.</p></important><p>Invokes a function asynchronously.</p>
 
 @param request A container for the necessary parameters to execute the InvokeAsync service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorInvalidRuntime`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaInvokeAsyncRequest
 @see AWSLambdaInvokeAsyncResponse
 */
- (void)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaInvokeAsyncResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">aliases</a> for a Lambda function.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListAliasesRequest
 @see AWSLambdaListAliasesResponse
 */
- (AWSTask<AWSLambdaListAliasesResponse *> *)listAliases:(AWSLambdaListAliasesRequest *)request;

/**
 <p>Returns a list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">aliases</a> for a Lambda function.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListAliasesRequest
 @see AWSLambdaListAliasesResponse
 */
- (void)listAliases:(AWSLambdaListAliasesRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListAliasesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists event source mappings. Specify an <code>EventSourceArn</code> to only show event source mappings for a single event source.</p>
 
 @param request A container for the necessary parameters to execute the ListEventSourceMappings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListEventSourceMappingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListEventSourceMappingsRequest
 @see AWSLambdaListEventSourceMappingsResponse
 */
- (AWSTask<AWSLambdaListEventSourceMappingsResponse *> *)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request;

/**
 <p>Lists event source mappings. Specify an <code>EventSourceArn</code> to only show event source mappings for a single event source.</p>
 
 @param request A container for the necessary parameters to execute the ListEventSourceMappings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListEventSourceMappingsRequest
 @see AWSLambdaListEventSourceMappingsResponse
 */
- (void)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListEventSourceMappingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of configurations for asynchronous invocation for a function.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListFunctionEventInvokeConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListFunctionEventInvokeConfigsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaListFunctionEventInvokeConfigsRequest
 @see AWSLambdaListFunctionEventInvokeConfigsResponse
 */
- (AWSTask<AWSLambdaListFunctionEventInvokeConfigsResponse *> *)listFunctionEventInvokeConfigs:(AWSLambdaListFunctionEventInvokeConfigsRequest *)request;

/**
 <p>Retrieves a list of configurations for asynchronous invocation for a function.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListFunctionEventInvokeConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaListFunctionEventInvokeConfigsRequest
 @see AWSLambdaListFunctionEventInvokeConfigsResponse
 */
- (void)listFunctionEventInvokeConfigs:(AWSLambdaListFunctionEventInvokeConfigsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListFunctionEventInvokeConfigsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of Lambda functions, with the version-specific configuration of each. Lambda returns up to 50 functions per call.</p><p>Set <code>FunctionVersion</code> to <code>ALL</code> to include all published versions of each function in addition to the unpublished version. To get more information about a function or version, use <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListFunctions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaListFunctionsRequest
 @see AWSLambdaListFunctionsResponse
 */
- (AWSTask<AWSLambdaListFunctionsResponse *> *)listFunctions:(AWSLambdaListFunctionsRequest *)request;

/**
 <p>Returns a list of Lambda functions, with the version-specific configuration of each. Lambda returns up to 50 functions per call.</p><p>Set <code>FunctionVersion</code> to <code>ALL</code> to include all published versions of each function in addition to the unpublished version. To get more information about a function or version, use <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListFunctions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaListFunctionsRequest
 @see AWSLambdaListFunctionsResponse
 */
- (void)listFunctions:(AWSLambdaListFunctionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListFunctionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the versions of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Versions that have been deleted aren't listed. Specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime identifier</a> to list only versions that indicate that they're compatible with that runtime.</p>
 
 @param request A container for the necessary parameters to execute the ListLayerVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListLayerVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListLayerVersionsRequest
 @see AWSLambdaListLayerVersionsResponse
 */
- (AWSTask<AWSLambdaListLayerVersionsResponse *> *)listLayerVersions:(AWSLambdaListLayerVersionsRequest *)request;

/**
 <p>Lists the versions of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. Versions that have been deleted aren't listed. Specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime identifier</a> to list only versions that indicate that they're compatible with that runtime.</p>
 
 @param request A container for the necessary parameters to execute the ListLayerVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListLayerVersionsRequest
 @see AWSLambdaListLayerVersionsResponse
 */
- (void)listLayerVersions:(AWSLambdaListLayerVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListLayerVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layers</a> and shows information about the latest version of each. Specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime identifier</a> to list only layers that indicate that they're compatible with that runtime.</p>
 
 @param request A container for the necessary parameters to execute the ListLayers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListLayersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListLayersRequest
 @see AWSLambdaListLayersResponse
 */
- (AWSTask<AWSLambdaListLayersResponse *> *)listLayers:(AWSLambdaListLayersRequest *)request;

/**
 <p>Lists <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layers</a> and shows information about the latest version of each. Specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime identifier</a> to list only layers that indicate that they're compatible with that runtime.</p>
 
 @param request A container for the necessary parameters to execute the ListLayers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListLayersRequest
 @see AWSLambdaListLayersResponse
 */
- (void)listLayers:(AWSLambdaListLayersRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListLayersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a list of provisioned concurrency configurations for a function.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisionedConcurrencyConfigs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListProvisionedConcurrencyConfigsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaListProvisionedConcurrencyConfigsRequest
 @see AWSLambdaListProvisionedConcurrencyConfigsResponse
 */
- (AWSTask<AWSLambdaListProvisionedConcurrencyConfigsResponse *> *)listProvisionedConcurrencyConfigs:(AWSLambdaListProvisionedConcurrencyConfigsRequest *)request;

/**
 <p>Retrieves a list of provisioned concurrency configurations for a function.</p>
 
 @param request A container for the necessary parameters to execute the ListProvisionedConcurrencyConfigs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaListProvisionedConcurrencyConfigsRequest
 @see AWSLambdaListProvisionedConcurrencyConfigsResponse
 */
- (void)listProvisionedConcurrencyConfigs:(AWSLambdaListProvisionedConcurrencyConfigsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListProvisionedConcurrencyConfigsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>. You can also view tags with <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListTagsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListTagsRequest
 @see AWSLambdaListTagsResponse
 */
- (AWSTask<AWSLambdaListTagsResponse *> *)listTags:(AWSLambdaListTagsRequest *)request;

/**
 <p>Returns a function's <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>. You can also view tags with <a>GetFunction</a>.</p>
 
 @param request A container for the necessary parameters to execute the ListTags service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListTagsRequest
 @see AWSLambdaListTagsResponse
 */
- (void)listTags:(AWSLambdaListTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListTagsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">versions</a>, with the version-specific configuration of each. Lambda returns up to 50 versions per call.</p>
 
 @param request A container for the necessary parameters to execute the ListVersionsByFunction service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListVersionsByFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListVersionsByFunctionRequest
 @see AWSLambdaListVersionsByFunctionResponse
 */
- (AWSTask<AWSLambdaListVersionsByFunctionResponse *> *)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request;

/**
 <p>Returns a list of <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">versions</a>, with the version-specific configuration of each. Lambda returns up to 50 versions per call.</p>
 
 @param request A container for the necessary parameters to execute the ListVersionsByFunction service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListVersionsByFunctionRequest
 @see AWSLambdaListVersionsByFunctionResponse
 */
- (void)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaListVersionsByFunctionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a> from a ZIP archive. Each time you call <code>PublishLayerVersion</code> with the same layer name, a new version is created.</p><p>Add layers to your function with <a>CreateFunction</a> or <a>UpdateFunctionConfiguration</a>.</p>
 
 @param request A container for the necessary parameters to execute the PublishLayerVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaPublishLayerVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaPublishLayerVersionRequest
 @see AWSLambdaPublishLayerVersionResponse
 */
- (AWSTask<AWSLambdaPublishLayerVersionResponse *> *)publishLayerVersion:(AWSLambdaPublishLayerVersionRequest *)request;

/**
 <p>Creates an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a> from a ZIP archive. Each time you call <code>PublishLayerVersion</code> with the same layer name, a new version is created.</p><p>Add layers to your function with <a>CreateFunction</a> or <a>UpdateFunctionConfiguration</a>.</p>
 
 @param request A container for the necessary parameters to execute the PublishLayerVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaPublishLayerVersionRequest
 @see AWSLambdaPublishLayerVersionResponse
 */
- (void)publishLayerVersion:(AWSLambdaPublishLayerVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaPublishLayerVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version</a> from the current code and configuration of a function. Use versions to create a snapshot of your function code and configuration that doesn't change.</p><p>AWS Lambda doesn't publish a version if the function's configuration and code haven't changed since the last version. Use <a>UpdateFunctionCode</a> or <a>UpdateFunctionConfiguration</a> to update the function before publishing a version.</p><p>Clients can invoke versions directly or with an alias. To create an alias, use <a>CreateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the PublishVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaPublishVersionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)publishVersion:(AWSLambdaPublishVersionRequest *)request;

/**
 <p>Creates a <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version</a> from the current code and configuration of a function. Use versions to create a snapshot of your function code and configuration that doesn't change.</p><p>AWS Lambda doesn't publish a version if the function's configuration and code haven't changed since the last version. Use <a>UpdateFunctionCode</a> or <a>UpdateFunctionConfiguration</a> to update the function before publishing a version.</p><p>Clients can invoke versions directly or with an alias. To create an alias, use <a>CreateAlias</a>.</p>
 
 @param request A container for the necessary parameters to execute the PublishVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaPublishVersionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)publishVersion:(AWSLambdaPublishVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the maximum number of simultaneous executions for a function, and reserves capacity for that concurrency level.</p><p>Concurrency settings apply to the function as a whole, including all published versions and the unpublished version. Reserving concurrency both ensures that your function has capacity to process the specified number of events simultaneously, and prevents it from scaling beyond that level. Use <a>GetFunction</a> to see the current setting for a function.</p><p>Use <a>GetAccountSettings</a> to see your Regional concurrency limit. You can reserve concurrency for as many functions as you like, as long as you leave at least 100 simultaneous executions unreserved for functions that aren't configured with a per-function limit. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionConcurrency service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaConcurrency`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaPutFunctionConcurrencyRequest
 @see AWSLambdaConcurrency
 */
- (AWSTask<AWSLambdaConcurrency *> *)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request;

/**
 <p>Sets the maximum number of simultaneous executions for a function, and reserves capacity for that concurrency level.</p><p>Concurrency settings apply to the function as a whole, including all published versions and the unpublished version. Reserving concurrency both ensures that your function has capacity to process the specified number of events simultaneously, and prevents it from scaling beyond that level. Use <a>GetFunction</a> to see the current setting for a function.</p><p>Use <a>GetAccountSettings</a> to see your Regional concurrency limit. You can reserve concurrency for as many functions as you like, as long as you leave at least 100 simultaneous executions unreserved for functions that aren't configured with a per-function limit. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing Concurrency</a>.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionConcurrency service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaPutFunctionConcurrencyRequest
 @see AWSLambdaConcurrency
 */
- (void)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaConcurrency * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures options for <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous invocation</a> on a function, version, or alias. If a configuration already exists for a function, version, or alias, this operation overwrites it. If you exclude any settings, they are removed. To set one option without affecting existing settings for other options, use <a>PutFunctionEventInvokeConfig</a>.</p><p>By default, Lambda retries an asynchronous invocation twice if the function returns an error. It retains events in a queue for up to six hours. When an event fails all processing attempts or stays in the asynchronous invocation queue for too long, Lambda discards it. To retain discarded events, configure a dead-letter queue with <a>UpdateFunctionConfiguration</a>.</p><p>To send an invocation record to a queue, topic, function, or event bus, specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations">destination</a>. You can configure separate destinations for successful invocations (on-success) and events that fail all processing attempts (on-failure). You can configure destinations in addition to or instead of a dead-letter queue.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionEventInvokeConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionEventInvokeConfig`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaPutFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)putFunctionEventInvokeConfig:(AWSLambdaPutFunctionEventInvokeConfigRequest *)request;

/**
 <p>Configures options for <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous invocation</a> on a function, version, or alias. If a configuration already exists for a function, version, or alias, this operation overwrites it. If you exclude any settings, they are removed. To set one option without affecting existing settings for other options, use <a>PutFunctionEventInvokeConfig</a>.</p><p>By default, Lambda retries an asynchronous invocation twice if the function returns an error. It retains events in a queue for up to six hours. When an event fails all processing attempts or stays in the asynchronous invocation queue for too long, Lambda discards it. To retain discarded events, configure a dead-letter queue with <a>UpdateFunctionConfiguration</a>.</p><p>To send an invocation record to a queue, topic, function, or event bus, specify a <a href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations">destination</a>. You can configure separate destinations for successful invocations (on-success) and events that fail all processing attempts (on-failure). You can configure destinations in addition to or instead of a dead-letter queue.</p>
 
 @param request A container for the necessary parameters to execute the PutFunctionEventInvokeConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaPutFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (void)putFunctionEventInvokeConfig:(AWSLambdaPutFunctionEventInvokeConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionEventInvokeConfig * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a provisioned concurrency configuration to a function's alias or version.</p>
 
 @param request A container for the necessary parameters to execute the PutProvisionedConcurrencyConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaPutProvisionedConcurrencyConfigResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaPutProvisionedConcurrencyConfigRequest
 @see AWSLambdaPutProvisionedConcurrencyConfigResponse
 */
- (AWSTask<AWSLambdaPutProvisionedConcurrencyConfigResponse *> *)putProvisionedConcurrencyConfig:(AWSLambdaPutProvisionedConcurrencyConfigRequest *)request;

/**
 <p>Adds a provisioned concurrency configuration to a function's alias or version.</p>
 
 @param request A container for the necessary parameters to execute the PutProvisionedConcurrencyConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorService`.
 
 @see AWSLambdaPutProvisionedConcurrencyConfigRequest
 @see AWSLambdaPutProvisionedConcurrencyConfigResponse
 */
- (void)putProvisionedConcurrencyConfig:(AWSLambdaPutProvisionedConcurrencyConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaPutProvisionedConcurrencyConfigResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes a statement from the permissions policy for a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the RemoveLayerVersionPermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemoveLayerVersionPermissionRequest
 */
- (AWSTask *)removeLayerVersionPermission:(AWSLambdaRemoveLayerVersionPermissionRequest *)request;

/**
 <p>Removes a statement from the permissions policy for a version of an <a href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the RemoveLayerVersionPermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemoveLayerVersionPermissionRequest
 */
- (void)removeLayerVersionPermission:(AWSLambdaRemoveLayerVersionPermissionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Revokes function-use permission from an AWS service or another account. You can get the ID of the statement from the output of <a>GetPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (AWSTask *)removePermission:(AWSLambdaRemovePermissionRequest *)request;

/**
 <p>Revokes function-use permission from an AWS service or another account. You can get the ID of the statement from the output of <a>GetPolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (void)removePermission:(AWSLambdaRemovePermissionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a> to a function.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaTagResourceRequest
 */
- (AWSTask *)tagResource:(AWSLambdaTagResourceRequest *)request;

/**
 <p>Adds <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a> to a function.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaTagResourceRequest
 */
- (void)tagResource:(AWSLambdaTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Removes <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a> from a function.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUntagResourceRequest
 */
- (AWSTask *)untagResource:(AWSLambdaUntagResourceRequest *)request;

/**
 <p>Removes <a href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a> from a function.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUntagResourceRequest
 */
- (void)untagResource:(AWSLambdaUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration of a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUpdateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask<AWSLambdaAliasConfiguration *> *)updateAlias:(AWSLambdaUpdateAliasRequest *)request;

/**
 <p>Updates the configuration of a Lambda function <a href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUpdateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (void)updateAlias:(AWSLambdaUpdateAliasRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaAliasConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an event source mapping. You can change the function that AWS Lambda invokes, or pause invocation and resume later from the same location.</p><p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p><ul><li><p><code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p></li><li><p><code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p></li><li><p><code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age.</p></li><li><p><code>MaximumRetryAttempts</code> - Discard records after the specified number of retries.</p></li><li><p><code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaUpdateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request;

/**
 <p>Updates an event source mapping. You can change the function that AWS Lambda invokes, or pause invocation and resume later from the same location.</p><p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p><ul><li><p><code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p></li><li><p><code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p></li><li><p><code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age.</p></li><li><p><code>MaximumRetryAttempts</code> - Discard records after the specified number of retries.</p></li><li><p><code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorResourceInUse`.
 
 @see AWSLambdaUpdateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (void)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaEventSourceMappingConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Lambda function's code.</p><p>The function's code is locked when you publish a version. You can't modify the code of a published version, only the unpublished version.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionCode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUpdateFunctionCodeRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request;

/**
 <p>Updates a Lambda function's code.</p><p>The function's code is locked when you publish a version. You can't modify the code of a published version, only the unpublished version.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionCode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`, `AWSLambdaErrorPreconditionFailed`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUpdateFunctionCodeRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Modify the version-specific settings of a Lambda function.</p><p>When you update a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute. During this time, you can't modify the function, but you can still invoke it. The <code>LastUpdateStatus</code>, <code>LastUpdateStatusReason</code>, and <code>LastUpdateStatusReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the update is complete and the function is processing events with the new configuration. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function States</a>.</p><p>These settings can vary between versions of a function and are locked when you publish a version. You can't modify the configuration of a published version, only the unpublished version.</p><p>To configure function concurrency, use <a>PutFunctionConcurrency</a>. To grant invoke permissions to an account or AWS service, use <a>AddPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request;

/**
 <p>Modify the version-specific settings of a Lambda function.</p><p>When you update a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute. During this time, you can't modify the function, but you can still invoke it. The <code>LastUpdateStatus</code>, <code>LastUpdateStatusReason</code>, and <code>LastUpdateStatusReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the update is complete and the function is processing events with the new configuration. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function States</a>.</p><p>These settings can vary between versions of a function and are locked when you publish a version. You can't modify the configuration of a published version, only the unpublished version.</p><p>To configure function concurrency, use <a>PutFunctionConcurrency</a>. To grant invoke permissions to an account or AWS service, use <a>AddPermission</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorPreconditionFailed`.
 
 @see AWSLambdaUpdateFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (void)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionConfiguration * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionEventInvokeConfig service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionEventInvokeConfig`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUpdateFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)updateFunctionEventInvokeConfig:(AWSLambdaUpdateFunctionEventInvokeConfigRequest *)request;

/**
 <p>Updates the configuration for asynchronous invocation for a function, version, or alias.</p><p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionEventInvokeConfig service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUpdateFunctionEventInvokeConfigRequest
 @see AWSLambdaFunctionEventInvokeConfig
 */
- (void)updateFunctionEventInvokeConfig:(AWSLambdaUpdateFunctionEventInvokeConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaFunctionEventInvokeConfig * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
