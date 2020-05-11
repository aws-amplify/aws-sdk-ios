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

#import "AWSCodeGuruReviewerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCodeGuruReviewerErrorDomain = @"com.amazonaws.AWSCodeGuruReviewerErrorDomain";

@implementation AWSCodeGuruReviewerAssociateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"repository" : @"Repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerRepository class]];
}

@end

@implementation AWSCodeGuruReviewerAssociateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerRepositoryAssociation class]];
}

@end

@implementation AWSCodeGuruReviewerCodeCommitRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSCodeGuruReviewerCodeReview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"createdTimeStamp" : @"CreatedTimeStamp",
             @"lastUpdatedTimeStamp" : @"LastUpdatedTimeStamp",
             @"metrics" : @"Metrics",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"providerType" : @"ProviderType",
             @"pullRequestId" : @"PullRequestId",
             @"repositoryName" : @"RepositoryName",
             @"sourceCodeType" : @"SourceCodeType",
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerMetrics class]];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeGitHub);
        }
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeBitbucket);
        }
        return @(AWSCodeGuruReviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWSCodeGuruReviewerProviderTypeGitHub:
                return @"GitHub";
            case AWSCodeGuruReviewerProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceCodeTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerSourceCodeType class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateDeleting);
        }
        return @(AWSCodeGuruReviewerJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerJobStateCompleted:
                return @"Completed";
            case AWSCodeGuruReviewerJobStatePending:
                return @"Pending";
            case AWSCodeGuruReviewerJobStateFailed:
                return @"Failed";
            case AWSCodeGuruReviewerJobStateDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PullRequest"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerTypesPullRequest);
        }
        return @(AWSCodeGuruReviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeGuruReviewerCodeReviewSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"createdTimeStamp" : @"CreatedTimeStamp",
             @"lastUpdatedTimeStamp" : @"LastUpdatedTimeStamp",
             @"metricsSummary" : @"MetricsSummary",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"providerType" : @"ProviderType",
             @"pullRequestId" : @"PullRequestId",
             @"repositoryName" : @"RepositoryName",
             @"state" : @"State",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)metricsSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerMetricsSummary class]];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeGitHub);
        }
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeBitbucket);
        }
        return @(AWSCodeGuruReviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWSCodeGuruReviewerProviderTypeGitHub:
                return @"GitHub";
            case AWSCodeGuruReviewerProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerJobStateDeleting);
        }
        return @(AWSCodeGuruReviewerJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerJobStateCompleted:
                return @"Completed";
            case AWSCodeGuruReviewerJobStatePending:
                return @"Pending";
            case AWSCodeGuruReviewerJobStateFailed:
                return @"Failed";
            case AWSCodeGuruReviewerJobStateDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PullRequest"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerTypesPullRequest);
        }
        return @(AWSCodeGuruReviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeGuruReviewerCommitDiffSourceCodeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCommit" : @"DestinationCommit",
             @"sourceCommit" : @"SourceCommit",
             };
}

@end

@implementation AWSCodeGuruReviewerDescribeCodeReviewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             };
}

@end

@implementation AWSCodeGuruReviewerDescribeCodeReviewResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReview" : @"CodeReview",
             };
}

+ (NSValueTransformer *)codeReviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerCodeReview class]];
}

@end

@implementation AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"recommendationId" : @"RecommendationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendationFeedback" : @"RecommendationFeedback",
             };
}

+ (NSValueTransformer *)recommendationFeedbackJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerRecommendationFeedback class]];
}

@end

@implementation AWSCodeGuruReviewerDescribeRepositoryAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             };
}

@end

@implementation AWSCodeGuruReviewerDescribeRepositoryAssociationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerRepositoryAssociation class]];
}

@end

@implementation AWSCodeGuruReviewerDisassociateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             };
}

@end

@implementation AWSCodeGuruReviewerDisassociateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerRepositoryAssociation class]];
}

@end

@implementation AWSCodeGuruReviewerListCodeReviewsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"providerTypes" : @"ProviderTypes",
             @"repositoryNames" : @"RepositoryNames",
             @"states" : @"States",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PullRequest"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerTypesPullRequest);
        }
        return @(AWSCodeGuruReviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeGuruReviewerListCodeReviewsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewSummaries" : @"CodeReviewSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)codeReviewSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeGuruReviewerCodeReviewSummary class]];
}

@end

@implementation AWSCodeGuruReviewerListRecommendationFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"recommendationIds" : @"RecommendationIds",
             @"userIds" : @"UserIds",
             };
}

@end

@implementation AWSCodeGuruReviewerListRecommendationFeedbackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recommendationFeedbackSummaries" : @"RecommendationFeedbackSummaries",
             };
}

+ (NSValueTransformer *)recommendationFeedbackSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeGuruReviewerRecommendationFeedbackSummary class]];
}

@end

@implementation AWSCodeGuruReviewerListRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCodeGuruReviewerListRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recommendationSummaries" : @"RecommendationSummaries",
             };
}

+ (NSValueTransformer *)recommendationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeGuruReviewerRecommendationSummary class]];
}

@end

