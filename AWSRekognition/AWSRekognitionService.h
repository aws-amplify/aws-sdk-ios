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
#import "AWSRekognitionModel.h"
#import "AWSRekognitionResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSRekognition
FOUNDATION_EXPORT NSString *const AWSRekognitionSDKVersion;

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
 <p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p></note><p>You pass the input and target images either as base64-encoded image bytes or as references to images in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p><p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, role, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p><note><p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p></note><p><code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>. </p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p><p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p><note><p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p></note><p>For an example, see Comparing Faces in Images in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCompareFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (AWSTask<AWSRekognitionCompareFacesResponse *> *)compareFaces:(AWSRekognitionCompareFacesRequest *)request;

/**
 <p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p></note><p>You pass the input and target images either as base64-encoded image bytes or as references to images in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p><p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, role, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p><note><p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p></note><p><code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>. </p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p><p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p><note><p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p></note><p>For an example, see Comparing Faces in Images in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (void)compareFaces:(AWSRekognitionCompareFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCompareFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the <a>IndexFaces</a> operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><p>When you create a collection, it is associated with the latest version of the face model version.</p><note><p>Collection names are case-sensitive.</p></note><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (AWSTask<AWSRekognitionCreateCollectionResponse *> *)createCollection:(AWSRekognitionCreateCollectionRequest *)request;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the <a>IndexFaces</a> operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><p>When you create a collection, it is associated with the latest version of the face model version.</p><note><p>Collection names are case-sensitive.</p></note><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (void)createCollection:(AWSRekognitionCreateCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon Rekognition Custom Labels project. A project is a logical grouping of resources (images, Labels, models) and operations (training, evaluation and detection). </p><p>This operation requires permissions to perform the <code>rekognition:CreateProject</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateProjectRequest
 @see AWSRekognitionCreateProjectResponse
 */
- (AWSTask<AWSRekognitionCreateProjectResponse *> *)createProject:(AWSRekognitionCreateProjectRequest *)request;

/**
 <p>Creates a new Amazon Rekognition Custom Labels project. A project is a logical grouping of resources (images, Labels, models) and operations (training, evaluation and detection). </p><p>This operation requires permissions to perform the <code>rekognition:CreateProject</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateProjectRequest
 @see AWSRekognitionCreateProjectResponse
 */
- (void)createProject:(AWSRekognitionCreateProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new version of a model and begins training. Models are managed as part of an Amazon Rekognition Custom Labels project. You can specify one training dataset and one testing dataset. The response from <code>CreateProjectVersion</code> is an Amazon Resource Name (ARN) for the version of the model. </p><p>Training takes a while to complete. You can get the current status by calling <a>DescribeProjectVersions</a>.</p><p>Once training has successfully completed, call <a>DescribeProjectVersions</a> to get the training results and evaluate the model. </p><p>After evaluating the model, you start the model by calling <a>StartProjectVersion</a>.</p><p>This operation requires permissions to perform the <code>rekognition:CreateProjectVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateProjectVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateProjectVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateProjectVersionRequest
 @see AWSRekognitionCreateProjectVersionResponse
 */
- (AWSTask<AWSRekognitionCreateProjectVersionResponse *> *)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request;

/**
 <p>Creates a new version of a model and begins training. Models are managed as part of an Amazon Rekognition Custom Labels project. You can specify one training dataset and one testing dataset. The response from <code>CreateProjectVersion</code> is an Amazon Resource Name (ARN) for the version of the model. </p><p>Training takes a while to complete. You can get the current status by calling <a>DescribeProjectVersions</a>.</p><p>Once training has successfully completed, call <a>DescribeProjectVersions</a> to get the training results and evaluate the model. </p><p>After evaluating the model, you start the model by calling <a>StartProjectVersion</a>.</p><p>This operation requires permissions to perform the <code>rekognition:CreateProjectVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateProjectVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateProjectVersionRequest
 @see AWSRekognitionCreateProjectVersionResponse
 */
- (void)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateProjectVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p><p>Amazon Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Amazon Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p><p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling <a>StartStreamProcessor</a> with the <code>Name</code> field. </p><p>After you have finished analyzing a streaming video, use <a>StopStreamProcessor</a> to stop processing. You can delete the stream processor by calling <a>DeleteStreamProcessor</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionCreateStreamProcessorRequest
 @see AWSRekognitionCreateStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionCreateStreamProcessorResponse *> *)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request;

/**
 <p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p><p>Amazon Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Amazon Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p><p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling <a>StartStreamProcessor</a> with the <code>Name</code> field. </p><p>After you have finished analyzing a streaming video, use <a>StopStreamProcessor</a> to stop processing. You can delete the stream processor by calling <a>DeleteStreamProcessor</a>.</p>
 
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
 <p>Deletes an Amazon Rekognition Custom Labels project. To delete a project you must first delete all versions of the model associated with the project. To delete a version of a model, see <a>DeleteProjectVersion</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteProject</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteProjectResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteProjectRequest
 @see AWSRekognitionDeleteProjectResponse
 */
- (AWSTask<AWSRekognitionDeleteProjectResponse *> *)deleteProject:(AWSRekognitionDeleteProjectRequest *)request;

/**
 <p>Deletes an Amazon Rekognition Custom Labels project. To delete a project you must first delete all versions of the model associated with the project. To delete a version of a model, see <a>DeleteProjectVersion</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteProject</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProject service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteProjectRequest
 @see AWSRekognitionDeleteProjectResponse
 */
