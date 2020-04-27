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

FOUNDATION_EXPORT NSString *const AWSaccess-analyzerErrorDomain;

typedef NS_ENUM(NSInteger, AWSaccess-analyzerErrorType) {
    AWSaccess-analyzerErrorUnknown,
    AWSaccess-analyzerErrorAccessDenied,
    AWSaccess-analyzerErrorConflict,
    AWSaccess-analyzerErrorInternalServer,
    AWSaccess-analyzerErrorResourceNotFound,
    AWSaccess-analyzerErrorServiceQuotaExceeded,
    AWSaccess-analyzerErrorThrottling,
    AWSaccess-analyzerErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerAnalyzerStatus) {
    AWSaccess-analyzerAnalyzerStatusUnknown,
    AWSaccess-analyzerAnalyzerStatusActive,
    AWSaccess-analyzerAnalyzerStatusCreating,
    AWSaccess-analyzerAnalyzerStatusDisabled,
    AWSaccess-analyzerAnalyzerStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerFindingSourceType) {
    AWSaccess-analyzerFindingSourceTypeUnknown,
    AWSaccess-analyzerFindingSourceTypeBucketAcl,
    AWSaccess-analyzerFindingSourceTypePolicy,
    AWSaccess-analyzerFindingSourceTypeS3AccessPoint,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerFindingStatus) {
    AWSaccess-analyzerFindingStatusUnknown,
    AWSaccess-analyzerFindingStatusActive,
    AWSaccess-analyzerFindingStatusArchived,
    AWSaccess-analyzerFindingStatusResolved,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerFindingStatusUpdate) {
    AWSaccess-analyzerFindingStatusUpdateUnknown,
    AWSaccess-analyzerFindingStatusUpdateActive,
    AWSaccess-analyzerFindingStatusUpdateArchived,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerOrderBy) {
    AWSaccess-analyzerOrderByUnknown,
    AWSaccess-analyzerOrderByAsc,
    AWSaccess-analyzerOrderByDesc,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerReasonCode) {
    AWSaccess-analyzerReasonCodeUnknown,
    AWSaccess-analyzerReasonCodeAwsServiceAccessDisabled,
    AWSaccess-analyzerReasonCodeDelegatedAdministratorDeregistered,
    AWSaccess-analyzerReasonCodeOrganizationDeleted,
    AWSaccess-analyzerReasonCodeServiceLinkedRoleCreationFailed,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerResourceType) {
    AWSaccess-analyzerResourceTypeUnknown,
    AWSaccess-analyzerResourceTypeAWSIAMRole,
    AWSaccess-analyzerResourceTypeAWSKMSKey,
    AWSaccess-analyzerResourceTypeAWSLambdaFunction,
    AWSaccess-analyzerResourceTypeAWSLambdaLayerVersion,
    AWSaccess-analyzerResourceTypeAWSS3Bucket,
    AWSaccess-analyzerResourceTypeAWSSQSQueue,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerTypes) {
    AWSaccess-analyzerTypesUnknown,
    AWSaccess-analyzerTypesAccount,
    AWSaccess-analyzerTypesOrganization,
};

typedef NS_ENUM(NSInteger, AWSaccess-analyzerValidationExceptionReason) {
    AWSaccess-analyzerValidationExceptionReasonUnknown,
    AWSaccess-analyzerValidationExceptionReasonCannotParse,
    AWSaccess-analyzerValidationExceptionReasonFieldValidationFailed,
    AWSaccess-analyzerValidationExceptionReasonOther,
    AWSaccess-analyzerValidationExceptionReasonUnknownOperation,
};

