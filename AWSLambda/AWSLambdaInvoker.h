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
#import <AWSCore/AWSService.h>
#import "AWSLambdaModel.h"

FOUNDATION_EXPORT NSString *const AWSLambdaInvokerErrorDomain;
FOUNDATION_EXPORT NSString *const AWSLambdaInvokerFunctionErrorKey;
FOUNDATION_EXPORT NSString *const AWSLambdaInvokerErrorTypeKey;
FOUNDATION_EXPORT NSString *const AWSLambdaInvokerErrorMessageKey;
FOUNDATION_EXPORT NSString *const AWSLambdaInvokerErrorStackTraceKey;

typedef NS_ENUM(NSInteger, AWSLambdaInvokerErrorType) {
    AWSLambdaInvokerErrorTypeUnknown,
    AWSLambdaInvokerErrorTypeFunctionError,
};

@class AWSLambdaInvokerInvocationRequest;
@class AWSLambdaInvokerInvocationResponse;
@class AWSClientContext;

@interface AWSLambdaInvoker : AWSService

@property (nonatomic, strong, readonly) AWSClientContext *clientContext;

/**
 Returns a shared instance of this service client using `[AWSServiceManager defaultServiceManager].defaultServiceConfiguration`. When `defaultServiceConfiguration` is not set, this method returns nil.

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

     let LambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()

 *Objective-C*

     AWSLambdaInvoker *LambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];

 @return A shared instance of this service client.
 */
+ (instancetype)defaultLambdaInvoker;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLambdaInvoker.registerLambdaInvokerWithConfiguration(configuration, forKey: "USWest2LambdaInvoker")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLambdaInvoker registerLambdaInvokerWithConfiguration:configuration forKey:@"USWest2LambdaInvoker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let LambdaInvoker = AWSLambdaInvoker(forKey: "USWest2LambdaInvoker")

 *Objective-C*

     AWSLambdaInvoker *LambdaInvoker = [AWSLambdaInvoker LambdaInvokerForKey:@"USWest2LambdaInvoker"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerLambdaInvokerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisWithConfiguration:forKey:` before invoking this method. If `+ registerKinesisWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLambdaInvoker.registerLambdaInvokerWithConfiguration(configuration, forKey: "USWest2LambdaInvoker")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSLambdaInvoker registerLambdaInvokerWithConfiguration:configuration forKey:@"USWest2LambdaInvoker"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let LambdaInvoker = AWSLambdaInvoker(forKey: "USWest2LambdaInvoker")

 *Objective-C*

     AWSLambdaInvoker *LambdaInvoker = [AWSLambdaInvoker LambdaInvokerForKey:@"USWest2LambdaInvoker"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)LambdaInvokerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeLambdaInvokerForKey:(NSString *)key;

/**
 Invokes an AWS Lambda function with a given request object.

 @param request The request object.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSLambdaInvokerInvocationResponse`. On failed service execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`. On failed function execution, `task.error` may contain an `NSError` with `AWSLambdaInvokerErrorDomain` domain and the following error code: `AWSLambdaInvokerErrorTypeFunctionError`.

 @see AWSLambdaInvokerInvocationRequest
 @see AWSLambdaInvokerInvocationResponse
 */
- (AWSTask *)invoke:(AWSLambdaInvokerInvocationRequest *)request;

/**
 Invokes a synchronous AWS Lambda function with given parameters.

 @param functionName The name of a function.
 @param JSONObject The object from which to generate JSON request data. Can be `nil`.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain a JSON object. On failed service execution, `task.error` may contain an `NSError` with `AWSLambdaErrorDomain` domain and the following error code: `AWSLambdaErrorService`, `AWSLambdaErrorResourceNotFound`, `AWSLambdaErrorInvalidParameterValue`. On failed function execution, `task.error` may contain an `NSError` with `AWSLambdaInvokerErrorDomain` domain and the following error code: `AWSLambdaInvokerErrorTypeFunctionError`.
 */
- (AWSTask *)invokeFunction:(NSString *)functionName
                JSONObject:(id)JSONObject;

@end

/**
 @see AWSLambdaInvocationRequest
 */
@interface AWSLambdaInvokerInvocationRequest : AWSLambdaInvocationRequest

@end

/**
 @see AWSLambdaInvocationResponse
 */
@interface AWSLambdaInvokerInvocationResponse : AWSLambdaInvocationResponse

@end
