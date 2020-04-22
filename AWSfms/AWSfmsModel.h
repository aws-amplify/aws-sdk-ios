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

FOUNDATION_EXPORT NSString *const AWSfmsErrorDomain;

typedef NS_ENUM(NSInteger, AWSfmsErrorType) {
    AWSfmsErrorUnknown,
    AWSfmsErrorInternalError,
    AWSfmsErrorInvalidInput,
    AWSfmsErrorInvalidOperation,
    AWSfmsErrorInvalidType,
    AWSfmsErrorLimitExceeded,
    AWSfmsErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSfmsAccountRoleStatus) {
    AWSfmsAccountRoleStatusUnknown,
    AWSfmsAccountRoleStatusReady,
    AWSfmsAccountRoleStatusCreating,
    AWSfmsAccountRoleStatusPendingDeletion,
    AWSfmsAccountRoleStatusDeleting,
    AWSfmsAccountRoleStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSfmsCustomerPolicyScopeIdType) {
    AWSfmsCustomerPolicyScopeIdTypeUnknown,
    AWSfmsCustomerPolicyScopeIdTypeAccount,
    AWSfmsCustomerPolicyScopeIdTypeOrgUnit,
};

typedef NS_ENUM(NSInteger, AWSfmsDependentServiceName) {
    AWSfmsDependentServiceNameUnknown,
    AWSfmsDependentServiceNameAwsconfig,
    AWSfmsDependentServiceNameAwswaf,
    AWSfmsDependentServiceNameAwsshieldAdvanced,
    AWSfmsDependentServiceNameAwsvpc,
};

typedef NS_ENUM(NSInteger, AWSfmsPolicyComplianceStatusType) {
    AWSfmsPolicyComplianceStatusTypeUnknown,
    AWSfmsPolicyComplianceStatusTypeCompliant,
    AWSfmsPolicyComplianceStatusTypeNonCompliant,
};

typedef NS_ENUM(NSInteger, AWSfmsSecurityServiceType) {
    AWSfmsSecurityServiceTypeUnknown,
    AWSfmsSecurityServiceTypeWaf,
    AWSfmsSecurityServiceTypeWafv2,
    AWSfmsSecurityServiceTypeShieldAdvanced,
    AWSfmsSecurityServiceTypeSecurityGroupsCommon,
    AWSfmsSecurityServiceTypeSecurityGroupsContentAudit,
    AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit,
};

typedef NS_ENUM(NSInteger, AWSfmsViolationReason) {
    AWSfmsViolationReasonUnknown,
    AWSfmsViolationReasonWebAclMissingRuleGroup,
    AWSfmsViolationReasonResourceMissingWebAcl,
    AWSfmsViolationReasonResourceIncorrectWebAcl,
    AWSfmsViolationReasonResourceMissingShieldProtection,
    AWSfmsViolationReasonResourceMissingWebAclOrShieldProtection,
    AWSfmsViolationReasonResourceMissingSecurityGroup,
    AWSfmsViolationReasonResourceViolatesAuditSecurityGroup,
    AWSfmsViolationReasonSecurityGroupUnused,
    AWSfmsViolationReasonSecurityGroupRedundant,
};

