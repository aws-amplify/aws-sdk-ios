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

#import "AWSramModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSramErrorDomain = @"com.amazonaws.AWSramErrorDomain";

@implementation AWSramAcceptResourceShareInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareInvitationArn" : @"resourceShareInvitationArn",
             };
}

@end

@implementation AWSramAcceptResourceShareInvitationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareInvitation" : @"resourceShareInvitation",
             };
}

+ (NSValueTransformer *)resourceShareInvitationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSramResourceShareInvitation class]];
}

@end

@implementation AWSramAssociateResourceSharePermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"permissionArn" : @"permissionArn",
             @"replace" : @"replace",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramAssociateResourceSharePermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"returnValue" : @"returnValue",
             };
}

@end

@implementation AWSramAssociateResourceShareRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"principals" : @"principals",
             @"resourceArns" : @"resourceArns",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramAssociateResourceShareResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareAssociations" : @"resourceShareAssociations",
             };
}

+ (NSValueTransformer *)resourceShareAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShareAssociation class]];
}

@end

@implementation AWSramCreateResourceShareRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowExternalPrincipals" : @"allowExternalPrincipals",
             @"clientToken" : @"clientToken",
             @"name" : @"name",
             @"permissionArns" : @"permissionArns",
             @"principals" : @"principals",
             @"resourceArns" : @"resourceArns",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramTag class]];
}

@end

@implementation AWSramCreateResourceShareResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShare" : @"resourceShare",
             };
}

+ (NSValueTransformer *)resourceShareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSramResourceShare class]];
}

@end

@implementation AWSramDeleteResourceShareRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramDeleteResourceShareResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"returnValue" : @"returnValue",
             };
}

@end

@implementation AWSramDisassociateResourceSharePermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"permissionArn" : @"permissionArn",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramDisassociateResourceSharePermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"returnValue" : @"returnValue",
             };
}

@end

@implementation AWSramDisassociateResourceShareRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"principals" : @"principals",
             @"resourceArns" : @"resourceArns",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramDisassociateResourceShareResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareAssociations" : @"resourceShareAssociations",
             };
}

+ (NSValueTransformer *)resourceShareAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShareAssociation class]];
}

@end

@implementation AWSramEnableSharingWithAwsOrganizationRequest

@end

@implementation AWSramEnableSharingWithAwsOrganizationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returnValue" : @"returnValue",
             };
}

@end

@implementation AWSramGetPermissionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissionArn" : @"permissionArn",
             @"permissionVersion" : @"permissionVersion",
             };
}

@end

@implementation AWSramGetPermissionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permission" : @"permission",
             };
}

+ (NSValueTransformer *)permissionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSramResourceSharePermissionDetail class]];
}

@end

@implementation AWSramGetResourcePoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principal" : @"principal",
             @"resourceArns" : @"resourceArns",
             };
}

@end

@implementation AWSramGetResourcePoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"policies" : @"policies",
             };
}

@end

@implementation AWSramGetResourceShareAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationStatus" : @"associationStatus",
             @"associationType" : @"associationType",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principal" : @"principal",
             @"resourceArn" : @"resourceArn",
             @"resourceShareArns" : @"resourceShareArns",
             };
}

+ (NSValueTransformer *)associationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASSOCIATING"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusAssociated);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATING"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusDisassociating);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusDisassociated);
        }
        return @(AWSramResourceShareAssociationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareAssociationStatusAssociating:
                return @"ASSOCIATING";
            case AWSramResourceShareAssociationStatusAssociated:
                return @"ASSOCIATED";
            case AWSramResourceShareAssociationStatusFailed:
                return @"FAILED";
            case AWSramResourceShareAssociationStatusDisassociating:
                return @"DISASSOCIATING";
            case AWSramResourceShareAssociationStatusDisassociated:
                return @"DISASSOCIATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)associationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRINCIPAL"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationTypePrincipal);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationTypeResource);
        }
        return @(AWSramResourceShareAssociationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareAssociationTypePrincipal:
                return @"PRINCIPAL";
            case AWSramResourceShareAssociationTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramGetResourceShareAssociationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceShareAssociations" : @"resourceShareAssociations",
             };
}

