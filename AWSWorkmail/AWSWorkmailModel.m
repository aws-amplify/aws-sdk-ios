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

#import "AWSWorkmailModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSWorkmailErrorDomain = @"com.amazonaws.AWSWorkmailErrorDomain";

@implementation AWSWorkmailAccessControlRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"dateCreated" : @"DateCreated",
             @"dateModified" : @"DateModified",
             @"detail" : @"Description",
             @"effect" : @"Effect",
             @"ipRanges" : @"IpRanges",
             @"name" : @"Name",
             @"notActions" : @"NotActions",
             @"notIpRanges" : @"NotIpRanges",
             @"notUserIds" : @"NotUserIds",
             @"userIds" : @"UserIds",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dateModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)effectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectDeny);
        }
        return @(AWSWorkmailAccessControlRuleEffectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailAccessControlRuleEffectAllow:
                return @"ALLOW";
            case AWSWorkmailAccessControlRuleEffectDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailAssociateDelegateToResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailAssociateDelegateToResourceResponse

@end

@implementation AWSWorkmailAssociateMemberToGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"memberId" : @"MemberId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailAssociateMemberToGroupResponse

@end

@implementation AWSWorkmailBookingOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoAcceptRequests" : @"AutoAcceptRequests",
             @"autoDeclineConflictingRequests" : @"AutoDeclineConflictingRequests",
             @"autoDeclineRecurringRequests" : @"AutoDeclineRecurringRequests",
             };
}

@end

@implementation AWSWorkmailCreateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"Alias",
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailCreateAliasResponse

@end

@implementation AWSWorkmailCreateGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailCreateGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             };
}

@end

@implementation AWSWorkmailCreateResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"organizationId" : @"OrganizationId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROOM"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeRoom);
        }
        if ([value caseInsensitiveCompare:@"EQUIPMENT"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeEquipment);
        }
        return @(AWSWorkmailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailResourceTypeRoom:
                return @"ROOM";
            case AWSWorkmailResourceTypeEquipment:
                return @"EQUIPMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailCreateResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailCreateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"name" : @"Name",
             @"organizationId" : @"OrganizationId",
             @"password" : @"Password",
             };
}

@end

@implementation AWSWorkmailCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailDelegate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeUser);
        }
        return @(AWSWorkmailMemberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailMemberTypeGroup:
                return @"GROUP";
            case AWSWorkmailMemberTypeUser:
                return @"USER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailDeleteAccessControlRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDeleteAccessControlRuleResponse

@end

@implementation AWSWorkmailDeleteAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"Alias",
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDeleteAliasResponse

@end

@implementation AWSWorkmailDeleteGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDeleteGroupResponse

@end

@implementation AWSWorkmailDeleteMailboxPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"granteeId" : @"GranteeId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDeleteMailboxPermissionsResponse

@end

@implementation AWSWorkmailDeleteResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailDeleteResourceResponse

@end

@implementation AWSWorkmailDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailDeleteUserResponse

@end

@implementation AWSWorkmailDeregisterFromWorkMailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDeregisterFromWorkMailResponse

@end

@implementation AWSWorkmailDescribeGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDescribeGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"groupId" : @"GroupId",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailDescribeOrganizationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDescribeOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"alias" : @"Alias",
             @"completedDate" : @"CompletedDate",
             @"defaultMailDomain" : @"DefaultMailDomain",
             @"directoryId" : @"DirectoryId",
             @"directoryType" : @"DirectoryType",
             @"errorMessage" : @"ErrorMessage",
             @"organizationId" : @"OrganizationId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)completedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSWorkmailDescribeResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailDescribeResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bookingOptions" : @"BookingOptions",
             @"disabledDate" : @"DisabledDate",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"name" : @"Name",
             @"resourceId" : @"ResourceId",
             @"state" : @"State",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)bookingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSWorkmailBookingOptions class]];
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROOM"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeRoom);
        }
        if ([value caseInsensitiveCompare:@"EQUIPMENT"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeEquipment);
        }
        return @(AWSWorkmailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailResourceTypeRoom:
                return @"ROOM";
            case AWSWorkmailResourceTypeEquipment:
                return @"EQUIPMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailDescribeUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailDescribeUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"displayName" : @"DisplayName",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"name" : @"Name",
             @"state" : @"State",
             @"userId" : @"UserId",
             @"userRole" : @"UserRole",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleUser);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleResource);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_USER"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleSystemUser);
        }
        return @(AWSWorkmailUserRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailUserRoleUser:
                return @"USER";
            case AWSWorkmailUserRoleResource:
                return @"RESOURCE";
            case AWSWorkmailUserRoleSystemUser:
                return @"SYSTEM_USER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailDisassociateDelegateFromResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailDisassociateDelegateFromResourceResponse

@end

@implementation AWSWorkmailDisassociateMemberFromGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"memberId" : @"MemberId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailDisassociateMemberFromGroupResponse

@end

@implementation AWSWorkmailGetAccessControlEffectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"ipAddress" : @"IpAddress",
             @"organizationId" : @"OrganizationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailGetAccessControlEffectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"effect" : @"Effect",
             @"matchedRules" : @"MatchedRules",
             };
}

