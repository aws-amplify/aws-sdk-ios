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
#import "AWSAWSComprehendMedicalModel.h"
#import "AWSAWSComprehendMedicalResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSAWSComprehendMedical
FOUNDATION_EXPORT NSString *const AWSAWSComprehendMedicalSDKVersion;

/**
 <p> Amazon Comprehend Medical extracts structured information from unstructured clinical text. Use these actions to gain insight in your documents. </p>
 */
@interface AWSAWSComprehendMedical : AWSService

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

     let AWSComprehendMedical = AWSAWSComprehendMedical.default()

 *Objective-C*

     AWSAWSComprehendMedical *AWSComprehendMedical = [AWSAWSComprehendMedical defaultAWSComprehendMedical];

 @return The default service client.
 */
+ (instancetype)defaultAWSComprehendMedical;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSComprehendMedical.register(with: configuration!, forKey: "USWest2AWSComprehendMedical")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:@"USWest2AWSComprehendMedical"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSComprehendMedical = AWSAWSComprehendMedical(forKey: "USWest2AWSComprehendMedical")

 *Objective-C*

     AWSAWSComprehendMedical *AWSComprehendMedical = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:@"USWest2AWSComprehendMedical"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerAWSComprehendMedicalWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerAWSComprehendMedicalWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSAWSComprehendMedical.register(with: configuration!, forKey: "USWest2AWSComprehendMedical")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:@"USWest2AWSComprehendMedical"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let AWSComprehendMedical = AWSAWSComprehendMedical(forKey: "USWest2AWSComprehendMedical")

 *Objective-C*

     AWSAWSComprehendMedical *AWSComprehendMedical = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:@"USWest2AWSComprehendMedical"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)AWSComprehendMedicalForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeAWSComprehendMedicalForKey:(NSString *)key;

/**
 <p>Gets the properties associated with a medical entities detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntitiesDetectionV2Job service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse *> *)describeEntitiesDetectionV2Job:(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest *)request;

/**
 <p>Gets the properties associated with a medical entities detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeEntitiesDetectionV2Job service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse
 */
- (void)describeEntitiesDetectionV2Job:(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with an InferICD10CM job. Use this operation to get the status of an inference job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeICD10CMInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse *> *)describeICD10CMInferenceJob:(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest *)request;

/**
 <p>Gets the properties associated with an InferICD10CM job. Use this operation to get the status of an inference job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeICD10CMInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse
 */
- (void)describeICD10CMInferenceJob:(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with a protected health information (PHI) detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribePHIDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDescribePHIDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribePHIDetectionJobRequest
 @see AWSAWSComprehendMedicalDescribePHIDetectionJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDescribePHIDetectionJobResponse *> *)describePHIDetectionJob:(AWSAWSComprehendMedicalDescribePHIDetectionJobRequest *)request;

/**
 <p>Gets the properties associated with a protected health information (PHI) detection job. Use this operation to get the status of a detection job.</p>
 
 @param request A container for the necessary parameters to execute the DescribePHIDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribePHIDetectionJobRequest
 @see AWSAWSComprehendMedicalDescribePHIDetectionJobResponse
 */
- (void)describePHIDetectionJob:(AWSAWSComprehendMedicalDescribePHIDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDescribePHIDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets the properties associated with an InferRxNorm job. Use this operation to get the status of an inference job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRxNormInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse *> *)describeRxNormInferenceJob:(AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest *)request;

/**
 <p>Gets the properties associated with an InferRxNorm job. Use this operation to get the status of an inference job.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRxNormInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse
 */
- (void)describeRxNormInferenceJob:(AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>The <code>DetectEntities</code> operation is deprecated. You should use the <a>DetectEntitiesV2</a> operation instead.</p><p> Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information .</p>
 
 @param request A container for the necessary parameters to execute the DetectEntities service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDetectEntitiesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectEntitiesRequest
 @see AWSAWSComprehendMedicalDetectEntitiesResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDetectEntitiesResponse *> *)detectEntities:(AWSAWSComprehendMedicalDetectEntitiesRequest *)request;