- (void)deleteProject:(AWSRekognitionDeleteProjectRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteProjectResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a version of a model. </p><p>You must first stop the model before you can delete it. To check if a model is running, use the <code>Status</code> field returned from <a>DescribeProjectVersions</a>. To stop a running model call <a>StopProjectVersion</a>. </p><p>This operation requires permissions to perform the <code>rekognition:DeleteProjectVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProjectVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteProjectVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteProjectVersionRequest
 @see AWSRekognitionDeleteProjectVersionResponse
 */
- (AWSTask<AWSRekognitionDeleteProjectVersionResponse *> *)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request;

/**
 <p>Deletes a version of a model. </p><p>You must first stop the model before you can delete it. To check if a model is running, use the <code>Status</code> field returned from <a>DescribeProjectVersions</a>. To stop a running model call <a>StopProjectVersion</a>. </p><p>This operation requires permissions to perform the <code>rekognition:DeleteProjectVersion</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DeleteProjectVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteProjectVersionRequest
 @see AWSRekognitionDeleteProjectVersionResponse
 */
- (void)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteProjectVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with <a>CreateStreamProcessor</a>. You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteStreamProcessorRequest
 @see AWSRekognitionDeleteStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> *)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request;

/**
 <p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with <a>CreateStreamProcessor</a>. You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDeleteStreamProcessorRequest
 @see AWSRekognitionDeleteStreamProcessorResponse
 */
- (void)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDeleteStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the specified collection. You can use <code>DescribeCollection</code> to get information, such as the number of faces indexed into a collection and the version of the model used by the collection for face detection.</p><p>For more information, see Describing a Collection in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDescribeCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDescribeCollectionRequest
 @see AWSRekognitionDescribeCollectionResponse
 */
- (AWSTask<AWSRekognitionDescribeCollectionResponse *> *)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request;

/**
 <p>Describes the specified collection. You can use <code>DescribeCollection</code> to get information, such as the number of faces indexed into a collection and the version of the model used by the collection for face detection.</p><p>For more information, see Describing a Collection in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDescribeCollectionRequest
 @see AWSRekognitionDescribeCollectionResponse
 */
- (void)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDescribeCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists and describes the models in an Amazon Rekognition Custom Labels project. You can specify up to 10 model versions in <code>ProjectVersionArns</code>. If you don't specify a value, descriptions for all models are returned.</p><p>This operation requires permissions to perform the <code>rekognition:DescribeProjectVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProjectVersions service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDescribeProjectVersionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeProjectVersionsRequest
 @see AWSRekognitionDescribeProjectVersionsResponse
 */
- (AWSTask<AWSRekognitionDescribeProjectVersionsResponse *> *)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request;

/**
 <p>Lists and describes the models in an Amazon Rekognition Custom Labels project. You can specify up to 10 model versions in <code>ProjectVersionArns</code>. If you don't specify a value, descriptions for all models are returned.</p><p>This operation requires permissions to perform the <code>rekognition:DescribeProjectVersions</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProjectVersions service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeProjectVersionsRequest
 @see AWSRekognitionDescribeProjectVersionsResponse
 */
- (void)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDescribeProjectVersionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists and gets information about your Amazon Rekognition Custom Labels projects.</p><p>This operation requires permissions to perform the <code>rekognition:DescribeProjects</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProjects service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDescribeProjectsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeProjectsRequest
 @see AWSRekognitionDescribeProjectsResponse
 */
- (AWSTask<AWSRekognitionDescribeProjectsResponse *> *)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request;

/**
 <p>Lists and gets information about your Amazon Rekognition Custom Labels projects.</p><p>This operation requires permissions to perform the <code>rekognition:DescribeProjects</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DescribeProjects service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeProjectsRequest
 @see AWSRekognitionDescribeProjectsResponse
 */
- (void)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDescribeProjectsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides information about a stream processor created by <a>CreateStreamProcessor</a>. You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDescribeStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeStreamProcessorRequest
 @see AWSRekognitionDescribeStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> *)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request;

/**
 <p>Provides information about a stream processor created by <a>CreateStreamProcessor</a>. You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDescribeStreamProcessorRequest
 @see AWSRekognitionDescribeStreamProcessorResponse
 */
- (void)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDescribeStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects custom labels in a supplied image by using an Amazon Rekognition Custom Labels model. </p><p>You specify which version of a model version to use by using the <code>ProjectVersionArn</code> input parameter. </p><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object that the model version detects on an image, the API returns a (<code>CustomLabel</code>) object in an array (<code>CustomLabels</code>). Each <code>CustomLabel</code> object provides the label name (<code>Name</code>), the level of confidence that the image contains the object (<code>Confidence</code>), and object location information, if it exists, for the label on the image (<code>Geometry</code>). </p><p>During training model calculates a threshold value that determines if a prediction for a label is true. By default, <code>DetectCustomLabels</code> doesn't return labels whose confidence value is below the model's calculated threshold value. To filter labels that are returned, specify a value for <code>MinConfidence</code> that is higher than the model's calculated threshold. You can get the model's calculated threshold from the model's training results shown in the Amazon Rekognition Custom Labels console. To get all labels, regardless of confidence, specify a <code>MinConfidence</code> value of 0. </p><p>You can also add the <code>MaxResults</code> parameter to limit the number of labels returned. </p><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectCustomLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectCustomLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectCustomLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceNotReady`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectCustomLabelsRequest
 @see AWSRekognitionDetectCustomLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectCustomLabelsResponse *> *)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request;

