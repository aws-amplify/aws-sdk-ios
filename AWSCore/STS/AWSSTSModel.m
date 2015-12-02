/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSTSModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSTSErrorDomain = @"com.amazonaws.AWSSTSErrorDomain";

@implementation AWSSTSAssumeRoleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"externalId" : @"ExternalId",
             @"policy" : @"Policy",
             @"roleArn" : @"RoleArn",
             @"roleSessionName" : @"RoleSessionName",
             @"serialNumber" : @"SerialNumber",
             @"tokenCode" : @"TokenCode",
             };
}

@end

@implementation AWSSTSAssumeRoleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"credentials" : @"Credentials",
             @"packedPolicySize" : @"PackedPolicySize",
             };
}

+ (NSValueTransformer *)assumedRoleUserJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSAssumedRoleUser class]];
}

+ (NSValueTransformer *)credentialsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

@end

@implementation AWSSTSAssumeRoleWithSAMLRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"policy" : @"Policy",
             @"principalArn" : @"PrincipalArn",
             @"roleArn" : @"RoleArn",
             @"SAMLAssertion" : @"SAMLAssertion",
             };
}

@end

@implementation AWSSTSAssumeRoleWithSAMLResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"audience" : @"Audience",
             @"credentials" : @"Credentials",
             @"issuer" : @"Issuer",
             @"nameQualifier" : @"NameQualifier",
             @"packedPolicySize" : @"PackedPolicySize",
             @"subject" : @"Subject",
             @"subjectType" : @"SubjectType",
             };
}

+ (NSValueTransformer *)assumedRoleUserJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSAssumedRoleUser class]];
}

+ (NSValueTransformer *)credentialsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

@end

@implementation AWSSTSAssumeRoleWithWebIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"policy" : @"Policy",
             @"providerId" : @"ProviderId",
             @"roleArn" : @"RoleArn",
             @"roleSessionName" : @"RoleSessionName",
             @"webIdentityToken" : @"WebIdentityToken",
             };
}

@end

@implementation AWSSTSAssumeRoleWithWebIdentityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"audience" : @"Audience",
             @"credentials" : @"Credentials",
             @"packedPolicySize" : @"PackedPolicySize",
             @"provider" : @"Provider",
             @"subjectFromWebIdentityToken" : @"SubjectFromWebIdentityToken",
             };
}

+ (NSValueTransformer *)assumedRoleUserJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSAssumedRoleUser class]];
}

+ (NSValueTransformer *)credentialsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

@end

@implementation AWSSTSAssumedRoleUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assumedRoleId" : @"AssumedRoleId",
             };
}

@end

@implementation AWSSTSCredentials

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             @"expiration" : @"Expiration",
             @"secretAccessKey" : @"SecretAccessKey",
             @"sessionToken" : @"SessionToken",
             };
}

+ (NSValueTransformer *)expirationJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSSTSDecodeAuthorizationMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encodedMessage" : @"EncodedMessage",
             };
}

@end

@implementation AWSSTSDecodeAuthorizationMessageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"decodedMessage" : @"DecodedMessage",
             };
}

@end

@implementation AWSSTSFederatedUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"federatedUserId" : @"FederatedUserId",
             };
}

@end

@implementation AWSSTSGetFederationTokenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"name" : @"Name",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSSTSGetFederationTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             @"federatedUser" : @"FederatedUser",
             @"packedPolicySize" : @"PackedPolicySize",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

+ (NSValueTransformer *)federatedUserJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSFederatedUser class]];
}

@end

@implementation AWSSTSGetSessionTokenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"serialNumber" : @"SerialNumber",
             @"tokenCode" : @"TokenCode",
             };
}

@end

@implementation AWSSTSGetSessionTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

@end