@class AWSfmsAssociateAdminAccountRequest;
@class AWSfmsComplianceViolator;
@class AWSfmsDeleteNotificationChannelRequest;
@class AWSfmsDeletePolicyRequest;
@class AWSfmsDisassociateAdminAccountRequest;
@class AWSfmsEvaluationResult;
@class AWSfmsGetAdminAccountRequest;
@class AWSfmsGetAdminAccountResponse;
@class AWSfmsGetComplianceDetailRequest;
@class AWSfmsGetComplianceDetailResponse;
@class AWSfmsGetNotificationChannelRequest;
@class AWSfmsGetNotificationChannelResponse;
@class AWSfmsGetPolicyRequest;
@class AWSfmsGetPolicyResponse;
@class AWSfmsGetProtectionStatusRequest;
@class AWSfmsGetProtectionStatusResponse;
@class AWSfmsListComplianceStatusRequest;
@class AWSfmsListComplianceStatusResponse;
@class AWSfmsListMemberAccountsRequest;
@class AWSfmsListMemberAccountsResponse;
@class AWSfmsListPoliciesRequest;
@class AWSfmsListPoliciesResponse;
@class AWSfmsListTagsForResourceRequest;
@class AWSfmsListTagsForResourceResponse;
@class AWSfmsPolicy;
@class AWSfmsPolicyComplianceDetail;
@class AWSfmsPolicyComplianceStatus;
@class AWSfmsPolicySummary;
@class AWSfmsPutNotificationChannelRequest;
@class AWSfmsPutPolicyRequest;
@class AWSfmsPutPolicyResponse;
@class AWSfmsResourceTag;
@class AWSfmsSecurityServicePolicyData;
@class AWSfmsTag;
@class AWSfmsTagResourceRequest;
@class AWSfmsTagResourceResponse;
@class AWSfmsUntagResourceRequest;
@class AWSfmsUntagResourceResponse;

/**
 
 */
@interface AWSfmsAssociateAdminAccountRequest : AWSRequest


/**
 <p>The AWS account ID to associate with AWS Firewall Manager as the AWS Firewall Manager administrator account. This can be an AWS Organizations master account or a member account. For more information about AWS Organizations and master accounts, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html">Managing the AWS Accounts in Your Organization</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccount;

@end

/**
 <p>Details of the resource that is not protected by the policy.</p>
 */
@interface AWSfmsComplianceViolator : AWSModel


/**
 <p>The resource ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The resource type. This is in the format shown in the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS Resource Types Reference</a>. For example: <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> or <code>AWS::CloudFront::Distribution</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The reason that the resource is not protected by the policy.</p>
 */
@property (nonatomic, assign) AWSfmsViolationReason violationReason;

@end

/**
 
 */
@interface AWSfmsDeleteNotificationChannelRequest : AWSRequest


@end

/**
 
 */
@interface AWSfmsDeletePolicyRequest : AWSRequest


/**
 <p>If <code>True</code>, the request performs cleanup according to the policy type. </p><p>For AWS WAF and Shield Advanced policies, the cleanup does the following:</p><ul><li><p>Deletes rule groups created by AWS Firewall Manager</p></li><li><p>Removes web ACLs from in-scope resources</p></li><li><p>Deletes web ACLs that contain no rules or rule groups</p></li></ul><p>For security group policies, the cleanup does the following for each security group in the policy:</p><ul><li><p>Disassociates the security group from in-scope resources </p></li><li><p>Deletes the security group if it was created through Firewall Manager and if it's no longer associated with any resources through another policy</p></li></ul><p>After the cleanup, in-scope resources are no longer protected by web ACLs in this policy. Protection of out-of-scope resources remains unchanged. Scope is determined by tags that you create and accounts that you associate with the policy. When creating the policy, if you specify that only resources in specific accounts or with specific tags are in scope of the policy, those accounts and resources are handled by the policy. All others are out of scope. If you don't specify tags or accounts, all resources are in scope. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAllPolicyResources;

/**
 <p>The ID of the policy that you want to delete. <code>PolicyId</code> is returned by <code>PutPolicy</code> and by <code>ListPolicies</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSfmsDisassociateAdminAccountRequest : AWSRequest


@end

/**
 <p>Describes the compliance status for the account. An account is considered noncompliant if it includes resources that are not protected by the specified policy or that don't comply with the policy.</p>
 */
@interface AWSfmsEvaluationResult : AWSModel


/**
 <p>Describes an AWS account's compliance with the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, assign) AWSfmsPolicyComplianceStatusType complianceStatus;

/**
 <p>Indicates that over 100 resources are noncompliant with the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationLimitExceeded;

/**
 <p>The number of resources that are noncompliant with the specified policy. For AWS WAF and Shield Advanced policies, a resource is considered noncompliant if it is not associated with the policy. For security group policies, a resource is considered noncompliant if it doesn't comply with the rules of the policy and remediation is disabled or not possible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable violatorCount;

@end

/**
 
 */