/**
 <p>Detects custom labels in a supplied image by using an Amazon Rekognition Custom Labels model. </p><p>You specify which version of a model version to use by using the <code>ProjectVersionArn</code> input parameter. </p><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object that the model version detects on an image, the API returns a (<code>CustomLabel</code>) object in an array (<code>CustomLabels</code>). Each <code>CustomLabel</code> object provides the label name (<code>Name</code>), the level of confidence that the image contains the object (<code>Confidence</code>), and object location information, if it exists, for the label on the image (<code>Geometry</code>). </p><p>During training model calculates a threshold value that determines if a prediction for a label is true. By default, <code>DetectCustomLabels</code> doesn't return labels whose confidence value is below the model's calculated threshold value. To filter labels that are returned, specify a value for <code>MinConfidence</code> that is higher than the model's calculated threshold. You can get the model's calculated threshold from the model's training results shown in the Amazon Rekognition Custom Labels console. To get all labels, regardless of confidence, specify a <code>MinConfidence</code> value of 0. </p><p>You can also add the <code>MaxResults</code> parameter to limit the number of labels returned. </p><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectCustomLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectCustomLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceNotReady`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectCustomLabelsRequest
 @see AWSRekognitionDetectCustomLabelsResponse
 */
- (void)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectCustomLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects faces within an image that is provided as input.</p><p><code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details. These details include a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), presence of beard, sunglasses, and so on. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm might not detect the faces or might detect faces with lower confidence. </p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (AWSTask<AWSRekognitionDetectFacesResponse *> *)detectFaces:(AWSRekognitionDetectFacesRequest *)request;

/**
 <p>Detects faces within an image that is provided as input.</p><p><code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details. These details include a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), presence of beard, sunglasses, and so on. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm might not detect the faces or might detect faces with lower confidence. </p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (void)detectFaces:(AWSRekognitionDetectFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. </p><p>For an example, see Analyzing Images Stored in an Amazon S3 Bucket in the Amazon Rekognition Developer Guide.</p><note><p><code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see StartLabelDetection in the Amazon Rekognition Developer Guide.</p></note><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response includes all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p>In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 55%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p><code>DetectLabels</code> returns bounding boxes for instances of common object labels in an array of <a>Instance</a> objects. An <code>Instance</code> object contains a <a>BoundingBox</a> object, for the location of the label on the image. It also includes the confidence by which the bounding box was detected.</p><p><code>DetectLabels</code> also returns a hierarchical taxonomy of detected labels. For example, a detected car might be assigned the label <i>car</i>. The label <i>car</i> has two parent labels: <i>Vehicle</i> (its parent) and <i>Transportation</i> (its grandparent). The response returns the entire list of ancestors for a label. Each ancestor is a unique label in the response. In the previous example, <i>Car</i>, <i>Vehicle</i>, and <i>Transportation</i> are returned as unique labels in the response. </p><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectLabelsResponse *> *)detectLabels:(AWSRekognitionDetectLabelsRequest *)request;

/**
 <p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. </p><p>For an example, see Analyzing Images Stored in an Amazon S3 Bucket in the Amazon Rekognition Developer Guide.</p><note><p><code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see StartLabelDetection in the Amazon Rekognition Developer Guide.</p></note><p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response includes all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p>In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 55%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p><code>DetectLabels</code> returns bounding boxes for instances of common object labels in an array of <a>Instance</a> objects. An <code>Instance</code> object contains a <a>BoundingBox</a> object, for the location of the label on the image. It also includes the confidence by which the bounding box was detected.</p><p><code>DetectLabels</code> also returns a hierarchical taxonomy of detected labels. For example, a detected car might be assigned the label <i>car</i>. The label <i>car</i> has two parent labels: <i>Vehicle</i> (its parent) and <i>Transportation</i> (its grandparent). The response returns the entire list of ancestors for a label. Each ancestor is a unique label in the response. In the previous example, <i>Car</i>, <i>Vehicle</i>, and <i>Transportation</i> are returned as unique labels in the response. </p><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (void)detectLabels:(AWSRekognitionDetectLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects unsafe content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate.</p><p>For information about moderation labels, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectModerationLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorHumanLoopQuotaExceeded`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectModerationLabelsResponse *> *)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request;

/**
 <p>Detects unsafe content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate.</p><p>For information about moderation labels, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorHumanLoopQuotaExceeded`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (void)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectModerationLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects text in the input image and converts it into machine-readable text.</p><p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p><p>The <code>DetectText</code> operation returns text in an array of <a>TextDetection</a> elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p><p>A word is one or more ISO basic latin script characters that are not separated by spaces. <code>DetectText</code> can detect up to 50 words in an image.</p><p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p><p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p><p>To be detected, text must be within +/- 90 degrees orientation of the horizontal axis.</p><p>For more information, see DetectText in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DetectText service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectTextResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectTextRequest
 @see AWSRekognitionDetectTextResponse
 */
- (AWSTask<AWSRekognitionDetectTextResponse *> *)detectText:(AWSRekognitionDetectTextRequest *)request;

/**
 <p>Detects text in the input image and converts it into machine-readable text.</p><p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p><p>The <code>DetectText</code> operation returns text in an array of <a>TextDetection</a> elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p><p>A word is one or more ISO basic latin script characters that are not separated by spaces. <code>DetectText</code> can detect up to 50 words in an image.</p><p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p><p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p><p>To be detected, text must be within +/- 90 degrees orientation of the horizontal axis.</p><p>For more information, see DetectText in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the DetectText service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectTextRequest
 @see AWSRekognitionDetectTextResponse
 */
