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

#import "AWSCognitoIdentityModel.h"
#import "AWSCategory.h"

NSString *const AWSCognitoIdentityErrorDomain = @"com.amazonaws.AWSCognitoIdentityErrorDomain";

@implementation AWSCognitoIdentityCognitoIdentityProvider

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"providerName" : @"ProviderName",
             @"serverSideTokenCheck" : @"ServerSideTokenCheck",
             };
}

@end

@implementation AWSCognitoIdentityCreateIdentityPoolInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowClassicFlow" : @"AllowClassicFlow",
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"cognitoIdentityProviders" : @"CognitoIdentityProviders",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolName" : @"IdentityPoolName",
             @"identityPoolTags" : @"IdentityPoolTags",
             @"openIdConnectProviderARNs" : @"OpenIdConnectProviderARNs",
             @"samlProviderARNs" : @"SamlProviderARNs",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
}

+ (NSValueTransformer *)cognitoIdentityProvidersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityCognitoIdentityProvider class]];
}

@end

@implementation AWSCognitoIdentityCredentials

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"expiration" : @"Expiration",
             @"secretKey" : @"SecretKey",
             @"sessionToken" : @"SessionToken",
             };
}

+ (NSValueTransformer *)expirationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCognitoIdentityDeleteIdentitiesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityIdsToDelete" : @"IdentityIdsToDelete",
             };
}

@end

@implementation AWSCognitoIdentityDeleteIdentitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unprocessedIdentityIds" : @"UnprocessedIdentityIds",
             };
}

+ (NSValueTransformer *)unprocessedIdentityIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityUnprocessedIdentityId class]];
}

@end

@implementation AWSCognitoIdentityDeleteIdentityPoolInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityDescribeIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityDescribeIdentityPoolInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityGetCredentialsForIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customRoleArn" : @"CustomRoleArn",
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetCredentialsForIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             @"identityId" : @"IdentityId",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityCredentials class]];
}

@end

@implementation AWSCognitoIdentityGetIdInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"identityPoolId" : @"IdentityPoolId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetIdResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityGetIdentityPoolRolesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityGetIdentityPoolRolesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"roleMappings" : @"RoleMappings",
             @"roles" : @"Roles",
             };
}

+ (NSValueTransformer *)roleMappingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSCognitoIdentityRoleMapping class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"identityPoolId" : @"IdentityPoolId",
             @"logins" : @"Logins",
             @"tokenDuration" : @"TokenDuration",
             };
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityIdentityDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"identityId" : @"IdentityId",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"logins" : @"Logins",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCognitoIdentityIdentityPool

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowClassicFlow" : @"AllowClassicFlow",
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"cognitoIdentityProviders" : @"CognitoIdentityProviders",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             @"identityPoolTags" : @"IdentityPoolTags",
             @"openIdConnectProviderARNs" : @"OpenIdConnectProviderARNs",
             @"samlProviderARNs" : @"SamlProviderARNs",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
}

+ (NSValueTransformer *)cognitoIdentityProvidersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityCognitoIdentityProvider class]];
}

@end

@implementation AWSCognitoIdentityIdentityPoolShortDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             };
}

@end

@implementation AWSCognitoIdentityListIdentitiesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hideDisabled" : @"HideDisabled",
             @"identityPoolId" : @"IdentityPoolId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityListIdentitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             @"identityPoolId" : @"IdentityPoolId",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)identitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityIdentityDescription class]];
}

@end

@implementation AWSCognitoIdentityListIdentityPoolsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityListIdentityPoolsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPools" : @"IdentityPools",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)identityPoolsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityIdentityPoolShortDescription class]];
}

@end

@implementation AWSCognitoIdentityListTagsForResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSCognitoIdentityListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSCognitoIdentityLookupDeveloperIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"developerUserIdentifier" : @"DeveloperUserIdentifier",
             @"identityId" : @"IdentityId",
             @"identityPoolId" : @"IdentityPoolId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityLookupDeveloperIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"developerUserIdentifierList" : @"DeveloperUserIdentifierList",
             @"identityId" : @"IdentityId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityMappingRule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"claim" : @"Claim",
             @"matchType" : @"MatchType",
             @"roleARN" : @"RoleARN",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)matchTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Equals"] == NSOrderedSame) {
            return @(AWSCognitoIdentityMappingRuleMatchTypeEquals);
        }
        if ([value caseInsensitiveCompare:@"Contains"] == NSOrderedSame) {
            return @(AWSCognitoIdentityMappingRuleMatchTypeContains);
        }
        if ([value caseInsensitiveCompare:@"StartsWith"] == NSOrderedSame) {
            return @(AWSCognitoIdentityMappingRuleMatchTypeStartsWith);
        }
        if ([value caseInsensitiveCompare:@"NotEqual"] == NSOrderedSame) {
            return @(AWSCognitoIdentityMappingRuleMatchTypeNotEqual);
        }
        return @(AWSCognitoIdentityMappingRuleMatchTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityMappingRuleMatchTypeEquals:
                return @"Equals";
            case AWSCognitoIdentityMappingRuleMatchTypeContains:
                return @"Contains";
            case AWSCognitoIdentityMappingRuleMatchTypeStartsWith:
                return @"StartsWith";
            case AWSCognitoIdentityMappingRuleMatchTypeNotEqual:
                return @"NotEqual";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityMergeDeveloperIdentitiesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationUserIdentifier" : @"DestinationUserIdentifier",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolId" : @"IdentityPoolId",
             @"sourceUserIdentifier" : @"SourceUserIdentifier",
             };
}

@end

@implementation AWSCognitoIdentityMergeDeveloperIdentitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityRoleMapping

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ambiguousRoleResolution" : @"AmbiguousRoleResolution",
             @"rulesConfiguration" : @"RulesConfiguration",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)ambiguousRoleResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AuthenticatedRole"] == NSOrderedSame) {
            return @(AWSCognitoIdentityAmbiguousRoleResolutionTypeAuthenticatedRole);
        }
        if ([value caseInsensitiveCompare:@"Deny"] == NSOrderedSame) {
            return @(AWSCognitoIdentityAmbiguousRoleResolutionTypeDeny);
        }
        return @(AWSCognitoIdentityAmbiguousRoleResolutionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityAmbiguousRoleResolutionTypeAuthenticatedRole:
                return @"AuthenticatedRole";
            case AWSCognitoIdentityAmbiguousRoleResolutionTypeDeny:
                return @"Deny";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rulesConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityRulesConfigurationType class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Token"] == NSOrderedSame) {
            return @(AWSCognitoIdentityRoleMappingTypeToken);
        }
        if ([value caseInsensitiveCompare:@"Rules"] == NSOrderedSame) {
            return @(AWSCognitoIdentityRoleMappingTypeRules);
        }
        return @(AWSCognitoIdentityRoleMappingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityRoleMappingTypeToken:
                return @"Token";
            case AWSCognitoIdentityRoleMappingTypeRules:
                return @"Rules";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityRulesConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rules" : @"Rules",
             };
}

+ (NSValueTransformer *)rulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityMappingRule class]];
}

@end

@implementation AWSCognitoIdentitySetIdentityPoolRolesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"roleMappings" : @"RoleMappings",
             @"roles" : @"Roles",
             };
}

+ (NSValueTransformer *)roleMappingsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSCognitoIdentityRoleMapping class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSCognitoIdentityTagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSCognitoIdentityTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityUnlinkDeveloperIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"developerProviderName" : @"DeveloperProviderName",
             @"developerUserIdentifier" : @"DeveloperUserIdentifier",
             @"identityId" : @"IdentityId",
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityUnlinkIdentityInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             @"loginsToRemove" : @"LoginsToRemove",
             };
}

@end

@implementation AWSCognitoIdentityUnprocessedIdentityId

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"identityId" : @"IdentityId",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSCognitoIdentityErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"InternalServerError"] == NSOrderedSame) {
            return @(AWSCognitoIdentityErrorCodeInternalServerError);
        }
        return @(AWSCognitoIdentityErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSCognitoIdentityErrorCodeInternalServerError:
                return @"InternalServerError";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityUntagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSCognitoIdentityUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
