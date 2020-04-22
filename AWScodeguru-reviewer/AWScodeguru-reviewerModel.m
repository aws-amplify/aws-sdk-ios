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

#import "AWScodeguru-reviewerModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWScodeguru-reviewerErrorDomain = @"com.amazonaws.AWScodeguru-reviewerErrorDomain";

@implementation AWScodeguru-reviewerAssociateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"repository" : @"Repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerRepository class]];
}

@end

@implementation AWScodeguru-reviewerAssociateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerRepositoryAssociation class]];
}

@end

@implementation AWScodeguru-reviewerCodeCommitRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWScodeguru-reviewerCodeReview

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerMetrics class]];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeGitHub);
        }
        return @(AWScodeguru-reviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWScodeguru-reviewerProviderTypeGitHub:
                return @"GitHub";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceCodeTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerSourceCodeType class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateDeleting);
        }
        return @(AWScodeguru-reviewerJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerJobStateCompleted:
                return @"Completed";
            case AWScodeguru-reviewerJobStatePending:
                return @"Pending";
            case AWScodeguru-reviewerJobStateFailed:
                return @"Failed";
            case AWScodeguru-reviewerJobStateDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PullRequest"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerTypesPullRequest);
        }
        return @(AWScodeguru-reviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWScodeguru-reviewerCodeReviewSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerMetricsSummary class]];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeGitHub);
        }
        return @(AWScodeguru-reviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWScodeguru-reviewerProviderTypeGitHub:
                return @"GitHub";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStatePending);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerJobStateDeleting);
        }
        return @(AWScodeguru-reviewerJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerJobStateCompleted:
                return @"Completed";
            case AWScodeguru-reviewerJobStatePending:
                return @"Pending";
            case AWScodeguru-reviewerJobStateFailed:
                return @"Failed";
            case AWScodeguru-reviewerJobStateDeleting:
                return @"Deleting";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PullRequest"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerTypesPullRequest);
        }
        return @(AWScodeguru-reviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWScodeguru-reviewerCommitDiffSourceCodeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCommit" : @"DestinationCommit",
             @"sourceCommit" : @"SourceCommit",
             };
}

@end

@implementation AWScodeguru-reviewerDescribeCodeReviewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             };
}

@end

@implementation AWScodeguru-reviewerDescribeCodeReviewResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReview" : @"CodeReview",
             };
}

+ (NSValueTransformer *)codeReviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerCodeReview class]];
}

@end

@implementation AWScodeguru-reviewerDescribeRecommendationFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"recommendationId" : @"RecommendationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWScodeguru-reviewerDescribeRecommendationFeedbackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommendationFeedback" : @"RecommendationFeedback",
             };
}

+ (NSValueTransformer *)recommendationFeedbackJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerRecommendationFeedback class]];
}

@end

@implementation AWScodeguru-reviewerDescribeRepositoryAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             };
}

@end

@implementation AWScodeguru-reviewerDescribeRepositoryAssociationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerRepositoryAssociation class]];
}

@end

@implementation AWScodeguru-reviewerDisassociateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             };
}

@end

@implementation AWScodeguru-reviewerDisassociateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repositoryAssociation" : @"RepositoryAssociation",
             };
}

+ (NSValueTransformer *)repositoryAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerRepositoryAssociation class]];
}

@end

@implementation AWScodeguru-reviewerListCodeReviewsRequest

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
            return @(AWScodeguru-reviewerTypesPullRequest);
        }
        return @(AWScodeguru-reviewerTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerTypesPullRequest:
                return @"PullRequest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWScodeguru-reviewerListCodeReviewsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewSummaries" : @"CodeReviewSummaries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)codeReviewSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWScodeguru-reviewerCodeReviewSummary class]];
}

@end

@implementation AWScodeguru-reviewerListRecommendationFeedbackRequest

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

@implementation AWScodeguru-reviewerListRecommendationFeedbackResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recommendationFeedbackSummaries" : @"RecommendationFeedbackSummaries",
             };
}

+ (NSValueTransformer *)recommendationFeedbackSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWScodeguru-reviewerRecommendationFeedbackSummary class]];
}

@end

