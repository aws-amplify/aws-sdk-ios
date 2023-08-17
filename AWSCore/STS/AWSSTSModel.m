//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSTSModel.h"
#import "AWSCategory.h"

NSString *const AWSSTSErrorDomain = @"com.amazonaws.AWSSTSErrorDomain";

@implementation AWSSTSAssumeRoleRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"externalId" : @"ExternalId",
             @"policy" : @"Policy",
             @"policyArns" : @"PolicyArns",
             @"providedContexts" : @"ProvidedContexts",
             @"roleArn" : @"RoleArn",
             @"roleSessionName" : @"RoleSessionName",
             @"serialNumber" : @"SerialNumber",
             @"sourceIdentity" : @"SourceIdentity",
             @"tags" : @"Tags",
             @"tokenCode" : @"TokenCode",
             @"transitiveTagKeys" : @"TransitiveTagKeys",
             };
}

+ (NSValueTransformer *)policyArnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSPolicyDescriptorType class]];
}

+ (NSValueTransformer *)providedContextsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSProvidedContext class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSTag class]];
}

@end

@implementation AWSSTSAssumeRoleResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"credentials" : @"Credentials",
             @"packedPolicySize" : @"PackedPolicySize",
             @"sourceIdentity" : @"SourceIdentity",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"policy" : @"Policy",
             @"policyArns" : @"PolicyArns",
             @"principalArn" : @"PrincipalArn",
             @"roleArn" : @"RoleArn",
             @"SAMLAssertion" : @"SAMLAssertion",
             };
}

+ (NSValueTransformer *)policyArnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSPolicyDescriptorType class]];
}

@end

@implementation AWSSTSAssumeRoleWithSAMLResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"audience" : @"Audience",
             @"credentials" : @"Credentials",
             @"issuer" : @"Issuer",
             @"nameQualifier" : @"NameQualifier",
             @"packedPolicySize" : @"PackedPolicySize",
             @"sourceIdentity" : @"SourceIdentity",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"policy" : @"Policy",
             @"policyArns" : @"PolicyArns",
             @"providerId" : @"ProviderId",
             @"roleArn" : @"RoleArn",
             @"roleSessionName" : @"RoleSessionName",
             @"webIdentityToken" : @"WebIdentityToken",
             };
}

+ (NSValueTransformer *)policyArnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSPolicyDescriptorType class]];
}

@end

@implementation AWSSTSAssumeRoleWithWebIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assumedRoleUser" : @"AssumedRoleUser",
             @"audience" : @"Audience",
             @"credentials" : @"Credentials",
             @"packedPolicySize" : @"PackedPolicySize",
             @"provider" : @"Provider",
             @"sourceIdentity" : @"SourceIdentity",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"assumedRoleId" : @"AssumedRoleId",
             };
}

@end

@implementation AWSSTSCredentials

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encodedMessage" : @"EncodedMessage",
             };
}

@end

@implementation AWSSTSDecodeAuthorizationMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"decodedMessage" : @"DecodedMessage",
             };
}

@end

@implementation AWSSTSFederatedUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"federatedUserId" : @"FederatedUserId",
             };
}

@end

@implementation AWSSTSGetAccessKeyInfoRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessKeyId" : @"AccessKeyId",
             };
}

@end

@implementation AWSSTSGetAccessKeyInfoResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             };
}

@end

@implementation AWSSTSGetCallerIdentityRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSSTSGetCallerIdentityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             @"arn" : @"Arn",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSSTSGetFederationTokenRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"name" : @"Name",
             @"policy" : @"Policy",
             @"policyArns" : @"PolicyArns",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)policyArnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSPolicyDescriptorType class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSTSTag class]];
}

@end

@implementation AWSSTSGetFederationTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationSeconds" : @"DurationSeconds",
             @"serialNumber" : @"SerialNumber",
             @"tokenCode" : @"TokenCode",
             };
}

@end

@implementation AWSSTSGetSessionTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSTSCredentials class]];
}

@end

@implementation AWSSTSPolicyDescriptorType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             };
}

@end

@implementation AWSSTSProvidedContext

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contextAssertion" : @"ContextAssertion",
             @"providerArn" : @"ProviderArn",
             };
}

@end

@implementation AWSSTSTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end