@interface AWSfmsGetAdminAccountRequest : AWSRequest


@end

/**
 
 */
@interface AWSfmsGetAdminAccountResponse : AWSModel


/**
 <p>The AWS account that is set as the AWS Firewall Manager administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccount;

/**
 <p>The status of the AWS account that you set as the AWS Firewall Manager administrator.</p>
 */
@property (nonatomic, assign) AWSfmsAccountRoleStatus roleStatus;

@end

/**
 
 */
@interface AWSfmsGetComplianceDetailRequest : AWSRequest


/**
 <p>The AWS account that owns the resources that you want to get the details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccount;

/**
 <p>The ID of the policy that you want to get the details for. <code>PolicyId</code> is returned by <code>PutPolicy</code> and by <code>ListPolicies</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSfmsGetComplianceDetailResponse : AWSModel


/**
 <p>Information about the resources and the policy that you specified in the <code>GetComplianceDetail</code> request.</p>
 */
@property (nonatomic, strong) AWSfmsPolicyComplianceDetail * _Nullable policyComplianceDetail;

@end

/**
 
 */
@interface AWSfmsGetNotificationChannelRequest : AWSRequest


@end

/**
 
 */
@interface AWSfmsGetNotificationChannelResponse : AWSModel


/**
 <p>The IAM role that is used by AWS Firewall Manager to record activity to SNS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsRoleName;

/**
 <p>The SNS topic that records AWS Firewall Manager activity. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

@end

/**
 
 */
@interface AWSfmsGetPolicyRequest : AWSRequest


/**
 <p>The ID of the AWS Firewall Manager policy that you want the details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSfmsGetPolicyResponse : AWSModel


/**
 <p>Information about the specified AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) AWSfmsPolicy * _Nullable policy;

/**
 <p>The Amazon Resource Name (ARN) of the specified policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSfmsGetProtectionStatusRequest : AWSRequest


/**
 <p>The end of the time period to query for the attacks. This is a <code>timestamp</code> type. The request syntax listing indicates a <code>number</code> type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid <code>timestamp</code> format is allowed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>Specifies the number of objects that you want AWS Firewall Manager to return for this request. If you have more objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The AWS account that is in scope of the policy that you want to get the details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

/**
 <p>If you specify a value for <code>MaxResults</code> and you have more objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response, which you can use to retrieve another group of objects. For the second and subsequent <code>GetProtectionStatus</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the policy for which you want to get the attack information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The start of the time period to query for the attacks. This is a <code>timestamp</code> type. The request syntax listing indicates a <code>number</code> type because the default used by AWS Firewall Manager is Unix time in seconds. However, any valid <code>timestamp</code> format is allowed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSfmsGetProtectionStatusResponse : AWSModel


/**
 <p>The ID of the AWS Firewall administrator account for this policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

/**
 <p>Details about the attack, including the following:</p><ul><li><p>Attack type</p></li><li><p>Account ID</p></li><li><p>ARN of the resource attacked</p></li><li><p>Start time of the attack</p></li><li><p>End time of the attack (ongoing attacks will not have an end time)</p></li></ul><p>The details are in JSON format. </p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

/**
 <p>If you have more objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more objects, submit another <code>GetProtectionStatus</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p><p>AWS SDKs provide auto-pagination that identify <code>NextToken</code> in a response and make subsequent request calls automatically on your behalf. However, this feature is not supported by <code>GetProtectionStatus</code>. You must submit subsequent requests with <code>NextToken</code> using your own processes. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The service type that is protected by the policy. Currently, this is always <code>SHIELD_ADVANCED</code>.</p>
 */
@property (nonatomic, assign) AWSfmsSecurityServiceType serviceType;

@end

/**
 
 */
@interface AWSfmsListComplianceStatusRequest : AWSRequest


