/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSCognitoIdentityModel.h"
#import "AWSCategory.h"

NSString *const AWSCognitoIdentityErrorDomain = @"com.amazonaws.AWSCognitoIdentityErrorDomain";

@implementation AWSCognitoIdentityCreateIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolName" : @"IdentityPoolName",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
}

@end

@implementation AWSCognitoIdentityDeleteIdentityPoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityPoolId" : @"IdentityPoolId",
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
             @"identityId" : @"IdentityId",
             @"logins" : @"Logins",
             };
}

@end

@implementation AWSCognitoIdentityIdentityPool

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowUnauthenticatedIdentities" : @"AllowUnauthenticatedIdentities",
             @"developerProviderName" : @"DeveloperProviderName",
             @"identityPoolId" : @"IdentityPoolId",
             @"identityPoolName" : @"IdentityPoolName",
             @"supportedLoginProviders" : @"SupportedLoginProviders",
             };
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
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityIdentityDescription class]];
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
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityIdentityPoolShortDescription class]];
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
