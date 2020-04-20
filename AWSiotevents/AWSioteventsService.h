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
#import "AWSioteventsModel.h"
#import "AWSioteventsResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSiotevents
FOUNDATION_EXPORT NSString *const AWSioteventsSDKVersion;

/**
 <p>AWS IoT Events monitors your equipment or device fleets for failures or changes in operation, and triggers actions when such events occur. You can use AWS IoT Events API operations to create, read, update, and delete inputs and detector models, and to list their versions.</p>
 */
@interface AWSiotevents : AWSService

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

     let iotevents = AWSiotevents.default()

 *Objective-C*

     AWSiotevents *iotevents = [AWSiotevents defaultiotevents];

 @return The default service client.
 */
+ (instancetype)defaultiotevents;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSiotevents.register(with: configuration!, forKey: "USWest2iotevents")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSiotevents registerioteventsWithConfiguration:configuration forKey:@"USWest2iotevents"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let iotevents = AWSiotevents(forKey: "USWest2iotevents")

 *Objective-C*

     AWSiotevents *iotevents = [AWSiotevents ioteventsForKey:@"USWest2iotevents"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerioteventsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerioteventsWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSiotevents.register(with: configuration!, forKey: "USWest2iotevents")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSiotevents registerioteventsWithConfiguration:configuration forKey:@"USWest2iotevents"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let iotevents = AWSiotevents(forKey: "USWest2iotevents")

 *Objective-C*

     AWSiotevents *iotevents = [AWSiotevents ioteventsForKey:@"USWest2iotevents"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ioteventsForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeioteventsForKey:(NSString *)key;

/**
 <p>Creates a detector model.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetectorModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsCreateDetectorModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceAlreadyExists`, `AWSioteventsErrorLimitExceeded`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsCreateDetectorModelRequest
 @see AWSioteventsCreateDetectorModelResponse
 */
- (AWSTask<AWSioteventsCreateDetectorModelResponse *> *)createDetectorModel:(AWSioteventsCreateDetectorModelRequest *)request;

/**
 <p>Creates a detector model.</p>
 
 @param request A container for the necessary parameters to execute the CreateDetectorModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceAlreadyExists`, `AWSioteventsErrorLimitExceeded`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsCreateDetectorModelRequest
 @see AWSioteventsCreateDetectorModelResponse
 */
- (void)createDetectorModel:(AWSioteventsCreateDetectorModelRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsCreateDetectorModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an input.</p>
 
 @param request A container for the necessary parameters to execute the CreateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsCreateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceAlreadyExists`.
 
 @see AWSioteventsCreateInputRequest
 @see AWSioteventsCreateInputResponse
 */
- (AWSTask<AWSioteventsCreateInputResponse *> *)createInput:(AWSioteventsCreateInputRequest *)request;

/**
 <p>Creates an input.</p>
 
 @param request A container for the necessary parameters to execute the CreateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceAlreadyExists`.
 
 @see AWSioteventsCreateInputRequest
 @see AWSioteventsCreateInputResponse
 */
- (void)createInput:(AWSioteventsCreateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsCreateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a detector model. Any active instances of the detector model are also deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetectorModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsDeleteDetectorModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDeleteDetectorModelRequest
 @see AWSioteventsDeleteDetectorModelResponse
 */
- (AWSTask<AWSioteventsDeleteDetectorModelResponse *> *)deleteDetectorModel:(AWSioteventsDeleteDetectorModelRequest *)request;

/**
 <p>Deletes a detector model. Any active instances of the detector model are also deleted.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDetectorModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDeleteDetectorModelRequest
 @see AWSioteventsDeleteDetectorModelResponse
 */
- (void)deleteDetectorModel:(AWSioteventsDeleteDetectorModelRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsDeleteDetectorModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an input.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsDeleteInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsDeleteInputRequest
 @see AWSioteventsDeleteInputResponse
 */
- (AWSTask<AWSioteventsDeleteInputResponse *> *)deleteInput:(AWSioteventsDeleteInputRequest *)request;

/**
 <p>Deletes an input.</p>
 
 @param request A container for the necessary parameters to execute the DeleteInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsDeleteInputRequest
 @see AWSioteventsDeleteInputResponse
 */
- (void)deleteInput:(AWSioteventsDeleteInputRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsDeleteInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a detector model. If the <code>version</code> parameter is not specified, information about the latest version is returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDetectorModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsDescribeDetectorModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDescribeDetectorModelRequest
 @see AWSioteventsDescribeDetectorModelResponse
 */
- (AWSTask<AWSioteventsDescribeDetectorModelResponse *> *)describeDetectorModel:(AWSioteventsDescribeDetectorModelRequest *)request;

/**
 <p>Describes a detector model. If the <code>version</code> parameter is not specified, information about the latest version is returned.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDetectorModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDescribeDetectorModelRequest
 @see AWSioteventsDescribeDetectorModelResponse
 */
- (void)describeDetectorModel:(AWSioteventsDescribeDetectorModelRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsDescribeDetectorModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes an input.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsDescribeInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDescribeInputRequest
 @see AWSioteventsDescribeInputResponse
 */
- (AWSTask<AWSioteventsDescribeInputResponse *> *)describeInput:(AWSioteventsDescribeInputRequest *)request;

/**
 <p>Describes an input.</p>
 
 @param request A container for the necessary parameters to execute the DescribeInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsDescribeInputRequest
 @see AWSioteventsDescribeInputResponse
 */
- (void)describeInput:(AWSioteventsDescribeInputRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsDescribeInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the current settings of the AWS IoT Events logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsDescribeLoggingOptionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorUnsupportedOperation`.
 
 @see AWSioteventsDescribeLoggingOptionsRequest
 @see AWSioteventsDescribeLoggingOptionsResponse
 */
- (AWSTask<AWSioteventsDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSioteventsDescribeLoggingOptionsRequest *)request;

/**
 <p>Retrieves the current settings of the AWS IoT Events logging options.</p>
 
 @param request A container for the necessary parameters to execute the DescribeLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorUnsupportedOperation`.
 
 @see AWSioteventsDescribeLoggingOptionsRequest
 @see AWSioteventsDescribeLoggingOptionsResponse
 */
- (void)describeLoggingOptions:(AWSioteventsDescribeLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsDescribeLoggingOptionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists all the versions of a detector model. Only the metadata associated with each detector model version is returned.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectorModelVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsListDetectorModelVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListDetectorModelVersionsRequest
 @see AWSioteventsListDetectorModelVersionsResponse
 */
- (AWSTask<AWSioteventsListDetectorModelVersionsResponse *> *)listDetectorModelVersions:(AWSioteventsListDetectorModelVersionsRequest *)request;

/**
 <p>Lists all the versions of a detector model. Only the metadata associated with each detector model version is returned.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectorModelVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListDetectorModelVersionsRequest
 @see AWSioteventsListDetectorModelVersionsResponse
 */
- (void)listDetectorModelVersions:(AWSioteventsListDetectorModelVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsListDetectorModelVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the detector models you have created. Only the metadata associated with each detector model is returned.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectorModels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsListDetectorModelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListDetectorModelsRequest
 @see AWSioteventsListDetectorModelsResponse
 */
- (AWSTask<AWSioteventsListDetectorModelsResponse *> *)listDetectorModels:(AWSioteventsListDetectorModelsRequest *)request;

/**
 <p>Lists the detector models you have created. Only the metadata associated with each detector model is returned.</p>
 
 @param request A container for the necessary parameters to execute the ListDetectorModels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListDetectorModelsRequest
 @see AWSioteventsListDetectorModelsResponse
 */
- (void)listDetectorModels:(AWSioteventsListDetectorModelsRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsListDetectorModelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the inputs you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListInputs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsListInputsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListInputsRequest
 @see AWSioteventsListInputsResponse
 */
- (AWSTask<AWSioteventsListInputsResponse *> *)listInputs:(AWSioteventsListInputsRequest *)request;

/**
 <p>Lists the inputs you have created.</p>
 
 @param request A container for the necessary parameters to execute the ListInputs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsListInputsRequest
 @see AWSioteventsListInputsResponse
 */
- (void)listInputs:(AWSioteventsListInputsRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsListInputsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags (metadata) you have assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsListTagsForResourceRequest
 @see AWSioteventsListTagsForResourceResponse
 */
- (AWSTask<AWSioteventsListTagsForResourceResponse *> *)listTagsForResource:(AWSioteventsListTagsForResourceRequest *)request;

/**
 <p>Lists the tags (metadata) you have assigned to the resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsListTagsForResourceRequest
 @see AWSioteventsListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSioteventsListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets or updates the AWS IoT Events logging options.</p><p>If you update the value of any <code>loggingOptions</code> field, it takes up to one minute for the change to take effect. If you change the policy attached to the role you specified in the <code>roleArn</code> field (for example, to correct an invalid policy), it takes up to five minutes for that change to take effect.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorUnsupportedOperation`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsPutLoggingOptionsRequest
 */
- (AWSTask *)putLoggingOptions:(AWSioteventsPutLoggingOptionsRequest *)request;

/**
 <p>Sets or updates the AWS IoT Events logging options.</p><p>If you update the value of any <code>loggingOptions</code> field, it takes up to one minute for the change to take effect. If you change the policy attached to the role you specified in the <code>roleArn</code> field (for example, to correct an invalid policy), it takes up to five minutes for that change to take effect.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingOptions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorUnsupportedOperation`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsPutLoggingOptionsRequest
 */
- (void)putLoggingOptions:(AWSioteventsPutLoggingOptionsRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorLimitExceeded`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsTagResourceRequest
 @see AWSioteventsTagResourceResponse
 */
- (AWSTask<AWSioteventsTagResourceResponse *> *)tagResource:(AWSioteventsTagResourceRequest *)request;

/**
 <p>Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorLimitExceeded`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsTagResourceRequest
 @see AWSioteventsTagResourceResponse
 */
- (void)tagResource:(AWSioteventsTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the given tags (metadata) from the resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsUntagResourceRequest
 @see AWSioteventsUntagResourceResponse
 */
- (AWSTask<AWSioteventsUntagResourceResponse *> *)untagResource:(AWSioteventsUntagResourceRequest *)request;

/**
 <p>Removes the given tags (metadata) from the resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`.
 
 @see AWSioteventsUntagResourceRequest
 @see AWSioteventsUntagResourceResponse
 */
- (void)untagResource:(AWSioteventsUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a detector model. Detectors (instances) spawned by the previous version are deleted and then re-created as new inputs arrive.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorModel service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsUpdateDetectorModelResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsUpdateDetectorModelRequest
 @see AWSioteventsUpdateDetectorModelResponse
 */
- (AWSTask<AWSioteventsUpdateDetectorModelResponse *> *)updateDetectorModel:(AWSioteventsUpdateDetectorModelRequest *)request;

/**
 <p>Updates a detector model. Detectors (instances) spawned by the previous version are deleted and then re-created as new inputs arrive.</p>
 
 @param request A container for the necessary parameters to execute the UpdateDetectorModel service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorResourceInUse`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`.
 
 @see AWSioteventsUpdateDetectorModelRequest
 @see AWSioteventsUpdateDetectorModelResponse
 */
- (void)updateDetectorModel:(AWSioteventsUpdateDetectorModelRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsUpdateDetectorModelResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates an input.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsUpdateInputResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsUpdateInputRequest
 @see AWSioteventsUpdateInputResponse
 */
- (AWSTask<AWSioteventsUpdateInputResponse *> *)updateInput:(AWSioteventsUpdateInputRequest *)request;

/**
 <p>Updates an input.</p>
 
 @param request A container for the necessary parameters to execute the UpdateInput service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorInvalidRequest`, `AWSioteventsErrorThrottling`, `AWSioteventsErrorResourceNotFound`, `AWSioteventsErrorInternalFailure`, `AWSioteventsErrorServiceUnavailable`, `AWSioteventsErrorResourceInUse`.
 
 @see AWSioteventsUpdateInputRequest
 @see AWSioteventsUpdateInputResponse
 */
- (void)updateInput:(AWSioteventsUpdateInputRequest *)request completionHandler:(void (^ _Nullable)(AWSioteventsUpdateInputResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 VerifyResourcesExistForTagris
 
 @param request A container for the necessary parameters to execute the VerifyResourcesExistForTagris service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSioteventsTagrisVerifyResourcesExistOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorTagrisAccessDenied`, `AWSioteventsErrorTagrisInternalService`, `AWSioteventsErrorTagrisInvalidArn`, `AWSioteventsErrorTagrisInvalidParameter`, `AWSioteventsErrorTagrisPartialResourcesExistResults`, `AWSioteventsErrorTagrisThrottled`.
 
 @see AWSioteventsTagrisVerifyResourcesExistInput
 @see AWSioteventsTagrisVerifyResourcesExistOutput
 */
- (AWSTask<AWSioteventsTagrisVerifyResourcesExistOutput *> *)verifyResourcesExistForTagris:(AWSioteventsTagrisVerifyResourcesExistInput *)request;

/**
 VerifyResourcesExistForTagris
 
 @param request A container for the necessary parameters to execute the VerifyResourcesExistForTagris service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSioteventsErrorDomain` domain and the following error code: `AWSioteventsErrorTagrisAccessDenied`, `AWSioteventsErrorTagrisInternalService`, `AWSioteventsErrorTagrisInvalidArn`, `AWSioteventsErrorTagrisInvalidParameter`, `AWSioteventsErrorTagrisPartialResourcesExistResults`, `AWSioteventsErrorTagrisThrottled`.
 
 @see AWSioteventsTagrisVerifyResourcesExistInput
 @see AWSioteventsTagrisVerifyResourcesExistOutput
 */
- (void)verifyResourcesExistForTagris:(AWSioteventsTagrisVerifyResourcesExistInput *)request completionHandler:(void (^ _Nullable)(AWSioteventsTagrisVerifyResourcesExistOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
