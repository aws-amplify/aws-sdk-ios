//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSRekognitionModel.h"
#import "AWSRekognitionResources.h"

NS_ASSUME_NONNULL_BEGIN

/**
 <p>This is the Amazon Rekognition API reference.</p>
 */
@interface AWSRekognition : AWSService

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

     let Rekognition = AWSRekognition.default()

 *Objective-C*

     AWSRekognition *Rekognition = [AWSRekognition defaultRekognition];

 @return The default service client.
 */
+ (instancetype)defaultRekognition;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSRekognition.register(with: configuration!, forKey: "USWest2Rekognition")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:@"USWest2Rekognition"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Rekognition = AWSRekognition(forKey: "USWest2Rekognition")

 *Objective-C*

     AWSRekognition *Rekognition = [AWSRekognition RekognitionForKey:@"USWest2Rekognition"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerRekognitionWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerRekognitionWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSRekognition.register(with: configuration!, forKey: "USWest2Rekognition")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSRekognition registerRekognitionWithConfiguration:configuration forKey:@"USWest2Rekognition"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Rekognition = AWSRekognition(forKey: "USWest2Rekognition")

 *Objective-C*

     AWSRekognition *Rekognition = [AWSRekognition RekognitionForKey:@"USWest2Rekognition"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)RekognitionForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeRekognitionForKey:(NSString *)key;

/**
 <p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p></note><p>You pass the input and target images either as base64-encoded image bytes or as a references to images in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, role, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p><note><p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p></note><p><code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p><p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p><p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p><note><p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p></note><p>For an example, see <a>faces-compare-images</a>.</p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCompareFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (AWSTask<AWSRekognitionCompareFacesResponse *> *)compareFaces:(AWSRekognitionCompareFacesRequest *)request;

/**
 <p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p></note><p>You pass the input and target images either as base64-encoded image bytes or as a references to images in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, role, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p><note><p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p></note><p><code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p><p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p><p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p><note><p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p></note><p>For an example, see <a>faces-compare-images</a>.</p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (void)compareFaces:(AWSRekognitionCompareFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCompareFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><note><p>Collection names are case-sensitive.</p></note><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (AWSTask<AWSRekognitionCreateCollectionResponse *> *)createCollection:(AWSRekognitionCreateCollectionRequest *)request;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><note><p>Collection names are case-sensitive.</p></note><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (void)createCollection:(AWSRekognitionCreateCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p><p>Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p><p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling with the <code>Name</code> field. </p><p>After you have finished analyzing a streaming video, use to stop processing. You can delete the stream processor by calling .</p>
 
 @param request A container for the necessary parameters to execute the CreateStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateStreamProcessorRequest
 @see AWSRekognitionCreateStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionCreateStreamProcessorResponse *> *)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request;

/**
 <p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p><p>Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p><p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling with the <code>Name</code> field. </p><p>After you have finished analyzing a streaming video, use to stop processing. You can delete the stream processor by calling .</p>
 
 @param request A container for the necessary parameters to execute the CreateStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateStreamProcessorRequest
 @see AWSRekognitionCreateStreamProcessorResponse
 */
- (void)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>delete-collection-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDeleteCollectionRequest
 @see AWSRekognitionDeleteCollectionResponse
 */
- (AWSTask<AWSRekognitionDeleteCollectionResponse *> *)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request;

/**
 <p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>delete-collection-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDeleteCollectionRequest
 @see AWSRekognitionDeleteCollectionResponse
 */
- (void)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from the collection.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDeleteFacesRequest
 @see AWSRekognitionDeleteFacesResponse
 */
- (AWSTask<AWSRekognitionDeleteFacesResponse *> *)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request;

/**
 <p>Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from the collection.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDeleteFacesRequest
 @see AWSRekognitionDeleteFacesResponse
 */
- (void)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with . You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteStreamProcessorRequest
 @see AWSRekognitionDeleteStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> *)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request;

/**
 <p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with . You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteStreamProcessorRequest
 @see AWSRekognitionDeleteStreamProcessorResponse
 */
- (void)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a stream processor created by . You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDescribeStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeStreamProcessorRequest
 @see AWSRekognitionDescribeStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> *)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request;

