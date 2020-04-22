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

#import "AWSfmsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSfmsErrorDomain = @"com.amazonaws.AWSfmsErrorDomain";

@implementation AWSfmsAssociateAdminAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccount" : @"AdminAccount",
             };
}

@end

@implementation AWSfmsComplianceViolator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"violationReason" : @"ViolationReason",
             };
}

+ (NSValueTransformer *)violationReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB_ACL_MISSING_RULE_GROUP"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonWebAclMissingRuleGroup);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_MISSING_WEB_ACL"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceMissingWebAcl);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_INCORRECT_WEB_ACL"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceIncorrectWebAcl);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_MISSING_SHIELD_PROTECTION"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceMissingShieldProtection);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceMissingWebAclOrShieldProtection);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_MISSING_SECURITY_GROUP"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceMissingSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonResourceViolatesAuditSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUP_UNUSED"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonSecurityGroupUnused);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUP_REDUNDANT"] == NSOrderedSame) {
            return @(AWSfmsViolationReasonSecurityGroupRedundant);
        }
        return @(AWSfmsViolationReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsViolationReasonWebAclMissingRuleGroup:
                return @"WEB_ACL_MISSING_RULE_GROUP";
            case AWSfmsViolationReasonResourceMissingWebAcl:
                return @"RESOURCE_MISSING_WEB_ACL";
            case AWSfmsViolationReasonResourceIncorrectWebAcl:
                return @"RESOURCE_INCORRECT_WEB_ACL";
            case AWSfmsViolationReasonResourceMissingShieldProtection:
                return @"RESOURCE_MISSING_SHIELD_PROTECTION";
            case AWSfmsViolationReasonResourceMissingWebAclOrShieldProtection:
                return @"RESOURCE_MISSING_WEB_ACL_OR_SHIELD_PROTECTION";
            case AWSfmsViolationReasonResourceMissingSecurityGroup:
                return @"RESOURCE_MISSING_SECURITY_GROUP";
            case AWSfmsViolationReasonResourceViolatesAuditSecurityGroup:
                return @"RESOURCE_VIOLATES_AUDIT_SECURITY_GROUP";
            case AWSfmsViolationReasonSecurityGroupUnused:
                return @"SECURITY_GROUP_UNUSED";
            case AWSfmsViolationReasonSecurityGroupRedundant:
                return @"SECURITY_GROUP_REDUNDANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsDeleteNotificationChannelRequest

@end

@implementation AWSfmsDeletePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteAllPolicyResources" : @"DeleteAllPolicyResources",
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSfmsDisassociateAdminAccountRequest

@end

@implementation AWSfmsEvaluationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceStatus" : @"ComplianceStatus",
             @"evaluationLimitExceeded" : @"EvaluationLimitExceeded",
             @"violatorCount" : @"ViolatorCount",
             };
}

+ (NSValueTransformer *)complianceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANT"] == NSOrderedSame) {
            return @(AWSfmsPolicyComplianceStatusTypeCompliant);
        }
        if ([value caseInsensitiveCompare:@"NON_COMPLIANT"] == NSOrderedSame) {
            return @(AWSfmsPolicyComplianceStatusTypeNonCompliant);
        }
        return @(AWSfmsPolicyComplianceStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsPolicyComplianceStatusTypeCompliant:
                return @"COMPLIANT";
            case AWSfmsPolicyComplianceStatusTypeNonCompliant:
                return @"NON_COMPLIANT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsGetAdminAccountRequest

@end

@implementation AWSfmsGetAdminAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccount" : @"AdminAccount",
             @"roleStatus" : @"RoleStatus",
             };
}

