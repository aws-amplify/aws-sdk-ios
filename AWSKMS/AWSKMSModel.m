//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSKMSModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKMSErrorDomain = @"com.amazonaws.AWSKMSErrorDomain";

@implementation AWSKMSAliasListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasArn" : @"AliasArn",
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSCancelKeyDeletionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSCancelKeyDeletionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSCreateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSCreateGrantRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"grantTokens" : @"GrantTokens",
             @"granteePrincipal" : @"GranteePrincipal",
             @"keyId" : @"KeyId",
             @"name" : @"Name",
             @"operations" : @"Operations",
             @"retiringPrincipal" : @"RetiringPrincipal",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSGrantConstraints class]];
}

@end

@implementation AWSKMSCreateGrantResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"grantToken" : @"GrantToken",
             };
}

@end

@implementation AWSKMSCreateKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassPolicyLockoutSafetyCheck" : @"BypassPolicyLockoutSafetyCheck",
             @"detail" : @"Description",
             @"keyUsage" : @"KeyUsage",
             @"origin" : @"Origin",
             @"policy" : @"Policy",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)keyUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENCRYPT_DECRYPT"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeEncryptDecrypt);
        }
        return @(AWSKMSKeyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyUsageTypeEncryptDecrypt:
                return @"ENCRYPT_DECRYPT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_KMS"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeAwsKms);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeExternal);
        }
        return @(AWSKMSOriginTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSOriginTypeAwsKms:
                return @"AWS_KMS";
            case AWSKMSOriginTypeExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSTag class]];
}

@end

@implementation AWSKMSCreateKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyMetadata" : @"KeyMetadata",
             };
}

+ (NSValueTransformer *)keyMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSKeyMetadata class]];
}

@end

@implementation AWSKMSDecryptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             };
}

@end

@implementation AWSKMSDecryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSDeleteAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             };
}

@end

@implementation AWSKMSDeleteImportedKeyMaterialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDescribeKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDescribeKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyMetadata" : @"KeyMetadata",
             };
}

+ (NSValueTransformer *)keyMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSKeyMetadata class]];
}

@end

@implementation AWSKMSDisableKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDisableKeyRotationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSEnableKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSEnableKeyRotationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSEncryptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSEncryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGenerateDataKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"keySpec" : @"KeySpec",
             @"numberOfBytes" : @"NumberOfBytes",
             };
}

+ (NSValueTransformer *)keySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES_256"] == NSOrderedSame) {
            return @(AWSKMSDataKeySpecAes256);
        }
        if ([value caseInsensitiveCompare:@"AES_128"] == NSOrderedSame) {
            return @(AWSKMSDataKeySpecAes128);
        }
        return @(AWSKMSDataKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeySpecAes256:
                return @"AES_256";
            case AWSKMSDataKeySpecAes128:
                return @"AES_128";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSGenerateDataKeyWithoutPlaintextRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"keySpec" : @"KeySpec",
             @"numberOfBytes" : @"NumberOfBytes",
             };
}

+ (NSValueTransformer *)keySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES_256"] == NSOrderedSame) {
            return @(AWSKMSDataKeySpecAes256);
        }
        if ([value caseInsensitiveCompare:@"AES_128"] == NSOrderedSame) {
            return @(AWSKMSDataKeySpecAes128);
        }
        return @(AWSKMSDataKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeySpecAes256:
                return @"AES_256";
            case AWSKMSDataKeySpecAes128:
                return @"AES_128";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyWithoutPlaintextResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGenerateRandomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfBytes" : @"NumberOfBytes",
             };
}

@end

@implementation AWSKMSGenerateRandomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSGetKeyPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSKMSGetKeyPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSKMSGetKeyRotationStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGetKeyRotationStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyRotationEnabled" : @"KeyRotationEnabled",
             };
}

@end

@implementation AWSKMSGetParametersForImportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"wrappingAlgorithm" : @"WrappingAlgorithm",
             @"wrappingKeySpec" : @"WrappingKeySpec",
             };
}

+ (NSValueTransformer *)wrappingAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSAES_PKCS1_V1_5"] == NSOrderedSame) {
            return @(AWSKMSAlgorithmSpecRsaesPkcs1V15);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSAlgorithmSpecRsaesPkcs1V15:
                return @"RSAES_PKCS1_V1_5";
            case AWSKMSAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)wrappingKeySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSWrappingKeySpecRsa2048);
        }
        return @(AWSKMSWrappingKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSWrappingKeySpecRsa2048:
                return @"RSA_2048";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGetParametersForImportResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importToken" : @"ImportToken",
             @"keyId" : @"KeyId",
             @"parametersValidTo" : @"ParametersValidTo",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)parametersValidToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSGrantConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContextEquals" : @"EncryptionContextEquals",
             @"encryptionContextSubset" : @"EncryptionContextSubset",
             };
}

@end

@implementation AWSKMSGrantListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraints" : @"Constraints",
             @"creationDate" : @"CreationDate",
             @"grantId" : @"GrantId",
             @"granteePrincipal" : @"GranteePrincipal",
             @"issuingAccount" : @"IssuingAccount",
             @"keyId" : @"KeyId",
             @"name" : @"Name",
             @"operations" : @"Operations",
             @"retiringPrincipal" : @"RetiringPrincipal",
             };
}

+ (NSValueTransformer *)constraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSGrantConstraints class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSImportKeyMaterialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptedKeyMaterial" : @"EncryptedKeyMaterial",
             @"expirationModel" : @"ExpirationModel",
             @"importToken" : @"ImportToken",
             @"keyId" : @"KeyId",
             @"validTo" : @"ValidTo",
             };
}