@implementation AWSCodeGuruReviewerListRepositoryAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"names" : @"Names",
             @"nextToken" : @"NextToken",
             @"owners" : @"Owners",
             @"providerTypes" : @"ProviderTypes",
             @"states" : @"States",
             };
}

@end

@implementation AWSCodeGuruReviewerListRepositoryAssociationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"repositoryAssociationSummaries" : @"RepositoryAssociationSummaries",
             };
}

+ (NSValueTransformer *)repositoryAssociationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodeGuruReviewerRepositoryAssociationSummary class]];
}

@end

@implementation AWSCodeGuruReviewerMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingsCount" : @"FindingsCount",
             @"meteredLinesOfCodeCount" : @"MeteredLinesOfCodeCount",
             };
}

@end

@implementation AWSCodeGuruReviewerMetricsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingsCount" : @"FindingsCount",
             @"meteredLinesOfCodeCount" : @"MeteredLinesOfCodeCount",
             };
}

@end

@implementation AWSCodeGuruReviewerPutRecommendationFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"reactions" : @"Reactions",
             @"recommendationId" : @"RecommendationId",
             };
}

@end

@implementation AWSCodeGuruReviewerPutRecommendationFeedbackResponse

@end

@implementation AWSCodeGuruReviewerRecommendationFeedback

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"createdTimeStamp" : @"CreatedTimeStamp",
             @"lastUpdatedTimeStamp" : @"LastUpdatedTimeStamp",
             @"reactions" : @"Reactions",
             @"recommendationId" : @"RecommendationId",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)createdTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodeGuruReviewerRecommendationFeedbackSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reactions" : @"Reactions",
             @"recommendationId" : @"RecommendationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSCodeGuruReviewerRecommendationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"endLine" : @"EndLine",
             @"filePath" : @"FilePath",
             @"recommendationId" : @"RecommendationId",
             @"startLine" : @"StartLine",
             };
}

@end

@implementation AWSCodeGuruReviewerRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitbucket" : @"Bitbucket",
             @"codeCommit" : @"CodeCommit",
             };
}

+ (NSValueTransformer *)bitbucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerThirdPartySourceRepository class]];
}

+ (NSValueTransformer *)codeCommitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerCodeCommitRepository class]];
}

@end

@implementation AWSCodeGuruReviewerRepositoryAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             @"associationId" : @"AssociationId",
             @"connectionArn" : @"ConnectionArn",
             @"createdTimeStamp" : @"CreatedTimeStamp",
             @"lastUpdatedTimeStamp" : @"LastUpdatedTimeStamp",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"providerType" : @"ProviderType",
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             };
}

+ (NSValueTransformer *)createdTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeGitHub);
        }
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeBitbucket);
        }
        return @(AWSCodeGuruReviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWSCodeGuruReviewerProviderTypeGitHub:
                return @"GitHub";
            case AWSCodeGuruReviewerProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Associated"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateAssociated);
        }
        if ([value caseInsensitiveCompare:@"Associating"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateAssociating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Disassociating"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateDisassociating);
        }
        return @(AWSCodeGuruReviewerRepositoryAssociationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerRepositoryAssociationStateAssociated:
                return @"Associated";
            case AWSCodeGuruReviewerRepositoryAssociationStateAssociating:
                return @"Associating";
            case AWSCodeGuruReviewerRepositoryAssociationStateFailed:
                return @"Failed";
            case AWSCodeGuruReviewerRepositoryAssociationStateDisassociating:
                return @"Disassociating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeGuruReviewerRepositoryAssociationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             @"associationId" : @"AssociationId",
             @"connectionArn" : @"ConnectionArn",
             @"lastUpdatedTimeStamp" : @"LastUpdatedTimeStamp",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"providerType" : @"ProviderType",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)lastUpdatedTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeGitHub);
        }
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerProviderTypeBitbucket);
        }
        return @(AWSCodeGuruReviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWSCodeGuruReviewerProviderTypeGitHub:
                return @"GitHub";
            case AWSCodeGuruReviewerProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Associated"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateAssociated);
        }
        if ([value caseInsensitiveCompare:@"Associating"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateAssociating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Disassociating"] == NSOrderedSame) {
            return @(AWSCodeGuruReviewerRepositoryAssociationStateDisassociating);
        }
        return @(AWSCodeGuruReviewerRepositoryAssociationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodeGuruReviewerRepositoryAssociationStateAssociated:
                return @"Associated";
            case AWSCodeGuruReviewerRepositoryAssociationStateAssociating:
                return @"Associating";
            case AWSCodeGuruReviewerRepositoryAssociationStateFailed:
                return @"Failed";
            case AWSCodeGuruReviewerRepositoryAssociationStateDisassociating:
                return @"Disassociating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodeGuruReviewerSourceCodeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitDiff" : @"CommitDiff",
             };
}

+ (NSValueTransformer *)commitDiffJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodeGuruReviewerCommitDiffSourceCodeType class]];
}

@end

@implementation AWSCodeGuruReviewerThirdPartySourceRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionArn" : @"ConnectionArn",
             @"name" : @"Name",
             @"owner" : @"Owner",
             };
}

@end
