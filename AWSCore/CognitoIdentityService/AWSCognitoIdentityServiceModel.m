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

#import "AWSCognitoIdentityServiceModel.h"
#import "AWSCategory.h"

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