- (void)detectText:(AWSRekognitionDetectTextRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectTextResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the name and additional information about a celebrity based on his or her Amazon Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty.</p><p>For more information, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityInfo service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetCelebrityInfoResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionGetCelebrityInfoRequest
 @see AWSRekognitionGetCelebrityInfoResponse
 */
- (AWSTask<AWSRekognitionGetCelebrityInfoResponse *> *)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request;

/**
 <p>Gets the name and additional information about a celebrity based on his or her Amazon Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty.</p><p>For more information, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityInfo service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionGetCelebrityInfoRequest
 @see AWSRekognitionGetCelebrityInfoResponse
 */
- (void)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetCelebrityInfoResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the celebrity recognition results for a Amazon Rekognition Video analysis started by <a>StartCelebrityRecognition</a>.</p><p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to <a>StartCelebrityRecognition</a> which returns a job identifier (<code>JobId</code>). When the celebrity recognition operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. </p><p>For more information, see Working With Stored Videos in the Amazon Rekognition Developer Guide.</p><p><code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of <a>CelebrityRecognition</a> objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a <a>CelebrityDetail</a> object and the time, <code>Timestamp</code>, the celebrity was detected. </p><note><p><code>GetCelebrityRecognition</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p></note><p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p><p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling <a>GetCelebrityInfo</a> with the celebrity identifer.</p><p>No information is returned for faces not recognized as celebrities.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityRecognition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetCelebrityRecognitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetCelebrityRecognitionRequest
 @see AWSRekognitionGetCelebrityRecognitionResponse
 */
- (AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> *)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request;

/**
 <p>Gets the celebrity recognition results for a Amazon Rekognition Video analysis started by <a>StartCelebrityRecognition</a>.</p><p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to <a>StartCelebrityRecognition</a> which returns a job identifier (<code>JobId</code>). When the celebrity recognition operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. </p><p>For more information, see Working With Stored Videos in the Amazon Rekognition Developer Guide.</p><p><code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of <a>CelebrityRecognition</a> objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a <a>CelebrityDetail</a> object and the time, <code>Timestamp</code>, the celebrity was detected. </p><note><p><code>GetCelebrityRecognition</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p></note><p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p><p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling <a>GetCelebrityInfo</a> with the celebrity identifer.</p><p>No information is returned for faces not recognized as celebrities.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetCelebrityRecognition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetCelebrityRecognitionRequest
 @see AWSRekognitionGetCelebrityRecognitionResponse
 */
- (void)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetCelebrityRecognitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the unsafe content analysis results for a Amazon Rekognition Video analysis started by <a>StartContentModeration</a>.</p><p>Unsafe content analysis of a video is an asynchronous operation. You start analysis by calling <a>StartContentModeration</a> which returns a job identifier (<code>JobId</code>). When analysis finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the unsafe content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetContentModeration</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p><p>For more information, see Working with Stored Videos in the Amazon Rekognition Devlopers Guide.</p><p><code>GetContentModeration</code> returns detected unsafe content labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of <a>ContentModerationDetection</a> objects. </p><p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p><p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p><p>For more information, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the GetContentModeration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetContentModerationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetContentModerationRequest
 @see AWSRekognitionGetContentModerationResponse
 */
- (AWSTask<AWSRekognitionGetContentModerationResponse *> *)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request;

/**
 <p>Gets the unsafe content analysis results for a Amazon Rekognition Video analysis started by <a>StartContentModeration</a>.</p><p>Unsafe content analysis of a video is an asynchronous operation. You start analysis by calling <a>StartContentModeration</a> which returns a job identifier (<code>JobId</code>). When analysis finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the unsafe content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetContentModeration</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p><p>For more information, see Working with Stored Videos in the Amazon Rekognition Devlopers Guide.</p><p><code>GetContentModeration</code> returns detected unsafe content labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of <a>ContentModerationDetection</a> objects. </p><p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p><p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p><p>For more information, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the GetContentModeration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetContentModerationRequest
 @see AWSRekognitionGetContentModerationResponse
 */
- (void)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetContentModerationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets face detection results for a Amazon Rekognition Video analysis started by <a>StartFaceDetection</a>.</p><p>Face detection with Amazon Rekognition Video is an asynchronous operation. You start face detection by calling <a>StartFaceDetection</a> which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p><code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetFaceDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceDetectionRequest
 @see AWSRekognitionGetFaceDetectionResponse
 */
- (AWSTask<AWSRekognitionGetFaceDetectionResponse *> *)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request;

/**
 <p>Gets face detection results for a Amazon Rekognition Video analysis started by <a>StartFaceDetection</a>.</p><p>Face detection with Amazon Rekognition Video is an asynchronous operation. You start face detection by calling <a>StartFaceDetection</a> which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p><code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceDetectionRequest
 @see AWSRekognitionGetFaceDetectionResponse
 */
- (void)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetFaceDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the face search results for Amazon Rekognition Video face search started by <a>StartFaceSearch</a>. The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p><p>Face search in a video is an asynchronous operation. You start face search by calling to <a>StartFaceSearch</a> which returns a job identifier (<code>JobId</code>). When the search operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>.</p><p>For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer Guide.</p><p>The search results are retured in an array, <code>Persons</code>, of <a>PersonMatch</a> objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information (facial attributes, bounding boxes, and person identifer) for the matched person, and the time the person was matched in the video.</p><note><p><code>GetFaceSearch</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p></note><p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceSearch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetFaceSearchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceSearchRequest
 @see AWSRekognitionGetFaceSearchResponse
 */
- (AWSTask<AWSRekognitionGetFaceSearchResponse *> *)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request;

/**
 <p>Gets the face search results for Amazon Rekognition Video face search started by <a>StartFaceSearch</a>. The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p><p>Face search in a video is an asynchronous operation. You start face search by calling to <a>StartFaceSearch</a> which returns a job identifier (<code>JobId</code>). When the search operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>.</p><p>For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer Guide.</p><p>The search results are retured in an array, <code>Persons</code>, of <a>PersonMatch</a> objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information (facial attributes, bounding boxes, and person identifer) for the matched person, and the time the person was matched in the video.</p><note><p><code>GetFaceSearch</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p></note><p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>
 
 @param request A container for the necessary parameters to execute the GetFaceSearch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetFaceSearchRequest
 @see AWSRekognitionGetFaceSearchResponse
 */
- (void)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetFaceSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the label detection results of a Amazon Rekognition Video analysis started by <a>StartLabelDetection</a>. </p><p>The label detection operation is started by a call to <a>StartLabelDetection</a> which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p><code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p><p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p><p>The returned labels also include bounding box information for common objects, a hierarchical taxonomy of detected labels, and the version of the label model used for detection.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLabelDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetLabelDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetLabelDetectionRequest
 @see AWSRekognitionGetLabelDetectionResponse
 */
- (AWSTask<AWSRekognitionGetLabelDetectionResponse *> *)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request;

/**
 <p>Gets the label detection results of a Amazon Rekognition Video analysis started by <a>StartLabelDetection</a>. </p><p>The label detection operation is started by a call to <a>StartLabelDetection</a> which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p><code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p><p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p><p>The returned labels also include bounding box information for common objects, a hierarchical taxonomy of detected labels, and the version of the label model used for detection.</p><p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetLabelDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetLabelDetectionRequest
 @see AWSRekognitionGetLabelDetectionResponse
 */
- (void)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetLabelDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the path tracking results of a Amazon Rekognition Video analysis started by <a>StartPersonTracking</a>.</p><p>The person path tracking operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p><p>To get the results of the person path tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p><p><code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) their paths were tracked in the video. </p><note><p><code>GetPersonTracking</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. </p><p>For more information, see FaceDetail in the Amazon Rekognition Developer Guide.</p></note><p>By default, the array is sorted by the time(s) a person's path is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p><p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetPersonTracking service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetPersonTrackingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetPersonTrackingRequest
 @see AWSRekognitionGetPersonTrackingResponse
 */
