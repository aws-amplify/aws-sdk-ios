//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 <p>Returns an <code>MLModel</code> that includes detailed metadata, and data source information as well as the current status of the <code>MLModel</code>.</p><p><code>GetMLModel</code> provides results in normal or verbose format. </p>
 
 @param request A container for the necessary parameters to execute the GetMLModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningGetMLModelOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetMLModelInput
 @see AWSMachineLearningGetMLModelOutput
 */
- (AWSTask<AWSMachineLearningGetMLModelOutput *> *)getMLModel:(AWSMachineLearningGetMLModelInput *)request;

/**
 <p>Returns an <code>MLModel</code> that includes detailed metadata, and data source information as well as the current status of the <code>MLModel</code>.</p><p><code>GetMLModel</code> provides results in normal or verbose format. </p>
 
 @param request A container for the necessary parameters to execute the GetMLModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorInternalServer`.
 
 @see AWSMachineLearningGetMLModelInput
 @see AWSMachineLearningGetMLModelOutput
 */
- (void)getMLModel:(AWSMachineLearningGetMLModelInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningGetMLModelOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Generates a prediction for the observation using the specified <code>MLModel</code>.</p><note><title>Note</title><p>Not all response parameters will be populated because this is dependent on the type of requested model.</p></note>
 
 @param request A container for the necessary parameters to execute the Predict service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSMachineLearningPredictOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorLimitExceeded`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorPredictorNotMounted`.
 
 @see AWSMachineLearningPredictInput
 @see AWSMachineLearningPredictOutput
 */
- (AWSTask<AWSMachineLearningPredictOutput *> *)predict:(AWSMachineLearningPredictInput *)request;

/**
 <p>Generates a prediction for the observation using the specified <code>MLModel</code>.</p><note><title>Note</title><p>Not all response parameters will be populated because this is dependent on the type of requested model.</p></note>
 
 @param request A container for the necessary parameters to execute the Predict service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSMachineLearningErrorDomain` domain and the following error code: `AWSMachineLearningErrorInvalidInput`, `AWSMachineLearningErrorResourceNotFound`, `AWSMachineLearningErrorLimitExceeded`, `AWSMachineLearningErrorInternalServer`, `AWSMachineLearningErrorPredictorNotMounted`.
 
 @see AWSMachineLearningPredictInput
 @see AWSMachineLearningPredictOutput
 */
- (void)predict:(AWSMachineLearningPredictInput *)request completionHandler:(void (^ _Nullable)(AWSMachineLearningPredictOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
