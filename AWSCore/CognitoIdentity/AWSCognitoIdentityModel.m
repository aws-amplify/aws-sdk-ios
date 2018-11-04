//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"providerName" : @"ProviderName",
             @"serverSideTokenCheck" : @"ServerSideTokenCheck",
             };
}

@end

@implementation AWSCognitoIdentityCreateIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"cognitoIdentityProviders" : @"CognitoIdentityProviders",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolName" : @"IdentityPoolName",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityIdsToDelete" : @"IdentityIdsToDelete",
             };
}

@end

@implementation AWSCognitoIdentityDeleteIdentitiesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityDescribeIdentityInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityDescribeIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityGetCredentialsForIdentityInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customRoleArn" : @"CustomRoleArn",
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetCredentialsForIdentityResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"identityPoolId" : @"IdentityPoolId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetIdResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityGetIdentityPoolRolesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityGetIdentityPoolRolesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityGetOpenIdTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityIdentityDescription

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"cognitoIdentityProviders" : @"CognitoIdentityProviders",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             };
}

@end

@implementation AWSCognitoIdentityListIdentitiesInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityListIdentityPoolsResponse

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

@implementation AWSCognitoIdentityLookupDeveloperIdentityInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"developerUserIdentifierList" : @"DeveloperUserIdentifierList",
             @"identityId" : @"IdentityId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityMappingRule

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityRoleMapping

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

@implementation AWSCognitoIdentityUnlinkDeveloperIdentityInput

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             @"loginsToRemove" : @"LoginsToRemove",
             };
}

@end

@implementation AWSCognitoIdentityUnprocessedIdentityId

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