- (AWSTask<AWSRekognitionGetPersonTrackingResponse *> *)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request;

/**
 <p>Gets the path tracking results of a Amazon Rekognition Video analysis started by <a>StartPersonTracking</a>.</p><p>The person path tracking operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p><p>To get the results of the person path tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p><p><code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) their paths were tracked in the video. </p><note><p><code>GetPersonTracking</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. </p><p>For more information, see FaceDetail in the Amazon Rekognition Developer Guide.</p></note><p>By default, the array is sorted by the time(s) a person's path is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p><p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetPersonTracking service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetPersonTrackingRequest
 @see AWSRekognitionGetPersonTrackingResponse
 */
- (void)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetPersonTrackingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the text detection results of a Amazon Rekognition Video analysis started by <a>StartTextDetection</a>.</p><p>Text detection with Amazon Rekognition Video is an asynchronous operation. You start text detection by calling <a>StartTextDetection</a> which returns a job identifier (<code>JobId</code>) When the text detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartTextDetection</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <code>GetTextDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call of <code>StartLabelDetection</code>.</p><p><code>GetTextDetection</code> returns an array of detected text (<code>TextDetections</code>) sorted by the time the text was detected, up to 50 words per frame of video.</p><p>Each element of the array includes the detected text, the precentage confidence in the acuracy of the detected text, the time the text was detected, bounding box information for where the text was located, and unique identifiers for words and their lines.</p><p>Use MaxResults parameter to limit the number of text detections returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetTextDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetTextDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTextDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionGetTextDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetTextDetectionRequest
 @see AWSRekognitionGetTextDetectionResponse
 */
- (AWSTask<AWSRekognitionGetTextDetectionResponse *> *)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request;

/**
 <p>Gets the text detection results of a Amazon Rekognition Video analysis started by <a>StartTextDetection</a>.</p><p>Text detection with Amazon Rekognition Video is an asynchronous operation. You start text detection by calling <a>StartTextDetection</a> which returns a job identifier (<code>JobId</code>) When the text detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartTextDetection</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <code>GetTextDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call of <code>StartLabelDetection</code>.</p><p><code>GetTextDetection</code> returns an array of detected text (<code>TextDetections</code>) sorted by the time the text was detected, up to 50 words per frame of video.</p><p>Each element of the array includes the detected text, the precentage confidence in the acuracy of the detected text, the time the text was detected, bounding box information for where the text was located, and unique identifiers for words and their lines.</p><p>Use MaxResults parameter to limit the number of text detections returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetTextDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetTextDetection</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetTextDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionGetTextDetectionRequest
 @see AWSRekognitionGetTextDetectionResponse
 */
