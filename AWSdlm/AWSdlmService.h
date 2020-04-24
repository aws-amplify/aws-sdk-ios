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
#import "AWSdlmModel.h"
#import "AWSdlmResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSdlm
FOUNDATION_EXPORT NSString *const AWSdlmSDKVersion;

/**
 <fullname>Amazon Data Lifecycle Manager</fullname><p>With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS resources. You create lifecycle policies, which are used to automate operations on the specified resources.</p><p>Amazon DLM supports Amazon EBS volumes and snapshots. For information about using Amazon DLM with Amazon EBS, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html">Automating the Amazon EBS Snapshot Lifecycle</a> in the <i>Amazon EC2 User Guide</i>.</p>
 */
@interface AWSdlm : AWSService

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

     let dlm = AWSdlm.default()

 *Objective-C*

     AWSdlm *dlm = [AWSdlm defaultdlm];

 @return The default service client.
 */
+ (instancetype)defaultdlm;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdlm.register(with: configuration!, forKey: "USWest2dlm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdlm registerdlmWithConfiguration:configuration forKey:@"USWest2dlm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dlm = AWSdlm(forKey: "USWest2dlm")

 *Objective-C*

     AWSdlm *dlm = [AWSdlm dlmForKey:@"USWest2dlm"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerdlmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerdlmWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSdlm.register(with: configuration!, forKey: "USWest2dlm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSdlm registerdlmWithConfiguration:configuration forKey:@"USWest2dlm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let dlm = AWSdlm(forKey: "USWest2dlm")

 *Objective-C*

     AWSdlm *dlm = [AWSdlm dlmForKey:@"USWest2dlm"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)dlmForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removedlmForKey:(NSString *)key;

/**
 <p>Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.</p>
 
 @param request A container for the necessary parameters to execute the CreateLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmCreateLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInvalidRequest`, `AWSdlmErrorLimitExceeded`, `AWSdlmErrorInternalServer`.
 
 @see AWSdlmCreateLifecyclePolicyRequest
 @see AWSdlmCreateLifecyclePolicyResponse
 */
- (AWSTask<AWSdlmCreateLifecyclePolicyResponse *> *)createLifecyclePolicy:(AWSdlmCreateLifecyclePolicyRequest *)request;

/**
 <p>Creates a policy to manage the lifecycle of the specified AWS resources. You can create up to 100 lifecycle policies.</p>
 
 @param request A container for the necessary parameters to execute the CreateLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInvalidRequest`, `AWSdlmErrorLimitExceeded`, `AWSdlmErrorInternalServer`.
 
 @see AWSdlmCreateLifecyclePolicyRequest
 @see AWSdlmCreateLifecyclePolicyResponse
 */
- (void)createLifecyclePolicy:(AWSdlmCreateLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmCreateLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified lifecycle policy and halts the automated operations that the policy specified.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmDeleteLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmDeleteLifecyclePolicyRequest
 @see AWSdlmDeleteLifecyclePolicyResponse
 */
- (AWSTask<AWSdlmDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSdlmDeleteLifecyclePolicyRequest *)request;

/**
 <p>Deletes the specified lifecycle policy and halts the automated operations that the policy specified.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmDeleteLifecyclePolicyRequest
 @see AWSdlmDeleteLifecyclePolicyResponse
 */
- (void)deleteLifecyclePolicy:(AWSdlmDeleteLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmDeleteLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets summary information about all or the specified data lifecycle policies.</p><p>To get complete information about a policy, use <a>GetLifecyclePolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmGetLifecyclePoliciesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmGetLifecyclePoliciesRequest
 @see AWSdlmGetLifecyclePoliciesResponse
 */
- (AWSTask<AWSdlmGetLifecyclePoliciesResponse *> *)getLifecyclePolicies:(AWSdlmGetLifecyclePoliciesRequest *)request;

/**
 <p>Gets summary information about all or the specified data lifecycle policies.</p><p>To get complete information about a policy, use <a>GetLifecyclePolicy</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmGetLifecyclePoliciesRequest
 @see AWSdlmGetLifecyclePoliciesResponse
 */
- (void)getLifecyclePolicies:(AWSdlmGetLifecyclePoliciesRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmGetLifecyclePoliciesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets detailed information about the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmGetLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmGetLifecyclePolicyRequest
 @see AWSdlmGetLifecyclePolicyResponse
 */
- (AWSTask<AWSdlmGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSdlmGetLifecyclePolicyRequest *)request;

/**
 <p>Gets detailed information about the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the GetLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmGetLifecyclePolicyRequest
 @see AWSdlmGetLifecyclePolicyResponse
 */
- (void)getLifecyclePolicy:(AWSdlmGetLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmGetLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmListTagsForResourceRequest
 @see AWSdlmListTagsForResourceResponse
 */
- (AWSTask<AWSdlmListTagsForResourceResponse *> *)listTagsForResource:(AWSdlmListTagsForResourceRequest *)request;

/**
 <p>Lists the tags for the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmListTagsForResourceRequest
 @see AWSdlmListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSdlmListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds the specified tags to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmTagResourceRequest
 @see AWSdlmTagResourceResponse
 */
- (AWSTask<AWSdlmTagResourceResponse *> *)tagResource:(AWSdlmTagResourceRequest *)request;

/**
 <p>Adds the specified tags to the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmTagResourceRequest
 @see AWSdlmTagResourceResponse
 */
- (void)tagResource:(AWSdlmTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmUntagResourceRequest
 @see AWSdlmUntagResourceResponse
 */
- (AWSTask<AWSdlmUntagResourceResponse *> *)untagResource:(AWSdlmUntagResourceRequest *)request;

/**
 <p>Removes the specified tags from the specified resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorInternalServer`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorResourceNotFound`.
 
 @see AWSdlmUntagResourceRequest
 @see AWSdlmUntagResourceResponse
 */
- (void)untagResource:(AWSdlmUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLifecyclePolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSdlmUpdateLifecyclePolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmUpdateLifecyclePolicyRequest
 @see AWSdlmUpdateLifecyclePolicyResponse
 */
- (AWSTask<AWSdlmUpdateLifecyclePolicyResponse *> *)updateLifecyclePolicy:(AWSdlmUpdateLifecyclePolicyRequest *)request;

/**
 <p>Updates the specified lifecycle policy.</p>
 
 @param request A container for the necessary parameters to execute the UpdateLifecyclePolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSdlmErrorDomain` domain and the following error code: `AWSdlmErrorResourceNotFound`, `AWSdlmErrorInvalidRequest`, `AWSdlmErrorInternalServer`, `AWSdlmErrorLimitExceeded`.
 
 @see AWSdlmUpdateLifecyclePolicyRequest
 @see AWSdlmUpdateLifecyclePolicyResponse
 */
- (void)updateLifecyclePolicy:(AWSdlmUpdateLifecyclePolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSdlmUpdateLifecyclePolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