@class AWSaccess-analyzerAnalyzedResource;
@class AWSaccess-analyzerAnalyzedResourceSummary;
@class AWSaccess-analyzerAnalyzerSummary;
@class AWSaccess-analyzerArchiveRuleSummary;
@class AWSaccess-analyzerCreateAnalyzerRequest;
@class AWSaccess-analyzerCreateAnalyzerResponse;
@class AWSaccess-analyzerCreateArchiveRuleRequest;
@class AWSaccess-analyzerCriterion;
@class AWSaccess-analyzerDeleteAnalyzerRequest;
@class AWSaccess-analyzerDeleteArchiveRuleRequest;
@class AWSaccess-analyzerFinding;
@class AWSaccess-analyzerFindingSource;
@class AWSaccess-analyzerFindingSourceDetail;
@class AWSaccess-analyzerFindingSummary;
@class AWSaccess-analyzerGetAnalyzedResourceRequest;
@class AWSaccess-analyzerGetAnalyzedResourceResponse;
@class AWSaccess-analyzerGetAnalyzerRequest;
@class AWSaccess-analyzerGetAnalyzerResponse;
@class AWSaccess-analyzerGetArchiveRuleRequest;
@class AWSaccess-analyzerGetArchiveRuleResponse;
@class AWSaccess-analyzerGetFindingRequest;
@class AWSaccess-analyzerGetFindingResponse;
@class AWSaccess-analyzerInlineArchiveRule;
@class AWSaccess-analyzerListAnalyzedResourcesRequest;
@class AWSaccess-analyzerListAnalyzedResourcesResponse;
@class AWSaccess-analyzerListAnalyzersRequest;
@class AWSaccess-analyzerListAnalyzersResponse;
@class AWSaccess-analyzerListArchiveRulesRequest;
@class AWSaccess-analyzerListArchiveRulesResponse;
@class AWSaccess-analyzerListFindingsRequest;
@class AWSaccess-analyzerListFindingsResponse;
@class AWSaccess-analyzerListTagsForResourceRequest;
@class AWSaccess-analyzerListTagsForResourceResponse;
@class AWSaccess-analyzerSortCriteria;
@class AWSaccess-analyzerStartResourceScanRequest;
@class AWSaccess-analyzerStatusReason;
@class AWSaccess-analyzerTagResourceRequest;
@class AWSaccess-analyzerTagResourceResponse;
@class AWSaccess-analyzerUntagResourceRequest;
@class AWSaccess-analyzerUntagResourceResponse;
@class AWSaccess-analyzerUpdateArchiveRuleRequest;
@class AWSaccess-analyzerUpdateFindingsRequest;
@class AWSaccess-analyzerValidationExceptionField;

/**
 <p>Contains details about the analyzed resource.</p>
 Required parameters: [analyzedAt, createdAt, isPublic, resourceArn, resourceOwnerAccount, resourceType, updatedAt]
 */
@interface AWSaccess-analyzerAnalyzedResource : AWSModel


/**
 <p>The actions that an external principal is granted permission to use by the policy that generated the finding.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actions;

/**
 <p>The time at which the resource was analyzed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable analyzedAt;

/**
 <p>The time at which the finding was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>An error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable error;

/**
 <p>Indicates whether the policy that generated the finding grants public access to the resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPublic;

/**
 <p>The ARN of the resource that was analyzed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The AWS account ID that owns the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwnerAccount;

/**
 <p>The type of the resource that was analyzed.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerResourceType resourceType;

/**
 <p>Indicates how the access that generated the finding is granted. This is populated for Amazon S3 bucket findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sharedVia;

/**
 <p>The current status of the finding generated from the analyzed resource.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerFindingStatus status;

/**
 <p>The time at which the finding was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Contains the ARN of the analyzed resource.</p>
 Required parameters: [resourceArn, resourceOwnerAccount, resourceType]
 */
@interface AWSaccess-analyzerAnalyzedResourceSummary : AWSModel


/**
 <p>The ARN of the analyzed resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The AWS account ID that owns the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwnerAccount;

/**
 <p>The type of resource that was analyzed.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerResourceType resourceType;

@end

/**
 <p>Contains information about the analyzer.</p>
 Required parameters: [arn, createdAt, name, status, type]
 */
@interface AWSaccess-analyzerAnalyzerSummary : AWSModel


/**
 <p>The ARN of the analyzer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A timestamp for the time at which the analyzer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The resource that was most recently analyzed by the analyzer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastResourceAnalyzed;

/**
 <p>The time at which the most recently analyzed resource was analyzed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastResourceAnalyzedAt;

/**
 <p>The name of the analyzer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the analyzer. An <code>Active</code> analyzer successfully monitors supported resources and generates new findings. The analyzer is <code>Disabled</code> when a user action, such as removing trusted access for IAM Access Analyzer from AWS Organizations, causes the analyzer to stop generating new findings. The status is <code>Creating</code> when the analyzer creation is in progress and <code>Failed</code> when the analyzer creation has failed. </p>
 */
@property (nonatomic, assign) AWSaccess-analyzerAnalyzerStatus status;

/**
 <p>The <code>statusReason</code> provides more details about the current status of the analyzer. For example, if the creation for the analyzer fails, a <code>Failed</code> status is displayed. For an analyzer with organization as the type, this failure can be due to an issue with creating the service-linked roles required in the member accounts of the AWS organization.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerStatusReason * _Nullable statusReason;

/**
 <p>The tags added to the analyzer.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of analyzer, which corresponds to the zone of trust chosen for the analyzer.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerTypes types;

@end

/**
 <p>Contains information about an archive rule.</p>
 Required parameters: [createdAt, filter, ruleName, updatedAt]
 */
