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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSCodeGuruReviewerErrorDomain;

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerErrorType) {
    AWSCodeGuruReviewerErrorUnknown,
    AWSCodeGuruReviewerErrorAccessDenied,
    AWSCodeGuruReviewerErrorConflict,
    AWSCodeGuruReviewerErrorInternalServer,
    AWSCodeGuruReviewerErrorNotFound,
    AWSCodeGuruReviewerErrorResourceNotFound,
    AWSCodeGuruReviewerErrorThrottling,
    AWSCodeGuruReviewerErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerJobState) {
    AWSCodeGuruReviewerJobStateUnknown,
    AWSCodeGuruReviewerJobStateCompleted,
    AWSCodeGuruReviewerJobStatePending,
    AWSCodeGuruReviewerJobStateFailed,
    AWSCodeGuruReviewerJobStateDeleting,
};

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerProviderType) {
    AWSCodeGuruReviewerProviderTypeUnknown,
    AWSCodeGuruReviewerProviderTypeCodeCommit,
    AWSCodeGuruReviewerProviderTypeGitHub,
    AWSCodeGuruReviewerProviderTypeBitbucket,
};

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerReaction) {
    AWSCodeGuruReviewerReactionUnknown,
    AWSCodeGuruReviewerReactionThumbsUp,
    AWSCodeGuruReviewerReactionThumbsDown,
};

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerRepositoryAssociationState) {
    AWSCodeGuruReviewerRepositoryAssociationStateUnknown,
    AWSCodeGuruReviewerRepositoryAssociationStateAssociated,
    AWSCodeGuruReviewerRepositoryAssociationStateAssociating,
    AWSCodeGuruReviewerRepositoryAssociationStateFailed,
    AWSCodeGuruReviewerRepositoryAssociationStateDisassociating,
};

typedef NS_ENUM(NSInteger, AWSCodeGuruReviewerTypes) {
    AWSCodeGuruReviewerTypesUnknown,
    AWSCodeGuruReviewerTypesPullRequest,
};

@class AWSCodeGuruReviewerAssociateRepositoryRequest;
@class AWSCodeGuruReviewerAssociateRepositoryResponse;
@class AWSCodeGuruReviewerCodeCommitRepository;
@class AWSCodeGuruReviewerCodeReview;
@class AWSCodeGuruReviewerCodeReviewSummary;
@class AWSCodeGuruReviewerCommitDiffSourceCodeType;
@class AWSCodeGuruReviewerDescribeCodeReviewRequest;
@class AWSCodeGuruReviewerDescribeCodeReviewResponse;
@class AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest;
@class AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse;
@class AWSCodeGuruReviewerDescribeRepositoryAssociationRequest;
@class AWSCodeGuruReviewerDescribeRepositoryAssociationResponse;
@class AWSCodeGuruReviewerDisassociateRepositoryRequest;
@class AWSCodeGuruReviewerDisassociateRepositoryResponse;
@class AWSCodeGuruReviewerListCodeReviewsRequest;
@class AWSCodeGuruReviewerListCodeReviewsResponse;
@class AWSCodeGuruReviewerListRecommendationFeedbackRequest;
@class AWSCodeGuruReviewerListRecommendationFeedbackResponse;
@class AWSCodeGuruReviewerListRecommendationsRequest;
@class AWSCodeGuruReviewerListRecommendationsResponse;
@class AWSCodeGuruReviewerListRepositoryAssociationsRequest;
@class AWSCodeGuruReviewerListRepositoryAssociationsResponse;
@class AWSCodeGuruReviewerMetrics;
@class AWSCodeGuruReviewerMetricsSummary;
@class AWSCodeGuruReviewerPutRecommendationFeedbackRequest;
@class AWSCodeGuruReviewerPutRecommendationFeedbackResponse;
@class AWSCodeGuruReviewerRecommendationFeedback;
@class AWSCodeGuruReviewerRecommendationFeedbackSummary;
@class AWSCodeGuruReviewerRecommendationSummary;
@class AWSCodeGuruReviewerRepository;
@class AWSCodeGuruReviewerRepositoryAssociation;
@class AWSCodeGuruReviewerRepositoryAssociationSummary;
@class AWSCodeGuruReviewerSourceCodeType;
@class AWSCodeGuruReviewerThirdPartySourceRepository;