+ (NSValueTransformer *)effectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectDeny);
        }
        return @(AWSWorkmailAccessControlRuleEffectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailAccessControlRuleEffectAllow:
                return @"ALLOW";
            case AWSWorkmailAccessControlRuleEffectDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailGetMailboxDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailGetMailboxDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mailboxQuota" : @"MailboxQuota",
             @"mailboxSize" : @"MailboxSize",
             };
}

@end

@implementation AWSWorkmailGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailListAccessControlRulesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListAccessControlRulesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailAccessControlRule class]];
}

@end

@implementation AWSWorkmailListAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorkmailListGroupMembersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListGroupMembersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"members" : @"Members",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailMember class]];
}

@end

@implementation AWSWorkmailListGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailGroup class]];
}

@end

@implementation AWSWorkmailListMailboxPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListMailboxPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"permissions" : @"Permissions",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailPermission class]];
}

@end

@implementation AWSWorkmailListOrganizationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorkmailListOrganizationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"organizationSummaries" : @"OrganizationSummaries",
             };
}

+ (NSValueTransformer *)organizationSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailOrganizationSummary class]];
}

@end

@implementation AWSWorkmailListResourceDelegatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSWorkmailListResourceDelegatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"delegates" : @"Delegates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)delegatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailDelegate class]];
}

@end

@implementation AWSWorkmailListResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resources" : @"Resources",
             };
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailResource class]];
}

@end

@implementation AWSWorkmailListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSWorkmailListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailTag class]];
}

@end

@implementation AWSWorkmailListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailUser class]];
}

@end

@implementation AWSWorkmailMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"enabledDate" : @"EnabledDate",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeUser);
        }
        return @(AWSWorkmailMemberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailMemberTypeGroup:
                return @"GROUP";
            case AWSWorkmailMemberTypeUser:
                return @"USER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailOrganizationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"Alias",
             @"errorMessage" : @"ErrorMessage",
             @"organizationId" : @"OrganizationId",
             @"state" : @"State",
             };
}

@end

@implementation AWSWorkmailPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granteeId" : @"GranteeId",
             @"granteeType" : @"GranteeType",
             @"permissionValues" : @"PermissionValues",
             };
}

+ (NSValueTransformer *)granteeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeGroup);
        }
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSWorkmailMemberTypeUser);
        }
        return @(AWSWorkmailMemberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailMemberTypeGroup:
                return @"GROUP";
            case AWSWorkmailMemberTypeUser:
                return @"USER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailPutAccessControlRuleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"detail" : @"Description",
             @"effect" : @"Effect",
             @"ipRanges" : @"IpRanges",
             @"name" : @"Name",
             @"notActions" : @"NotActions",
             @"notIpRanges" : @"NotIpRanges",
             @"notUserIds" : @"NotUserIds",
             @"organizationId" : @"OrganizationId",
             @"userIds" : @"UserIds",
             };
}

