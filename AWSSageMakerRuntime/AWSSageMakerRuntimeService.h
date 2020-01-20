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
#import "AWSSageMakerRuntimeModel.h"
#import "AWSSageMakerRuntimeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSSageMakerRuntime
FOUNDATION_EXPORT NSString *const AWSSageMakerRuntimeSDKVersion;

/**
 <p> The Amazon SageMaker runtime API. </p>
 */
@interface AWSSageMakerRuntime : AWSService

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

     let SageMakerRuntime = AWSSageMakerRuntime.default()

 *Objective-C*

     AWSSageMakerRuntime *SageMakerRuntime = [AWSSageMakerRuntime defaultSageMakerRuntime];

 @return The default service client.
 */
+ (instancetype)defaultSageMakerRuntime;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSageMakerRuntime.register(with: configuration!, forKey: "USWest2SageMakerRuntime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSageMakerRuntime registerSageMakerRuntimeWithConfiguration:configuration forKey:@"USWest2SageMakerRuntime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SageMakerRuntime = AWSSageMakerRuntime(forKey: "USWest2SageMakerRuntime")

 *Objective-C*

     AWSSageMakerRuntime *SageMakerRuntime = [AWSSageMakerRuntime SageMakerRuntimeForKey:@"USWest2SageMakerRuntime"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerSageMakerRuntimeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerSageMakerRuntimeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSSageMakerRuntime.register(with: configuration!, forKey: "USWest2SageMakerRuntime")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSSageMakerRuntime registerSageMakerRuntimeWithConfiguration:configuration forKey:@"USWest2SageMakerRuntime"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let SageMakerRuntime = AWSSageMakerRuntime(forKey: "USWest2SageMakerRuntime")

 *Objective-C*

     AWSSageMakerRuntime *SageMakerRuntime = [AWSSageMakerRuntime SageMakerRuntimeForKey:@"USWest2SageMakerRuntime"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)SageMakerRuntimeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeSageMakerRuntimeForKey:(NSString *)key;

/**
 <p>After you deploy a model into production using Amazon SageMaker hosting services, your client applications use this API to get inferences from the model hosted at the specified endpoint. </p><p>For an overview of Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p><p>Amazon SageMaker strips all POST headers except those supported by the API. Amazon SageMaker might add additional headers. You should not rely on the behavior of headers outside those enumerated in the request syntax. </p><p>Calls to <code>InvokeEndpoint</code> are authenticated by using AWS Signature Version 4. For information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating Requests (AWS Signature Version 4)</a> in the <i>Amazon S3 API Reference</i>.</p><p>A customer's model containers must respond to requests within 60 seconds. The model itself can have a maximum processing time of 60 seconds before responding to the /invocations. If your model is going to take 50-60 seconds of processing time, the SDK socket timeout should be set to be 70 seconds.</p><note><p>Endpoints are scoped to an individual account, and are not public. The URL does not contain the account ID, but Amazon SageMaker determines the account ID from the authentication token that is supplied by the caller.</p></note>
 
 @param request A container for the necessary parameters to execute the InvokeEndpoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSSageMakerRuntimeInvokeEndpointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSSageMakerRuntimeErrorDomain` domain and the following error code: `AWSSageMakerRuntimeErrorInternalFailure`, `AWSSageMakerRuntimeErrorServiceUnavailable`, `AWSSageMakerRuntimeErrorValidation`, `AWSSageMakerRuntimeErrorModel`.
 
 @see AWSSageMakerRuntimeInvokeEndpointInput
 @see AWSSageMakerRuntimeInvokeEndpointOutput
 */
- (AWSTask<AWSSageMakerRuntimeInvokeEndpointOutput *> *)invokeEndpoint:(AWSSageMakerRuntimeInvokeEndpointInput *)request;

/**
 <p>After you deploy a model into production using Amazon SageMaker hosting services, your client applications use this API to get inferences from the model hosted at the specified endpoint. </p><p>For an overview of Amazon SageMaker, see <a href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How It Works</a>. </p><p>Amazon SageMaker strips all POST headers except those supported by the API. Amazon SageMaker might add additional headers. You should not rely on the behavior of headers outside those enumerated in the request syntax. </p><p>Calls to <code>InvokeEndpoint</code> are authenticated by using AWS Signature Version 4. For information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating Requests (AWS Signature Version 4)</a> in the <i>Amazon S3 API Reference</i>.</p><p>A customer's model containers must respond to requests within 60 seconds. The model itself can have a maximum processing time of 60 seconds before responding to the /invocations. If your model is going to take 50-60 seconds of processing time, the SDK socket timeout should be set to be 70 seconds.</p><note><p>Endpoints are scoped to an individual account, and are not public. The URL does not contain the account ID, but Amazon SageMaker determines the account ID from the authentication token that is supplied by the caller.</p></note>
 
 @param request A container for the necessary parameters to execute the InvokeEndpoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSSageMakerRuntimeErrorDomain` domain and the following error code: `AWSSageMakerRuntimeErrorInternalFailure`, `AWSSageMakerRuntimeErrorServiceUnavailable`, `AWSSageMakerRuntimeErrorValidation`, `AWSSageMakerRuntimeErrorModel`.
 
 @see AWSSageMakerRuntimeInvokeEndpointInput
 @see AWSSageMakerRuntimeInvokeEndpointOutput
 */
- (void)invokeEndpoint:(AWSSageMakerRuntimeInvokeEndpointInput *)request completionHandler:(void (^ _Nullable)(AWSSageMakerRuntimeInvokeEndpointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
