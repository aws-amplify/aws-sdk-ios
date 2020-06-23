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

#import "AWSOrganizationsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSOrganizationsErrorDomain = @"com.amazonaws.AWSOrganizationsErrorDomain";

@implementation AWSOrganizationsAcceptHandshakeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakeId" : @"HandshakeId",
             };
}

@end

@implementation AWSOrganizationsAcceptHandshakeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"email" : @"Email",
             @"identifier" : @"Id",
             @"joinedMethod" : @"JoinedMethod",
             @"joinedTimestamp" : @"JoinedTimestamp",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)joinedMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVITED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountJoinedMethodInvited);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountJoinedMethodCreated);
        }
        return @(AWSOrganizationsAccountJoinedMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsAccountJoinedMethodInvited:
                return @"INVITED";
            case AWSOrganizationsAccountJoinedMethodCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)joinedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountStatusActive);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountStatusSuspended);
        }
        return @(AWSOrganizationsAccountStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsAccountStatusActive:
                return @"ACTIVE";
            case AWSOrganizationsAccountStatusSuspended:
                return @"SUSPENDED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsAttachPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             @"targetId" : @"TargetId",
             };
}

@end

@implementation AWSOrganizationsCancelHandshakeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakeId" : @"HandshakeId",
             };
}

@end

@implementation AWSOrganizationsCancelHandshakeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsChild

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSOrganizationsChildTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSOrganizationsChildTypeOrganizationalUnit);
        }
        return @(AWSOrganizationsChildTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsChildTypeAccount:
                return @"ACCOUNT";
            case AWSOrganizationsChildTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreateAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountName" : @"AccountName",
             @"email" : @"Email",
             @"iamUserAccessToBilling" : @"IamUserAccessToBilling",
             @"roleName" : @"RoleName",
             };
}

+ (NSValueTransformer *)iamUserAccessToBillingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSOrganizationsIAMUserAccessToBillingAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSOrganizationsIAMUserAccessToBillingDeny);
        }
        return @(AWSOrganizationsIAMUserAccessToBillingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsIAMUserAccessToBillingAllow:
                return @"ALLOW";
            case AWSOrganizationsIAMUserAccessToBillingDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreateAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAccountStatus" : @"CreateAccountStatus",
             };
}

+ (NSValueTransformer *)createAccountStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsCreateAccountStatus class]];
}

@end

@implementation AWSOrganizationsCreateAccountStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"accountName" : @"AccountName",
             @"completedTimestamp" : @"CompletedTimestamp",
             @"failureReason" : @"FailureReason",
             @"govCloudAccountId" : @"GovCloudAccountId",
             @"identifier" : @"Id",
             @"requestedTimestamp" : @"RequestedTimestamp",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)completedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)failureReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonAccountLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"EMAIL_ALREADY_EXISTS"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonEmailAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"INVALID_ADDRESS"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonInvalidAddress);
        }
        if ([value caseInsensitiveCompare:@"INVALID_EMAIL"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonInvalidEmail);
        }
        if ([value caseInsensitiveCompare:@"CONCURRENT_ACCOUNT_MODIFICATION"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonConcurrentAccountModification);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonInternalFailure);
        }
        if ([value caseInsensitiveCompare:@"GOVCLOUD_ACCOUNT_ALREADY_EXISTS"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountFailureReasonGovcloudAccountAlreadyExists);
        }
        return @(AWSOrganizationsCreateAccountFailureReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsCreateAccountFailureReasonAccountLimitExceeded:
                return @"ACCOUNT_LIMIT_EXCEEDED";
            case AWSOrganizationsCreateAccountFailureReasonEmailAlreadyExists:
                return @"EMAIL_ALREADY_EXISTS";
            case AWSOrganizationsCreateAccountFailureReasonInvalidAddress:
                return @"INVALID_ADDRESS";
            case AWSOrganizationsCreateAccountFailureReasonInvalidEmail:
                return @"INVALID_EMAIL";
            case AWSOrganizationsCreateAccountFailureReasonConcurrentAccountModification:
                return @"CONCURRENT_ACCOUNT_MODIFICATION";
            case AWSOrganizationsCreateAccountFailureReasonInternalFailure:
                return @"INTERNAL_FAILURE";
            case AWSOrganizationsCreateAccountFailureReasonGovcloudAccountAlreadyExists:
                return @"GOVCLOUD_ACCOUNT_ALREADY_EXISTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSOrganizationsCreateAccountStateFailed);
        }
        return @(AWSOrganizationsCreateAccountStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsCreateAccountStateInProgress:
                return @"IN_PROGRESS";
            case AWSOrganizationsCreateAccountStateSucceeded:
                return @"SUCCEEDED";
            case AWSOrganizationsCreateAccountStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreateGovCloudAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountName" : @"AccountName",
             @"email" : @"Email",
             @"iamUserAccessToBilling" : @"IamUserAccessToBilling",
             @"roleName" : @"RoleName",
             };
}