@interface AWSaccess-analyzerArchiveRuleSummary : AWSModel


/**
 <p>The time at which the archive rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A filter used to define the archive rule.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSaccess-analyzerCriterion *> * _Nullable filter;

/**
 <p>The name of the archive rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The time at which the archive rule was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Creates an analyzer.</p>
 Required parameters: [analyzerName, type]
 */
@interface AWSaccess-analyzerCreateAnalyzerRequest : AWSRequest


/**
 <p>The name of the analyzer to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>Specifies the archive rules to add for the analyzer. Archive rules automatically archive findings that meet the criteria you define for the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerInlineArchiveRule *> * _Nullable archiveRules;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The tags to apply to the analyzer.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The type of analyzer to create. Only ACCOUNT analyzers are supported. You can create only one analyzer per account per Region.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerTypes types;

@end

/**
 <p>The response to the request to create an analyzer.</p>
 */
@interface AWSaccess-analyzerCreateAnalyzerResponse : AWSModel


/**
 <p>The ARN of the analyzer that was created by the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Creates an archive rule.</p>
 Required parameters: [analyzerName, filter, ruleName]
 */
@interface AWSaccess-analyzerCreateArchiveRuleRequest : AWSRequest


/**
 <p>The name of the created analyzer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The criteria for the rule.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSaccess-analyzerCriterion *> * _Nullable filter;

/**
 <p>The name of the rule to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The criteria to use in the filter that defines the archive rule.</p>
 */
@interface AWSaccess-analyzerCriterion : AWSModel


/**
 <p>A "contains" operator to match for the filter used to create the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contains;

/**
 <p>An "equals" operator to match for the filter used to create the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eq;

/**
 <p>An "exists" operator to match for the filter used to create the rule. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable exists;

/**
 <p>A "not equals" operator to match for the filter used to create the rule.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable neq;

@end

/**
 <p>Deletes an analyzer.</p>
 Required parameters: [analyzerName]
 */
@interface AWSaccess-analyzerDeleteAnalyzerRequest : AWSRequest


/**
 <p>The name of the analyzer to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

@end

/**
 <p>Deletes an archive rule.</p>
 Required parameters: [analyzerName, ruleName]
 */
@interface AWSaccess-analyzerDeleteArchiveRuleRequest : AWSRequest


/**
 <p>The name of the analyzer that associated with the archive rule to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The name of the rule to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Contains information about a finding.</p>
 Required parameters: [analyzedAt, condition, createdAt, id, resourceOwnerAccount, resourceType, status, updatedAt]
 */
@interface AWSaccess-analyzerFinding : AWSModel


/**
 <p>The action in the analyzed policy statement that an external principal has permission to use.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable action;

/**
 <p>The time at which the resource was analyzed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable analyzedAt;

/**
 <p>The condition in the analyzed policy statement that resulted in a finding.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable condition;

/**
 <p>The time at which the finding was generated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>An error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable error;

/**
 <p>The ID of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Indicates whether the policy that generated the finding allows public access to the resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPublic;

/**
 <p>The external principal that access to a resource within the zone of trust.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable principal;

/**
 <p>The resource that an external principal has access to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>The AWS account ID that owns the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwnerAccount;

/**
 <p>The type of the resource reported in the finding.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerResourceType resourceType;

/**
 <p>The sources of the finding. This indicates how the access that generated the finding is granted. It is populated for Amazon S3 bucket findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerFindingSource *> * _Nullable sources;

/**
 <p>The current status of the finding.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerFindingStatus status;

/**
 <p>The time at which the finding was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The source of the finding. This indicates how the access that generated the finding is granted. It is populated for Amazon S3 bucket findings.</p>
 Required parameters: [type]
 */
@interface AWSaccess-analyzerFindingSource : AWSModel


/**
 <p>Includes details about how the access that generated the finding is granted. This is populated for Amazon S3 bucket findings.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerFindingSourceDetail * _Nullable detail;

/**
 <p>Indicates the type of access that generated the finding.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerFindingSourceType types;

@end

/**
 <p>Includes details about how the access that generated the finding is granted. This is populated for Amazon S3 bucket findings.</p>
 */
@interface AWSaccess-analyzerFindingSourceDetail : AWSModel


/**
 <p>The ARN of the access point that generated the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPointArn;

@end

/**
 <p>Contains information about a finding.</p>
 Required parameters: [analyzedAt, condition, createdAt, id, resourceOwnerAccount, resourceType, status, updatedAt]
 */
