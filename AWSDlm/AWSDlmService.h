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
#import "AWSDlmModel.h"
#import "AWSDlmResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSDlm
FOUNDATION_EXPORT NSString *const AWSDlmSDKVersion;

/**
 <fullname>Amazon Data Lifecycle Manager</fullname><p>With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS resources. You create lifecycle policies, which are used to automate operations on the specified resources.</p><p>Amazon DLM supports Amazon EBS volumes and snapshots. For information about using Amazon DLM with Amazon EBS, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html">Automating the Amazon EBS Snapshot Lifecycle</a> in the <i>Amazon EC2 User Guide</i>.</p>
 */
@interface AWSDlm : AWSService

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

     let Dlm = AWSDlm.default()

 *Objective-C*

     AWSDlm *Dlm = [AWSDlm defaultDlm];

 @return The default service client.
 */
+ (instancetype)defaultDlm;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDlm.register(with: configuration!, forKey: "USWest2Dlm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDlm registerDlmWithConfiguration:configuration forKey:@"USWest2Dlm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Dlm = AWSDlm(forKey: "USWest2Dlm")

 *Objective-C*

     AWSDlm *Dlm = [AWSDlm DlmForKey:@"USWest2Dlm"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerDlmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerDlmWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSDlm.register(with: configuration!, forKey: "USWest2Dlm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSDlm registerDlmWithConfiguration:configuration forKey:@"USWest2Dlm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Dlm = AWSDlm(forKey: "USWest2Dlm")

 *Objective-C*

     AWSDlm *Dlm = [AWSDlm DlmForKey:@"USWest2Dlm"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)DlmForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeDlmForKey:(NSString *)key;

/**
 <p>Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.</p>
 
 @param request A container for the necessary parameters to execute the CreateLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmCreateLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInvalidRequest`, `AWSDlmErrorLimitExceeded`, `AWSDlmErrorInternalServer`.
 
 @see AWSDlmCreateLifecyclePolicyRequest
 @see AWSDlmCreateLifecyclePolicyResponse
 */
- (AWSTask<AWSDlmCreateLifecyclePolicyResponse *> *)createLifecyclePolicy:(AWSDlmCreateLifecyclePolicyRequest *)request;

/**
 <p>Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.</p>
 
 @param request A container for the necessary parameters to execute the CreateLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInvalidRequest`, `AWSDlmErrorLimitExceeded`, `AWSDlmErrorInternalServer`.
 
 @see AWSDlmCreateLifecyclePolicyRequest
 @see AWSDlmCreateLifecyclePolicyResponse
 */
- (void)createLifecyclePolicy:(AWSDlmCreateLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmCreateLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified lifecycle policy and halts the automated operations that the policy specified.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmDeleteLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmDeleteLifecyclePolicyRequest
 @see AWSDlmDeleteLifecyclePolicyResponse
 */
- (AWSTask<AWSDlmDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSDlmDeleteLifecyclePolicyRequest *)request;

/**
 <p>Deletes the specified lifecycle policy and halts the automated operations that the policy specified.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmDeleteLifecyclePolicyRequest
 @see AWSDlmDeleteLifecyclePolicyResponse
 */
- (void)deleteLifecyclePolicy:(AWSDlmDeleteLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmDeleteLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets summary information about all or the specified data lifecycle policies.</p><p>To get complete information about a policy, use <a>GetLifecyclePolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmGetLifecyclePoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmGetLifecyclePoliciesRequest
 @see AWSDlmGetLifecyclePoliciesResponse
 */
- (AWSTask<AWSDlmGetLifecyclePoliciesResponse *> *)getLifecyclePolicies:(AWSDlmGetLifecyclePoliciesRequest *)request;

/**
 <p>Gets summary information about all or the specified data lifecycle policies.</p><p>To get complete information about a policy, use <a>GetLifecyclePolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmGetLifecyclePoliciesRequest
 @see AWSDlmGetLifecyclePoliciesResponse
 */
- (void)getLifecyclePolicies:(AWSDlmGetLifecyclePoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmGetLifecyclePoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets detailed information about the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmGetLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmGetLifecyclePolicyRequest
 @see AWSDlmGetLifecyclePolicyResponse
 */
- (AWSTask<AWSDlmGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSDlmGetLifecyclePolicyRequest *)request;

/**
 <p>Gets detailed information about the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmGetLifecyclePolicyRequest
 @see AWSDlmGetLifecyclePolicyResponse
 */
- (void)getLifecyclePolicy:(AWSDlmGetLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmGetLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmListTagsForResourceRequest
 @see AWSDlmListTagsForResourceResponse
 */
- (AWSTask<AWSDlmListTagsForResourceResponse *> *)listTagsForResource:(AWSDlmListTagsForResourceRequest *)request;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmListTagsForResourceRequest
 @see AWSDlmListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSDlmListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmTagResourceRequest
 @see AWSDlmTagResourceResponse
 */
- (AWSTask<AWSDlmTagResourceResponse *> *)tagResource:(AWSDlmTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmTagResourceRequest
 @see AWSDlmTagResourceResponse
 */
- (void)tagResource:(AWSDlmTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmUntagResourceRequest
 @see AWSDlmUntagResourceResponse
 */
- (AWSTask<AWSDlmUntagResourceResponse *> *)untagResource:(AWSDlmUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorInternalServer`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorResourceNotFound`.
 
 @see AWSDlmUntagResourceRequest
 @see AWSDlmUntagResourceResponse
 */
- (void)untagResource:(AWSDlmUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSDlmUpdateLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmUpdateLifecyclePolicyRequest
 @see AWSDlmUpdateLifecyclePolicyResponse
 */
- (AWSTask<AWSDlmUpdateLifecyclePolicyResponse *> *)updateLifecyclePolicy:(AWSDlmUpdateLifecyclePolicyRequest *)request;

/**
 <p>Updates the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSDlmErrorDomain` domain and the following error code: `AWSDlmErrorResourceNotFound`, `AWSDlmErrorInvalidRequest`, `AWSDlmErrorInternalServer`, `AWSDlmErrorLimitExceeded`.
 
 @see AWSDlmUpdateLifecyclePolicyRequest
 @see AWSDlmUpdateLifecyclePolicyResponse
 */
- (void)updateLifecyclePolicy:(AWSDlmUpdateLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSDlmUpdateLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