+ (NSValueTransformer *)iamUserAccessToBillingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSOrganizationsIAMUserAccessToBillingAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSOrganizationsIAMUserAccessToBillingDeny);
        }
        return @(AWSOrganizationsIAMUserAccessToBillingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsIAMUserAccessToBillingAllow:
                return @"ALLOW";
            case AWSOrganizationsIAMUserAccessToBillingDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreateGovCloudAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAccountStatus" : @"CreateAccountStatus",
             };
}

+ (NSValueTransformer *)createAccountStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsCreateAccountStatus class]];
}

@end

@implementation AWSOrganizationsCreateOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"featureSet" : @"FeatureSet",
             };
}

+ (NSValueTransformer *)featureSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSOrganizationsOrganizationFeatureSetAll);
        }
        if ([value caseInsensitiveCompare:@"CONSOLIDATED_BILLING"] == NSOrderedSame) {
            return @(AWSOrganizationsOrganizationFeatureSetConsolidatedBilling);
        }
        return @(AWSOrganizationsOrganizationFeatureSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsOrganizationFeatureSetAll:
                return @"ALL";
            case AWSOrganizationsOrganizationFeatureSetConsolidatedBilling:
                return @"CONSOLIDATED_BILLING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreateOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organization" : @"Organization",
             };
}

+ (NSValueTransformer *)organizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsOrganization class]];
}

@end

@implementation AWSOrganizationsCreateOrganizationalUnitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"parentId" : @"ParentId",
             };
}

@end

@implementation AWSOrganizationsCreateOrganizationalUnitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnit" : @"OrganizationalUnit",
             };
}

+ (NSValueTransformer *)organizationalUnitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsOrganizationalUnit class]];
}

@end

@implementation AWSOrganizationsCreatePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsCreatePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsPolicy class]];
}

@end

@implementation AWSOrganizationsDeclineHandshakeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakeId" : @"HandshakeId",
             };
}

@end

@implementation AWSOrganizationsDeclineHandshakeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsDelegatedAdministrator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"delegationEnabledDate" : @"DelegationEnabledDate",
             @"email" : @"Email",
             @"identifier" : @"Id",
             @"joinedMethod" : @"JoinedMethod",
             @"joinedTimestamp" : @"JoinedTimestamp",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)delegationEnabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)joinedMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVITED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountJoinedMethodInvited);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountJoinedMethodCreated);
        }
        return @(AWSOrganizationsAccountJoinedMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsAccountJoinedMethodInvited:
                return @"INVITED";
            case AWSOrganizationsAccountJoinedMethodCreated:
                return @"CREATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)joinedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountStatusActive);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSOrganizationsAccountStatusSuspended);
        }
        return @(AWSOrganizationsAccountStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsAccountStatusActive:
                return @"ACTIVE";
            case AWSOrganizationsAccountStatusSuspended:
                return @"SUSPENDED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsDelegatedService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegationEnabledDate" : @"DelegationEnabledDate",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

+ (NSValueTransformer *)delegationEnabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSOrganizationsDeleteOrganizationalUnitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSOrganizationsDeletePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSOrganizationsDeregisterDelegatedAdministratorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSOrganizationsDescribeAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSOrganizationsDescribeAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             };
}