- (void)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionGetTextDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p>Amazon Rekognition doesn't save the actual faces that are detected. Instead, the underlying detection algorithm first detects the faces in the input image. For each face, the algorithm extracts facial features into a feature vector, and stores it in the backend database. Amazon Rekognition uses feature vectors when it performs face match and search operations using the <a>SearchFaces</a> and <a>SearchFacesByImage</a> operations.</p><p>For more information, see Adding Faces to a Collection in the Amazon Rekognition Developer Guide.</p><p>To get the number of faces in a collection, call <a>DescribeCollection</a>. </p><p>If you're using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. </p><p>If you're using version 4 or later of the face model, image orientation information is not returned in the <code>OrientationCorrection</code> field. </p><p>To determine which version of the model you're using, call <a>DescribeCollection</a> and supply the collection ID. You can also get the model version from the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code></p><p>For more information, see Model Versioning in the Amazon Rekognition Developer Guide.</p><p>If you provide the optional <code>ExternalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the <a>ListFaces</a> operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image.</p><p>You can specify the maximum number of faces to index with the <code>MaxFaces</code> input parameter. This is useful when you want to index the largest faces in an image and don't want to index smaller faces, such as those belonging to people standing in the background.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. By default, <code>IndexFaces</code> chooses the quality bar that's used to filter faces. You can also explicitly choose the quality bar. Use <code>QualityFilter</code>, to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. </p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>Information about faces detected in an image, but not indexed, is returned in an array of <a>UnindexedFace</a> objects, <code>UnindexedFaces</code>. Faces aren't indexed for reasons such as:</p><ul><li><p>The number of faces detected exceeds the value of the <code>MaxFaces</code> request parameter.</p></li><li><p>The face is too small compared to the image dimensions.</p></li><li><p>The face is too blurry.</p></li><li><p>The image is too dark.</p></li><li><p>The face has an extreme pose.</p></li><li><p>The face doesn’t have enough detail to be suitable for face search.</p></li></ul><p>In response, the <code>IndexFaces</code> operation returns an array of metadata for all detected faces, <code>FaceRecords</code>. This includes: </p><ul><li><p>The bounding box, <code>BoundingBox</code>, of the detected face. </p></li><li><p>A confidence value, <code>Confidence</code>, which indicates the confidence that the bounding box contains a face.</p></li><li><p>A face ID, <code>FaceId</code>, assigned by the service for each face that's detected and stored.</p></li><li><p>An image ID, <code>ImageId</code>, assigned by the service for the input image.</p></li></ul><p>If you request all facial attributes (by using the <code>detectionAttributes</code> parameter), Amazon Rekognition returns detailed facial attributes, such as facial landmarks (for example, location of eye and mouth) and other facial attributes. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata.</p><p/><p>The input image is passed either as base64-encoded image bytes, or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionIndexFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (AWSTask<AWSRekognitionIndexFacesResponse *> *)indexFaces:(AWSRekognitionIndexFacesRequest *)request;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p>Amazon Rekognition doesn't save the actual faces that are detected. Instead, the underlying detection algorithm first detects the faces in the input image. For each face, the algorithm extracts facial features into a feature vector, and stores it in the backend database. Amazon Rekognition uses feature vectors when it performs face match and search operations using the <a>SearchFaces</a> and <a>SearchFacesByImage</a> operations.</p><p>For more information, see Adding Faces to a Collection in the Amazon Rekognition Developer Guide.</p><p>To get the number of faces in a collection, call <a>DescribeCollection</a>. </p><p>If you're using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. </p><p>If you're using version 4 or later of the face model, image orientation information is not returned in the <code>OrientationCorrection</code> field. </p><p>To determine which version of the model you're using, call <a>DescribeCollection</a> and supply the collection ID. You can also get the model version from the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code></p><p>For more information, see Model Versioning in the Amazon Rekognition Developer Guide.</p><p>If you provide the optional <code>ExternalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the <a>ListFaces</a> operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image.</p><p>You can specify the maximum number of faces to index with the <code>MaxFaces</code> input parameter. This is useful when you want to index the largest faces in an image and don't want to index smaller faces, such as those belonging to people standing in the background.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. By default, <code>IndexFaces</code> chooses the quality bar that's used to filter faces. You can also explicitly choose the quality bar. Use <code>QualityFilter</code>, to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. </p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>Information about faces detected in an image, but not indexed, is returned in an array of <a>UnindexedFace</a> objects, <code>UnindexedFaces</code>. Faces aren't indexed for reasons such as:</p><ul><li><p>The number of faces detected exceeds the value of the <code>MaxFaces</code> request parameter.</p></li><li><p>The face is too small compared to the image dimensions.</p></li><li><p>The face is too blurry.</p></li><li><p>The image is too dark.</p></li><li><p>The face has an extreme pose.</p></li><li><p>The face doesn’t have enough detail to be suitable for face search.</p></li></ul><p>In response, the <code>IndexFaces</code> operation returns an array of metadata for all detected faces, <code>FaceRecords</code>. This includes: </p><ul><li><p>The bounding box, <code>BoundingBox</code>, of the detected face. </p></li><li><p>A confidence value, <code>Confidence</code>, which indicates the confidence that the bounding box contains a face.</p></li><li><p>A face ID, <code>FaceId</code>, assigned by the service for each face that's detected and stored.</p></li><li><p>An image ID, <code>ImageId</code>, assigned by the service for the input image.</p></li></ul><p>If you request all facial attributes (by using the <code>detectionAttributes</code> parameter), Amazon Rekognition returns detailed facial attributes, such as facial landmarks (for example, location of eye and mouth) and other facial attributes. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata.</p><p/><p>The input image is passed either as base64-encoded image bytes, or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (void)indexFaces:(AWSRekognitionIndexFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionIndexFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see Listing Collections in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListCollectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (AWSTask<AWSRekognitionListCollectionsResponse *> *)listCollections:(AWSRekognitionListCollectionsRequest *)request;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see Listing Collections in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (void)listCollections:(AWSRekognitionListCollectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListCollectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see Listing Faces in a Collection in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (AWSTask<AWSRekognitionListFacesResponse *> *)listFaces:(AWSRekognitionListFacesRequest *)request;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see Listing Faces in a Collection in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (void)listFaces:(AWSRekognitionListFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of stream processors that you have created with <a>CreateStreamProcessor</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListStreamProcessors service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListStreamProcessorsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionListStreamProcessorsRequest
 @see AWSRekognitionListStreamProcessorsResponse
 */
- (AWSTask<AWSRekognitionListStreamProcessorsResponse *> *)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request;

/**
 <p>Gets a list of stream processors that you have created with <a>CreateStreamProcessor</a>. </p>
 
 @param request A container for the necessary parameters to execute the ListStreamProcessors service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionListStreamProcessorsRequest
 @see AWSRekognitionListStreamProcessorsResponse
 */
- (void)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListStreamProcessorsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of celebrities recognized in the input image. For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide. </p><p><code>RecognizeCelebrities</code> returns the 100 largest faces in the image. It lists recognized celebrities in the <code>CelebrityFaces</code> array and unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces aren't among the largest 100 faces in the image.</p><p>For each celebrity recognized, <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p><p>Amazon Rekognition doesn't retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the <a>GetCelebrityInfo</a> operation.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>For an example, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the RecognizeCelebrities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionRecognizeCelebritiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionRecognizeCelebritiesRequest
 @see AWSRekognitionRecognizeCelebritiesResponse
 */
- (AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> *)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request;

/**
 <p>Returns an array of celebrities recognized in the input image. For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide. </p><p><code>RecognizeCelebrities</code> returns the 100 largest faces in the image. It lists recognized celebrities in the <code>CelebrityFaces</code> array and unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces aren't among the largest 100 faces in the image.</p><p>For each celebrity recognized, <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p><p>Amazon Rekognition doesn't retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the <a>GetCelebrityInfo</a> operation.</p><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p>For an example, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>
 
 @param request A container for the necessary parameters to execute the RecognizeCelebrities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidImageFormat`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionRecognizeCelebritiesRequest
 @see AWSRekognitionRecognizeCelebritiesResponse
 */
- (void)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionRecognizeCelebritiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see Searching for a Face Using Its Face ID in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (AWSTask<AWSRekognitionSearchFacesResponse *> *)searchFaces:(AWSRekognitionSearchFacesRequest *)request;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see Searching for a Face Using Its Face ID in the Amazon Rekognition Developer Guide.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (void)searchFaces:(AWSRekognitionSearchFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p>To search for all faces in an input image, you might first call the <a>IndexFaces</a> operation, and then use the face IDs returned in subsequent calls to the <a>SearchFaces</a> operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, Searching for a Face Using an Image in the Amazon Rekognition Developer Guide.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar for filtering by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>.</p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesByImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (AWSTask<AWSRekognitionSearchFacesByImageResponse *> *)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p>To search for all faces in an input image, you might first call the <a>IndexFaces</a> operation, and then use the face IDs returned in subsequent calls to the <a>SearchFaces</a> operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, Searching for a Face Using an Image in the Amazon Rekognition Developer Guide.</p><p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar for filtering by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>.</p><note><p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p></note><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (void)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesByImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous recognition of celebrities in a stored video.</p><p>Amazon Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetCelebrityRecognition</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. </p><p>For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartCelebrityRecognition service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartCelebrityRecognitionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartCelebrityRecognitionRequest
 @see AWSRekognitionStartCelebrityRecognitionResponse
 */
- (AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> *)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request;

/**
 <p>Starts asynchronous recognition of celebrities in a stored video.</p><p>Amazon Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetCelebrityRecognition</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. </p><p>For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartCelebrityRecognition service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartCelebrityRecognitionRequest
 @see AWSRekognitionStartCelebrityRecognitionResponse
 */
- (void)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartCelebrityRecognitionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Starts asynchronous detection of unsafe content in a stored video.</p><p>Amazon Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When unsafe content analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the unsafe content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetContentModeration</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p><p>For more information, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartContentModeration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartContentModerationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartContentModerationRequest
 @see AWSRekognitionStartContentModerationResponse
 */
- (AWSTask<AWSRekognitionStartContentModerationResponse *> *)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request;

/**
 <p> Starts asynchronous detection of unsafe content in a stored video.</p><p>Amazon Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When unsafe content analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the unsafe content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetContentModeration</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p><p>For more information, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartContentModeration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartContentModerationRequest
 @see AWSRekognitionStartContentModerationResponse
 */
- (void)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartContentModerationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous detection of faces in a stored video.</p><p>Amazon Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p>For more information, see Detecting Faces in a Stored Video in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartFaceDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceDetectionRequest
 @see AWSRekognitionStartFaceDetectionResponse
 */
- (AWSTask<AWSRekognitionStartFaceDetectionResponse *> *)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request;

/**
 <p>Starts asynchronous detection of faces in a stored video.</p><p>Amazon Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p><p>For more information, see Detecting Faces in a Stored Video in the Amazon Rekognition Developer Guide.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceDetectionRequest
 @see AWSRekognitionStartFaceDetectionResponse
 */
- (void)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartFaceDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceSearch</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>procedure-person-search-videos</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceSearch service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartFaceSearchResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceSearchRequest
 @see AWSRekognitionStartFaceSearchResponse
 */
- (AWSTask<AWSRekognitionStartFaceSearchResponse *> *)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request;

/**
 <p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceSearch</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>procedure-person-search-videos</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartFaceSearch service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartFaceSearchRequest
 @see AWSRekognitionStartFaceSearchResponse
 */
- (void)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartFaceSearchResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous detection of labels in a stored video.</p><p>Amazon Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p/>
 
 @param request A container for the necessary parameters to execute the StartLabelDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartLabelDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartLabelDetectionRequest
 @see AWSRekognitionStartLabelDetectionResponse
 */
- (AWSTask<AWSRekognitionStartLabelDetectionResponse *> *)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request;

/**
 <p>Starts asynchronous detection of labels in a stored video.</p><p>Amazon Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p><p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p><p/>
 
 @param request A container for the necessary parameters to execute the StartLabelDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartLabelDetectionRequest
 @see AWSRekognitionStartLabelDetectionResponse
 */
- (void)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartLabelDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the asynchronous tracking of a person's path in a stored video.</p><p>Amazon Rekognition Video can track the path of people in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p><p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartPersonTracking service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartPersonTrackingResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartPersonTrackingRequest
 @see AWSRekognitionStartPersonTrackingResponse
 */
- (AWSTask<AWSRekognitionStartPersonTrackingResponse *> *)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request;

/**
 <p>Starts the asynchronous tracking of a person's path in a stored video.</p><p>Amazon Rekognition Video can track the path of people in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p><p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartPersonTracking service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartPersonTrackingRequest
 @see AWSRekognitionStartPersonTrackingResponse
 */
- (void)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartPersonTrackingResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts the running of the version of a model. Starting a model takes a while to complete. To check the current state of the model, use <a>DescribeProjectVersions</a>.</p><p>Once the model is running, you can detect custom labels in new images by calling <a>DetectCustomLabels</a>.</p><note><p>You are charged for the amount of time that the model is running. To stop a running model, call <a>StopProjectVersion</a>.</p></note><p>This operation requires permissions to perform the <code>rekognition:StartProjectVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the StartProjectVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartProjectVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartProjectVersionRequest
 @see AWSRekognitionStartProjectVersionResponse
 */
- (AWSTask<AWSRekognitionStartProjectVersionResponse *> *)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request;

/**
 <p>Starts the running of the version of a model. Starting a model takes a while to complete. To check the current state of the model, use <a>DescribeProjectVersions</a>.</p><p>Once the model is running, you can detect custom labels in new images by calling <a>DetectCustomLabels</a>.</p><note><p>You are charged for the amount of time that the model is running. To stop a running model, call <a>StopProjectVersion</a>.</p></note><p>This operation requires permissions to perform the <code>rekognition:StartProjectVersion</code> action.</p>
 
 @param request A container for the necessary parameters to execute the StartProjectVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartProjectVersionRequest
 @see AWSRekognitionStartProjectVersionResponse
 */
- (void)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartProjectVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts processing a stream processor. You create a stream processor by calling <a>CreateStreamProcessor</a>. To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartStreamProcessorRequest
 @see AWSRekognitionStartStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionStartStreamProcessorResponse *> *)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request;

/**
 <p>Starts processing a stream processor. You create a stream processor by calling <a>CreateStreamProcessor</a>. To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>
 
 @param request A container for the necessary parameters to execute the StartStreamProcessor service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStartStreamProcessorRequest
 @see AWSRekognitionStartStreamProcessorResponse
 */
- (void)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartStreamProcessorResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts asynchronous detection of text in a stored video.</p><p>Amazon Rekognition Video can detect text in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When text detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <a>GetTextDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartTextDetection</code>. </p>
 
 @param request A container for the necessary parameters to execute the StartTextDetection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStartTextDetectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartTextDetectionRequest
 @see AWSRekognitionStartTextDetectionResponse
 */
- (AWSTask<AWSRekognitionStartTextDetectionResponse *> *)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request;

/**
 <p>Starts asynchronous detection of text in a stored video.</p><p>Amazon Rekognition Video can detect text in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When text detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p><p>To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <a>GetTextDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartTextDetection</code>. </p>
 
 @param request A container for the necessary parameters to execute the StartTextDetection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorIdempotentParameterMismatch`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorVideoTooLarge`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorLimitExceeded`, `AWSRekognitionErrorThrottling`.
 
 @see AWSRekognitionStartTextDetectionRequest
 @see AWSRekognitionStartTextDetectionResponse
 */
- (void)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStartTextDetectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running model. The operation might take a while to complete. To check the current status, call <a>DescribeProjectVersions</a>. </p>
 
 @param request A container for the necessary parameters to execute the StopProjectVersion service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStopProjectVersionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStopProjectVersionRequest
 @see AWSRekognitionStopProjectVersionResponse
 */
- (AWSTask<AWSRekognitionStopProjectVersionResponse *> *)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request;

/**
 <p>Stops a running model. The operation might take a while to complete. To check the current status, call <a>DescribeProjectVersions</a>. </p>
 
 @param request A container for the necessary parameters to execute the StopProjectVersion service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStopProjectVersionRequest
 @see AWSRekognitionStopProjectVersionResponse
 */
- (void)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionStopProjectVersionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a running stream processor that was created by <a>CreateStreamProcessor</a>.</p>
 
 @param request A container for the necessary parameters to execute the StopStreamProcessor service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionStopStreamProcessorResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorResourceInUse`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionStopStreamProcessorRequest
 @see AWSRekognitionStopStreamProcessorResponse
 */
- (AWSTask<AWSRekognitionStopStreamProcessorResponse *> *)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request;

/**
 <p>Stops a running stream processor that was created by <a>CreateStreamProcessor</a>.</p>
 
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
