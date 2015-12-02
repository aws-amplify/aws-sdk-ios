/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSLambdaModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <fullname>AWS Lambda</fullname><p><b>Overview</b></p><p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, go to <a href="http://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS Lambda</a>, and for information about how the service works, go to <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p>
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

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let Lambda = AWSLambda.defaultLambda()

 *Objective-C*

     AWSLambda *Lambda = [AWSLambda defaultLambda];

 @return The default service client.
 */
+ (instancetype)defaultLambda;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLambda.registerLambdaWithConfiguration(configuration, forKey: "USWest2Lambda")

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
 Retrieves the service client associated with the key. You need to call `+ registerLambdaWithConfiguration:forKey:` before invoking this method. If `+ registerLambdaWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLambda.registerLambdaWithConfiguration(configuration, forKey: "USWest2Lambda")

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
 <p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use "push" model. In "push" model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source, permission to invoke the Lambda function. </p><p>For information about the push model, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a>. </p><p>If you are using versioning feature (see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html">AWS Lambda Function Versioning and Aliases</a>), a Lambda function can have multiple ARNs that can be used to invoke the function. Note that, each permission you add to resource policy using this API is specific to an ARN, specified using the <code>Qualifier</code> parameter</p><p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAddPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (AWSTask *)addPermission:(AWSLambdaAddPermissionRequest *)request;

/**
 <p>Creates an alias to the specified Lambda function version. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html">Introduction to AWS Lambda Aliases</a></p><p>This requires permission for the lambda:CreateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the CreateAlias service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask *)createAlias:(AWSLambdaCreateAliasRequest *)request;

/**
 <p>Identifies a stream as an event source for a Lambda function. It can be either an Amazon Kinesis stream or an Amazon DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the stream.</p><p>This is the pull model, where AWS Lambda invokes the function. For more information, go to <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p><p>This association between an Amazon Kinesis stream and a Lambda function is called the event source mapping. You provide the configuration information (for example, which stream to read from and which Lambda function to invoke) for the event source mapping in the request body.</p><p> Each event source, such as an Amazon Kinesis or a DynamoDB stream, can be associated with multiple AWS Lambda function. A given Lambda function can be associated with multiple AWS event sources. </p><p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaCreateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request;

/**
 <p>Creates a new Lambda function. The function metadata is created from the request parameters, and the code for the function is provided by a .zip file in the request body. If the function name already exists, the operation will fail. Note that the function name is case-sensitive. </p><p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaCreateFunctionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)createFunction:(AWSLambdaCreateFunctionRequest *)request;

/**
 <p>Deletes specified Lambda function alias. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html">Introduction to AWS Lambda Aliases</a></p><p>This requires permission for the lambda:DeleteAlias action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAlias service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteAliasRequest
 */
- (AWSTask *)deleteAlias:(AWSLambdaDeleteAliasRequest *)request;

/**
 <p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p><p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request;

/**
 <p>Deletes the specified Lambda function code and configuration.</p><p>If you don't specify a function version, AWS Lambda will delete the function, including all its versions, and any aliases pointing to the function versions.</p><p>When you delete a function the associated resource policy is also deleted. You will need to delete the event source mappings explicitly.</p><p>For information about function versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (AWSTask *)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request;

/**
 <p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html">Introduction to AWS Lambda Aliases</a></p><p>This requires permission for the lambda:GetAlias action.</p>
 
 @param request A container for the necessary parameters to execute the GetAlias service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask *)getAlias:(AWSLambdaGetAliasRequest *)request;

/**
 <p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p><p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p><p>Using the optional <code>Qualifier</code> parameter, you can specify a specific function version for which you want this information. If you don't specify this parameter, the API uses unqualified function ARN which return information about the $LATEST version of the Lambda function. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (AWSTask *)getFunction:(AWSLambdaGetFunctionRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p><p>You can use the optional <code>Qualifier</code> parameter to retrieve configuration information for a specific Lambda function version. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html">AWS Lambda Function Versioning and Aliases</a>.</p><p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request;

/**
 <p>Returns the resource policy, containing a list of permissions that apply to a specific to an ARN that you specify via the <code>Qualifier</code> paramter. </p><p>For informration about adding permissions, see <a>AddPermission</a>.</p><p>You need permission for the <code>lambda:GetPolicy action.</code></p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (AWSTask *)getPolicy:(AWSLambdaGetPolicyRequest *)request;

/**
 <p> Invokes a specific Lambda function version. </p><p>If you don't provide the <code>Qualifier</code> parameter, it uses the unqualified function ARN which results in invocation of the $LATEST version of the Lambda function (when you create a Lambda function, the $LATEST is the version). The AWS Lambda versioning and aliases feature allows you to publish multiple versions of a Lambda function and also create aliases for each function version. So each your Lambda function version can be invoked using multiple ARNs. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html">AWS Lambda Function Versioning and Aliases</a>. Using the <code>Qualifier</code> parameter, you can specify a function version or alias name to invoke specific function version. If you specify function version, the API uses the qualified function ARN to invoke a specific function version. If you specify alias name, the API uses the alias ARN to invoke the function version to which the alias points.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvocationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorInvalidParameterValue`.
 
 @see AWSLambdaInvocationRequest
 @see AWSLambdaInvocationResponse
 */