/**
 <p>Provides information about a stream processor created by . You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeStreamProcessorRequest
 @see AWSRekognitionDescribeStreamProcessorResponse
 */
- (void)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDescribeStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects faces within an image that is provided as input.</p><p><code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>procedure-detecting-faces-in-images</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (AWSTask<AWSRekognitionDetectFacesResponse *> *)detectFaces:(AWSRekognitionDetectFacesRequest *)request;

/**
 <p>Detects faces within an image that is provided as input.</p><p><code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>procedure-detecting-faces-in-images</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (void)detectFaces:(AWSRekognitionDetectFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>images-s3</a>.</p><note><p><code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see .</p></note><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectLabelsResponse *> *)detectLabels:(AWSRekognitionDetectLabelsRequest *)request;

/**
 <p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>images-s3</a>.</p><note><p><code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see .</p></note><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (void)detectLabels:(AWSRekognitionDetectLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects explicit or suggestive adult content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate. For information about moderation labels, see <a>moderation</a>.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectModerationLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectModerationLabelsResponse *> *)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request;

/**
 <p>Detects explicit or suggestive adult content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate. For information about moderation labels, see <a>moderation</a>.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (void)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectModerationLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects text in the input image and converts it into machine-readable text.</p><p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p><p>The <code>DetectText</code> operation returns text in an array of elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p><p>A word is one or more ISO basic latin script characters that are not separated by spaces. <code>DetectText</code> can detect up to 50 words in an image.</p><p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p><p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p><p>To be detected, text must be within +/- 30 degrees orientation of the horizontal axis.</p><p>For more information, see <a>text-detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectTextRequest
 @see AWSRekognitionDetectTextResponse
 */
- (AWSTask<AWSRekognitionDetectTextResponse *> *)detectText:(AWSRekognitionDetectTextRequest *)request;

/**
 <p>Detects text in the input image and converts it into machine-readable text.</p><p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p><p>The <code>DetectText</code> operation returns text in an array of elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p><p>A word is one or more ISO basic latin script characters that are not separated by spaces. <code>DetectText</code> can detect up to 50 words in an image.</p><p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p><p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p><p>To be detected, text must be within +/- 30 degrees orientation of the horizontal axis.</p><p>For more information, see <a>text-detection</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectTextRequest
 @see AWSRekognitionDetectTextResponse
 */