+ (NSValueTransformer *)resourceShareAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShareAssociation class]];
}

@end

@implementation AWSramGetResourceShareInvitationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceShareArns" : @"resourceShareArns",
             @"resourceShareInvitationArns" : @"resourceShareInvitationArns",
             };
}

@end

@implementation AWSramGetResourceShareInvitationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceShareInvitations" : @"resourceShareInvitations",
             };
}

+ (NSValueTransformer *)resourceShareInvitationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShareInvitation class]];
}

@end

@implementation AWSramGetResourceSharesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"name" : @"name",
             @"nextToken" : @"nextToken",
             @"resourceOwner" : @"resourceOwner",
             @"resourceShareArns" : @"resourceShareArns",
             @"resourceShareStatus" : @"resourceShareStatus",
             @"tagFilters" : @"tagFilters",
             };
}

+ (NSValueTransformer *)resourceOwnerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF"] == NSOrderedSame) {
            return @(AWSramResourceOwnerSelf);
        }
        if ([value caseInsensitiveCompare:@"OTHER-ACCOUNTS"] == NSOrderedSame) {
            return @(AWSramResourceOwnerOtherAccounts);
        }
        return @(AWSramResourceOwnerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceOwnerSelf:
                return @"SELF";
            case AWSramResourceOwnerOtherAccounts:
                return @"OTHER-ACCOUNTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceShareStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusPending);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusDeleted);
        }
        return @(AWSramResourceShareStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareStatusPending:
                return @"PENDING";
            case AWSramResourceShareStatusActive:
                return @"ACTIVE";
            case AWSramResourceShareStatusFailed:
                return @"FAILED";
            case AWSramResourceShareStatusDeleting:
                return @"DELETING";
            case AWSramResourceShareStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramTagFilter class]];
}

@end

@implementation AWSramGetResourceSharesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceShares" : @"resourceShares",
             };
}

+ (NSValueTransformer *)resourceSharesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShare class]];
}

@end

@implementation AWSramListPendingInvitationResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceShareInvitationArn" : @"resourceShareInvitationArn",
             };
}

@end

@implementation AWSramListPendingInvitationResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resources" : @"resources",
             };
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResource class]];
}

@end

@implementation AWSramListPermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceType" : @"resourceType",
             };
}

@end

@implementation AWSramListPermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"permissions" : @"permissions",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceSharePermissionSummary class]];
}

@end

@implementation AWSramListPrincipalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principals" : @"principals",
             @"resourceArn" : @"resourceArn",
             @"resourceOwner" : @"resourceOwner",
             @"resourceShareArns" : @"resourceShareArns",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceOwnerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF"] == NSOrderedSame) {
            return @(AWSramResourceOwnerSelf);
        }
        if ([value caseInsensitiveCompare:@"OTHER-ACCOUNTS"] == NSOrderedSame) {
            return @(AWSramResourceOwnerOtherAccounts);
        }
        return @(AWSramResourceOwnerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceOwnerSelf:
                return @"SELF";
            case AWSramResourceOwnerOtherAccounts:
                return @"OTHER-ACCOUNTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramListPrincipalsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"principals" : @"principals",
             };
}

+ (NSValueTransformer *)principalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramPrincipal class]];
}

@end

@implementation AWSramListResourceSharePermissionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramListResourceSharePermissionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"permissions" : @"permissions",
             };
}

+ (NSValueTransformer *)permissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceSharePermissionSummary class]];
}

@end

@implementation AWSramListResourceTypesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSramListResourceTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourceTypes" : @"resourceTypes",
             };
}

+ (NSValueTransformer *)resourceTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramServiceNameAndResourceType class]];
}

@end