+ (NSValueTransformer *)roleStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSfmsAccountRoleStatusReady);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSfmsAccountRoleStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"PENDING_DELETION"] == NSOrderedSame) {
            return @(AWSfmsAccountRoleStatusPendingDeletion);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSfmsAccountRoleStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSfmsAccountRoleStatusDeleted);
        }
        return @(AWSfmsAccountRoleStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsAccountRoleStatusReady:
                return @"READY";
            case AWSfmsAccountRoleStatusCreating:
                return @"CREATING";
            case AWSfmsAccountRoleStatusPendingDeletion:
                return @"PENDING_DELETION";
            case AWSfmsAccountRoleStatusDeleting:
                return @"DELETING";
            case AWSfmsAccountRoleStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsGetComplianceDetailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccount" : @"MemberAccount",
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSfmsGetComplianceDetailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyComplianceDetail" : @"PolicyComplianceDetail",
             };
}

+ (NSValueTransformer *)policyComplianceDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfmsPolicyComplianceDetail class]];
}

@end

@implementation AWSfmsGetNotificationChannelRequest

@end

@implementation AWSfmsGetNotificationChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snsRoleName" : @"SnsRoleName",
             @"snsTopicArn" : @"SnsTopicArn",
             };
}

@end

@implementation AWSfmsGetPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSfmsGetPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"policyArn" : @"PolicyArn",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfmsPolicy class]];
}

@end

@implementation AWSfmsGetProtectionStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"maxResults" : @"MaxResults",
             @"memberAccountId" : @"MemberAccountId",
             @"nextToken" : @"NextToken",
             @"policyId" : @"PolicyId",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSfmsGetProtectionStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminAccountId" : @"AdminAccountId",
             @"data" : @"Data",
             @"nextToken" : @"NextToken",
             @"serviceType" : @"ServiceType",
             };
}

+ (NSValueTransformer *)serviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAF"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWaf);
        }
        if ([value caseInsensitiveCompare:@"WAFV2"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWafv2);
        }
        if ([value caseInsensitiveCompare:@"SHIELD_ADVANCED"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeShieldAdvanced);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_COMMON"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsCommon);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_CONTENT_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsContentAudit);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_USAGE_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit);
        }
        return @(AWSfmsSecurityServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsSecurityServiceTypeWaf:
                return @"WAF";
            case AWSfmsSecurityServiceTypeWafv2:
                return @"WAFV2";
            case AWSfmsSecurityServiceTypeShieldAdvanced:
                return @"SHIELD_ADVANCED";
            case AWSfmsSecurityServiceTypeSecurityGroupsCommon:
                return @"SECURITY_GROUPS_COMMON";
            case AWSfmsSecurityServiceTypeSecurityGroupsContentAudit:
                return @"SECURITY_GROUPS_CONTENT_AUDIT";
            case AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit:
                return @"SECURITY_GROUPS_USAGE_AUDIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsListComplianceStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSfmsListComplianceStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"policyComplianceStatusList" : @"PolicyComplianceStatusList",
             };
}

+ (NSValueTransformer *)policyComplianceStatusListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsPolicyComplianceStatus class]];
}

@end

@implementation AWSfmsListMemberAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSfmsListMemberAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccounts" : @"MemberAccounts",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSfmsListPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSfmsListPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"policyList" : @"PolicyList",
             };
}

+ (NSValueTransformer *)policyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsPolicySummary class]];
}

@end

@implementation AWSfmsListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSfmsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsTag class]];
}

@end

@implementation AWSfmsPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeMap" : @"ExcludeMap",
             @"excludeResourceTags" : @"ExcludeResourceTags",
             @"includeMap" : @"IncludeMap",
             @"policyId" : @"PolicyId",
             @"policyName" : @"PolicyName",
             @"policyUpdateToken" : @"PolicyUpdateToken",
             @"remediationEnabled" : @"RemediationEnabled",
             @"resourceTags" : @"ResourceTags",
             @"resourceType" : @"ResourceType",
             @"resourceTypeList" : @"ResourceTypeList",
             @"securityServicePolicyData" : @"SecurityServicePolicyData",
             };
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsResourceTag class]];
}

+ (NSValueTransformer *)securityServicePolicyDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfmsSecurityServicePolicyData class]];
}

@end

@implementation AWSfmsPolicyComplianceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationLimitExceeded" : @"EvaluationLimitExceeded",
             @"expiredAt" : @"ExpiredAt",
             @"issueInfoMap" : @"IssueInfoMap",
             @"memberAccount" : @"MemberAccount",
             @"policyId" : @"PolicyId",
             @"policyOwner" : @"PolicyOwner",
             @"violators" : @"Violators",
             };
}