@interface AWSaccess-analyzerFindingSummary : AWSModel


/**
 <p>The action in the analyzed policy statement that an external principal has permission to use.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable action;

/**
 <p>The time at which the resource-based policy that generated the finding was analyzed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable analyzedAt;

/**
 <p>The condition in the analyzed policy statement that resulted in a finding.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable condition;

/**
 <p>The time at which the finding was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The error that resulted in an Error finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable error;

/**
 <p>The ID of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Indicates whether the finding reports a resource that has a policy that allows public access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPublic;

/**
 <p>The external principal that has access to a resource within the zone of trust.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable principal;

/**
 <p>The resource that the external principal has access to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>The AWS account ID that owns the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwnerAccount;

/**
 <p>The type of the resource that the external principal has access to.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerResourceType resourceType;

/**
 <p>The sources of the finding. This indicates how the access that generated the finding is granted. It is populated for Amazon S3 bucket findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerFindingSource *> * _Nullable sources;

/**
 <p>The status of the finding.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerFindingStatus status;

/**
 <p>The time at which the finding was most recently updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>Retrieves an analyzed resource.</p>
 Required parameters: [analyzerArn, resourceArn]
 */
@interface AWSaccess-analyzerGetAnalyzedResourceRequest : AWSRequest


/**
 <p>The ARN of the analyzer to retrieve information from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>The ARN of the resource to retrieve information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>The response to the request.</p>
 */
@interface AWSaccess-analyzerGetAnalyzedResourceResponse : AWSModel


/**
 <p>An <code>AnalyedResource</code> object that contains information that Access Analyzer found when it analyzed the resource.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerAnalyzedResource * _Nullable resource;

@end

/**
 <p>Retrieves an analyzer.</p>
 Required parameters: [analyzerName]
 */
@interface AWSaccess-analyzerGetAnalyzerRequest : AWSRequest


/**
 <p>The name of the analyzer retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [analyzer]
 */
@interface AWSaccess-analyzerGetAnalyzerResponse : AWSModel


/**
 <p>An <code>AnalyzerSummary</code> object that contains information about the analyzer.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerAnalyzerSummary * _Nullable analyzer;

@end

/**
 <p>Retrieves an archive rule.</p>
 Required parameters: [analyzerName, ruleName]
 */
@interface AWSaccess-analyzerGetArchiveRuleRequest : AWSRequest


/**
 <p>The name of the analyzer to retrieve rules from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>The name of the rule to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [archiveRule]
 */
@interface AWSaccess-analyzerGetArchiveRuleResponse : AWSModel


/**
 <p>Contains information about an archive rule.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerArchiveRuleSummary * _Nullable archiveRule;

@end

/**
 <p>Retrieves a finding.</p>
 Required parameters: [analyzerArn, id]
 */
@interface AWSaccess-analyzerGetFindingRequest : AWSRequest


/**
 <p>The ARN of the analyzer that generated the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>The ID of the finding to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The response to the request.</p>
 */
@interface AWSaccess-analyzerGetFindingResponse : AWSModel


/**
 <p>A <code>finding</code> object that contains finding details.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerFinding * _Nullable finding;

@end

/**
 <p>An criterion statement in an archive rule. Each archive rule may have multiple criteria.</p>
 Required parameters: [filter, ruleName]
 */
@interface AWSaccess-analyzerInlineArchiveRule : AWSModel


/**
 <p>The condition and values for a criterion.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSaccess-analyzerCriterion *> * _Nullable filter;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Retrieves a list of resources that have been analyzed.</p>
 Required parameters: [analyzerArn]
 */
@interface AWSaccess-analyzerListAnalyzedResourcesRequest : AWSRequest


/**
 <p>The ARN of the analyzer to retrieve a list of analyzed resources from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of resource.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerResourceType resourceType;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [analyzedResources]
 */
@interface AWSaccess-analyzerListAnalyzedResourcesResponse : AWSModel


/**
 <p>A list of resources that were analyzed.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerAnalyzedResourceSummary *> * _Nullable analyzedResources;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieves a list of analyzers.</p>
 */
@interface AWSaccess-analyzerListAnalyzersRequest : AWSRequest


/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The type of analyzer.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerTypes types;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [analyzers]
 */
@interface AWSaccess-analyzerListAnalyzersResponse : AWSModel


/**
 <p>The analyzers retrieved.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerAnalyzerSummary *> * _Nullable analyzers;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieves a list of archive rules created for the specified analyzer.</p>
 Required parameters: [analyzerName]
 */
@interface AWSaccess-analyzerListArchiveRulesRequest : AWSRequest