@implementation AWSramListResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"principal" : @"principal",
             @"resourceArns" : @"resourceArns",
             @"resourceOwner" : @"resourceOwner",
             @"resourceShareArns" : @"resourceShareArns",
             @"resourceType" : @"resourceType",
             };
}

+ (NSValueTransformer *)resourceOwnerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF"] == NSOrderedSame) {
            return @(AWSramResourceOwnerSelf);
        }
        if ([value caseInsensitiveCompare:@"OTHER-ACCOUNTS"] == NSOrderedSame) {
            return @(AWSramResourceOwnerOtherAccounts);
        }
        return @(AWSramResourceOwnerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceOwnerSelf:
                return @"SELF";
            case AWSramResourceOwnerOtherAccounts:
                return @"OTHER-ACCOUNTS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramListResourcesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resources" : @"resources",
             };
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResource class]];
}

@end

@implementation AWSramPrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"external" : @"external",
             @"identifier" : @"id",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSramPromoteResourceShareCreatedFromPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramPromoteResourceShareCreatedFromPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returnValue" : @"returnValue",
             };
}

@end

@implementation AWSramRejectResourceShareInvitationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareInvitationArn" : @"resourceShareInvitationArn",
             };
}

@end

@implementation AWSramRejectResourceShareInvitationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShareInvitation" : @"resourceShareInvitation",
             };
}

+ (NSValueTransformer *)resourceShareInvitationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSramResourceShareInvitation class]];
}

@end

@implementation AWSramResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"resourceGroupArn" : @"resourceGroupArn",
             @"resourceShareArn" : @"resourceShareArn",
             @"status" : @"status",
             @"statusMessage" : @"statusMessage",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSramResourceStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"ZONAL_RESOURCE_INACCESSIBLE"] == NSOrderedSame) {
            return @(AWSramResourceStatusZonalResourceInaccessible);
        }
        if ([value caseInsensitiveCompare:@"LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSramResourceStatusLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSramResourceStatusUnavailable);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSramResourceStatusPending);
        }
        return @(AWSramResourceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceStatusAvailable:
                return @"AVAILABLE";
            case AWSramResourceStatusZonalResourceInaccessible:
                return @"ZONAL_RESOURCE_INACCESSIBLE";
            case AWSramResourceStatusLimitExceeded:
                return @"LIMIT_EXCEEDED";
            case AWSramResourceStatusUnavailable:
                return @"UNAVAILABLE";
            case AWSramResourceStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramResourceShare

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowExternalPrincipals" : @"allowExternalPrincipals",
             @"creationTime" : @"creationTime",
             @"featureSet" : @"featureSet",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"name" : @"name",
             @"owningAccountId" : @"owningAccountId",
             @"resourceShareArn" : @"resourceShareArn",
             @"status" : @"status",
             @"statusMessage" : @"statusMessage",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)featureSetJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED_FROM_POLICY"] == NSOrderedSame) {
            return @(AWSramResourceShareFeatureSetCreatedFromPolicy);
        }
        if ([value caseInsensitiveCompare:@"PROMOTING_TO_STANDARD"] == NSOrderedSame) {
            return @(AWSramResourceShareFeatureSetPromotingToStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSramResourceShareFeatureSetStandard);
        }
        return @(AWSramResourceShareFeatureSetUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareFeatureSetCreatedFromPolicy:
                return @"CREATED_FROM_POLICY";
            case AWSramResourceShareFeatureSetPromotingToStandard:
                return @"PROMOTING_TO_STANDARD";
            case AWSramResourceShareFeatureSetStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusPending);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSramResourceShareStatusDeleted);
        }
        return @(AWSramResourceShareStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareStatusPending:
                return @"PENDING";
            case AWSramResourceShareStatusActive:
                return @"ACTIVE";
            case AWSramResourceShareStatusFailed:
                return @"FAILED";
            case AWSramResourceShareStatusDeleting:
                return @"DELETING";
            case AWSramResourceShareStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramTag class]];
}

