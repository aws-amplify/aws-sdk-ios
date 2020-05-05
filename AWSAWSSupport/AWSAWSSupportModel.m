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

#import "AWSAWSSupportModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAWSSupportErrorDomain = @"com.amazonaws.AWSAWSSupportErrorDomain";

@implementation AWSAWSSupportAddAttachmentsToSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"attachments" : @"attachments",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportAttachment class]];
}

@end

@implementation AWSAWSSupportAddAttachmentsToSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"expiryTime" : @"expiryTime",
             };
}

@end

@implementation AWSAWSSupportAddCommunicationToCaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"caseId" : @"caseId",
             @"ccEmailAddresses" : @"ccEmailAddresses",
             @"communicationBody" : @"communicationBody",
             };
}

@end

@implementation AWSAWSSupportAddCommunicationToCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"result" : @"result",
             };
}

@end

@implementation AWSAWSSupportAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"data",
             @"fileName" : @"fileName",
             };
}

@end

@implementation AWSAWSSupportAttachmentDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"attachmentId",
             @"fileName" : @"fileName",
             };
}

@end

@implementation AWSAWSSupportCaseDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseId" : @"caseId",
             @"categoryCode" : @"categoryCode",
             @"ccEmailAddresses" : @"ccEmailAddresses",
             @"displayId" : @"displayId",
             @"language" : @"language",
             @"recentCommunications" : @"recentCommunications",
             @"serviceCode" : @"serviceCode",
             @"severityCode" : @"severityCode",
             @"status" : @"status",
             @"subject" : @"subject",
             @"submittedBy" : @"submittedBy",
             @"timeCreated" : @"timeCreated",
             };
}

+ (NSValueTransformer *)recentCommunicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportRecentCaseCommunications class]];
}

@end

@implementation AWSAWSSupportCategory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"name" : @"name",
             };
}

@end

@implementation AWSAWSSupportCommunication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSet" : @"attachmentSet",
             @"body" : @"body",
             @"caseId" : @"caseId",
             @"submittedBy" : @"submittedBy",
             @"timeCreated" : @"timeCreated",
             };
}

+ (NSValueTransformer *)attachmentSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportAttachmentDetails class]];
}

@end

@implementation AWSAWSSupportCreateCaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"categoryCode" : @"categoryCode",
             @"ccEmailAddresses" : @"ccEmailAddresses",
             @"communicationBody" : @"communicationBody",
             @"issueType" : @"issueType",
             @"language" : @"language",
             @"serviceCode" : @"serviceCode",
             @"severityCode" : @"severityCode",
             @"subject" : @"subject",
             };
}

@end

@implementation AWSAWSSupportCreateCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseId" : @"caseId",
             };
}

@end

@implementation AWSAWSSupportDescribeAttachmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"attachmentId",
             };
}

@end

@implementation AWSAWSSupportDescribeAttachmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"attachment",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportAttachment class]];
}

@end

@implementation AWSAWSSupportDescribeCasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterTime" : @"afterTime",
             @"beforeTime" : @"beforeTime",
             @"caseIdList" : @"caseIdList",
             @"displayId" : @"displayId",
             @"includeCommunications" : @"includeCommunications",
             @"includeResolvedCases" : @"includeResolvedCases",
             @"language" : @"language",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAWSSupportDescribeCasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cases" : @"cases",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)casesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportCaseDetails class]];
}

@end

@implementation AWSAWSSupportDescribeCommunicationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterTime" : @"afterTime",
             @"beforeTime" : @"beforeTime",
             @"caseId" : @"caseId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSAWSSupportDescribeCommunicationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"communications" : @"communications",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)communicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportCommunication class]];
}

@end

@implementation AWSAWSSupportDescribeServicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             @"serviceCodeList" : @"serviceCodeList",
             };
}

@end

@implementation AWSAWSSupportDescribeServicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"services" : @"services",
             };
}

+ (NSValueTransformer *)servicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportService class]];
}

@end

@implementation AWSAWSSupportDescribeSeverityLevelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             };
}

@end

@implementation AWSAWSSupportDescribeSeverityLevelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"severityLevels" : @"severityLevels",
             };
}