+ (NSValueTransformer *)accountJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsAccount class]];
}

@end

@implementation AWSOrganizationsDescribeCreateAccountStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAccountRequestId" : @"CreateAccountRequestId",
             };
}

@end

@implementation AWSOrganizationsDescribeCreateAccountStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAccountStatus" : @"CreateAccountStatus",
             };
}

+ (NSValueTransformer *)createAccountStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsCreateAccountStatus class]];
}

@end

@implementation AWSOrganizationsDescribeEffectivePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyType" : @"PolicyType",
             @"targetId" : @"TargetId",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsEffectivePolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsEffectivePolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsEffectivePolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsDescribeEffectivePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effectivePolicy" : @"EffectivePolicy",
             };
}

+ (NSValueTransformer *)effectivePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsEffectivePolicy class]];
}

@end

@implementation AWSOrganizationsDescribeHandshakeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakeId" : @"HandshakeId",
             };
}

@end

@implementation AWSOrganizationsDescribeHandshakeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsDescribeOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organization" : @"Organization",
             };
}

+ (NSValueTransformer *)organizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsOrganization class]];
}

@end

@implementation AWSOrganizationsDescribeOrganizationalUnitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSOrganizationsDescribeOrganizationalUnitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnit" : @"OrganizationalUnit",
             };
}

+ (NSValueTransformer *)organizationalUnitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsOrganizationalUnit class]];
}

@end

@implementation AWSOrganizationsDescribePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSOrganizationsDescribePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsPolicy class]];
}

@end

@implementation AWSOrganizationsDetachPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyId" : @"PolicyId",
             @"targetId" : @"TargetId",
             };
}

@end

@implementation AWSOrganizationsDisableAWSServiceAccessRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSOrganizationsDisablePolicyTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyType" : @"PolicyType",
             @"rootId" : @"RootId",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsDisablePolicyTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"root" : @"Root",
             };
}

+ (NSValueTransformer *)rootJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsRoot class]];
}

@end

@implementation AWSOrganizationsEffectivePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"policyContent" : @"PolicyContent",
             @"policyType" : @"PolicyType",
             @"targetId" : @"TargetId",
             };
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsEffectivePolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsEffectivePolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsEffectivePolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsEnableAWSServiceAccessRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSOrganizationsEnableAllFeaturesRequest

@end

@implementation AWSOrganizationsEnableAllFeaturesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsEnablePolicyTypeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyType" : @"PolicyType",
             @"rootId" : @"RootId",
             };
}

+ (NSValueTransformer *)policyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsEnablePolicyTypeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"root" : @"Root",
             };
}

+ (NSValueTransformer *)rootJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsRoot class]];
}

@end

@implementation AWSOrganizationsEnabledServicePrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dateEnabled" : @"DateEnabled",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