@end

@implementation AWSramResourceShareAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedEntity" : @"associatedEntity",
             @"associationType" : @"associationType",
             @"creationTime" : @"creationTime",
             @"external" : @"external",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"resourceShareArn" : @"resourceShareArn",
             @"resourceShareName" : @"resourceShareName",
             @"status" : @"status",
             @"statusMessage" : @"statusMessage",
             };
}

+ (NSValueTransformer *)associationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRINCIPAL"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationTypePrincipal);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationTypeResource);
        }
        return @(AWSramResourceShareAssociationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareAssociationTypePrincipal:
                return @"PRINCIPAL";
            case AWSramResourceShareAssociationTypeResource:
                return @"RESOURCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASSOCIATING"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusAssociated);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATING"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusDisassociating);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATED"] == NSOrderedSame) {
            return @(AWSramResourceShareAssociationStatusDisassociated);
        }
        return @(AWSramResourceShareAssociationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareAssociationStatusAssociating:
                return @"ASSOCIATING";
            case AWSramResourceShareAssociationStatusAssociated:
                return @"ASSOCIATED";
            case AWSramResourceShareAssociationStatusFailed:
                return @"FAILED";
            case AWSramResourceShareAssociationStatusDisassociating:
                return @"DISASSOCIATING";
            case AWSramResourceShareAssociationStatusDisassociated:
                return @"DISASSOCIATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramResourceShareInvitation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitationTimestamp" : @"invitationTimestamp",
             @"receiverAccountId" : @"receiverAccountId",
             @"resourceShareArn" : @"resourceShareArn",
             @"resourceShareAssociations" : @"resourceShareAssociations",
             @"resourceShareInvitationArn" : @"resourceShareInvitationArn",
             @"resourceShareName" : @"resourceShareName",
             @"senderAccountId" : @"senderAccountId",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)invitationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)resourceShareAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramResourceShareAssociation class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSramResourceShareInvitationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"ACCEPTED"] == NSOrderedSame) {
            return @(AWSramResourceShareInvitationStatusAccepted);
        }
        if ([value caseInsensitiveCompare:@"REJECTED"] == NSOrderedSame) {
            return @(AWSramResourceShareInvitationStatusRejected);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSramResourceShareInvitationStatusExpired);
        }
        return @(AWSramResourceShareInvitationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSramResourceShareInvitationStatusPending:
                return @"PENDING";
            case AWSramResourceShareInvitationStatusAccepted:
                return @"ACCEPTED";
            case AWSramResourceShareInvitationStatusRejected:
                return @"REJECTED";
            case AWSramResourceShareInvitationStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSramResourceSharePermissionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"defaultVersion" : @"defaultVersion",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"name" : @"name",
             @"permission" : @"permission",
             @"resourceType" : @"resourceType",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSramResourceSharePermissionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"defaultVersion" : @"defaultVersion",
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"name" : @"name",
             @"resourceType" : @"resourceType",
             @"status" : @"status",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSramServiceNameAndResourceType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceType" : @"resourceType",
             @"serviceName" : @"serviceName",
             };
}

@end

@implementation AWSramTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSramTagFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagKey" : @"tagKey",
             @"tagValues" : @"tagValues",
             };
}

@end

@implementation AWSramTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceShareArn" : @"resourceShareArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSramTag class]];
}

@end

@implementation AWSramTagResourceResponse

@end

@implementation AWSramUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceShareArn" : @"resourceShareArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSramUntagResourceResponse

@end

@implementation AWSramUpdateResourceShareRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowExternalPrincipals" : @"allowExternalPrincipals",
             @"clientToken" : @"clientToken",
             @"name" : @"name",
             @"resourceShareArn" : @"resourceShareArn",
             };
}

@end

@implementation AWSramUpdateResourceShareResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"resourceShare" : @"resourceShare",
             };
}

+ (NSValueTransformer *)resourceShareJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSramResourceShare class]];
}

@end