+ (NSValueTransformer *)severityLevelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportSeverityLevel class]];
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkIds" : @"checkIds",
             };
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statuses" : @"statuses",
             };
}

+ (NSValueTransformer *)statusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCheckRefreshStatus class]];
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             @"language" : @"language",
             };
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"result" : @"result",
             };
}

+ (NSValueTransformer *)resultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCheckResult class]];
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkIds" : @"checkIds",
             };
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"summaries" : @"summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCheckSummary class]];
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorChecksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             };
}

@end

@implementation AWSAWSSupportDescribeTrustedAdvisorChecksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checks" : @"checks",
             };
}

+ (NSValueTransformer *)checksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCheckDescription class]];
}

@end

@implementation AWSAWSSupportRecentCaseCommunications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"communications" : @"communications",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)communicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportCommunication class]];
}

@end

@implementation AWSAWSSupportRefreshTrustedAdvisorCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             };
}

@end

@implementation AWSAWSSupportRefreshTrustedAdvisorCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCheckRefreshStatus class]];
}

@end

@implementation AWSAWSSupportResolveCaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseId" : @"caseId",
             };
}

@end

@implementation AWSAWSSupportResolveCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalCaseStatus" : @"finalCaseStatus",
             @"initialCaseStatus" : @"initialCaseStatus",
             };
}

@end

@implementation AWSAWSSupportService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categories" : @"categories",
             @"code" : @"code",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)categoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportCategory class]];
}

@end

@implementation AWSAWSSupportSeverityLevel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"name" : @"name",
             };
}

@end

@implementation AWSAWSSupportTrustedAdvisorCategorySpecificSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costOptimizing" : @"costOptimizing",
             };
}

+ (NSValueTransformer *)costOptimizingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCostOptimizingSummary class]];
}

@end

@implementation AWSAWSSupportTrustedAdvisorCheckDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"category",
             @"detail" : @"description",
             @"identifier" : @"id",
             @"metadata" : @"metadata",
             @"name" : @"name",
             };
}

@end

@implementation AWSAWSSupportTrustedAdvisorCheckRefreshStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             @"millisUntilNextRefreshable" : @"millisUntilNextRefreshable",
             @"status" : @"status",
             };
}

@end

@implementation AWSAWSSupportTrustedAdvisorCheckResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categorySpecificSummary" : @"categorySpecificSummary",
             @"checkId" : @"checkId",
             @"flaggedResources" : @"flaggedResources",
             @"resourcesSummary" : @"resourcesSummary",
             @"status" : @"status",
             @"timestamp" : @"timestamp",
             };
}

+ (NSValueTransformer *)categorySpecificSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCategorySpecificSummary class]];
}

+ (NSValueTransformer *)flaggedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorResourceDetail class]];
}

+ (NSValueTransformer *)resourcesSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorResourcesSummary class]];
}

@end

@implementation AWSAWSSupportTrustedAdvisorCheckSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categorySpecificSummary" : @"categorySpecificSummary",
             @"checkId" : @"checkId",
             @"hasFlaggedResources" : @"hasFlaggedResources",
             @"resourcesSummary" : @"resourcesSummary",
             @"status" : @"status",
             @"timestamp" : @"timestamp",
             };
}

+ (NSValueTransformer *)categorySpecificSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorCategorySpecificSummary class]];
}

+ (NSValueTransformer *)resourcesSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSSupportTrustedAdvisorResourcesSummary class]];
}

@end

@implementation AWSAWSSupportTrustedAdvisorCostOptimizingSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"estimatedMonthlySavings" : @"estimatedMonthlySavings",
             @"estimatedPercentMonthlySavings" : @"estimatedPercentMonthlySavings",
             };
}

@end

@implementation AWSAWSSupportTrustedAdvisorResourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isSuppressed" : @"isSuppressed",
             @"metadata" : @"metadata",
             @"region" : @"region",
             @"resourceId" : @"resourceId",
             @"status" : @"status",
             };
}

@end

@implementation AWSAWSSupportTrustedAdvisorResourcesSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcesFlagged" : @"resourcesFlagged",
             @"resourcesIgnored" : @"resourcesIgnored",
             @"resourcesProcessed" : @"resourcesProcessed",
             @"resourcesSuppressed" : @"resourcesSuppressed",
             };
}

@end
