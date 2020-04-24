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
#import "AWSapi.elastic-inferenceModel.h"
#import "AWSapi.elastic-inferenceResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSapi.elastic-inference
FOUNDATION_EXPORT NSString *const AWSapi.elastic-inferenceSDKVersion;

/**
 <p> Elastic Inference public APIs. </p>
 */
@interface AWSapi.elastic-inference : AWSService

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

     let api.elastic-inference = AWSapi.elastic-inference.default()

 *Objective-C*

     AWSapi.elastic-inference *api.elastic-inference = [AWSapi.elastic-inference defaultapi.elastic-inference];

 @return The default service client.
 */
+ (instancetype)defaultapi.elastic-inference;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.elastic-inference.register(with: configuration!, forKey: "USWest2api.elastic-inference")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:@"USWest2api.elastic-inference"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.elastic-inference = AWSapi.elastic-inference(forKey: "USWest2api.elastic-inference")

 *Objective-C*

     AWSapi.elastic-inference *api.elastic-inference = [AWSapi.elastic-inference api.elastic-inferenceForKey:@"USWest2api.elastic-inference"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerapi.elastic-inferenceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerapi.elastic-inferenceWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSapi.elastic-inference.register(with: configuration!, forKey: "USWest2api.elastic-inference")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:configuration forKey:@"USWest2api.elastic-inference"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let api.elastic-inference = AWSapi.elastic-inference(forKey: "USWest2api.elastic-inference")

 *Objective-C*

     AWSapi.elastic-inference *api.elastic-inference = [AWSapi.elastic-inference api.elastic-inferenceForKey:@"USWest2api.elastic-inference"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)api.elastic-inferenceForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeapi.elastic-inferenceForKey:(NSString *)key;

/**
 <p> Describes the locations in which a given accelerator type or set of types is present in a given region. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAcceleratorOfferings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse
 */
- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse *> *)describeAcceleratorOfferings:(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest *)request;

/**
 <p> Describes the locations in which a given accelerator type or set of types is present in a given region. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAcceleratorOfferings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse
 */
- (void)describeAcceleratorOfferings:(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes the accelerator types available in a given region, as well as their characteristics, such as memory and throughput. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAcceleratorTypes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse
 */
- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse *> *)describeAcceleratorTypes:(AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest *)request;

/**
 <p> Describes the accelerator types available in a given region, as well as their characteristics, such as memory and throughput. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAcceleratorTypes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse
 */
- (void)describeAcceleratorTypes:(AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes information over a provided set of accelerators belonging to an account. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAccelerators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceDescribeAcceleratorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorsRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorsResponse
 */
- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorsResponse *> *)describeAccelerators:(AWSapi.elastic-inferenceDescribeAcceleratorsRequest *)request;

/**
 <p> Describes information over a provided set of accelerators belonging to an account. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAccelerators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceDescribeAcceleratorsRequest
 @see AWSapi.elastic-inferenceDescribeAcceleratorsResponse
 */
- (void)describeAccelerators:(AWSapi.elastic-inferenceDescribeAcceleratorsRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceDescribeAcceleratorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns all tags of an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceListTagsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceListTagsForResourceRequest
 @see AWSapi.elastic-inferenceListTagsForResourceResult
 */
- (AWSTask<AWSapi.elastic-inferenceListTagsForResourceResult *> *)listTagsForResource:(AWSapi.elastic-inferenceListTagsForResourceRequest *)request;

/**
 <p> Returns all tags of an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceListTagsForResourceRequest
 @see AWSapi.elastic-inferenceListTagsForResourceResult
 */
- (void)listTagsForResource:(AWSapi.elastic-inferenceListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceListTagsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Adds the specified tags to an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceTagResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceTagResourceRequest
 @see AWSapi.elastic-inferenceTagResourceResult
 */
- (AWSTask<AWSapi.elastic-inferenceTagResourceResult *> *)tagResource:(AWSapi.elastic-inferenceTagResourceRequest *)request;

/**
 <p> Adds the specified tags to an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceTagResourceRequest
 @see AWSapi.elastic-inferenceTagResourceResult
 */
- (void)tagResource:(AWSapi.elastic-inferenceTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceTagResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Removes the specified tags from an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSapi.elastic-inferenceUntagResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceUntagResourceRequest
 @see AWSapi.elastic-inferenceUntagResourceResult
 */
- (AWSTask<AWSapi.elastic-inferenceUntagResourceResult *> *)untagResource:(AWSapi.elastic-inferenceUntagResourceRequest *)request;

/**
 <p> Removes the specified tags from an Elastic Inference Accelerator. </p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSapi.elastic-inferenceErrorDomain` domain and the following error code: `AWSapi.elastic-inferenceErrorBadRequest`, `AWSapi.elastic-inferenceErrorResourceNotFound`, `AWSapi.elastic-inferenceErrorInternalServer`.
 
 @see AWSapi.elastic-inferenceUntagResourceRequest
 @see AWSapi.elastic-inferenceUntagResourceResult
 */
- (void)untagResource:(AWSapi.elastic-inferenceUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSapi.elastic-inferenceUntagResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