- (AWSTask *)invoke:(AWSLambdaInvocationRequest *)request;

/**
 <important>This API is deprecated. We recommend you use <code>Invoke</code> API (see <a>Invoke</a>).</important><p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch logs console.</p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the InvokeAsync service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvokeAsyncResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`.
 
 @see AWSLambdaInvokeAsyncRequest
 @see AWSLambdaInvokeAsyncResponse
 */
- (AWSTask *)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request;

/**
 <p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html">Introduction to AWS Lambda Aliases</a></p><p>This requires permission for the lambda:ListAliases action.</p>
 
 @param request A container for the necessary parameters to execute the ListAliases service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListAliasesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListAliasesRequest
 @see AWSLambdaListAliasesResponse
 */
- (AWSTask *)listAliases:(AWSLambdaListAliasesRequest *)request;

/**
 <p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>), where you identify a stream as an event source. This list does not include Amazon S3 event sources. </p><p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p><p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListEventSourceMappings service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListEventSourceMappingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListEventSourceMappingsRequest
 @see AWSLambdaListEventSourceMappingsResponse
 */
- (AWSTask *)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request;

/**
 <p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p><p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFunctions service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListFunctionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListFunctionsRequest
 @see AWSLambdaListFunctionsResponse
 */
- (AWSTask *)listFunctions:(AWSLambdaListFunctionsRequest *)request;

/**
 <p>List all versions of a function.</p>
 
 @param request A container for the necessary parameters to execute the ListVersionsByFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaListVersionsByFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaListVersionsByFunctionRequest
 @see AWSLambdaListVersionsByFunctionResponse
 */
- (AWSTask *)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request;

/**
 <p>Publishes a version of your function from the current snapshot of HEAD. That is, AWS Lambda takes a snapshot of the function code and configuration information from HEAD and publishes a new version. The code and <code>handler</code> of this specific Lambda function version cannot be modified after publication, but you can modify the configuration information. </p>
 
 @param request A container for the necessary parameters to execute the PublishVersion service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaPublishVersionRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)publishVersion:(AWSLambdaPublishVersionRequest *)request;

/**
 <p>You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you addded the permission. The API removes corresponding permission that is associated with the specific ARN identified by the <code>Qualifier</code> parameter.</p><p>Note that removal of a permission will cause an active event source to lose permission to the function. </p><p>You need permission for the <code>lambda:RemovePermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (AWSTask *)removePermission:(AWSLambdaRemovePermissionRequest *)request;

/**
 <p>Using this API you can update function version to which the alias points to and alias description. For more information, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html">Introduction to AWS Lambda Aliases</a></p><p>This requires permission for the lambda:UpdateAlias action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateAlias service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAliasConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUpdateAliasRequest
 @see AWSLambdaAliasConfiguration
 */
- (AWSTask *)updateAlias:(AWSLambdaUpdateAliasRequest *)request;

/**
 <p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping. </p><p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorResourceConflict`.
 
 @see AWSLambdaUpdateEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request;

/**
 <p> Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionCode service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`, `AWSLambdaErrorCodeStorageExceeded`.
 
 @see AWSLambdaUpdateFunctionCodeRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request;

/**
 <p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code. </p><p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFunctionConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaUpdateFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request;

@end

NS_ASSUME_NONNULL_END