+ (NSValueTransformer *)expiredAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)violatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsComplianceViolator class]];
}

@end

@implementation AWSfmsPolicyComplianceStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationResults" : @"EvaluationResults",
             @"issueInfoMap" : @"IssueInfoMap",
             @"lastUpdated" : @"LastUpdated",
             @"memberAccount" : @"MemberAccount",
             @"policyId" : @"PolicyId",
             @"policyName" : @"PolicyName",
             @"policyOwner" : @"PolicyOwner",
             };
}

+ (NSValueTransformer *)evaluationResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsEvaluationResult class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSfmsPolicySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyArn" : @"PolicyArn",
             @"policyId" : @"PolicyId",
             @"policyName" : @"PolicyName",
             @"remediationEnabled" : @"RemediationEnabled",
             @"resourceType" : @"ResourceType",
             @"securityServiceType" : @"SecurityServiceType",
             };
}

+ (NSValueTransformer *)securityServiceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAF"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWaf);
        }
        if ([value caseInsensitiveCompare:@"WAFV2"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWafv2);
        }
        if ([value caseInsensitiveCompare:@"SHIELD_ADVANCED"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeShieldAdvanced);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_COMMON"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsCommon);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_CONTENT_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsContentAudit);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_USAGE_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit);
        }
        return @(AWSfmsSecurityServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsSecurityServiceTypeWaf:
                return @"WAF";
            case AWSfmsSecurityServiceTypeWafv2:
                return @"WAFV2";
            case AWSfmsSecurityServiceTypeShieldAdvanced:
                return @"SHIELD_ADVANCED";
            case AWSfmsSecurityServiceTypeSecurityGroupsCommon:
                return @"SECURITY_GROUPS_COMMON";
            case AWSfmsSecurityServiceTypeSecurityGroupsContentAudit:
                return @"SECURITY_GROUPS_CONTENT_AUDIT";
            case AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit:
                return @"SECURITY_GROUPS_USAGE_AUDIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsPutNotificationChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snsRoleName" : @"SnsRoleName",
             @"snsTopicArn" : @"SnsTopicArn",
             };
}

@end

@implementation AWSfmsPutPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfmsPolicy class]];
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsTag class]];
}

@end

@implementation AWSfmsPutPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             @"policyArn" : @"PolicyArn",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSfmsPolicy class]];
}

@end

@implementation AWSfmsResourceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSfmsSecurityServicePolicyData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedServiceData" : @"ManagedServiceData",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WAF"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWaf);
        }
        if ([value caseInsensitiveCompare:@"WAFV2"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeWafv2);
        }
        if ([value caseInsensitiveCompare:@"SHIELD_ADVANCED"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeShieldAdvanced);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_COMMON"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsCommon);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_CONTENT_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsContentAudit);
        }
        if ([value caseInsensitiveCompare:@"SECURITY_GROUPS_USAGE_AUDIT"] == NSOrderedSame) {
            return @(AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit);
        }
        return @(AWSfmsSecurityServiceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSfmsSecurityServiceTypeWaf:
                return @"WAF";
            case AWSfmsSecurityServiceTypeWafv2:
                return @"WAFV2";
            case AWSfmsSecurityServiceTypeShieldAdvanced:
                return @"SHIELD_ADVANCED";
            case AWSfmsSecurityServiceTypeSecurityGroupsCommon:
                return @"SECURITY_GROUPS_COMMON";
            case AWSfmsSecurityServiceTypeSecurityGroupsContentAudit:
                return @"SECURITY_GROUPS_CONTENT_AUDIT";
            case AWSfmsSecurityServiceTypeSecurityGroupsUsageAudit:
                return @"SECURITY_GROUPS_USAGE_AUDIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSfmsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSfmsTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSfmsTag class]];
}

@end

@implementation AWSfmsTagResourceResponse

@end

@implementation AWSfmsUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSfmsUntagResourceResponse

@end
