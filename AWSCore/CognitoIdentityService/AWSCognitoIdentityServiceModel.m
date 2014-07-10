/**
 * Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 */

#import "AWSCognitoIdentityServiceModel.h"
#import "AZCategory.h"

NSString *const AWSCognitoIdentityServiceErrorDomain = @"com.amazonaws.AWSCognitoIdentityServiceErrorDomain";

@implementation AWSCognitoIdentityServiceCreateIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"identityPoolName" : @"IdentityPoolName",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
}

@end

@implementation AWSCognitoIdentityServiceDeleteIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityServiceDescribeIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             };
}

@end

@implementation AWSCognitoIdentityServiceGetIdInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"identityPoolId" : @"IdentityPoolId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityServiceGetIdResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             };
}

@end

@implementation AWSCognitoIdentityServiceGetOpenIdTokenInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityServiceGetOpenIdTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityServiceIdentityDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityServiceIdentityPool

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
}

@end

@implementation AWSCognitoIdentityServiceIdentityPoolShortDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             };
}

@end

@implementation AWSCognitoIdentityServiceListIdentitiesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityServiceListIdentitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identities" : @"Identities",
             @"identityPoolId" : @"IdentityPoolId",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)identitiesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityServiceIdentityDescription class]];
}

@end

@implementation AWSCognitoIdentityServiceListIdentityPoolsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityServiceListIdentityPoolsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPools" : @"IdentityPools",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)identityPoolsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityServiceIdentityPoolShortDescription class]];
}

@end

@implementation AWSCognitoIdentityServiceUnlinkIdentityInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             @"loginsToRemove" : @"LoginsToRemove",
             };
}

@end