/**
 <p>The <code>DetectEntities</code> operation is deprecated. You should use the <a>DetectEntitiesV2</a> operation instead.</p><p> Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information .</p>
 
 @param request A container for the necessary parameters to execute the DetectEntities service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectEntitiesRequest
 @see AWSAWSComprehendMedicalDetectEntitiesResponse
 */
- (void)detectEntities:(AWSAWSComprehendMedicalDetectEntitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDetectEntitiesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information. Amazon Comprehend Medical only detects medical entities in English language texts.</p><p>The <code>DetectEntitiesV2</code> operation replaces the <a>DetectEntities</a> operation. This new action uses a different model for determining the entities in your medical text and changes the way that some entities are returned in the output. You should use the <code>DetectEntitiesV2</code> operation in all new applications.</p><p>The <code>DetectEntitiesV2</code> operation returns the <code>Acuity</code> and <code>Direction</code> entities as attributes instead of types. </p>
 
 @param request A container for the necessary parameters to execute the DetectEntitiesV2 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDetectEntitiesV2Response`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectEntitiesV2Request
 @see AWSAWSComprehendMedicalDetectEntitiesV2Response
 */
- (AWSTask<AWSAWSComprehendMedicalDetectEntitiesV2Response *> *)detectEntitiesV2:(AWSAWSComprehendMedicalDetectEntitiesV2Request *)request;

/**
 <p>Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information. Amazon Comprehend Medical only detects medical entities in English language texts.</p><p>The <code>DetectEntitiesV2</code> operation replaces the <a>DetectEntities</a> operation. This new action uses a different model for determining the entities in your medical text and changes the way that some entities are returned in the output. You should use the <code>DetectEntitiesV2</code> operation in all new applications.</p><p>The <code>DetectEntitiesV2</code> operation returns the <code>Acuity</code> and <code>Direction</code> entities as attributes instead of types. </p>
 
 @param request A container for the necessary parameters to execute the DetectEntitiesV2 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectEntitiesV2Request
 @see AWSAWSComprehendMedicalDetectEntitiesV2Response
 */
- (void)detectEntitiesV2:(AWSAWSComprehendMedicalDetectEntitiesV2Request *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDetectEntitiesV2Response * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Inspects the clinical text for protected health information (PHI) entities and returns the entity category, location, and confidence score for each entity. Amazon Comprehend Medical only detects entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the DetectPHI service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalDetectPHIResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectPHIRequest
 @see AWSAWSComprehendMedicalDetectPHIResponse
 */
- (AWSTask<AWSAWSComprehendMedicalDetectPHIResponse *> *)detectPHI:(AWSAWSComprehendMedicalDetectPHIRequest *)request;

/**
 <p> Inspects the clinical text for protected health information (PHI) entities and returns the entity category, location, and confidence score for each entity. Amazon Comprehend Medical only detects entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the DetectPHI service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalDetectPHIRequest
 @see AWSAWSComprehendMedicalDetectPHIResponse
 */
- (void)detectPHI:(AWSAWSComprehendMedicalDetectPHIRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalDetectPHIResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>InferICD10CM detects medical conditions as entities listed in a patient record and links those entities to normalized concept identifiers in the ICD-10-CM knowledge base from the Centers for Disease Control. Amazon Comprehend Medical only detects medical entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the InferICD10CM service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalInferICD10CMResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalInferICD10CMRequest
 @see AWSAWSComprehendMedicalInferICD10CMResponse
 */
- (AWSTask<AWSAWSComprehendMedicalInferICD10CMResponse *> *)inferICD10CM:(AWSAWSComprehendMedicalInferICD10CMRequest *)request;

/**
 <p>InferICD10CM detects medical conditions as entities listed in a patient record and links those entities to normalized concept identifiers in the ICD-10-CM knowledge base from the Centers for Disease Control. Amazon Comprehend Medical only detects medical entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the InferICD10CM service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalInferICD10CMRequest
 @see AWSAWSComprehendMedicalInferICD10CMResponse
 */
- (void)inferICD10CM:(AWSAWSComprehendMedicalInferICD10CMRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalInferICD10CMResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>InferRxNorm detects medications as entities listed in a patient record and links to the normalized concept identifiers in the RxNorm database from the National Library of Medicine. Amazon Comprehend Medical only detects medical entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the InferRxNorm service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalInferRxNormResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalInferRxNormRequest
 @see AWSAWSComprehendMedicalInferRxNormResponse
 */
- (AWSTask<AWSAWSComprehendMedicalInferRxNormResponse *> *)inferRxNorm:(AWSAWSComprehendMedicalInferRxNormRequest *)request;

/**
 <p>InferRxNorm detects medications as entities listed in a patient record and links to the normalized concept identifiers in the RxNorm database from the National Library of Medicine. Amazon Comprehend Medical only detects medical entities in English language texts.</p>
 
 @param request A container for the necessary parameters to execute the InferRxNorm service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInternalServer`, `AWSAWSComprehendMedicalErrorServiceUnavailable`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorInvalidEncoding`, `AWSAWSComprehendMedicalErrorTextSizeLimitExceeded`.
 
 @see AWSAWSComprehendMedicalInferRxNormRequest
 @see AWSAWSComprehendMedicalInferRxNormResponse
 */
- (void)inferRxNorm:(AWSAWSComprehendMedicalInferRxNormRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalInferRxNormResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of medical entity detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListEntitiesDetectionV2Jobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest
 @see AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse
 */
- (AWSTask<AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse *> *)listEntitiesDetectionV2Jobs:(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest *)request;

/**
 <p>Gets a list of medical entity detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListEntitiesDetectionV2Jobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest
 @see AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse
 */
- (void)listEntitiesDetectionV2Jobs:(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of InferICD10CM jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListICD10CMInferenceJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest
 @see AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse
 */
- (AWSTask<AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse *> *)listICD10CMInferenceJobs:(AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest *)request;

/**
 <p>Gets a list of InferICD10CM jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListICD10CMInferenceJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest
 @see AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse
 */
- (void)listICD10CMInferenceJobs:(AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of protected health information (PHI) detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListPHIDetectionJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalListPHIDetectionJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListPHIDetectionJobsRequest
 @see AWSAWSComprehendMedicalListPHIDetectionJobsResponse
 */
- (AWSTask<AWSAWSComprehendMedicalListPHIDetectionJobsResponse *> *)listPHIDetectionJobs:(AWSAWSComprehendMedicalListPHIDetectionJobsRequest *)request;

/**
 <p>Gets a list of protected health information (PHI) detection jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListPHIDetectionJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListPHIDetectionJobsRequest
 @see AWSAWSComprehendMedicalListPHIDetectionJobsResponse
 */
- (void)listPHIDetectionJobs:(AWSAWSComprehendMedicalListPHIDetectionJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalListPHIDetectionJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of InferRxNorm jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListRxNormInferenceJobs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalListRxNormInferenceJobsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListRxNormInferenceJobsRequest
 @see AWSAWSComprehendMedicalListRxNormInferenceJobsResponse
 */
- (AWSTask<AWSAWSComprehendMedicalListRxNormInferenceJobsResponse *> *)listRxNormInferenceJobs:(AWSAWSComprehendMedicalListRxNormInferenceJobsRequest *)request;

/**
 <p>Gets a list of InferRxNorm jobs that you have submitted.</p>
 
 @param request A container for the necessary parameters to execute the ListRxNormInferenceJobs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorValidation`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalListRxNormInferenceJobsRequest
 @see AWSAWSComprehendMedicalListRxNormInferenceJobsResponse
 */
- (void)listRxNormInferenceJobs:(AWSAWSComprehendMedicalListRxNormInferenceJobsRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalListRxNormInferenceJobsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous medical entity detection job for a collection of documents. Use the <code>DescribeEntitiesDetectionV2Job</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartEntitiesDetectionV2Job service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse *> *)startEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest *)request;