/**
 <p>Specifies the number of <code>PolicyComplianceStatus</code> objects that you want AWS Firewall Manager to return for this request. If you have more <code>PolicyComplianceStatus</code> objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of <code>PolicyComplianceStatus</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify a value for <code>MaxResults</code> and you have more <code>PolicyComplianceStatus</code> objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of <code>PolicyComplianceStatus</code> objects. For the second and subsequent <code>ListComplianceStatus</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of <code>PolicyComplianceStatus</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the AWS Firewall Manager policy that you want the details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSfmsListComplianceStatusResponse : AWSModel


/**
 <p>If you have more <code>PolicyComplianceStatus</code> objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more <code>PolicyComplianceStatus</code> objects, submit another <code>ListComplianceStatus</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>PolicyComplianceStatus</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsPolicyComplianceStatus *> * _Nullable policyComplianceStatusList;

@end

/**
 
 */
@interface AWSfmsListMemberAccountsRequest : AWSRequest


/**
 <p>Specifies the number of member account IDs that you want AWS Firewall Manager to return for this request. If you have more IDs than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of member account IDs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify a value for <code>MaxResults</code> and you have more account IDs than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of IDs. For the second and subsequent <code>ListMemberAccountsRequest</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of member account IDs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfmsListMemberAccountsResponse : AWSModel


/**
 <p>An array of account IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable memberAccounts;

/**
 <p>If you have more member account IDs than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more IDs, submit another <code>ListMemberAccounts</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfmsListPoliciesRequest : AWSRequest


/**
 <p>Specifies the number of <code>PolicySummary</code> objects that you want AWS Firewall Manager to return for this request. If you have more <code>PolicySummary</code> objects than the number that you specify for <code>MaxResults</code>, the response includes a <code>NextToken</code> value that you can use to get another batch of <code>PolicySummary</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify a value for <code>MaxResults</code> and you have more <code>PolicySummary</code> objects than the number that you specify for <code>MaxResults</code>, AWS Firewall Manager returns a <code>NextToken</code> value in the response that allows you to list another group of <code>PolicySummary</code> objects. For the second and subsequent <code>ListPolicies</code> requests, specify the value of <code>NextToken</code> from the previous response to get information about another batch of <code>PolicySummary</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSfmsListPoliciesResponse : AWSModel


/**
 <p>If you have more <code>PolicySummary</code> objects than the number that you specified for <code>MaxResults</code> in the request, the response includes a <code>NextToken</code> value. To list more <code>PolicySummary</code> objects, submit another <code>ListPolicies</code> request, and specify the <code>NextToken</code> value from the response in the <code>NextToken</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>PolicySummary</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsPolicySummary *> * _Nullable policyList;

@end

/**
 
 */
@interface AWSfmsListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to return tags for. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN..</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSfmsListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsTag *> * _Nullable tagList;

@end

/**
 <p>An AWS Firewall Manager policy.</p>
 Required parameters: [PolicyName, SecurityServicePolicyData, ResourceType, ExcludeResourceTags, RemediationEnabled]
 */
@interface AWSfmsPolicy : AWSModel