/**
 <p>The name of the analyzer to retrieve rules from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>The maximum number of results to return in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [archiveRules]
 */
@interface AWSaccess-analyzerListArchiveRulesResponse : AWSModel


/**
 <p>A list of archive rules created for the specified analyzer.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerArchiveRuleSummary *> * _Nullable archiveRules;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieves a list of findings generated by the specified analyzer.</p>
 Required parameters: [analyzerArn]
 */
@interface AWSaccess-analyzerListFindingsRequest : AWSRequest


/**
 <p>The ARN of the analyzer to retrieve findings from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>A filter to match for the findings to return.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSaccess-analyzerCriterion *> * _Nullable filter;

/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The sort order for the findings returned.</p>
 */
@property (nonatomic, strong) AWSaccess-analyzerSortCriteria * _Nullable sort;

@end

/**
 <p>The response to the request.</p>
 Required parameters: [findings]
 */
@interface AWSaccess-analyzerListFindingsResponse : AWSModel


/**
 <p>A list of findings retrieved from the analyzer that match the filter criteria specified, if any.</p>
 */
@property (nonatomic, strong) NSArray<AWSaccess-analyzerFindingSummary *> * _Nullable findings;

/**
 <p>A token used for pagination of results returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Retrieves a list of tags applied to the specified resource.</p>
 Required parameters: [resourceArn]
 */
@interface AWSaccess-analyzerListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to retrieve tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>The response to the request.</p>
 */
@interface AWSaccess-analyzerListTagsForResourceResponse : AWSModel


/**
 <p>The tags that are applied to the specified resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The criteria used to sort.</p>
 */
@interface AWSaccess-analyzerSortCriteria : AWSModel


/**
 <p>The name of the attribute to sort on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The sort order, ascending or descending.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerOrderBy orderBy;

@end

/**
 <p>Starts a scan of the policies applied to the specified resource.</p>
 Required parameters: [analyzerArn, resourceArn]
 */
@interface AWSaccess-analyzerStartResourceScanRequest : AWSRequest


/**
 <p>The ARN of the analyzer to use to scan the policies applied to the specified resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>The ARN of the resource to scan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>Provides more details about the current status of the analyzer. For example, if the creation for the analyzer fails, a <code>Failed</code> status is displayed. For an analyzer with organization as the type, this failure can be due to an issue with creating the service-linked roles required in the member accounts of the AWS organization.</p>
 Required parameters: [code]
 */
@interface AWSaccess-analyzerStatusReason : AWSModel


/**
 <p>The reason code for the current status of the analyzer.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerReasonCode code;

@end

/**
 <p>Adds a tag to the specified resource.</p>
 Required parameters: [resourceArn, tags]
 */
@interface AWSaccess-analyzerTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to add the tag to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The response to the request.</p>
 */
@interface AWSaccess-analyzerTagResourceResponse : AWSModel


@end

/**
 <p>Removes a tag from the specified resource.</p>
 Required parameters: [resourceArn, tagKeys]
 */
@interface AWSaccess-analyzerUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource to remove the tag from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The key for the tag to add.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>The response to the request.</p>
 */
@interface AWSaccess-analyzerUntagResourceResponse : AWSModel


@end

/**
 <p>Updates the specified archive rule.</p>
 Required parameters: [analyzerName, filter, ruleName]
 */
@interface AWSaccess-analyzerUpdateArchiveRuleRequest : AWSRequest


/**
 <p>The name of the analyzer to update the archive rules for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerName;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A filter to match for the rules to update. Only rules that match the filter are updated.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSaccess-analyzerCriterion *> * _Nullable filter;

/**
 <p>The name of the rule to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Updates findings with the new values provided in the request.</p>
 Required parameters: [analyzerArn, status]
 */
@interface AWSaccess-analyzerUpdateFindingsRequest : AWSRequest


/**
 <p>The ARN of the analyzer that generated the findings to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzerArn;

/**
 <p>A client token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The IDs of the findings to update.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>The ARN of the resource identified in the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The state represents the action to take to update the finding Status. Use <code>ARCHIVE</code> to change an Active finding to an Archived finding. Use <code>ACTIVE</code> to change an Archived finding to an Active finding.</p>
 */
@property (nonatomic, assign) AWSaccess-analyzerFindingStatusUpdate status;

@end

/**
 <p>Contains information about a validation exception.</p>
 Required parameters: [message, name]
 */
@interface AWSaccess-analyzerValidationExceptionField : AWSModel


/**
 <p>A message about the validation exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name of the validation exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

NS_ASSUME_NONNULL_END