/**
 <p>Starts an asynchronous medical entity detection job for a collection of documents. Use the <code>DescribeEntitiesDetectionV2Job</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartEntitiesDetectionV2Job service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse
 */
- (void)startEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM ontology. Use the <code>DescribeICD10CMInferenceJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartICD10CMInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse *> *)startICD10CMInferenceJob:(AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest *)request;

/**
 <p>Starts an asynchronous job to detect medical conditions and link them to the ICD-10-CM ontology. Use the <code>DescribeICD10CMInferenceJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartICD10CMInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse
 */
- (void)startICD10CMInferenceJob:(AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous job to detect protected health information (PHI). Use the <code>DescribePHIDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartPHIDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStartPHIDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartPHIDetectionJobRequest
 @see AWSAWSComprehendMedicalStartPHIDetectionJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStartPHIDetectionJobResponse *> *)startPHIDetectionJob:(AWSAWSComprehendMedicalStartPHIDetectionJobRequest *)request;

/**
 <p>Starts an asynchronous job to detect protected health information (PHI). Use the <code>DescribePHIDetectionJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartPHIDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartPHIDetectionJobRequest
 @see AWSAWSComprehendMedicalStartPHIDetectionJobResponse
 */
- (void)startPHIDetectionJob:(AWSAWSComprehendMedicalStartPHIDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStartPHIDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts an asynchronous job to detect medication entities and link them to the RxNorm ontology. Use the <code>DescribeRxNormInferenceJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartRxNormInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStartRxNormInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalStartRxNormInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStartRxNormInferenceJobResponse *> *)startRxNormInferenceJob:(AWSAWSComprehendMedicalStartRxNormInferenceJobRequest *)request;