+ (NSValueTransformer *)expirationModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEY_MATERIAL_EXPIRES"] == NSOrderedSame) {
            return @(AWSKMSExpirationModelTypeKeyMaterialExpires);
        }
        if ([value caseInsensitiveCompare:@"KEY_MATERIAL_DOES_NOT_EXPIRE"] == NSOrderedSame) {
            return @(AWSKMSExpirationModelTypeKeyMaterialDoesNotExpire);
        }
        return @(AWSKMSExpirationModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSExpirationModelTypeKeyMaterialExpires:
                return @"KEY_MATERIAL_EXPIRES";
            case AWSKMSExpirationModelTypeKeyMaterialDoesNotExpire:
                return @"KEY_MATERIAL_DOES_NOT_EXPIRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSImportKeyMaterialResponse

@end

@implementation AWSKMSKeyListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyArn" : @"KeyArn",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSKeyMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountId" : @"AWSAccountId",
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"deletionDate" : @"DeletionDate",
             @"detail" : @"Description",
             @"enabled" : @"Enabled",
             @"expirationModel" : @"ExpirationModel",
             @"keyId" : @"KeyId",
             @"keyState" : @"KeyState",
             @"keyUsage" : @"KeyUsage",
             @"origin" : @"Origin",
             @"validTo" : @"ValidTo",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expirationModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEY_MATERIAL_EXPIRES"] == NSOrderedSame) {
            return @(AWSKMSExpirationModelTypeKeyMaterialExpires);
        }
        if ([value caseInsensitiveCompare:@"KEY_MATERIAL_DOES_NOT_EXPIRE"] == NSOrderedSame) {
            return @(AWSKMSExpirationModelTypeKeyMaterialDoesNotExpire);
        }
        return @(AWSKMSExpirationModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSExpirationModelTypeKeyMaterialExpires:
                return @"KEY_MATERIAL_EXPIRES";
            case AWSKMSExpirationModelTypeKeyMaterialDoesNotExpire:
                return @"KEY_MATERIAL_DOES_NOT_EXPIRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSKMSKeyStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
            return @(AWSKMSKeyStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"PendingDeletion"] == NSOrderedSame) {
            return @(AWSKMSKeyStatePendingDeletion);
        }
        if ([value caseInsensitiveCompare:@"PendingImport"] == NSOrderedSame) {
            return @(AWSKMSKeyStatePendingImport);
        }
        return @(AWSKMSKeyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyStateEnabled:
                return @"Enabled";
            case AWSKMSKeyStateDisabled:
                return @"Disabled";
            case AWSKMSKeyStatePendingDeletion:
                return @"PendingDeletion";
            case AWSKMSKeyStatePendingImport:
                return @"PendingImport";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENCRYPT_DECRYPT"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeEncryptDecrypt);
        }
        return @(AWSKMSKeyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyUsageTypeEncryptDecrypt:
                return @"ENCRYPT_DECRYPT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS_KMS"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeAwsKms);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeExternal);
        }
        return @(AWSKMSOriginTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSOriginTypeAwsKms:
                return @"AWS_KMS";
            case AWSKMSOriginTypeExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSListAliasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListAliasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"nextMarker" : @"NextMarker",
             @"truncated" : @"Truncated",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSAliasListEntry class]];
}

@end

@implementation AWSKMSListGrantsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListGrantsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grants" : @"Grants",
             @"nextMarker" : @"NextMarker",
             @"truncated" : @"Truncated",
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSGrantListEntry class]];
}

@end

@implementation AWSKMSListKeyPoliciesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListKeyPoliciesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"policyNames" : @"PolicyNames",
             @"truncated" : @"Truncated",
             };
}

@end

@implementation AWSKMSListKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListKeysResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keys" : @"Keys",
             @"nextMarker" : @"NextMarker",
             @"truncated" : @"Truncated",
             };
}

+ (NSValueTransformer *)keysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSKeyListEntry class]];
}

@end

@implementation AWSKMSListResourceTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListResourceTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"tags" : @"Tags",
             @"truncated" : @"Truncated",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSTag class]];
}

@end

@implementation AWSKMSListRetirableGrantsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"retiringPrincipal" : @"RetiringPrincipal",
             };
}

@end

@implementation AWSKMSPutKeyPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassPolicyLockoutSafetyCheck" : @"BypassPolicyLockoutSafetyCheck",
             @"keyId" : @"KeyId",
             @"policy" : @"Policy",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSKMSReEncryptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"destinationEncryptionContext" : @"DestinationEncryptionContext",
             @"destinationKeyId" : @"DestinationKeyId",
             @"grantTokens" : @"GrantTokens",
             @"sourceEncryptionContext" : @"SourceEncryptionContext",
             };
}

@end

@implementation AWSKMSReEncryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             @"sourceKeyId" : @"SourceKeyId",
             };
}

@end

@implementation AWSKMSRetireGrantRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"grantToken" : @"GrantToken",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSRevokeGrantRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSScheduleKeyDeletionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"pendingWindowInDays" : @"PendingWindowInDays",
             };
}

@end

@implementation AWSKMSScheduleKeyDeletionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionDate" : @"DeletionDate",
             @"keyId" : @"KeyId",
             };
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagKey" : @"TagKey",
             @"tagValue" : @"TagValue",
             };
}

@end

@implementation AWSKMSTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSTag class]];
}

@end

@implementation AWSKMSUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSKMSUpdateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSUpdateKeyDescriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             };
}

@end
