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
 <p>Compares a face in the <i>source</i> input image with each face detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and uses it to compare with each face detected in the target image. </p></note><p>In response, the operation returns an array of face matches ordered by similarity score with the highest similarity scores first. For each face match, the response provides a bounding box of the face and <code>confidence</code> value (indicating the level of confidence that the bounding box contains a face). The response also provides a <code>similarity</code> score, which indicates how closely the faces match. </p><note><p>By default, only faces with the similarity score of greater than or equal to 80% are returned in the response. You can change this value.</p></note><p>In addition to the face matches, the response returns information about the face in the source image, including the bounding box of the face and confidence value.</p><note><p> This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>get-started-exercise-compare-faces</a></p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCompareFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (AWSTask<AWSRekognitionCompareFacesResponse *> *)compareFaces:(AWSRekognitionCompareFacesRequest *)request;

/**
 <p>Compares a face in the <i>source</i> input image with each face detected in the <i>target</i> input image. </p><note><p> If the source image contains multiple faces, the service detects the largest face and uses it to compare with each face detected in the target image. </p></note><p>In response, the operation returns an array of face matches ordered by similarity score with the highest similarity scores first. For each face match, the response provides a bounding box of the face and <code>confidence</code> value (indicating the level of confidence that the bounding box contains a face). The response also provides a <code>similarity</code> score, which indicates how closely the faces match. </p><note><p>By default, only faces with the similarity score of greater than or equal to 80% are returned in the response. You can change this value.</p></note><p>In addition to the face matches, the response returns information about the face in the source image, including the bounding box of the face and confidence value.</p><note><p> This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>get-started-exercise-compare-faces</a></p><p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CompareFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionCompareFacesRequest
 @see AWSRekognitionCompareFacesResponse
 */