- (void)detectText:(AWSRekognitionDetectTextRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the name and additional information about a celebrity based on his or her Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty. For more information, see <a>get-celebrity-info-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetCelebrityInfoResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionGetCelebrityInfoRequest
 @see AWSRekognitionGetCelebrityInfoResponse
 */
- (AWSTask<AWSRekognitionGetCelebrityInfoResponse *> *)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request;

/**
 <p>Gets the name and additional information about a celebrity based on his or her Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty. For more information, see <a>get-celebrity-info-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionGetCelebrityInfoRequest
 @see AWSRekognitionGetCelebrityInfoResponse
 */
- (void)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetCelebrityInfoResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the celebrity recognition results for a Rekognition Video analysis started by .</p><p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to which returns a job identifier (<code>JobId</code>). When the celebrity recognition operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>.</p><p><code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a object and the time, <code>Timestamp</code>, the celebrity was detected. </p><p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p><p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling with the celebrity identifer.</p><p>No information is returned for faces not recognized as celebrities.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityRecognition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetCelebrityRecognitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetCelebrityRecognitionRequest
 @see AWSRekognitionGetCelebrityRecognitionResponse
 */
- (AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> *)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request;

/**
 <p>Gets the celebrity recognition results for a Rekognition Video analysis started by .</p><p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to which returns a job identifier (<code>JobId</code>). When the celebrity recognition operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>.</p><p><code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a object and the time, <code>Timestamp</code>, the celebrity was detected. </p><p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p><p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling with the celebrity identifer.</p><p>No information is returned for faces not recognized as celebrities.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityRecognition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetCelebrityRecognitionRequest
 @see AWSRekognitionGetCelebrityRecognitionResponse
 */
- (void)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetCelebrityRecognitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the content moderation analysis results for a Rekognition Video analysis started by .</p><p>Content moderation analysis of a video is an asynchronous operation. You start analysis by calling . which returns a job identifier (<code>JobId</code>). When analysis finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>. </p><p><code>GetContentModeration</code> returns detected content moderation labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of objects. </p><p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p><p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p><p>For more information, see <a>moderation</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetContentModeration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetContentModerationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetContentModerationRequest
 @see AWSRekognitionGetContentModerationResponse
 */
- (AWSTask<AWSRekognitionGetContentModerationResponse *> *)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request;

/**
 <p>Gets the content moderation analysis results for a Rekognition Video analysis started by .</p><p>Content moderation analysis of a video is an asynchronous operation. You start analysis by calling . which returns a job identifier (<code>JobId</code>). When analysis finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. For more information, see <a>video</a>. </p><p><code>GetContentModeration</code> returns detected content moderation labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of objects. </p><p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p><p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p><p>For more information, see <a>moderation</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetContentModeration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetContentModerationRequest
 @see AWSRekognitionGetContentModerationResponse
 */
- (void)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetContentModerationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets face detection results for a Rekognition Video analysis started by .</p><p>Face detection with Rekognition Video is an asynchronous operation. You start face detection by calling which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p><code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetFaceDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceDetectionRequest
 @see AWSRekognitionGetFaceDetectionResponse
 */
- (AWSTask<AWSRekognitionGetFaceDetectionResponse *> *)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request;

/**
 <p>Gets face detection results for a Rekognition Video analysis started by .</p><p>Face detection with Rekognition Video is an asynchronous operation. You start face detection by calling which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p><code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceDetectionRequest
 @see AWSRekognitionGetFaceDetectionResponse
 */
- (void)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetFaceDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the face search results for Rekognition Video face search started by . The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p><p>Face search in a video is an asynchronous operation. You start face search by calling to which returns a job identifier (<code>JobId</code>). When the search operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections</a>.</p><p>The search results are retured in an array, <code>Persons</code>, of objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information for the matched person, and the time the person was matched in the video.</p><p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceSearch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetFaceSearchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceSearchRequest
 @see AWSRekognitionGetFaceSearchResponse
 */
- (AWSTask<AWSRekognitionGetFaceSearchResponse *> *)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request;

/**
 <p>Gets the face search results for Rekognition Video face search started by . The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p><p>Face search in a video is an asynchronous operation. You start face search by calling to which returns a job identifier (<code>JobId</code>). When the search operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections</a>.</p><p>The search results are retured in an array, <code>Persons</code>, of objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information for the matched person, and the time the person was matched in the video.</p><p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceSearch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceSearchRequest
 @see AWSRekognitionGetFaceSearchResponse
 */
- (void)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetFaceSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the label detection results of a Rekognition Video analysis started by . </p><p>The label detection operation is started by a call to which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p><code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p><p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLabelDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetLabelDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetLabelDetectionRequest
 @see AWSRekognitionGetLabelDetectionResponse
 */
- (AWSTask<AWSRekognitionGetLabelDetectionResponse *> *)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request;

/**
 <p>Gets the label detection results of a Rekognition Video analysis started by . </p><p>The label detection operation is started by a call to which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p><code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p><p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLabelDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetLabelDetectionRequest
 @see AWSRekognitionGetLabelDetectionResponse
 */
- (void)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetLabelDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the person tracking results of a Rekognition Video analysis started by .</p><p>The person detection operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the person detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p><p>To get the results of the person tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p><p><code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) they were tracked in the video. </p><p>By default, the array is sorted by the time(s) a person is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p><p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetPersonTracking service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetPersonTrackingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetPersonTrackingRequest
 @see AWSRekognitionGetPersonTrackingResponse
 */
- (AWSTask<AWSRekognitionGetPersonTrackingResponse *> *)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request;

/**
 <p>Gets the person tracking results of a Rekognition Video analysis started by .</p><p>The person detection operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the person detection operation finishes, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p><p>To get the results of the person tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p><p><code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) they were tracked in the video. </p><p>By default, the array is sorted by the time(s) a person is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p><p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetPersonTracking service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetPersonTrackingRequest
 @see AWSRekognitionGetPersonTrackingResponse
 */
