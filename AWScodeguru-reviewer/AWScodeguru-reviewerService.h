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
#import "AWScodeguru-reviewerModel.h"
#import "AWScodeguru-reviewerResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWScodeguru-reviewer
FOUNDATION_EXPORT NSString *const AWScodeguru-reviewerSDKVersion;

/**
 <p>This section provides documentation for the Amazon CodeGuru Reviewer API operations.</p>
 */
@interface AWScodeguru-reviewer : AWSService

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

     let codeguru-reviewer = AWScodeguru-reviewer.default()

 *Objective-C*

     AWScodeguru-reviewer *codeguru-reviewer = [AWScodeguru-reviewer defaultcodeguru-reviewer];

 @return The default service client.
 */
+ (instancetype)defaultcodeguru-reviewer;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWScodeguru-reviewer.register(with: configuration!, forKey: "USWest2codeguru-reviewer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:@"USWest2codeguru-reviewer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let codeguru-reviewer = AWScodeguru-reviewer(forKey: "USWest2codeguru-reviewer")

 *Objective-C*

     AWScodeguru-reviewer *codeguru-reviewer = [AWScodeguru-reviewer codeguru-reviewerForKey:@"USWest2codeguru-reviewer"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registercodeguru-reviewerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registercodeguru-reviewerWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWScodeguru-reviewer.register(with: configuration!, forKey: "USWest2codeguru-reviewer")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:@"USWest2codeguru-reviewer"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let codeguru-reviewer = AWScodeguru-reviewer(forKey: "USWest2codeguru-reviewer")

 *Objective-C*

     AWScodeguru-reviewer *codeguru-reviewer = [AWScodeguru-reviewer codeguru-reviewerForKey:@"USWest2codeguru-reviewer"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)codeguru-reviewerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removecodeguru-reviewerForKey:(NSString *)key;

/**
 <p>Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request raised within the repository. You can view recommendations in the AWS CodeCommit repository.</p><p>You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerAssociateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorConflict`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerAssociateRepositoryRequest
 @see AWScodeguru-reviewerAssociateRepositoryResponse
 */
- (AWSTask<AWScodeguru-reviewerAssociateRepositoryResponse *> *)associateRepository:(AWScodeguru-reviewerAssociateRepositoryRequest *)request;

/**
 <p>Associates an AWS CodeCommit repository with Amazon CodeGuru Reviewer. When you associate an AWS CodeCommit repository with Amazon CodeGuru Reviewer, Amazon CodeGuru Reviewer will provide recommendations for each pull request raised within the repository. You can view recommendations in the AWS CodeCommit repository.</p><p>You can associate a GitHub repository using the Amazon CodeGuru Reviewer console.</p>
 
 @param request A container for the necessary parameters to execute the AssociateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorConflict`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerAssociateRepositoryRequest
 @see AWScodeguru-reviewerAssociateRepositoryResponse
 */
- (void)associateRepository:(AWScodeguru-reviewerAssociateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerAssociateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the metadaata associated with the code review along with its status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeReview service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerDescribeCodeReviewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeCodeReviewRequest
 @see AWScodeguru-reviewerDescribeCodeReviewResponse
 */
- (AWSTask<AWScodeguru-reviewerDescribeCodeReviewResponse *> *)describeCodeReview:(AWScodeguru-reviewerDescribeCodeReviewRequest *)request;

/**
 <p> Returns the metadaata associated with the code review along with its status.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCodeReview service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeCodeReviewRequest
 @see AWScodeguru-reviewerDescribeCodeReviewResponse
 */
- (void)describeCodeReview:(AWScodeguru-reviewerDescribeCodeReviewRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerDescribeCodeReviewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes the customer feedback for a CodeGuru Reviewer recommendation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerDescribeRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeRecommendationFeedbackRequest
 @see AWScodeguru-reviewerDescribeRecommendationFeedbackResponse
 */
- (AWSTask<AWScodeguru-reviewerDescribeRecommendationFeedbackResponse *> *)describeRecommendationFeedback:(AWScodeguru-reviewerDescribeRecommendationFeedbackRequest *)request;

/**
 <p> Describes the customer feedback for a CodeGuru Reviewer recommendation. </p>
 
 @param request A container for the necessary parameters to execute the DescribeRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeRecommendationFeedbackRequest
 @see AWScodeguru-reviewerDescribeRecommendationFeedbackResponse
 */
- (void)describeRecommendationFeedback:(AWScodeguru-reviewerDescribeRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerDescribeRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes a repository association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositoryAssociation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerDescribeRepositoryAssociationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeRepositoryAssociationRequest
 @see AWScodeguru-reviewerDescribeRepositoryAssociationResponse
 */
- (AWSTask<AWScodeguru-reviewerDescribeRepositoryAssociationResponse *> *)describeRepositoryAssociation:(AWScodeguru-reviewerDescribeRepositoryAssociationRequest *)request;

/**
 <p>Describes a repository association.</p>
 
 @param request A container for the necessary parameters to execute the DescribeRepositoryAssociation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDescribeRepositoryAssociationRequest
 @see AWScodeguru-reviewerDescribeRepositoryAssociationResponse
 */
- (void)describeRepositoryAssociation:(AWScodeguru-reviewerDescribeRepositoryAssociationRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerDescribeRepositoryAssociationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes the association between Amazon CodeGuru Reviewer and a repository.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRepository service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerDisassociateRepositoryResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorConflict`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDisassociateRepositoryRequest
 @see AWScodeguru-reviewerDisassociateRepositoryResponse
 */
- (AWSTask<AWScodeguru-reviewerDisassociateRepositoryResponse *> *)disassociateRepository:(AWScodeguru-reviewerDisassociateRepositoryRequest *)request;

/**
 <p>Removes the association between Amazon CodeGuru Reviewer and a repository.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateRepository service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorConflict`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerDisassociateRepositoryRequest
 @see AWScodeguru-reviewerDisassociateRepositoryResponse
 */
- (void)disassociateRepository:(AWScodeguru-reviewerDisassociateRepositoryRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerDisassociateRepositoryResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists all the code reviews that the customer has created in the past 90 days. </p>
 
 @param request A container for the necessary parameters to execute the ListCodeReviews service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerListCodeReviewsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorThrottling`, `AWScodeguru-reviewerErrorAccessDenied`.
 
 @see AWScodeguru-reviewerListCodeReviewsRequest
 @see AWScodeguru-reviewerListCodeReviewsResponse
 */
- (AWSTask<AWScodeguru-reviewerListCodeReviewsResponse *> *)listCodeReviews:(AWScodeguru-reviewerListCodeReviewsRequest *)request;

/**
 <p> Lists all the code reviews that the customer has created in the past 90 days. </p>
 
 @param request A container for the necessary parameters to execute the ListCodeReviews service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorThrottling`, `AWScodeguru-reviewerErrorAccessDenied`.
 
 @see AWScodeguru-reviewerListCodeReviewsRequest
 @see AWScodeguru-reviewerListCodeReviewsResponse
 */
- (void)listCodeReviews:(AWScodeguru-reviewerListCodeReviewsRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerListCodeReviewsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists the customer feedback for a CodeGuru Reviewer recommendation for all users. This API will be used from the console to extract the previously given feedback by the user to pre-populate the feedback emojis for all recommendations. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerListRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRecommendationFeedbackRequest
 @see AWScodeguru-reviewerListRecommendationFeedbackResponse
 */
- (AWSTask<AWScodeguru-reviewerListRecommendationFeedbackResponse *> *)listRecommendationFeedback:(AWScodeguru-reviewerListRecommendationFeedbackRequest *)request;

/**
 <p> Lists the customer feedback for a CodeGuru Reviewer recommendation for all users. This API will be used from the console to extract the previously given feedback by the user to pre-populate the feedback emojis for all recommendations. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRecommendationFeedbackRequest
 @see AWScodeguru-reviewerListRecommendationFeedbackResponse
 */
- (void)listRecommendationFeedback:(AWScodeguru-reviewerListRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerListRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the list of all recommendations for a completed code review. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerListRecommendationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRecommendationsRequest
 @see AWScodeguru-reviewerListRecommendationsResponse
 */
- (AWSTask<AWScodeguru-reviewerListRecommendationsResponse *> *)listRecommendations:(AWScodeguru-reviewerListRecommendationsRequest *)request;

/**
 <p> Returns the list of all recommendations for a completed code review. </p>
 
 @param request A container for the necessary parameters to execute the ListRecommendations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRecommendationsRequest
 @see AWScodeguru-reviewerListRecommendationsResponse
 */
- (void)listRecommendations:(AWScodeguru-reviewerListRecommendationsRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerListRecommendationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoryAssociations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerListRepositoryAssociationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRepositoryAssociationsRequest
 @see AWScodeguru-reviewerListRepositoryAssociationsResponse
 */
- (AWSTask<AWScodeguru-reviewerListRepositoryAssociationsResponse *> *)listRepositoryAssociations:(AWScodeguru-reviewerListRepositoryAssociationsRequest *)request;

/**
 <p>Lists repository associations. You can optionally filter on one or more of the following recommendation properties: provider types, states, names, and owners.</p>
 
 @param request A container for the necessary parameters to execute the ListRepositoryAssociations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerListRepositoryAssociationsRequest
 @see AWScodeguru-reviewerListRepositoryAssociationsResponse
 */
- (void)listRepositoryAssociations:(AWScodeguru-reviewerListRepositoryAssociationsRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerListRepositoryAssociationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Stores customer feedback for a CodeGuru-Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten. </p>
 
 @param request A container for the necessary parameters to execute the PutRecommendationFeedback service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWScodeguru-reviewerPutRecommendationFeedbackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerPutRecommendationFeedbackRequest
 @see AWScodeguru-reviewerPutRecommendationFeedbackResponse
 */
- (AWSTask<AWScodeguru-reviewerPutRecommendationFeedbackResponse *> *)putRecommendationFeedback:(AWScodeguru-reviewerPutRecommendationFeedbackRequest *)request;

/**
 <p> Stores customer feedback for a CodeGuru-Reviewer recommendation. When this API is called again with different reactions the previous feedback is overwritten. </p>
 
 @param request A container for the necessary parameters to execute the PutRecommendationFeedback service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWScodeguru-reviewerErrorDomain` domain and the following error code: `AWScodeguru-reviewerErrorResourceNotFound`, `AWScodeguru-reviewerErrorInternalServer`, `AWScodeguru-reviewerErrorValidation`, `AWScodeguru-reviewerErrorAccessDenied`, `AWScodeguru-reviewerErrorThrottling`.
 
 @see AWScodeguru-reviewerPutRecommendationFeedbackRequest
 @see AWScodeguru-reviewerPutRecommendationFeedbackResponse
 */
- (void)putRecommendationFeedback:(AWScodeguru-reviewerPutRecommendationFeedbackRequest *)request completionHandler:(void (^ _Nullable)(AWScodeguru-reviewerPutRecommendationFeedbackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
