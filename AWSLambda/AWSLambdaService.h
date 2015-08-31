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
 <p>Adds a permission to the access policy associated with the specified AWS Lambda function. In a "push event" model, the access policy attached to the Lambda function grants Amazon S3 or a user application permission for the Lambda <code>lambda:Invoke</code> action. For information about the push model, see <a href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS Lambda: How it Works</a>. Each Lambda function has one access policy associated with it. You can use the <code>AddPermission</code> API to add a permission to the policy. You have one access policy but it can have multiple permission statements.</p><p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the AddPermission service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaAddPermissionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorResourceConflict`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorPolicyLengthExceeded`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaAddPermissionRequest
 @see AWSLambdaAddPermissionResponse
 */
- (AWSTask *)addPermission:(AWSLambdaAddPermissionRequest *)request;

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
 <p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p><p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request;

/**
 <p>Deletes the specified Lambda function code and configuration.</p><p>When you delete a function the associated access policy is also deleted. You will need to delete the event source mappings explicitly.</p><p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaDeleteFunctionRequest
 */
- (AWSTask *)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request;

/**
 <p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p><p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetEventSourceMappingRequest
 @see AWSLambdaEventSourceMappingConfiguration
 */
- (AWSTask *)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p><p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the GetFunction service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetFunctionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetFunctionRequest
 @see AWSLambdaGetFunctionResponse
 */
- (AWSTask *)getFunction:(AWSLambdaGetFunctionRequest *)request;

/**
 <p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p><p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the GetFunctionConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaFunctionConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetFunctionConfigurationRequest
 @see AWSLambdaFunctionConfiguration
 */
- (AWSTask *)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request;

/**
 <p>Returns the access policy, containing a list of permissions granted via the <code>AddPermission</code> API, associated with the specified bucket.</p><p>You need permission for the <code>lambda:GetPolicy action.</code></p>
 
 @param request A container for the necessary parameters to execute the GetPolicy service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaGetPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaGetPolicyRequest
 @see AWSLambdaGetPolicyResponse
 */
- (AWSTask *)getPolicy:(AWSLambdaGetPolicyRequest *)request;

/**
 <p> Invokes a specified Lambda function. </p><p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>
 
 @param request A container for the necessary parameters to execute the Invoke service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvocationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidRequestContent`, `AWSLambdaErrorRequestTooLarge`, `AWSLambdaErrorUnsupportedMediaType`, `AWSLambdaErrorTooManyRequests`.
 
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
 <p>You can remove individual permissions from an access policy associated with a Lambda function by providing a Statement ID. </p><p>Note that removal of a permission will cause an active event source to lose permission to the function. </p><p>You need permission for the <code>lambda:RemovePermission</code> action.</p>
 
 @param request A container for the necessary parameters to execute the RemovePermission service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorTooManyRequests`.
 
 @see AWSLambdaRemovePermissionRequest
 */
- (AWSTask *)removePermission:(AWSLambdaRemovePermissionRequest *)request;

/**
 <p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping. </p><p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>
 
 @param request A container for the necessary parameters to execute the UpdateEventSourceMapping service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaEventSourceMappingConfiguration`. On failed execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`, `AWSLambdaErrorTooManyRequests`.
 
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