+ (NSValueTransformer *)effectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALLOW"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectAllow);
        }
        if ([value caseInsensitiveCompare:@"DENY"] == NSOrderedSame) {
            return @(AWSWorkmailAccessControlRuleEffectDeny);
        }
        return @(AWSWorkmailAccessControlRuleEffectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailAccessControlRuleEffectAllow:
                return @"ALLOW";
            case AWSWorkmailAccessControlRuleEffectDeny:
                return @"DENY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailPutAccessControlRuleResponse

@end

@implementation AWSWorkmailPutMailboxPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"granteeId" : @"GranteeId",
             @"organizationId" : @"OrganizationId",
             @"permissionValues" : @"PermissionValues",
             };
}

@end

@implementation AWSWorkmailPutMailboxPermissionsResponse

@end

@implementation AWSWorkmailRegisterToWorkMailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailRegisterToWorkMailResponse

@end

@implementation AWSWorkmailResetPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationId" : @"OrganizationId",
             @"password" : @"Password",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailResetPasswordResponse

@end

@implementation AWSWorkmailResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ROOM"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeRoom);
        }
        if ([value caseInsensitiveCompare:@"EQUIPMENT"] == NSOrderedSame) {
            return @(AWSWorkmailResourceTypeEquipment);
        }
        return @(AWSWorkmailResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailResourceTypeRoom:
                return @"ROOM";
            case AWSWorkmailResourceTypeEquipment:
                return @"EQUIPMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorkmailTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSWorkmailTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorkmailTag class]];
}

@end

@implementation AWSWorkmailTagResourceResponse

@end

@implementation AWSWorkmailUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSWorkmailUntagResourceResponse

@end

@implementation AWSWorkmailUpdateMailboxQuotaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mailboxQuota" : @"MailboxQuota",
             @"organizationId" : @"OrganizationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSWorkmailUpdateMailboxQuotaResponse

@end

@implementation AWSWorkmailUpdatePrimaryEmailAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"email" : @"Email",
             @"entityId" : @"EntityId",
             @"organizationId" : @"OrganizationId",
             };
}

@end

@implementation AWSWorkmailUpdatePrimaryEmailAddressResponse

@end

@implementation AWSWorkmailUpdateResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bookingOptions" : @"BookingOptions",
             @"name" : @"Name",
             @"organizationId" : @"OrganizationId",
             @"resourceId" : @"ResourceId",
             };
}

+ (NSValueTransformer *)bookingOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSWorkmailBookingOptions class]];
}

@end

@implementation AWSWorkmailUpdateResourceResponse

@end

@implementation AWSWorkmailUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabledDate" : @"DisabledDate",
             @"displayName" : @"DisplayName",
             @"email" : @"Email",
             @"enabledDate" : @"EnabledDate",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"state" : @"State",
             @"userRole" : @"UserRole",
             };
}

+ (NSValueTransformer *)disabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)enabledDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorkmailEntityStateDeleted);
        }
        return @(AWSWorkmailEntityStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailEntityStateEnabled:
                return @"ENABLED";
            case AWSWorkmailEntityStateDisabled:
                return @"DISABLED";
            case AWSWorkmailEntityStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userRoleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleUser);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleResource);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_USER"] == NSOrderedSame) {
            return @(AWSWorkmailUserRoleSystemUser);
        }
        return @(AWSWorkmailUserRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorkmailUserRoleUser:
                return @"USER";
            case AWSWorkmailUserRoleResource:
                return @"RESOURCE";
            case AWSWorkmailUserRoleSystemUser:
                return @"SYSTEM_USER";
            default:
                return nil;
        }
    }];
}

@end