/**
 
 */
@interface AWSCodeGuruReviewerAssociateRepositoryRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p><p>To add a new repository association, this parameter specifies a unique identifier for the new repository association that helps ensure idempotency.</p><p>If you use the AWS CLI or one of the AWS SDKs to call this operation, you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, you must generate a ClientRequestToken yourself for new versions and include that value in the request.</p><p>You typically interact with this value if you implement your own retry logic and want to ensure that a given repository association is not created twice. We recommend that you generate a UUID-type value to ensure uniqueness within the specified repository association.</p><p>Amazon CodeGuru Reviewer uses this value to prevent the accidental creation of duplicate repository associations if there are failures and retries. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The repository to associate.</p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerRepository * _Nullable repository;

@end

/**
 
 */
@interface AWSCodeGuruReviewerAssociateRepositoryResponse : AWSModel


/**
 <p>Information about the repository association.</p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerRepositoryAssociation * _Nullable repositoryAssociation;

@end

/**
 <p>Information about an AWS CodeCommit repository.</p>
 Required parameters: [Name]
 */
@interface AWSCodeGuruReviewerCodeCommitRepository : AWSModel


/**
 <p>The name of the AWS CodeCommit repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p> Information about a code review. </p>
 */
@interface AWSCodeGuruReviewerCodeReview : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the code review to describe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The time, in milliseconds since the epoch, when the code review was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p> The time, in milliseconds since the epoch, when the code review was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimeStamp;

/**
 <p> The statistics from the code review. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerMetrics * _Nullable metrics;

/**
 <p> The name of the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The owner of the repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p> The provider type of the repository association. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerProviderType providerType;

/**
 <p> The pull request ID for the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p> The name of the repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p> The type of the source code for the code review. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerSourceCodeType * _Nullable sourceCodeType;

/**
 <p> The state of the code review. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerJobState state;

/**
 <p> The reason for the state of the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p> The type of code review. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerTypes types;

@end

/**
 <p> Information about the summary of the code review. </p>
 */
@interface AWSCodeGuruReviewerCodeReviewSummary : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the code review to describe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The time, in milliseconds since the epoch, when the code review was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p> The time, in milliseconds since the epoch, when the code review was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimeStamp;

/**
 <p> The statistics from the code review. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerMetricsSummary * _Nullable metricsSummary;

/**
 <p> The name of the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The owner of the repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p> The provider type of the repository association. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerProviderType providerType;

/**
 <p> The pull request ID for the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable pullRequestId;

/**
 <p> The name of the repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p> The state of the code review. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerJobState state;

/**
 <p> The type of the code review. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerTypes types;

@end

/**
 <p> The commit diff for the pull request. </p>
 */
@interface AWSCodeGuruReviewerCommitDiffSourceCodeType : AWSModel


/**
 <p> Destination Commit SHA </p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCommit;

/**
 <p> Source Commit SHA. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceCommit;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeCodeReviewRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the code review to describe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeCodeReviewResponse : AWSModel


/**
 <p> Information about the code review. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerCodeReview * _Nullable codeReview;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) that identifies the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The recommendation ID that can be used to track the provided recommendations and then to collect the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

/**
 <p> Optional parameter to describe the feedback for a given user. If this is not supplied, it defaults to the user making the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse : AWSModel


/**
 <p> The recommendation feedback given by the user. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerRecommendationFeedback * _Nullable recommendationFeedback;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeRepositoryAssociationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) identifying the association. You can retrieve this ARN by calling <code>ListRepositories</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationArn;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDescribeRepositoryAssociationResponse : AWSModel


/**
 <p>Information about the repository association.</p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerRepositoryAssociation * _Nullable repositoryAssociation;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDisassociateRepositoryRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) identifying the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationArn;

@end

/**
 
 */
@interface AWSCodeGuruReviewerDisassociateRepositoryResponse : AWSModel


