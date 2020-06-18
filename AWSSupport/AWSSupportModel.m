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

#import "AWSSupportModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSupportErrorDomain = @"com.amazonaws.AWSSupportErrorDomain";

@implementation AWSSupportAddAttachmentsToSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"attachments" : @"attachments",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportAttachment class]];
}

@end

@implementation AWSSupportAddAttachmentsToSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"expiryTime" : @"expiryTime",
             };
}

@end

@implementation AWSSupportAddCommunicationToCaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentSetId" : @"attachmentSetId",
             @"caseId" : @"caseId",
             @"ccEmailAddresses" : @"ccEmailAddresses",
             @"communicationBody" : @"communicationBody",
             };
}

@end

@implementation AWSSupportAddCommunicationToCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"result" : @"result",
             };
}

@end

@implementation AWSSupportAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"data",
             @"fileName" : @"fileName",
             };
}

@end

@implementation AWSSupportAttachmentDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"attachmentId",
             @"fileName" : @"fileName",
             };
}

@end

@implementation AWSSupportCaseDetails

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportRecentCaseCommunications class]];
}

@end

@implementation AWSSupportCategory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"name" : @"name",
             };
}

@end

@implementation AWSSupportCommunication

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportAttachmentDetails class]];
}

@end

@implementation AWSSupportCreateCaseRequest

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

@implementation AWSSupportCreateCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseId" : @"caseId",
             };
}

@end

@implementation AWSSupportDescribeAttachmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"attachmentId",
             };
}

@end

@implementation AWSSupportDescribeAttachmentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"attachment",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportAttachment class]];
}

@end

@implementation AWSSupportDescribeCasesRequest

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

@implementation AWSSupportDescribeCasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cases" : @"cases",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)casesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportCaseDetails class]];
}

@end

@implementation AWSSupportDescribeCommunicationsRequest

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

@implementation AWSSupportDescribeCommunicationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"communications" : @"communications",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)communicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportCommunication class]];
}

@end

@implementation AWSSupportDescribeServicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             @"serviceCodeList" : @"serviceCodeList",
             };
}

@end

@implementation AWSSupportDescribeServicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"services" : @"services",
             };
}

+ (NSValueTransformer *)servicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportService class]];
}

@end

@implementation AWSSupportDescribeSeverityLevelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             };
}

@end

@implementation AWSSupportDescribeSeverityLevelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"severityLevels" : @"severityLevels",
             };
}

+ (NSValueTransformer *)severityLevelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportSeverityLevel class]];
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkIds" : @"checkIds",
             };
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statuses" : @"statuses",
             };
}

+ (NSValueTransformer *)statusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportTrustedAdvisorCheckRefreshStatus class]];
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckResultRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             @"language" : @"language",
             };
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckResultResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"result" : @"result",
             };
}

+ (NSValueTransformer *)resultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorCheckResult class]];
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckSummariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkIds" : @"checkIds",
             };
}

@end

@implementation AWSSupportDescribeTrustedAdvisorCheckSummariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"summaries" : @"summaries",
             };
}

+ (NSValueTransformer *)summariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportTrustedAdvisorCheckSummary class]];
}

@end

@implementation AWSSupportDescribeTrustedAdvisorChecksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"language",
             };
}

@end

@implementation AWSSupportDescribeTrustedAdvisorChecksResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checks" : @"checks",
             };
}

+ (NSValueTransformer *)checksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportTrustedAdvisorCheckDescription class]];
}

@end

@implementation AWSSupportRecentCaseCommunications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"communications" : @"communications",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)communicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportCommunication class]];
}

@end

@implementation AWSSupportRefreshTrustedAdvisorCheckRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             };
}

@end

@implementation AWSSupportRefreshTrustedAdvisorCheckResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorCheckRefreshStatus class]];
}

@end

@implementation AWSSupportResolveCaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseId" : @"caseId",
             };
}

@end

@implementation AWSSupportResolveCaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finalCaseStatus" : @"finalCaseStatus",
             @"initialCaseStatus" : @"initialCaseStatus",
             };
}

@end

@implementation AWSSupportService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"categories" : @"categories",
             @"code" : @"code",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)categoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportCategory class]];
}

@end

@implementation AWSSupportSeverityLevel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"name" : @"name",
             };
}

@end

@implementation AWSSupportTrustedAdvisorCategorySpecificSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"costOptimizing" : @"costOptimizing",
             };
}

+ (NSValueTransformer *)costOptimizingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorCostOptimizingSummary class]];
}

@end

@implementation AWSSupportTrustedAdvisorCheckDescription

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

@implementation AWSSupportTrustedAdvisorCheckRefreshStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checkId" : @"checkId",
             @"millisUntilNextRefreshable" : @"millisUntilNextRefreshable",
             @"status" : @"status",
             };
}

@end

@implementation AWSSupportTrustedAdvisorCheckResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorCategorySpecificSummary class]];
}

+ (NSValueTransformer *)flaggedResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSupportTrustedAdvisorResourceDetail class]];
}

+ (NSValueTransformer *)resourcesSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorResourcesSummary class]];
}

@end

@implementation AWSSupportTrustedAdvisorCheckSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorCategorySpecificSummary class]];
}

+ (NSValueTransformer *)resourcesSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSupportTrustedAdvisorResourcesSummary class]];
}

@end

@implementation AWSSupportTrustedAdvisorCostOptimizingSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"estimatedMonthlySavings" : @"estimatedMonthlySavings",
             @"estimatedPercentMonthlySavings" : @"estimatedPercentMonthlySavings",
             };
}

@end

@implementation AWSSupportTrustedAdvisorResourceDetail

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

@implementation AWSSupportTrustedAdvisorResourcesSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcesFlagged" : @"resourcesFlagged",
             @"resourcesIgnored" : @"resourcesIgnored",
             @"resourcesProcessed" : @"resourcesProcessed",
             @"resourcesSuppressed" : @"resourcesSuppressed",
             };
}

@end