/**
 <p>Specifies the AWS account IDs and AWS Organizations organizational units (OUs) to exclude from the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.</p><p>You can specify inclusions or exclusions, but not both. If you specify an <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all accounts specified by the <code>IncludeMap</code>, and does not evaluate any <code>ExcludeMap</code> specifications. If you do not specify an <code>IncludeMap</code>, then Firewall Manager applies the policy to all accounts except for those specified by the <code>ExcludeMap</code>.</p><p>You can specify account IDs, OUs, or a combination: </p><ul><li><p>Specify account IDs by setting the key to <code>ACCOUNT</code>. For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”, “accountID2”]}</code>.</p></li><li><p>Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the following is a valid map: <code>{“ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.</p></li><li><p>Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”, “accountID2”], “ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable excludeMap;

/**
 <p>If set to <code>True</code>, resources with the tags that are specified in the <code>ResourceTag</code> array are not in scope of the policy. If set to <code>False</code>, and the <code>ResourceTag</code> array is not null, only resources with the specified tags are in scope of the policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeResourceTags;

/**
 <p>Specifies the AWS account IDs and AWS Organizations organizational units (OUs) to include in the policy. Specifying an OU is the equivalent of specifying all accounts in the OU and in any of its child OUs, including any child OUs and accounts that are added at a later time.</p><p>You can specify inclusions or exclusions, but not both. If you specify an <code>IncludeMap</code>, AWS Firewall Manager applies the policy to all accounts specified by the <code>IncludeMap</code>, and does not evaluate any <code>ExcludeMap</code> specifications. If you do not specify an <code>IncludeMap</code>, then Firewall Manager applies the policy to all accounts except for those specified by the <code>ExcludeMap</code>.</p><p>You can specify account IDs, OUs, or a combination: </p><ul><li><p>Specify account IDs by setting the key to <code>ACCOUNT</code>. For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”, “accountID2”]}</code>.</p></li><li><p>Specify OUs by setting the key to <code>ORG_UNIT</code>. For example, the following is a valid map: <code>{“ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.</p></li><li><p>Specify accounts and OUs together in a single map, separated with a comma. For example, the following is a valid map: <code>{“ACCOUNT” : [“accountID1”, “accountID2”], “ORG_UNIT” : [“ouid111”, “ouid112”]}</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable includeMap;

/**
 <p>The ID of the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The friendly name of the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>A unique identifier for each update to the policy. When issuing a <code>PutPolicy</code> request, the <code>PolicyUpdateToken</code> in the request must match the <code>PolicyUpdateToken</code> of the current policy version. To get the <code>PolicyUpdateToken</code> of the current policy version, use a <code>GetPolicy</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyUpdateToken;

/**
 <p>Indicates if the policy should be automatically applied to new resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable remediationEnabled;

/**
 <p>An array of <code>ResourceTag</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsResourceTag *> * _Nullable resourceTags;

/**
 <p>The type of resource protected by or in scope of the policy. This is in the format shown in the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and <code>AWS::CloudFront::Distribution</code>. For a security group common policy, valid values are <code>AWS::EC2::NetworkInterface</code> and <code>AWS::EC2::Instance</code>. For a security group content audit policy, valid values are <code>AWS::EC2::SecurityGroup</code>, <code>AWS::EC2::NetworkInterface</code>, and <code>AWS::EC2::Instance</code>. For a security group usage audit policy, the value is <code>AWS::EC2::SecurityGroup</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>An array of <code>ResourceType</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypeList;

/**
 <p>Details about the security service that is being used to protect the resources.</p>
 */
@property (nonatomic, strong) AWSfmsSecurityServicePolicyData * _Nullable securityServicePolicyData;

@end

/**
 <p>Describes the noncompliant resources in a member account for a specific AWS Firewall Manager policy. A maximum of 100 entries are displayed. If more than 100 resources are noncompliant, <code>EvaluationLimitExceeded</code> is set to <code>True</code>.</p>
 */
@interface AWSfmsPolicyComplianceDetail : AWSModel


/**
 <p>Indicates if over 100 resources are noncompliant with the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationLimitExceeded;

/**
 <p>A timestamp that indicates when the returned information should be considered out of date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiredAt;

/**
 <p>Details about problems with dependent services, such as AWS WAF or AWS Config, that are causing a resource to be noncompliant. The details include the name of the dependent service and the error message received that indicates the problem with the service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable issueInfoMap;

/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccount;

/**
 <p>The ID of the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The AWS account that created the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyOwner;

/**
 <p>An array of resources that aren't protected by the AWS WAF or Shield Advanced policy or that aren't in compliance with the security group policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsComplianceViolator *> * _Nullable violators;

@end

/**
 <p>Indicates whether the account is compliant with the specified policy. An account is considered noncompliant if it includes resources that are not protected by the policy, for AWS WAF and Shield Advanced policies, or that are noncompliant with the policy, for security group policies.</p>
 */