/**
 <p>Information about the disassociated repository.</p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerRepositoryAssociation * _Nullable repositoryAssociation;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListCodeReviewsRequest : AWSRequest


/**
 <p> The maximum number of results that are returned per call. The default is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> List of provider types for filtering that needs to be applied before displaying the result. For example, "providerTypes=[GitHub]" will list code reviews from GitHub. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable providerTypes;

/**
 <p> List of repository names for filtering that needs to be applied before displaying the result. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

/**
 <p> List of states for filtering that needs to be applied before displaying the result. For example, "states=[Pending]" will list code reviews in the Pending state. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable states;

/**
 <p> The type of code reviews to list in the response. </p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerTypes types;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListCodeReviewsResponse : AWSModel


/**
 <p> A list of code reviews that meet the criteria of the request. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeGuruReviewerCodeReviewSummary *> * _Nullable codeReviewSummaries;

/**
 <p> Pagination token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRecommendationFeedbackRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) that identifies the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The maximum number of results that are returned per call. The default is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> Filter on recommendationIds that need to be applied before displaying the result. This can be used to query all the recommendation feedback for a given recommendation. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable recommendationIds;

/**
 <p> Filter on userIds that need to be applied before displaying the result. This can be used to query all the recommendation feedback for a code review from a given user. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRecommendationFeedbackResponse : AWSModel


/**
 <p> If nextToken is returned, there are more results available. The value of nextToken is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> Recommendation feedback summaries corresponding to the code reivew ARN. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeGuruReviewerRecommendationFeedbackSummary *> * _Nullable recommendationFeedbackSummaries;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRecommendationsRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the code review to describe. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The maximum number of results that are returned per call. The default is 100. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> Pagination token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRecommendationsResponse : AWSModel


/**
 <p> Pagination token. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> List of recommendations for the requested code review. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodeGuruReviewerRecommendationSummary *> * _Nullable recommendationSummaries;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRepositoryAssociationsRequest : AWSRequest


/**
 <p>The maximum number of repository association results returned by <code>ListRepositoryAssociations</code> in paginated output. When this parameter is used, <code>ListRepositoryAssociations</code> only returns <code>maxResults</code> results in a single page with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>ListRepositoryAssociations</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 25. If this parameter is not used, <code>ListRepositoryAssociations</code> returns up to 25 results and a <code>nextToken</code> value if applicable. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>List of repository names to use as a filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable names;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListRepositoryAssociations</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. </p><note><p>Treat this token as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of owners to use as a filter. For GitHub, this is name of the GitHub account that was used to associate the repository. For AWS CodeCommit, it is the name of the CodeCommit account that was used to associate the repository.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable owners;

/**
 <p>List of provider types to use as a filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable providerTypes;

/**
 <p>List of states to use as a filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable states;

@end

/**
 
 */
@interface AWSCodeGuruReviewerListRepositoryAssociationsResponse : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>ListRecommendations</code> request. When the results of a <code>ListRecommendations</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of repository associations that meet the criteria of the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodeGuruReviewerRepositoryAssociationSummary *> * _Nullable repositoryAssociationSummaries;

@end

/**
 <p> Information about the statistics from the code review. </p>
 */
@interface AWSCodeGuruReviewerMetrics : AWSModel


/**
 <p> Total number of recommendations found in the code review. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable findingsCount;

/**
 <p> Lines of code metered in the code review. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable meteredLinesOfCodeCount;

@end

/**
 <p> Information about metrics summaries. </p>
 */
@interface AWSCodeGuruReviewerMetricsSummary : AWSModel


/**
 <p> Total number of recommendations found in the code review. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable findingsCount;

/**
 <p> Lines of code metered in the code review. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable meteredLinesOfCodeCount;

@end

/**
 
 */
@interface AWSCodeGuruReviewerPutRecommendationFeedbackRequest : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) that identifies the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> List for storing reactions. Reactions are utf-8 text code for emojis. If you send an empty list it clears all your feedback. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reactions;

/**
 <p> The recommendation ID that can be used to track the provided recommendations and then to collect the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

@end

/**
 
 */
@interface AWSCodeGuruReviewerPutRecommendationFeedbackResponse : AWSModel


@end

/**
 <p> Information about the recommendation feedback. </p>
 */
@interface AWSCodeGuruReviewerRecommendationFeedback : AWSModel


/**
 <p> The Amazon Resource Name (ARN) that identifies the code review. </p>
 */
@property (nonatomic, strong) NSString * _Nullable codeReviewArn;