- (void)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetPersonTrackingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p>Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations.</p><p>If you are using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. To determine which version of the model you are using, check the the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code>. For more information, see <a>face-detection-model</a>.</p><p>If you provide the optional <code>ExternalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p><p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image. If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Amazon Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata. </p><p>The input image is passed either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionIndexFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (AWSTask<AWSRekognitionIndexFacesResponse *> *)indexFaces:(AWSRekognitionIndexFacesRequest *)request;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p>Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations.</p><p>If you are using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. To determine which version of the model you are using, check the the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code>. For more information, see <a>face-detection-model</a>.</p><p>If you provide the optional <code>ExternalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p><p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image. If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Amazon Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata. </p><p>The input image is passed either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (void)indexFaces:(AWSRekognitionIndexFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionIndexFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see <a>list-collection-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListCollectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (AWSTask<AWSRekognitionListCollectionsResponse *> *)listCollections:(AWSRekognitionListCollectionsRequest *)request;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see <a>list-collection-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (void)listCollections:(AWSRekognitionListCollectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListCollectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>list-faces-in-collection-procedure</a>. </p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (AWSTask<AWSRekognitionListFacesResponse *> *)listFaces:(AWSRekognitionListFacesRequest *)request;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>list-faces-in-collection-procedure</a>. </p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (void)listFaces:(AWSRekognitionListFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of stream processors that you have created with . </p>
 
 @param request A container for the necessary parameters to execute the ListStreamProcessors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListStreamProcessorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionListStreamProcessorsRequest
 @see AWSRekognitionListStreamProcessorsResponse
 */
- (AWSTask<AWSRekognitionListStreamProcessorsResponse *> *)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request;

/**
 <p>Gets a list of stream processors that you have created with . </p>
 
 @param request A container for the necessary parameters to execute the ListStreamProcessors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionListStreamProcessorsRequest
 @see AWSRekognitionListStreamProcessorsResponse
 */
- (void)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListStreamProcessorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of celebrities recognized in the input image. For more information, see <a>celebrities</a>. </p><p><code>RecognizeCelebrities</code> returns the 100 largest faces in the image. It lists recognized celebrities in the <code>CelebrityFaces</code> array and unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces are not amongst the largest 100 faces in the image.</p><p>For each celebrity recognized, the <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p><p>Rekognition does not retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the operation.</p><p>You pass the imput image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>For an example, see <a>celebrities-procedure-image</a>.</p><p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the RecognizeCelebrities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionRecognizeCelebritiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionRecognizeCelebritiesRequest
 @see AWSRekognitionRecognizeCelebritiesResponse
 */
- (AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> *)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request;

/**
 <p>Returns an array of celebrities recognized in the input image. For more information, see <a>celebrities</a>. </p><p><code>RecognizeCelebrities</code> returns the 100 largest faces in the image. It lists recognized celebrities in the <code>CelebrityFaces</code> array and unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces are not amongst the largest 100 faces in the image.</p><p>For each celebrity recognized, the <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p><p>Rekognition does not retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the operation.</p><p>You pass the imput image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>For an example, see <a>celebrities-procedure-image</a>.</p><p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the RecognizeCelebrities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionRecognizeCelebritiesRequest
 @see AWSRekognitionRecognizeCelebritiesResponse
 */
- (void)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionRecognizeCelebritiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see <a>search-face-with-id-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (AWSTask<AWSRekognitionSearchFacesResponse *> *)searchFaces:(AWSRekognitionSearchFacesRequest *)request;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see <a>search-face-with-id-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (void)searchFaces:(AWSRekognitionSearchFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p> To search for all faces in an input image, you might first call the operation, and then use the face IDs returned in subsequent calls to the operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, see <a>search-face-with-image-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesByImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (AWSTask<AWSRekognitionSearchFacesByImageResponse *> *)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p> To search for all faces in an input image, you might first call the operation, and then use the face IDs returned in subsequent calls to the operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the Amazon CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, see <a>search-face-with-image-procedure</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (void)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesByImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous recognition of celebrities in a stored video.</p><p>Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. For more information, see <a>celebrities</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCelebrityRecognition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartCelebrityRecognitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartCelebrityRecognitionRequest
 @see AWSRekognitionStartCelebrityRecognitionResponse
 */
- (AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> *)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request;

/**
 <p>Starts asynchronous recognition of celebrities in a stored video.</p><p>Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. For more information, see <a>celebrities</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartCelebrityRecognition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartCelebrityRecognitionRequest
 @see AWSRekognitionStartCelebrityRecognitionResponse
 */
- (void)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartCelebrityRecognitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts asynchronous detection of explicit or suggestive adult content in a stored video.</p><p>Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When content moderation analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. For more information, see <a>moderation</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartContentModeration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartContentModerationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartContentModerationRequest
 @see AWSRekognitionStartContentModerationResponse
 */
- (AWSTask<AWSRekognitionStartContentModerationResponse *> *)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request;

/**
 <p> Starts asynchronous detection of explicit or suggestive adult content in a stored video.</p><p>Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When content moderation analysis is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the content moderation analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. For more information, see <a>moderation</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartContentModeration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartContentModerationRequest
 @see AWSRekognitionStartContentModerationResponse
 */
- (void)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartContentModerationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous detection of faces in a stored video.</p><p>Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>. For more information, see <a>faces-video</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartFaceDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceDetectionRequest
 @see AWSRekognitionStartFaceDetectionResponse
 */
- (AWSTask<AWSRekognitionStartFaceDetectionResponse *> *)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request;

/**
 <p>Starts asynchronous detection of faces in a stored video.</p><p>Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>. For more information, see <a>faces-video</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceDetectionRequest
 @see AWSRekognitionStartFaceDetectionResponse
 */
- (void)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartFaceDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections-search-person</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceSearch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartFaceSearchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceSearchRequest
 @see AWSRekognitionStartFaceSearchResponse
 */
- (AWSTask<AWSRekognitionStartFaceSearchResponse *> *)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request;

/**
 <p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>collections-search-person</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceSearch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceSearchRequest
 @see AWSRekognitionStartFaceSearchResponse
 */
- (void)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartFaceSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous detection of labels in a stored video.</p><p>Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p/>
 
 @param request A container for the necessary parameters to execute the StartLabelDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartLabelDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartLabelDetectionRequest
 @see AWSRekognitionStartLabelDetectionResponse
 */
- (AWSTask<AWSRekognitionStartLabelDetectionResponse *> *)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request;

/**
 <p>Starts asynchronous detection of labels in a stored video.</p><p>Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p/>
 
 @param request A container for the necessary parameters to execute the StartLabelDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartLabelDetectionRequest
 @see AWSRekognitionStartLabelDetectionResponse
 */
- (void)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartLabelDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the asynchronous tracking of persons in a stored video.</p><p>Rekognition Video can track persons in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p><p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartPersonTracking service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartPersonTrackingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartPersonTrackingRequest
 @see AWSRekognitionStartPersonTrackingResponse
 */
- (AWSTask<AWSRekognitionStartPersonTrackingResponse *> *)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request;

/**
 <p>Starts the asynchronous tracking of persons in a stored video.</p><p>Rekognition Video can track persons in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p><p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartPersonTracking service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartPersonTrackingRequest
 @see AWSRekognitionStartPersonTrackingResponse
 */
- (void)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartPersonTrackingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts processing a stream processor. You create a stream processor by calling . To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartStreamProcessorRequest
 @see AWSRekognitionStartStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionStartStreamProcessorResponse *> *)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request;

/**
 <p>Starts processing a stream processor. You create a stream processor by calling . To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartStreamProcessorRequest
 @see AWSRekognitionStartStreamProcessorResponse
 */
- (void)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running stream processor that was created by .</p>
 
 @param request A container for the necessary parameters to execute the StopStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStopStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStopStreamProcessorRequest
 @see AWSRekognitionStopStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionStopStreamProcessorResponse *> *)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request;

/**
 <p>Stops a running stream processor that was created by .</p>
 
 @param request A container for the necessary parameters to execute the StopStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStopStreamProcessorRequest
 @see AWSRekognitionStopStreamProcessorResponse
 */
- (void)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStopStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
