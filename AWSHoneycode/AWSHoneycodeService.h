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
#import "AWSHoneycodeModel.h"
#import "AWSHoneycodeResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSHoneycode
FOUNDATION_EXPORT NSString *const AWSHoneycodeSDKVersion;

/**
 <p> Amazon Honeycode is a fully managed service that allows you to quickly build mobile and web apps for teams—without programming. Build Honeycode apps for managing almost anything, like projects, customers, operations, approvals, resources, and even your team. </p>
 */
@interface AWSHoneycode : AWSService

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

     let Honeycode = AWSHoneycode.default()

 *Objective-C*

     AWSHoneycode *Honeycode = [AWSHoneycode defaultHoneycode];

 @return The default service client.
 */
+ (instancetype)defaultHoneycode;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSHoneycode.register(with: configuration!, forKey: "USWest2Honeycode")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSHoneycode registerHoneycodeWithConfiguration:configuration forKey:@"USWest2Honeycode"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Honeycode = AWSHoneycode(forKey: "USWest2Honeycode")

 *Objective-C*

     AWSHoneycode *Honeycode = [AWSHoneycode HoneycodeForKey:@"USWest2Honeycode"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerHoneycodeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerHoneycodeWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSHoneycode.register(with: configuration!, forKey: "USWest2Honeycode")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSHoneycode registerHoneycodeWithConfiguration:configuration forKey:@"USWest2Honeycode"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Honeycode = AWSHoneycode(forKey: "USWest2Honeycode")

 *Objective-C*

     AWSHoneycode *Honeycode = [AWSHoneycode HoneycodeForKey:@"USWest2Honeycode"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)HoneycodeForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeHoneycodeForKey:(NSString *)key;

/**
 <p> The GetScreenData API allows retrieval of data from a screen in a Honeycode app. The API allows setting local variables in the screen to filter, sort or otherwise affect what will be displayed on the screen. </p>
 
 @param request A container for the necessary parameters to execute the GetScreenData service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHoneycodeGetScreenDataResult`. On failed execution, `task.error` may contain an `NSError` with `AWSHoneycodeErrorDomain` domain and the following error code: `AWSHoneycodeErrorAccessDenied`, `AWSHoneycodeErrorInternalServer`, `AWSHoneycodeErrorRequestTimeout`, `AWSHoneycodeErrorResourceNotFound`, `AWSHoneycodeErrorServiceUnavailable`, `AWSHoneycodeErrorThrottling`, `AWSHoneycodeErrorValidation`.
 
 @see AWSHoneycodeGetScreenDataRequest
 @see AWSHoneycodeGetScreenDataResult
 */
- (AWSTask<AWSHoneycodeGetScreenDataResult *> *)getScreenData:(AWSHoneycodeGetScreenDataRequest *)request;

/**
 <p> The GetScreenData API allows retrieval of data from a screen in a Honeycode app. The API allows setting local variables in the screen to filter, sort or otherwise affect what will be displayed on the screen. </p>
 
 @param request A container for the necessary parameters to execute the GetScreenData service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHoneycodeErrorDomain` domain and the following error code: `AWSHoneycodeErrorAccessDenied`, `AWSHoneycodeErrorInternalServer`, `AWSHoneycodeErrorRequestTimeout`, `AWSHoneycodeErrorResourceNotFound`, `AWSHoneycodeErrorServiceUnavailable`, `AWSHoneycodeErrorThrottling`, `AWSHoneycodeErrorValidation`.
 
 @see AWSHoneycodeGetScreenDataRequest
 @see AWSHoneycodeGetScreenDataResult
 */
- (void)getScreenData:(AWSHoneycodeGetScreenDataRequest *)request completionHandler:(void (^ _Nullable)(AWSHoneycodeGetScreenDataResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> The InvokeScreenAutomation API allows invoking an action defined in a screen in a Honeycode app. The API allows setting local variables, which can then be used in the automation being invoked. This allows automating the Honeycode app interactions to write, update or delete data in the workbook. </p>
 
 @param request A container for the necessary parameters to execute the InvokeScreenAutomation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSHoneycodeInvokeScreenAutomationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSHoneycodeErrorDomain` domain and the following error code: `AWSHoneycodeErrorAccessDenied`, `AWSHoneycodeErrorInternalServer`, `AWSHoneycodeErrorResourceNotFound`, `AWSHoneycodeErrorValidation`, `AWSHoneycodeErrorThrottling`, `AWSHoneycodeErrorServiceUnavailable`, `AWSHoneycodeErrorAutomationExecution`, `AWSHoneycodeErrorAutomationExecutionTimeout`, `AWSHoneycodeErrorRequestTimeout`.
 
 @see AWSHoneycodeInvokeScreenAutomationRequest
 @see AWSHoneycodeInvokeScreenAutomationResult
 */
- (AWSTask<AWSHoneycodeInvokeScreenAutomationResult *> *)invokeScreenAutomation:(AWSHoneycodeInvokeScreenAutomationRequest *)request;

/**
 <p> The InvokeScreenAutomation API allows invoking an action defined in a screen in a Honeycode app. The API allows setting local variables, which can then be used in the automation being invoked. This allows automating the Honeycode app interactions to write, update or delete data in the workbook. </p>
 
 @param request A container for the necessary parameters to execute the InvokeScreenAutomation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSHoneycodeErrorDomain` domain and the following error code: `AWSHoneycodeErrorAccessDenied`, `AWSHoneycodeErrorInternalServer`, `AWSHoneycodeErrorResourceNotFound`, `AWSHoneycodeErrorValidation`, `AWSHoneycodeErrorThrottling`, `AWSHoneycodeErrorServiceUnavailable`, `AWSHoneycodeErrorAutomationExecution`, `AWSHoneycodeErrorAutomationExecutionTimeout`, `AWSHoneycodeErrorRequestTimeout`.
 
 @see AWSHoneycodeInvokeScreenAutomationRequest
 @see AWSHoneycodeInvokeScreenAutomationResult
 */
- (void)invokeScreenAutomation:(AWSHoneycodeInvokeScreenAutomationRequest *)request completionHandler:(void (^ _Nullable)(AWSHoneycodeInvokeScreenAutomationResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