@interface AWSfmsPolicyComplianceStatus : AWSModel


/**
 <p>An array of <code>EvaluationResult</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsEvaluationResult *> * _Nullable evaluationResults;

/**
 <p>Details about problems with dependent services, such as AWS WAF or AWS Config, that are causing a resource to be noncompliant. The details include the name of the dependent service and the error message received that indicates the problem with the service.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable issueInfoMap;

/**
 <p>Timestamp of the last update to the <code>EvaluationResult</code> objects.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The member account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccount;

/**
 <p>The ID of the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The friendly name of the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The AWS account that created the AWS Firewall Manager policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyOwner;

@end

/**
 <p>Details of the AWS Firewall Manager policy. </p>
 */
@interface AWSfmsPolicySummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the specified policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The ID of the specified policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The friendly name of the specified policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Indicates if the policy should be automatically applied to new resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable remediationEnabled;

/**
 <p>The type of resource protected by or in scope of the policy. This is in the format shown in the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">AWS Resource Types Reference</a>. For AWS WAF and Shield Advanced, examples include <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code> and <code>AWS::CloudFront::Distribution</code>. For a security group common policy, valid values are <code>AWS::EC2::NetworkInterface</code> and <code>AWS::EC2::Instance</code>. For a security group content audit policy, valid values are <code>AWS::EC2::SecurityGroup</code>, <code>AWS::EC2::NetworkInterface</code>, and <code>AWS::EC2::Instance</code>. For a security group usage audit policy, the value is <code>AWS::EC2::SecurityGroup</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an AWS WAF policy, a Shield Advanced policy, or a security group policy.</p>
 */
@property (nonatomic, assign) AWSfmsSecurityServiceType securityServiceType;

@end

/**
 
 */
@interface AWSfmsPutNotificationChannelRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM role that allows Amazon SNS to record AWS Firewall Manager activity. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsRoleName;

/**
 <p>The Amazon Resource Name (ARN) of the SNS topic that collects notifications from AWS Firewall Manager.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

@end

/**
 
 */
@interface AWSfmsPutPolicyRequest : AWSRequest


/**
 <p>The details of the AWS Firewall Manager policy to be created.</p>
 */
@property (nonatomic, strong) AWSfmsPolicy * _Nullable policy;

/**
 <p>The tags to add to the AWS resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsTag *> * _Nullable tagList;

@end

/**
 
 */
@interface AWSfmsPutPolicyResponse : AWSModel


/**
 <p>The details of the AWS Firewall Manager policy that was created.</p>
 */
@property (nonatomic, strong) AWSfmsPolicy * _Nullable policy;

/**
 <p>The Amazon Resource Name (ARN) of the policy that was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 <p>The resource tags that AWS Firewall Manager uses to determine if a particular resource should be included or excluded from the AWS Firewall Manager policy. Tags enable you to categorize your AWS resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value. Firewall Manager combines the tags with "AND" so that, if you add more than one tag to a policy scope, a resource must have all the specified tags to be included or excluded. For more information, see <a href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html">Working with Tag Editor</a>.</p>
 Required parameters: [Key]
 */
@interface AWSfmsResourceTag : AWSModel


/**
 <p>The resource tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The resource tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Details about the security service that is being used to protect the resources.</p>
 Required parameters: [Type]
 */
@interface AWSfmsSecurityServicePolicyData : AWSModel