+ (NSValueTransformer *)dateEnabledJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSOrganizationsHandshake

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"arn" : @"Arn",
             @"expirationTimestamp" : @"ExpirationTimestamp",
             @"identifier" : @"Id",
             @"parties" : @"Parties",
             @"requestedTimestamp" : @"RequestedTimestamp",
             @"resources" : @"Resources",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVITE"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeInvite);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_ALL_FEATURES"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeEnableAllFeatures);
        }
        if ([value caseInsensitiveCompare:@"APPROVE_ALL_FEATURES"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeApproveAllFeatures);
        }
        if ([value caseInsensitiveCompare:@"ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeAddOrganizationsServiceLinkedRole);
        }
        return @(AWSOrganizationsActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsActionTypeInvite:
                return @"INVITE";
            case AWSOrganizationsActionTypeEnableAllFeatures:
                return @"ENABLE_ALL_FEATURES";
            case AWSOrganizationsActionTypeApproveAllFeatures:
                return @"APPROVE_ALL_FEATURES";
            case AWSOrganizationsActionTypeAddOrganizationsServiceLinkedRole:
                return @"ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expirationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)partiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsHandshakeParty class]];
}

+ (NSValueTransformer *)requestedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsHandshakeResource class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REQUESTED"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateRequested);
        }
        if ([value caseInsensitiveCompare:@"OPEN"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateOpen);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"ACCEPTED"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateAccepted);
        }
        if ([value caseInsensitiveCompare:@"DECLINED"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateDeclined);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeStateExpired);
        }
        return @(AWSOrganizationsHandshakeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsHandshakeStateRequested:
                return @"REQUESTED";
            case AWSOrganizationsHandshakeStateOpen:
                return @"OPEN";
            case AWSOrganizationsHandshakeStateCanceled:
                return @"CANCELED";
            case AWSOrganizationsHandshakeStateAccepted:
                return @"ACCEPTED";
            case AWSOrganizationsHandshakeStateDeclined:
                return @"DECLINED";
            case AWSOrganizationsHandshakeStateExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsHandshakeFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionType" : @"ActionType",
             @"parentHandshakeId" : @"ParentHandshakeId",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVITE"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeInvite);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_ALL_FEATURES"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeEnableAllFeatures);
        }
        if ([value caseInsensitiveCompare:@"APPROVE_ALL_FEATURES"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeApproveAllFeatures);
        }
        if ([value caseInsensitiveCompare:@"ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE"] == NSOrderedSame) {
            return @(AWSOrganizationsActionTypeAddOrganizationsServiceLinkedRole);
        }
        return @(AWSOrganizationsActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsActionTypeInvite:
                return @"INVITE";
            case AWSOrganizationsActionTypeEnableAllFeatures:
                return @"ENABLE_ALL_FEATURES";
            case AWSOrganizationsActionTypeApproveAllFeatures:
                return @"APPROVE_ALL_FEATURES";
            case AWSOrganizationsActionTypeAddOrganizationsServiceLinkedRole:
                return @"ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsHandshakeParty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakePartyTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakePartyTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakePartyTypeEmail);
        }
        return @(AWSOrganizationsHandshakePartyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsHandshakePartyTypeAccount:
                return @"ACCOUNT";
            case AWSOrganizationsHandshakePartyTypeOrganization:
                return @"ORGANIZATION";
            case AWSOrganizationsHandshakePartyTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsHandshakeResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resources" : @"Resources",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsHandshakeResource class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION_FEATURE_SET"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeOrganizationFeatureSet);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"MASTER_EMAIL"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeMasterEmail);
        }
        if ([value caseInsensitiveCompare:@"MASTER_NAME"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeMasterName);
        }
        if ([value caseInsensitiveCompare:@"NOTES"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeNotes);
        }
        if ([value caseInsensitiveCompare:@"PARENT_HANDSHAKE"] == NSOrderedSame) {
            return @(AWSOrganizationsHandshakeResourceTypeParentHandshake);
        }
        return @(AWSOrganizationsHandshakeResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsHandshakeResourceTypeAccount:
                return @"ACCOUNT";
            case AWSOrganizationsHandshakeResourceTypeOrganization:
                return @"ORGANIZATION";
            case AWSOrganizationsHandshakeResourceTypeOrganizationFeatureSet:
                return @"ORGANIZATION_FEATURE_SET";
            case AWSOrganizationsHandshakeResourceTypeEmail:
                return @"EMAIL";
            case AWSOrganizationsHandshakeResourceTypeMasterEmail:
                return @"MASTER_EMAIL";
            case AWSOrganizationsHandshakeResourceTypeMasterName:
                return @"MASTER_NAME";
            case AWSOrganizationsHandshakeResourceTypeNotes:
                return @"NOTES";
            case AWSOrganizationsHandshakeResourceTypeParentHandshake:
                return @"PARENT_HANDSHAKE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsInviteAccountToOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notes" : @"Notes",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshakeParty class]];
}

@end

@implementation AWSOrganizationsInviteAccountToOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshake" : @"Handshake",
             };
}

