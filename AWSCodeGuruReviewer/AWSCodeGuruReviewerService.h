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
#import "AWSCodeGuruReviewerModel.h"
#import "AWSCodeGuruReviewerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCodeGuruReviewer
FOUNDATION_EXPORT NSString *const AWSCodeGuruReviewerSDKVersion;

/**
 <p>This section provides documentation for the Amazon CodeGuru Reviewer API operations. Amazon CodeGuru Reviewer is a service that uses program analysis and machine learning to detect potential defects that are difficult for developers to find and recommends fixes in your Java code.</p><p>By proactively detecting and providing recommendations for addressing code defects and implementing best practices, CodeGuru Reviewer improves the overall quality and maintainability of your code base during the code review stage. For more information about CodeGuru Reviewer, see the <a href="https://docs.aws.amazon.com/codeguru/latest/reviewer-ug/welcome.html">Amazon CodeGuru Reviewer User Guide</a>.</p>
 */
@interface AWSCodeGuruReviewer : AWSService

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

     let CodeGuruReviewer = AWSCodeGuruReviewer.default()

 *Objective-C*

     AWSCodeGuruReviewer *CodeGuruReviewer = [AWSCodeGuruReviewer defaultCodeGuruReviewer];

 @return The default service client.
 */
+ (instancetype)defaultCodeGuruReviewer;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodeGuruReviewer.register(with: configuration!, forKey: "USWest2CodeGuruReviewer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:@"USWest2CodeGuruReviewer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CodeGuruReviewer = AWSCodeGuruReviewer(forKey: "USWest2CodeGuruReviewer")

 *Objective-C*

     AWSCodeGuruReviewer *CodeGuruReviewer = [AWSCodeGuruReviewer CodeGuruReviewerForKey:@"USWest2CodeGuruReviewer"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCodeGuruReviewerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCodeGuruReviewerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCodeGuruReviewer.register(with: configuration!, forKey: "USWest2CodeGuruReviewer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:@"USWest2CodeGuruReviewer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CodeGuruReviewer = AWSCodeGuruReviewer(forKey: "USWest2CodeGuruReviewer")

 *Objective-C*

     AWSCodeGuruReviewer *CodeGuruReviewer = [AWSCodeGuruReviewer CodeGuruReviewerForKey:@"USWest2CodeGuruReviewer"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CodeGuruReviewerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCodeGuruReviewerForKey:(NSString *)key;

/**
 <p>Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request raised within the repository. You can view recommendations in the AWS CodeCommit repository.</p><p>You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerAssociateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorConflict`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerAssociateRepositoryRequest
 @see AWSCodeGuruReviewerAssociateRepositoryResponse
 */
- (AWSTask<AWSCodeGuruReviewerAssociateRepositoryResponse *> *)associateRepository:(AWSCodeGuruReviewerAssociateRepositoryRequest *)request;

/**
 <p>Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request raised within the repository. You can view recommendations in the AWS CodeCommit repository.</p><p>You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorConflict`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerAssociateRepositoryRequest
 @see AWSCodeGuruReviewerAssociateRepositoryResponse
 */
- (void)associateRepository:(AWSCodeGuruReviewerAssociateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerAssociateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the metadaata associated with the code review along with its status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeReview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerDescribeCodeReviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeCodeReviewRequest
 @see AWSCodeGuruReviewerDescribeCodeReviewResponse
 */
- (AWSTask<AWSCodeGuruReviewerDescribeCodeReviewResponse *> *)describeCodeReview:(AWSCodeGuruReviewerDescribeCodeReviewRequest *)request;

/**
 <p> Returns the metadaata associated with the code review along with its status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeReview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeCodeReviewRequest
 @see AWSCodeGuruReviewerDescribeCodeReviewResponse
 */
- (void)describeCodeReview:(AWSCodeGuruReviewerDescribeCodeReviewRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerDescribeCodeReviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes the customer feedback for a CodeGuru Reviewer recommendation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse
 */
- (AWSTask<AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse *> *)describeRecommendationFeedback:(AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest *)request;

/**
 <p> Describes the customer feedback for a CodeGuru Reviewer recommendation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse
 */
- (void)describeRecommendationFeedback:(AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a repository association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositoryAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerDescribeRepositoryAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeRepositoryAssociationRequest
 @see AWSCodeGuruReviewerDescribeRepositoryAssociationResponse
 */
- (AWSTask<AWSCodeGuruReviewerDescribeRepositoryAssociationResponse *> *)describeRepositoryAssociation:(AWSCodeGuruReviewerDescribeRepositoryAssociationRequest *)request;

/**
 <p>Describes a repository association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositoryAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDescribeRepositoryAssociationRequest
 @see AWSCodeGuruReviewerDescribeRepositoryAssociationResponse
 */
- (void)describeRepositoryAssociation:(AWSCodeGuruReviewerDescribeRepositoryAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerDescribeRepositoryAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the association between Amazon CodeGuru Reviewer and a repository.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerDisassociateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorConflict`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDisassociateRepositoryRequest
 @see AWSCodeGuruReviewerDisassociateRepositoryResponse
 */
- (AWSTask<AWSCodeGuruReviewerDisassociateRepositoryResponse *> *)disassociateRepository:(AWSCodeGuruReviewerDisassociateRepositoryRequest *)request;

/**
 <p>Removes the association between Amazon CodeGuru Reviewer and a repository.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorConflict`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerDisassociateRepositoryRequest
 @see AWSCodeGuruReviewerDisassociateRepositoryResponse
 */
- (void)disassociateRepository:(AWSCodeGuruReviewerDisassociateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerDisassociateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists all the code reviews that the customer has created in the past 90 days. </p>
 
 @param request A container for the necessary parameters to execute the ListCodeReviews service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerListCodeReviewsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorThrottling`, `AWSCodeGuruReviewerErrorAccessDenied`.
 
 @see AWSCodeGuruReviewerListCodeReviewsRequest
 @see AWSCodeGuruReviewerListCodeReviewsResponse
 */
- (AWSTask<AWSCodeGuruReviewerListCodeReviewsResponse *> *)listCodeReviews:(AWSCodeGuruReviewerListCodeReviewsRequest *)request;

/**
 <p> Lists all the code reviews that the customer has created in the past 90 days. </p>
 
 @param request A container for the necessary parameters to execute the ListCodeReviews service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorThrottling`, `AWSCodeGuruReviewerErrorAccessDenied`.
 
 @see AWSCodeGuruReviewerListCodeReviewsRequest
 @see AWSCodeGuruReviewerListCodeReviewsResponse
 */
- (void)listCodeReviews:(AWSCodeGuruReviewerListCodeReviewsRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerListCodeReviewsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists the customer feedback for a CodeGuru Reviewer recommendation for all users. This API will be used from the console to extract the previously given feedback by the user to pre-populate the feedback emojis for all recommendations. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerListRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerListRecommendationFeedbackResponse
 */
- (AWSTask<AWSCodeGuruReviewerListRecommendationFeedbackResponse *> *)listRecommendationFeedback:(AWSCodeGuruReviewerListRecommendationFeedbackRequest *)request;

/**
 <p> Lists the customer feedback for a CodeGuru Reviewer recommendation for all users. This API will be used from the console to extract the previously given feedback by the user to pre-populate the feedback emojis for all recommendations. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerListRecommendationFeedbackResponse
 */
- (void)listRecommendationFeedback:(AWSCodeGuruReviewerListRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerListRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of all recommendations for a completed code review. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerListRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRecommendationsRequest
 @see AWSCodeGuruReviewerListRecommendationsResponse
 */
- (AWSTask<AWSCodeGuruReviewerListRecommendationsResponse *> *)listRecommendations:(AWSCodeGuruReviewerListRecommendationsRequest *)request;

/**
 <p> Returns the list of all recommendations for a completed code review. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRecommendationsRequest
 @see AWSCodeGuruReviewerListRecommendationsResponse
 */
- (void)listRecommendations:(AWSCodeGuruReviewerListRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerListRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoryAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerListRepositoryAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRepositoryAssociationsRequest
 @see AWSCodeGuruReviewerListRepositoryAssociationsResponse
 */
- (AWSTask<AWSCodeGuruReviewerListRepositoryAssociationsResponse *> *)listRepositoryAssociations:(AWSCodeGuruReviewerListRepositoryAssociationsRequest *)request;

/**
 <p>Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoryAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerListRepositoryAssociationsRequest
 @see AWSCodeGuruReviewerListRepositoryAssociationsResponse
 */
- (void)listRepositoryAssociations:(AWSCodeGuruReviewerListRepositoryAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerListRepositoryAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stores customer feedback for a CodeGuru-Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten. </p>
 
 @param request A container for the necessary parameters to execute the PutRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCodeGuruReviewerPutRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerPutRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerPutRecommendationFeedbackResponse
 */
- (AWSTask<AWSCodeGuruReviewerPutRecommendationFeedbackResponse *> *)putRecommendationFeedback:(AWSCodeGuruReviewerPutRecommendationFeedbackRequest *)request;

/**
 <p> Stores customer feedback for a CodeGuru-Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten. </p>
 
 @param request A container for the necessary parameters to execute the PutRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCodeGuruReviewerErrorDomain` domain and the following error code: `AWSCodeGuruReviewerErrorResourceNotFound`, `AWSCodeGuruReviewerErrorInternalServer`, `AWSCodeGuruReviewerErrorValidation`, `AWSCodeGuruReviewerErrorAccessDenied`, `AWSCodeGuruReviewerErrorThrottling`.
 
 @see AWSCodeGuruReviewerPutRecommendationFeedbackRequest
 @see AWSCodeGuruReviewerPutRecommendationFeedbackResponse
 */
- (void)putRecommendationFeedback:(AWSCodeGuruReviewerPutRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWSCodeGuruReviewerPutRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