/**
 <p>Starts an asynchronous job to detect medication entities and link them to the RxNorm ontology. Use the <code>DescribeRxNormInferenceJob</code> operation to track the status of a job.</p>
 
 @param request A container for the necessary parameters to execute the StartRxNormInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorTooManyRequests`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStartRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalStartRxNormInferenceJobResponse
 */
- (void)startRxNormInferenceJob:(AWSAWSComprehendMedicalStartRxNormInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStartRxNormInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a medical entities detection job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopEntitiesDetectionV2Job service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse *> *)stopEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest *)request;

/**
 <p>Stops a medical entities detection job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopEntitiesDetectionV2Job service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest
 @see AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse
 */
- (void)stopEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an InferICD10CM inference job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopICD10CMInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse *> *)stopICD10CMInferenceJob:(AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest *)request;

/**
 <p>Stops an InferICD10CM inference job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopICD10CMInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest
 @see AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse
 */
- (void)stopICD10CMInferenceJob:(AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops a protected health information (PHI) detection job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopPHIDetectionJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStopPHIDetectionJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopPHIDetectionJobRequest
 @see AWSAWSComprehendMedicalStopPHIDetectionJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStopPHIDetectionJobResponse *> *)stopPHIDetectionJob:(AWSAWSComprehendMedicalStopPHIDetectionJobRequest *)request;

/**
 <p>Stops a protected health information (PHI) detection job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopPHIDetectionJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopPHIDetectionJobRequest
 @see AWSAWSComprehendMedicalStopPHIDetectionJobResponse
 */
- (void)stopPHIDetectionJob:(AWSAWSComprehendMedicalStopPHIDetectionJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStopPHIDetectionJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Stops an InferRxNorm inference job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopRxNormInferenceJob service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAWSComprehendMedicalStopRxNormInferenceJobResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalStopRxNormInferenceJobResponse
 */
- (AWSTask<AWSAWSComprehendMedicalStopRxNormInferenceJobResponse *> *)stopRxNormInferenceJob:(AWSAWSComprehendMedicalStopRxNormInferenceJobRequest *)request;

/**
 <p>Stops an InferRxNorm inference job in progress.</p>
 
 @param request A container for the necessary parameters to execute the StopRxNormInferenceJob service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSAWSComprehendMedicalErrorDomain` domain and the following error code: `AWSAWSComprehendMedicalErrorInvalidRequest`, `AWSAWSComprehendMedicalErrorResourceNotFound`, `AWSAWSComprehendMedicalErrorInternalServer`.
 
 @see AWSAWSComprehendMedicalStopRxNormInferenceJobRequest
 @see AWSAWSComprehendMedicalStopRxNormInferenceJobResponse
 */
- (void)stopRxNormInferenceJob:(AWSAWSComprehendMedicalStopRxNormInferenceJobRequest *)request completionHandler:(void (^ _Nullable)(AWSAWSComprehendMedicalStopRxNormInferenceJobResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