+ (NSValueTransformer *)handshakeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsListAWSServiceAccessForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSOrganizationsListAWSServiceAccessForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabledServicePrincipals" : @"EnabledServicePrincipals",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)enabledServicePrincipalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsEnabledServicePrincipal class]];
}

@end

@implementation AWSOrganizationsListAccountsForParentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parentId" : @"ParentId",
             };
}

@end

@implementation AWSOrganizationsListAccountsForParentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsAccount class]];
}

@end

@implementation AWSOrganizationsListAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSOrganizationsListAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsAccount class]];
}

@end

@implementation AWSOrganizationsListChildrenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childType" : @"ChildType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parentId" : @"ParentId",
             };
}

+ (NSValueTransformer *)childTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSOrganizationsChildTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSOrganizationsChildTypeOrganizationalUnit);
        }
        return @(AWSOrganizationsChildTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsChildTypeAccount:
                return @"ACCOUNT";
            case AWSOrganizationsChildTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsListChildrenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"children" : @"Children",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)childrenJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsChild class]];
}

@end

@implementation AWSOrganizationsListCreateAccountStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"states" : @"States",
             };
}

@end

@implementation AWSOrganizationsListCreateAccountStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAccountStatuses" : @"CreateAccountStatuses",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)createAccountStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsCreateAccountStatus class]];
}

@end

@implementation AWSOrganizationsListDelegatedAdministratorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSOrganizationsListDelegatedAdministratorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegatedAdministrators" : @"DelegatedAdministrators",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)delegatedAdministratorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsDelegatedAdministrator class]];
}

@end

@implementation AWSOrganizationsListDelegatedServicesForAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSOrganizationsListDelegatedServicesForAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegatedServices" : @"DelegatedServices",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)delegatedServicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsDelegatedService class]];
}

@end

@implementation AWSOrganizationsListHandshakesForAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshakeFilter class]];
}

@end

@implementation AWSOrganizationsListHandshakesForAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakes" : @"Handshakes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)handshakesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsListHandshakesForOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsHandshakeFilter class]];
}

@end

@implementation AWSOrganizationsListHandshakesForOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"handshakes" : @"Handshakes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)handshakesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsHandshake class]];
}

@end

@implementation AWSOrganizationsListOrganizationalUnitsForParentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"parentId" : @"ParentId",
             };
}

@end

@implementation AWSOrganizationsListOrganizationalUnitsForParentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"organizationalUnits" : @"OrganizationalUnits",
             };
}

+ (NSValueTransformer *)organizationalUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsOrganizationalUnit class]];
}

@end

@implementation AWSOrganizationsListParentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childId" : @"ChildId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSOrganizationsListParentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parents" : @"Parents",
             };
}

+ (NSValueTransformer *)parentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsParent class]];
}

@end

@implementation AWSOrganizationsListPoliciesForTargetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"targetId" : @"TargetId",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsListPoliciesForTargetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"policies" : @"Policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsPolicySummary class]];
}

@end

@implementation AWSOrganizationsListPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsListPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"policies" : @"Policies",
             };
}

+ (NSValueTransformer *)policiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsPolicySummary class]];
}

@end

@implementation AWSOrganizationsListRootsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSOrganizationsListRootsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"roots" : @"Roots",
             };
}

+ (NSValueTransformer *)rootsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsRoot class]];
}

@end

@implementation AWSOrganizationsListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSOrganizationsListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsTag class]];
}

@end

@implementation AWSOrganizationsListTargetsForPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSOrganizationsListTargetsForPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsPolicyTargetSummary class]];
}

@end

@implementation AWSOrganizationsMoveAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"destinationParentId" : @"DestinationParentId",
             @"sourceParentId" : @"SourceParentId",
             };
}

@end

@implementation AWSOrganizationsOrganization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availablePolicyTypes" : @"AvailablePolicyTypes",
             @"featureSet" : @"FeatureSet",
             @"identifier" : @"Id",
             @"masterAccountArn" : @"MasterAccountArn",
             @"masterAccountEmail" : @"MasterAccountEmail",
             @"masterAccountId" : @"MasterAccountId",
             };
}