/**
 <p> The time at which the feedback was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p> The time at which the feedback was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimeStamp;

/**
 <p> List for storing reactions. Reactions are utf-8 text code for emojis. You can send an empty list to clear off all your feedback. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reactions;

/**
 <p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

/**
 <p> The user principal that made the API call. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p> Information about recommendation feedback summaries. </p>
 */
@interface AWSCodeGuruReviewerRecommendationFeedbackSummary : AWSModel


/**
 <p> List for storing reactions. Reactions are utf-8 text code for emojis. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reactions;

/**
 <p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

/**
 <p> The identifier for the user that gave the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p> Information about recommendations. </p>
 */
@interface AWSCodeGuruReviewerRecommendationSummary : AWSModel


/**
 <p> A description of the recommendation generated by CodeGuru Reviewer for the lines of code between the start line and the end line. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Last line where the recommendation is applicable in the source commit or source branch. For a single line comment the start line and end line values will be the same. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endLine;

/**
 <p>Name of the file on which a recommendation is provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filePath;

/**
 <p> The recommendation ID that can be used to track the provided recommendations. Later on it can be used to collect the feedback. </p>
 */
@property (nonatomic, strong) NSString * _Nullable recommendationId;

/**
 <p> Start line from where the recommendation is applicable in the source commit or source branch. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startLine;

@end

/**
 <p>Information about a repository.</p>
 */
@interface AWSCodeGuruReviewerRepository : AWSModel


/**
 <p> Information about a Bitbucket Cloud repository. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerThirdPartySourceRepository * _Nullable bitbucket;

/**
 <p>Information about an AWS CodeCommit repository.</p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerCodeCommitRepository * _Nullable codeCommit;

@end

/**
 <p>Information about a repository association.</p>
 */
@interface AWSCodeGuruReviewerRepositoryAssociation : AWSModel


/**
 <p>The Amazon Resource Name (ARN) identifying the repository association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationArn;

/**
 <p>The ID of the repository association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p> The Amazon Resource Name (ARN) identifying the repository connection. </p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

/**
 <p>The time, in milliseconds since the epoch, when the repository association was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTimeStamp;

/**
 <p>The time, in milliseconds since the epoch, when the repository association was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimeStamp;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The provider type of the repository association.</p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerProviderType providerType;

/**
 <p>The state of the repository association.</p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerRepositoryAssociationState state;

/**
 <p>A description of why the repository association is in the current state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

@end

/**
 <p>Information about a repository association.</p>
 */
@interface AWSCodeGuruReviewerRepositoryAssociationSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) identifying the repository association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationArn;

/**
 <p>The repository association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p> The Amazon Resource Name (ARN) identifying the repository connection. </p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

/**
 <p>The time, in milliseconds since the epoch, since the repository association was last updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimeStamp;

/**
 <p>The name of the repository association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the repository association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The provider type of the repository association.</p>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerProviderType providerType;

/**
 <p>The state of the repository association.</p><dl><dt>Associated</dt><dd><p>Amazon CodeGuru Reviewer is associated with the repository. </p></dd><dt>Associating</dt><dd><p>The association is in progress. </p></dd><dt>Failed</dt><dd><p>The association failed. </p></dd><dt>Disassociating</dt><dd><p>Amazon CodeGuru Reviewer is in the process of disassociating with the repository. </p></dd></dl>
 */
@property (nonatomic, assign) AWSCodeGuruReviewerRepositoryAssociationState state;

@end

/**
 <p> Information about the source code type. </p>
 */
@interface AWSCodeGuruReviewerSourceCodeType : AWSModel


/**
 <p> The commit diff for the pull request. </p>
 */
@property (nonatomic, strong) AWSCodeGuruReviewerCommitDiffSourceCodeType * _Nullable commitDiff;

@end

/**
 <p> Information about a third party source repository connected through CodeStar Connections. </p>
 Required parameters: [Name, ConnectionArn, Owner]
 */
@interface AWSCodeGuruReviewerThirdPartySourceRepository : AWSModel


/**
 <p> The Amazon Resource Name (ARN) identifying the repository connection. </p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionArn;

/**
 <p> The name of the third party source repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> The username of the owner of the repository. </p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

@end

NS_ASSUME_NONNULL_END