@implementation AWScodeguru-reviewerListRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWScodeguru-reviewerListRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"recommendationSummaries" : @"RecommendationSummaries",
             };
}

+ (NSValueTransformer *)recommendationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWScodeguru-reviewerRecommendationSummary class]];
}

@end

@implementation AWScodeguru-reviewerListRepositoryAssociationsRequest

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

@implementation AWScodeguru-reviewerListRepositoryAssociationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"repositoryAssociationSummaries" : @"RepositoryAssociationSummaries",
             };
}

+ (NSValueTransformer *)repositoryAssociationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWScodeguru-reviewerRepositoryAssociationSummary class]];
}

@end

@implementation AWScodeguru-reviewerMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingsCount" : @"FindingsCount",
             @"meteredLinesOfCodeCount" : @"MeteredLinesOfCodeCount",
             };
}

@end

@implementation AWScodeguru-reviewerMetricsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingsCount" : @"FindingsCount",
             @"meteredLinesOfCodeCount" : @"MeteredLinesOfCodeCount",
             };
}

@end

@implementation AWScodeguru-reviewerPutRecommendationFeedbackRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeReviewArn" : @"CodeReviewArn",
             @"reactions" : @"Reactions",
             @"recommendationId" : @"RecommendationId",
             };
}

@end

@implementation AWScodeguru-reviewerPutRecommendationFeedbackResponse

@end

@implementation AWScodeguru-reviewerRecommendationFeedback

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

@implementation AWScodeguru-reviewerRecommendationFeedbackSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reactions" : @"Reactions",
             @"recommendationId" : @"RecommendationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWScodeguru-reviewerRecommendationSummary

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

@implementation AWScodeguru-reviewerRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeCommit" : @"CodeCommit",
             };
}

+ (NSValueTransformer *)codeCommitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerCodeCommitRepository class]];
}

@end

@implementation AWScodeguru-reviewerRepositoryAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             @"associationId" : @"AssociationId",
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
            return @(AWScodeguru-reviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeGitHub);
        }
        return @(AWScodeguru-reviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWScodeguru-reviewerProviderTypeGitHub:
                return @"GitHub";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Associated"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateAssociated);
        }
        if ([value caseInsensitiveCompare:@"Associating"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateAssociating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Disassociating"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateDisassociating);
        }
        return @(AWScodeguru-reviewerRepositoryAssociationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerRepositoryAssociationStateAssociated:
                return @"Associated";
            case AWScodeguru-reviewerRepositoryAssociationStateAssociating:
                return @"Associating";
            case AWScodeguru-reviewerRepositoryAssociationStateFailed:
                return @"Failed";
            case AWScodeguru-reviewerRepositoryAssociationStateDisassociating:
                return @"Disassociating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWScodeguru-reviewerRepositoryAssociationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationArn" : @"AssociationArn",
             @"associationId" : @"AssociationId",
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
            return @(AWScodeguru-reviewerProviderTypeCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerProviderTypeGitHub);
        }
        return @(AWScodeguru-reviewerProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerProviderTypeCodeCommit:
                return @"CodeCommit";
            case AWScodeguru-reviewerProviderTypeGitHub:
                return @"GitHub";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Associated"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateAssociated);
        }
        if ([value caseInsensitiveCompare:@"Associating"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateAssociating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateFailed);
        }
        if ([value caseInsensitiveCompare:@"Disassociating"] == NSOrderedSame) {
            return @(AWScodeguru-reviewerRepositoryAssociationStateDisassociating);
        }
        return @(AWScodeguru-reviewerRepositoryAssociationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWScodeguru-reviewerRepositoryAssociationStateAssociated:
                return @"Associated";
            case AWScodeguru-reviewerRepositoryAssociationStateAssociating:
                return @"Associating";
            case AWScodeguru-reviewerRepositoryAssociationStateFailed:
                return @"Failed";
            case AWScodeguru-reviewerRepositoryAssociationStateDisassociating:
                return @"Disassociating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWScodeguru-reviewerSourceCodeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitDiff" : @"CommitDiff",
             };
}

+ (NSValueTransformer *)commitDiffJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWScodeguru-reviewerCommitDiffSourceCodeType class]];
}

@end