+ (NSValueTransformer *)availablePolicyTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsPolicyTypeSummary class]];
}

+ (NSValueTransformer *)featureSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSOrganizationsOrganizationFeatureSetAll);
        }
        if ([value caseInsensitiveCompare:@"CONSOLIDATED_BILLING"] == NSOrderedSame) {
            return @(AWSOrganizationsOrganizationFeatureSetConsolidatedBilling);
        }
        return @(AWSOrganizationsOrganizationFeatureSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsOrganizationFeatureSetAll:
                return @"ALL";
            case AWSOrganizationsOrganizationFeatureSetConsolidatedBilling:
                return @"CONSOLIDATED_BILLING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsOrganizationalUnit

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSOrganizationsParent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROOT"] == NSOrderedSame) {
            return @(AWSOrganizationsParentTypeRoot);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSOrganizationsParentTypeOrganizationalUnit);
        }
        return @(AWSOrganizationsParentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsParentTypeRoot:
                return @"ROOT";
            case AWSOrganizationsParentTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"policySummary" : @"PolicySummary",
             };
}

+ (NSValueTransformer *)policySummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsPolicySummary class]];
}

@end

@implementation AWSOrganizationsPolicySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"awsManaged" : @"AwsManaged",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsPolicyTargetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"name" : @"Name",
             @"targetId" : @"TargetId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSOrganizationsTargetTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSOrganizationsTargetTypeOrganizationalUnit);
        }
        if ([value caseInsensitiveCompare:@"ROOT"] == NSOrderedSame) {
            return @(AWSOrganizationsTargetTypeRoot);
        }
        return @(AWSOrganizationsTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsTargetTypeAccount:
                return @"ACCOUNT";
            case AWSOrganizationsTargetTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            case AWSOrganizationsTargetTypeRoot:
                return @"ROOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsPolicyTypeSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"PENDING_ENABLE"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeStatusPendingEnable);
        }
        if ([value caseInsensitiveCompare:@"PENDING_DISABLE"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeStatusPendingDisable);
        }
        return @(AWSOrganizationsPolicyTypeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeStatusEnabled:
                return @"ENABLED";
            case AWSOrganizationsPolicyTypeStatusPendingEnable:
                return @"PENDING_ENABLE";
            case AWSOrganizationsPolicyTypeStatusPendingDisable:
                return @"PENDING_DISABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_CONTROL_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeServiceControlPolicy);
        }
        if ([value caseInsensitiveCompare:@"TAG_POLICY"] == NSOrderedSame) {
            return @(AWSOrganizationsPolicyTypeTagPolicy);
        }
        return @(AWSOrganizationsPolicyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSOrganizationsPolicyTypeServiceControlPolicy:
                return @"SERVICE_CONTROL_POLICY";
            case AWSOrganizationsPolicyTypeTagPolicy:
                return @"TAG_POLICY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSOrganizationsRegisterDelegatedAdministratorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"servicePrincipal" : @"ServicePrincipal",
             };
}

@end

@implementation AWSOrganizationsRemoveAccountFromOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSOrganizationsRoot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"policyTypes" : @"PolicyTypes",
             };
}

+ (NSValueTransformer *)policyTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsPolicyTypeSummary class]];
}

@end

@implementation AWSOrganizationsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSOrganizationsTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSOrganizationsTag class]];
}

@end

@implementation AWSOrganizationsUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSOrganizationsUpdateOrganizationalUnitRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"organizationalUnitId" : @"OrganizationalUnitId",
             };
}

@end

@implementation AWSOrganizationsUpdateOrganizationalUnitResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationalUnit" : @"OrganizationalUnit",
             };
}

+ (NSValueTransformer *)organizationalUnitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsOrganizationalUnit class]];
}

@end

@implementation AWSOrganizationsUpdatePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"policyId" : @"PolicyId",
             };
}

@end

@implementation AWSOrganizationsUpdatePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

+ (NSValueTransformer *)policyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSOrganizationsPolicy class]];
}

@end