/**
 <p>Details about the service that are specific to the service type, in JSON format. For service type <code>SHIELD_ADVANCED</code>, this is an empty string.</p><ul><li><p>Example: <code>WAFV2</code></p><p><code>"ManagedServiceData": "{\"type\":\"WAFV2\",\"defaultAction\":{\"type\":\"ALLOW\"},\"preProcessRuleGroups\":[{\"managedRuleGroupIdentifier\":null,\"ruleGroupArn\":\"rulegrouparn\",\"overrideAction\":{\"type\":\"COUNT\"},\"excludedRules\":[{\"name\":\"EntityName\"}],\"ruleGroupType\":\"RuleGroup\"}],\"postProcessRuleGroups\":[{\"managedRuleGroupIdentifier\":{\"managedRuleGroupName\":\"AWSManagedRulesAdminProtectionRuleSet\",\"vendor\":\"AWS\"},\"ruleGroupArn\":\"rulegrouparn\",\"overrideAction\":{\"type\":\"NONE\"},\"excludedRules\":[],\"ruleGroupType\":\"ManagedRuleGroup\"}],\"overrideCustomerWebACLAssociation\":false}"</code></p></li><li><p>Example: <code>WAF Classic</code></p><p><code>"ManagedServiceData": "{\"type\": \"WAF\", \"ruleGroups\": [{\"id\": \"12345678-1bcd-9012-efga-0987654321ab\", \"overrideAction\" : {\"type\": \"COUNT\"}}], \"defaultAction\": {\"type\": \"BLOCK\"}}</code></p></li><li><p>Example: <code>SECURITY_GROUPS_COMMON</code></p><p><code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_COMMON","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_COMMON\",\"revertManualSecurityGroupChanges\":false,\"exclusiveResourceSecurityGroupManagement\":false, \"applyToAllEC2InstanceENIs\":false,\"securityGroups\":[{\"id\":\" sg-000e55995d61a06bd\"}]}"},"RemediationEnabled":false,"ResourceType":"AWS::EC2::NetworkInterface"}</code></p></li><li><p>Example: <code>SECURITY_GROUPS_CONTENT_AUDIT</code></p><p><code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_CONTENT_AUDIT","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_CONTENT_AUDIT\",\"securityGroups\":[{\"id\":\" sg-000e55995d61a06bd \"}],\"securityGroupAction\":{\"type\":\"ALLOW\"}}"},"RemediationEnabled":false,"ResourceType":"AWS::EC2::NetworkInterface"}</code></p><p>The security group action for content audit can be <code>ALLOW</code> or <code>DENY</code>. For <code>ALLOW</code>, all in-scope security group rules must be within the allowed range of the policy's security group rules. For <code>DENY</code>, all in-scope security group rules must not contain a value or a range that matches a rule value or range in the policy security group.</p></li><li><p>Example: <code>SECURITY_GROUPS_USAGE_AUDIT</code></p><p><code>"SecurityServicePolicyData":{"Type":"SECURITY_GROUPS_USAGE_AUDIT","ManagedServiceData":"{\"type\":\"SECURITY_GROUPS_USAGE_AUDIT\",\"deleteUnusedSecurityGroups\":true,\"coalesceRedundantSecurityGroups\":true}"},"RemediationEnabled":false,"Resou rceType":"AWS::EC2::SecurityGroup"}</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable managedServiceData;

/**
 <p>The service that the policy is using to protect the resources. This specifies the type of policy that is created, either an AWS WAF policy, a Shield Advanced policy, or a security group policy. For security group policies, Firewall Manager supports one security group for each common policy and for each content audit policy. This is an adjustable limit that you can increase by contacting AWS Support.</p>
 */
@property (nonatomic, assign) AWSfmsSecurityServiceType types;

@end

/**
 <p>A collection of key:value pairs associated with an AWS resource. The key:value pair can be anything you define. Typically, the tag key represents a category (such as "environment") and the tag value represents a specific value within that category (such as "test," "development," or "production"). You can add up to 50 tags to each AWS resource. </p>
 Required parameters: [Key, Value]
 */
@interface AWSfmsTag : AWSModel


/**
 <p>Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as "customer." Tag keys are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as "companyA" or "companyB." Tag values are case-sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSfmsTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSfmsTag *> * _Nullable tagList;

@end

/**
 
 */
@interface AWSfmsTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSfmsUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource. The Firewall Manager policy is the only AWS resource that supports tagging, so this ARN is a policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of the tags to remove from the resource. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSfmsUntagResourceResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