- (void)compareFaces:(AWSRekognitionCompareFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCompareFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><p>For an example, see <a>example1</a>. </p><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionCreateCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (AWSTask<AWSRekognitionCreateCollectionResponse *> *)createCollection:(AWSRekognitionCreateCollectionRequest *)request;

/**
 <p>Creates a collection in an AWS Region. You can add faces to the collection using the operation. </p><p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p><p>For an example, see <a>example1</a>. </p><p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the CreateCollection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceAlreadyExists`.
 
 @see AWSRekognitionCreateCollectionRequest
 @see AWSRekognitionCreateCollectionResponse
 */
- (void)createCollection:(AWSRekognitionCreateCollectionRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionCreateCollectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>example1</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>
 
 @param request A container for the necessary parameters to execute the DeleteCollection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDeleteCollectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionDeleteCollectionRequest
 @see AWSRekognitionDeleteCollectionResponse
 */
- (AWSTask<AWSRekognitionDeleteCollectionResponse *> *)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request;

/**
 <p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>example1</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>
 
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
 <p>Detects faces within an image (JPEG or PNG) that is provided as input.</p><p> For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>get-started-exercise-detect-faces</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (AWSTask<AWSRekognitionDetectFacesResponse *> *)detectFaces:(AWSRekognitionDetectFacesRequest *)request;

/**
 <p>Detects faces within an image (JPEG or PNG) that is provided as input.</p><p> For each face detected, the operation returns face details including a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), gender, presence of beard, sunglasses, etc. </p><p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm may not detect the faces or might detect faces with lower confidence. </p><note><p>This is a stateless API operation. That is, the operation does not persist any data.</p></note><p>For an example, see <a>get-started-exercise-detect-faces</a>.</p><p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectFacesRequest
 @see AWSRekognitionDetectFacesResponse
 */
- (void)detectFaces:(AWSRekognitionDetectFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects instances of real-world labels within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>get-started-exercise-detect-labels</a>.</p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>You can provide the input image as an S3 object or as base64-encoded bytes. In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectLabelsResponse *> *)detectLabels:(AWSRekognitionDetectLabelsRequest *)request;

/**
 <p>Detects instances of real-world labels within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. For an example, see <a>get-started-exercise-detect-labels</a>.</p><p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response will include all three labels, one for each object. </p><p><code>{Name: lighthouse, Confidence: 98.4629}</code></p><p><code>{Name: rock,Confidence: 79.2097}</code></p><p><code> {Name: sea,Confidence: 75.061}</code></p><p> In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p><p><code>{Name: flower,Confidence: 99.0562}</code></p><p><code>{Name: plant,Confidence: 99.0562}</code></p><p><code>{Name: tulip,Confidence: 99.0562}</code></p><p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p><p>You can provide the input image as an S3 object or as base64-encoded bytes. In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 50%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p><note><p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p></note><p>This is a stateless API operation. That is, the operation does not persist any data.</p><p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>
 
 @param request A container for the necessary parameters to execute the DetectLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionDetectLabelsRequest
 @see AWSRekognitionDetectLabelsResponse
 */
- (void)detectLabels:(AWSRekognitionDetectLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects explicit or suggestive adult content in a specified .jpeg or .png image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate. For information about moderation labels, see <a>howitworks-moderateimage</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionDetectModerationLabelsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (AWSTask<AWSRekognitionDetectModerationLabelsResponse *> *)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request;

/**
 <p>Detects explicit or suggestive adult content in a specified .jpeg or .png image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p><p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate. For information about moderation labels, see <a>howitworks-moderateimage</a>.</p>
 
 @param request A container for the necessary parameters to execute the DetectModerationLabels service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`.
 
 @see AWSRekognitionDetectModerationLabelsRequest
 @see AWSRekognitionDetectModerationLabelsResponse
 */
- (void)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionDetectModerationLabelsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p> Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations. </p><p>If you provide the optional <code>externalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p><p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Amazon Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata. </p><p>For an example, see <a>example2</a>.</p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionIndexFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (AWSTask<AWSRekognitionIndexFacesResponse *> *)indexFaces:(AWSRekognitionIndexFacesRequest *)request;

/**
 <p>Detects faces in the input image and adds them to the specified collection. </p><p> Amazon Rekognition does not save the actual faces detected. Instead, the underlying detection algorithm first detects the faces in the input image, and for each face extracts facial features into a feature vector, and stores it in the back-end database. Amazon Rekognition uses feature vectors when performing face match and search operations using the and operations. </p><p>If you provide the optional <code>externalImageID</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image. </p><p>In response, the operation returns an array of metadata for all detected faces. This includes, the bounding box of the detected face, confidence value (indicating the bounding box contains a face), a face ID assigned by the service for each face that is detected and stored, and an image ID assigned by the service for the input image If you request all facial attributes (using the <code>detectionAttributes</code> parameter, Amazon Rekognition returns detailed facial attributes such as facial landmarks (for example, location of eye and mount) and other facial attributes such gender. If you provide the same image, specify the same collection, and use the same external ID in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata. </p><p>For an example, see <a>example2</a>.</p><p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the IndexFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionIndexFacesRequest
 @see AWSRekognitionIndexFacesResponse
 */
- (void)indexFaces:(AWSRekognitionIndexFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionIndexFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see <a>example1</a>.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListCollectionsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (AWSTask<AWSRekognitionListCollectionsResponse *> *)listCollections:(AWSRekognitionListCollectionsRequest *)request;

/**
 <p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p><p>For an example, see <a>example1</a>.</p><p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListCollections service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListCollectionsRequest
 @see AWSRekognitionListCollectionsResponse
 */
- (void)listCollections:(AWSRekognitionListCollectionsRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListCollectionsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>example3</a>. </p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionListFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (AWSTask<AWSRekognitionListFacesResponse *> *)listFaces:(AWSRekognitionListFacesRequest *)request;

/**
 <p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see <a>example3</a>. </p><p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the ListFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorInvalidPaginationToken`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionListFacesRequest
 @see AWSRekognitionListFacesResponse
 */
- (void)listFaces:(AWSRekognitionListFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionListFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see <a>example3</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (AWSTask<AWSRekognitionSearchFacesResponse *> *)searchFaces:(AWSRekognitionSearchFacesRequest *)request;

/**
 <p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p><note><p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p></note><p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p><p>For an example, see <a>example3</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFaces service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`.
 
 @see AWSRekognitionSearchFacesRequest
 @see AWSRekognitionSearchFacesResponse
 */
- (void)searchFaces:(AWSRekognitionSearchFacesRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p> To search for all faces in an input image, you might first call the operation, and then use the face IDs returned in subsequent calls to the operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, see <a>example3</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSRekognitionSearchFacesByImageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (AWSTask<AWSRekognitionSearchFacesByImageResponse *> *)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request;

/**
 <p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p><note><p> To search for all faces in an input image, you might first call the operation, and then use the face IDs returned in subsequent calls to the operation. </p><p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p></note><p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p><p>For an example, see <a>example3</a>.</p><p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>
 
 @param request A container for the necessary parameters to execute the SearchFacesByImage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSRekognitionErrorDomain` domain and the following error code: `AWSRekognitionErrorInvalidS3Object`, `AWSRekognitionErrorInvalidParameter`, `AWSRekognitionErrorImageTooLarge`, `AWSRekognitionErrorAccessDenied`, `AWSRekognitionErrorInternalServer`, `AWSRekognitionErrorThrottling`, `AWSRekognitionErrorProvisionedThroughputExceeded`, `AWSRekognitionErrorResourceNotFound`, `AWSRekognitionErrorInvalidImageFormat`.
 
 @see AWSRekognitionSearchFacesByImageRequest
 @see AWSRekognitionSearchFacesByImageResponse
 */
- (void)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request completionHandler:(void (^ _Nullable)(AWSRekognitionSearchFacesByImageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
