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

@implementation AWSKMSConnectCustomKeyStoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSConnectCustomKeyStoreResponse

@end

@implementation AWSKMSCreateAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSCreateCustomKeyStoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudHsmClusterId" : @"CloudHsmClusterId",
             @"customKeyStoreName" : @"CustomKeyStoreName",
             @"keyStorePassword" : @"KeyStorePassword",
             @"trustAnchorCertificate" : @"TrustAnchorCertificate",
             };
}

@end

@implementation AWSKMSCreateCustomKeyStoreResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
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
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"customerMasterKeySpec" : @"CustomerMasterKeySpec",
             @"detail" : @"Description",
             @"keyUsage" : @"KeyUsage",
             @"origin" : @"Origin",
             @"policy" : @"Policy",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)customerMasterKeySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecSymmetricDefault);
        }
        return @(AWSKMSCustomerMasterKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSCustomerMasterKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSCustomerMasterKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSCustomerMasterKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSCustomerMasterKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSCustomerMasterKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSCustomerMasterKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSCustomerMasterKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSCustomerMasterKeySpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIGN_VERIFY"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeSignVerify);
        }
        if ([value caseInsensitiveCompare:@"ENCRYPT_DECRYPT"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeEncryptDecrypt);
        }
        return @(AWSKMSKeyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyUsageTypeSignVerify:
                return @"SIGN_VERIFY";
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
        if ([value caseInsensitiveCompare:@"AWS_CLOUDHSM"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeAwsCloudhsm);
        }
        return @(AWSKMSOriginTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSOriginTypeAwsKms:
                return @"AWS_KMS";
            case AWSKMSOriginTypeExternal:
                return @"EXTERNAL";
            case AWSKMSOriginTypeAwsCloudhsm:
                return @"AWS_CLOUDHSM";
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

@implementation AWSKMSCustomKeyStoresListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudHsmClusterId" : @"CloudHsmClusterId",
             @"connectionErrorCode" : @"ConnectionErrorCode",
             @"connectionState" : @"ConnectionState",
             @"creationDate" : @"CreationDate",
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"customKeyStoreName" : @"CustomKeyStoreName",
             @"trustAnchorCertificate" : @"TrustAnchorCertificate",
             };
}

+ (NSValueTransformer *)connectionErrorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID_CREDENTIALS"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeInvalidCredentials);
        }
        if ([value caseInsensitiveCompare:@"CLUSTER_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeClusterNotFound);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_ERRORS"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeNetworkErrors);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeInternalError);
        }
        if ([value caseInsensitiveCompare:@"INSUFFICIENT_CLOUDHSM_HSMS"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeInsufficientCloudhsmHsms);
        }
        if ([value caseInsensitiveCompare:@"USER_LOCKED_OUT"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeUserLockedOut);
        }
        if ([value caseInsensitiveCompare:@"USER_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeUserNotFound);
        }
        if ([value caseInsensitiveCompare:@"USER_LOGGED_IN"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeUserLoggedIn);
        }
        if ([value caseInsensitiveCompare:@"SUBNET_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSKMSConnectionErrorCodeTypeSubnetNotFound);
        }
        return @(AWSKMSConnectionErrorCodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSConnectionErrorCodeTypeInvalidCredentials:
                return @"INVALID_CREDENTIALS";
            case AWSKMSConnectionErrorCodeTypeClusterNotFound:
                return @"CLUSTER_NOT_FOUND";
            case AWSKMSConnectionErrorCodeTypeNetworkErrors:
                return @"NETWORK_ERRORS";
            case AWSKMSConnectionErrorCodeTypeInternalError:
                return @"INTERNAL_ERROR";
            case AWSKMSConnectionErrorCodeTypeInsufficientCloudhsmHsms:
                return @"INSUFFICIENT_CLOUDHSM_HSMS";
            case AWSKMSConnectionErrorCodeTypeUserLockedOut:
                return @"USER_LOCKED_OUT";
            case AWSKMSConnectionErrorCodeTypeUserNotFound:
                return @"USER_NOT_FOUND";
            case AWSKMSConnectionErrorCodeTypeUserLoggedIn:
                return @"USER_LOGGED_IN";
            case AWSKMSConnectionErrorCodeTypeSubnetNotFound:
                return @"SUBNET_NOT_FOUND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSKMSConnectionStateTypeConnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTING"] == NSOrderedSame) {
            return @(AWSKMSConnectionStateTypeConnecting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSKMSConnectionStateTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"DISCONNECTED"] == NSOrderedSame) {
            return @(AWSKMSConnectionStateTypeDisconnected);
        }
        if ([value caseInsensitiveCompare:@"DISCONNECTING"] == NSOrderedSame) {
            return @(AWSKMSConnectionStateTypeDisconnecting);
        }
        return @(AWSKMSConnectionStateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSConnectionStateTypeConnected:
                return @"CONNECTED";
            case AWSKMSConnectionStateTypeConnecting:
                return @"CONNECTING";
            case AWSKMSConnectionStateTypeFailed:
                return @"FAILED";
            case AWSKMSConnectionStateTypeDisconnected:
                return @"DISCONNECTED";
            case AWSKMSConnectionStateTypeDisconnecting:
                return @"DISCONNECTING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSDecryptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"encryptionAlgorithm" : @"EncryptionAlgorithm",
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             };
}

+ (NSValueTransformer *)encryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSDecryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionAlgorithm" : @"EncryptionAlgorithm",
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

+ (NSValueTransformer *)encryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSDeleteAliasRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             };
}

@end

@implementation AWSKMSDeleteCustomKeyStoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSDeleteCustomKeyStoreResponse

@end

@implementation AWSKMSDeleteImportedKeyMaterialRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDescribeCustomKeyStoresRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"customKeyStoreName" : @"CustomKeyStoreName",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSDescribeCustomKeyStoresResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStores" : @"CustomKeyStores",
             @"nextMarker" : @"NextMarker",
             @"truncated" : @"Truncated",
             };
}

+ (NSValueTransformer *)customKeyStoresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSCustomKeyStoresListEntry class]];
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

@implementation AWSKMSDisconnectCustomKeyStoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSDisconnectCustomKeyStoreResponse

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
             @"encryptionAlgorithm" : @"EncryptionAlgorithm",
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

+ (NSValueTransformer *)encryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSEncryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"encryptionAlgorithm" : @"EncryptionAlgorithm",
             @"keyId" : @"KeyId",
             };
}

+ (NSValueTransformer *)encryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"keyPairSpec" : @"KeyPairSpec",
             };
}

+ (NSValueTransformer *)keyPairSpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccSecgP256k1);
        }
        return @(AWSKMSDataKeyPairSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeyPairSpecRsa2048:
                return @"RSA_2048";
            case AWSKMSDataKeyPairSpecRsa3072:
                return @"RSA_3072";
            case AWSKMSDataKeyPairSpecRsa4096:
                return @"RSA_4096";
            case AWSKMSDataKeyPairSpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSDataKeyPairSpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSDataKeyPairSpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSDataKeyPairSpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyPairResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"keyPairSpec" : @"KeyPairSpec",
             @"privateKeyCiphertextBlob" : @"PrivateKeyCiphertextBlob",
             @"privateKeyPlaintext" : @"PrivateKeyPlaintext",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)keyPairSpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccSecgP256k1);
        }
        return @(AWSKMSDataKeyPairSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeyPairSpecRsa2048:
                return @"RSA_2048";
            case AWSKMSDataKeyPairSpecRsa3072:
                return @"RSA_3072";
            case AWSKMSDataKeyPairSpecRsa4096:
                return @"RSA_4096";
            case AWSKMSDataKeyPairSpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSDataKeyPairSpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSDataKeyPairSpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSDataKeyPairSpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyPairWithoutPlaintextRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContext" : @"EncryptionContext",
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"keyPairSpec" : @"KeyPairSpec",
             };
}

+ (NSValueTransformer *)keyPairSpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccSecgP256k1);
        }
        return @(AWSKMSDataKeyPairSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeyPairSpecRsa2048:
                return @"RSA_2048";
            case AWSKMSDataKeyPairSpecRsa3072:
                return @"RSA_3072";
            case AWSKMSDataKeyPairSpecRsa4096:
                return @"RSA_4096";
            case AWSKMSDataKeyPairSpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSDataKeyPairSpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSDataKeyPairSpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSDataKeyPairSpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSGenerateDataKeyPairWithoutPlaintextResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"keyPairSpec" : @"KeyPairSpec",
             @"privateKeyCiphertextBlob" : @"PrivateKeyCiphertextBlob",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)keyPairSpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSDataKeyPairSpecEccSecgP256k1);
        }
        return @(AWSKMSDataKeyPairSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSDataKeyPairSpecRsa2048:
                return @"RSA_2048";
            case AWSKMSDataKeyPairSpecRsa3072:
                return @"RSA_3072";
            case AWSKMSDataKeyPairSpecRsa4096:
                return @"RSA_4096";
            case AWSKMSDataKeyPairSpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSDataKeyPairSpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSDataKeyPairSpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSDataKeyPairSpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            default:
                return nil;
        }
    }];
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
             @"customKeyStoreId" : @"CustomKeyStoreId",
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

@implementation AWSKMSGetPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGetPublicKeyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerMasterKeySpec" : @"CustomerMasterKeySpec",
             @"encryptionAlgorithms" : @"EncryptionAlgorithms",
             @"keyId" : @"KeyId",
             @"keyUsage" : @"KeyUsage",
             @"publicKey" : @"PublicKey",
             @"signingAlgorithms" : @"SigningAlgorithms",
             };
}

+ (NSValueTransformer *)customerMasterKeySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecSymmetricDefault);
        }
        return @(AWSKMSCustomerMasterKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSCustomerMasterKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSCustomerMasterKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSCustomerMasterKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSCustomerMasterKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSCustomerMasterKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSCustomerMasterKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSCustomerMasterKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSCustomerMasterKeySpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIGN_VERIFY"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeSignVerify);
        }
        if ([value caseInsensitiveCompare:@"ENCRYPT_DECRYPT"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeEncryptDecrypt);
        }
        return @(AWSKMSKeyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyUsageTypeSignVerify:
                return @"SIGN_VERIFY";
            case AWSKMSKeyUsageTypeEncryptDecrypt:
                return @"ENCRYPT_DECRYPT";
            default:
                return nil;
        }
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
             @"cloudHsmClusterId" : @"CloudHsmClusterId",
             @"creationDate" : @"CreationDate",
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"customerMasterKeySpec" : @"CustomerMasterKeySpec",
             @"deletionDate" : @"DeletionDate",
             @"detail" : @"Description",
             @"enabled" : @"Enabled",
             @"encryptionAlgorithms" : @"EncryptionAlgorithms",
             @"expirationModel" : @"ExpirationModel",
             @"keyId" : @"KeyId",
             @"keyManager" : @"KeyManager",
             @"keyState" : @"KeyState",
             @"keyUsage" : @"KeyUsage",
             @"origin" : @"Origin",
             @"signingAlgorithms" : @"SigningAlgorithms",
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

+ (NSValueTransformer *)customerMasterKeySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSCustomerMasterKeySpecSymmetricDefault);
        }
        return @(AWSKMSCustomerMasterKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSCustomerMasterKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSCustomerMasterKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSCustomerMasterKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSCustomerMasterKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSCustomerMasterKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSCustomerMasterKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSCustomerMasterKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSCustomerMasterKeySpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            default:
                return nil;
        }
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

+ (NSValueTransformer *)keyManagerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AWS"] == NSOrderedSame) {
            return @(AWSKMSKeyManagerTypeAws);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER"] == NSOrderedSame) {
            return @(AWSKMSKeyManagerTypeCustomer);
        }
        return @(AWSKMSKeyManagerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyManagerTypeAws:
                return @"AWS";
            case AWSKMSKeyManagerTypeCustomer:
                return @"CUSTOMER";
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
        if ([value caseInsensitiveCompare:@"Unavailable"] == NSOrderedSame) {
            return @(AWSKMSKeyStateUnavailable);
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
            case AWSKMSKeyStateUnavailable:
                return @"Unavailable";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIGN_VERIFY"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeSignVerify);
        }
        if ([value caseInsensitiveCompare:@"ENCRYPT_DECRYPT"] == NSOrderedSame) {
            return @(AWSKMSKeyUsageTypeEncryptDecrypt);
        }
        return @(AWSKMSKeyUsageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyUsageTypeSignVerify:
                return @"SIGN_VERIFY";
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
        if ([value caseInsensitiveCompare:@"AWS_CLOUDHSM"] == NSOrderedSame) {
            return @(AWSKMSOriginTypeAwsCloudhsm);
        }
        return @(AWSKMSOriginTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSOriginTypeAwsKms:
                return @"AWS_KMS";
            case AWSKMSOriginTypeExternal:
                return @"EXTERNAL";
            case AWSKMSOriginTypeAwsCloudhsm:
                return @"AWS_CLOUDHSM";
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
             @"keyId" : @"KeyId",
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
             @"destinationEncryptionAlgorithm" : @"DestinationEncryptionAlgorithm",
             @"destinationEncryptionContext" : @"DestinationEncryptionContext",
             @"destinationKeyId" : @"DestinationKeyId",
             @"grantTokens" : @"GrantTokens",
             @"sourceEncryptionAlgorithm" : @"SourceEncryptionAlgorithm",
             @"sourceEncryptionContext" : @"SourceEncryptionContext",
             @"sourceKeyId" : @"SourceKeyId",
             };
}

+ (NSValueTransformer *)destinationEncryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceEncryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSReEncryptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"destinationEncryptionAlgorithm" : @"DestinationEncryptionAlgorithm",
             @"keyId" : @"KeyId",
             @"sourceEncryptionAlgorithm" : @"SourceEncryptionAlgorithm",
             @"sourceKeyId" : @"SourceKeyId",
             };
}

+ (NSValueTransformer *)destinationEncryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceEncryptionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecSymmetricDefault);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_1"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1);
        }
        if ([value caseInsensitiveCompare:@"RSAES_OAEP_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256);
        }
        return @(AWSKMSEncryptionAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSEncryptionAlgorithmSpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1:
                return @"RSAES_OAEP_SHA_1";
            case AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256:
                return @"RSAES_OAEP_SHA_256";
            default:
                return nil;
        }
    }];
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

@implementation AWSKMSSignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"message" : @"Message",
             @"messageType" : @"MessageType",
             @"signingAlgorithm" : @"SigningAlgorithm",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSKMSMessageTypeRAW);
        }
        if ([value caseInsensitiveCompare:@"DIGEST"] == NSOrderedSame) {
            return @(AWSKMSMessageTypeDigest);
        }
        return @(AWSKMSMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSMessageTypeRAW:
                return @"RAW";
            case AWSKMSMessageTypeDigest:
                return @"DIGEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)signingAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha512);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha256);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha384);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha512);
        }
        return @(AWSKMSSigningAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSSigningAlgorithmSpecRsassaPssSha256:
                return @"RSASSA_PSS_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha384:
                return @"RSASSA_PSS_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha512:
                return @"RSASSA_PSS_SHA_512";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256:
                return @"RSASSA_PKCS1_V1_5_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384:
                return @"RSASSA_PKCS1_V1_5_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512:
                return @"RSASSA_PKCS1_V1_5_SHA_512";
            case AWSKMSSigningAlgorithmSpecEcdsaSha256:
                return @"ECDSA_SHA_256";
            case AWSKMSSigningAlgorithmSpecEcdsaSha384:
                return @"ECDSA_SHA_384";
            case AWSKMSSigningAlgorithmSpecEcdsaSha512:
                return @"ECDSA_SHA_512";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSSignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"signature" : @"Signature",
             @"signingAlgorithm" : @"SigningAlgorithm",
             };
}

+ (NSValueTransformer *)signingAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha512);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha256);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha384);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha512);
        }
        return @(AWSKMSSigningAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSSigningAlgorithmSpecRsassaPssSha256:
                return @"RSASSA_PSS_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha384:
                return @"RSASSA_PSS_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha512:
                return @"RSASSA_PSS_SHA_512";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256:
                return @"RSASSA_PKCS1_V1_5_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384:
                return @"RSASSA_PKCS1_V1_5_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512:
                return @"RSASSA_PKCS1_V1_5_SHA_512";
            case AWSKMSSigningAlgorithmSpecEcdsaSha256:
                return @"ECDSA_SHA_256";
            case AWSKMSSigningAlgorithmSpecEcdsaSha384:
                return @"ECDSA_SHA_384";
            case AWSKMSSigningAlgorithmSpecEcdsaSha512:
                return @"ECDSA_SHA_512";
            default:
                return nil;
        }
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

@implementation AWSKMSUpdateCustomKeyStoreRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudHsmClusterId" : @"CloudHsmClusterId",
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"keyStorePassword" : @"KeyStorePassword",
             @"latestCustomKeyStoreName" : @"NewCustomKeyStoreName",
             };
}

@end

@implementation AWSKMSUpdateCustomKeyStoreResponse

@end

@implementation AWSKMSUpdateKeyDescriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSVerifyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             @"message" : @"Message",
             @"messageType" : @"MessageType",
             @"signature" : @"Signature",
             @"signingAlgorithm" : @"SigningAlgorithm",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSKMSMessageTypeRAW);
        }
        if ([value caseInsensitiveCompare:@"DIGEST"] == NSOrderedSame) {
            return @(AWSKMSMessageTypeDigest);
        }
        return @(AWSKMSMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSMessageTypeRAW:
                return @"RAW";
            case AWSKMSMessageTypeDigest:
                return @"DIGEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)signingAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha512);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha256);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha384);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha512);
        }
        return @(AWSKMSSigningAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSSigningAlgorithmSpecRsassaPssSha256:
                return @"RSASSA_PSS_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha384:
                return @"RSASSA_PSS_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha512:
                return @"RSASSA_PSS_SHA_512";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256:
                return @"RSASSA_PKCS1_V1_5_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384:
                return @"RSASSA_PKCS1_V1_5_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512:
                return @"RSASSA_PKCS1_V1_5_SHA_512";
            case AWSKMSSigningAlgorithmSpecEcdsaSha256:
                return @"ECDSA_SHA_256";
            case AWSKMSSigningAlgorithmSpecEcdsaSha384:
                return @"ECDSA_SHA_384";
            case AWSKMSSigningAlgorithmSpecEcdsaSha512:
                return @"ECDSA_SHA_512";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSVerifyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"signatureValid" : @"SignatureValid",
             @"signingAlgorithm" : @"SigningAlgorithm",
             };
}

+ (NSValueTransformer *)signingAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PSS_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPssSha512);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384);
        }
        if ([value caseInsensitiveCompare:@"RSASSA_PKCS1_V1_5_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_256"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha256);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_384"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha384);
        }
        if ([value caseInsensitiveCompare:@"ECDSA_SHA_512"] == NSOrderedSame) {
            return @(AWSKMSSigningAlgorithmSpecEcdsaSha512);
        }
        return @(AWSKMSSigningAlgorithmSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSSigningAlgorithmSpecRsassaPssSha256:
                return @"RSASSA_PSS_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha384:
                return @"RSASSA_PSS_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPssSha512:
                return @"RSASSA_PSS_SHA_512";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256:
                return @"RSASSA_PKCS1_V1_5_SHA_256";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384:
                return @"RSASSA_PKCS1_V1_5_SHA_384";
            case AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512:
                return @"RSASSA_PKCS1_V1_5_SHA_512";
            case AWSKMSSigningAlgorithmSpecEcdsaSha256:
                return @"ECDSA_SHA_256";
            case AWSKMSSigningAlgorithmSpecEcdsaSha384:
                return @"ECDSA_SHA_384";
            case AWSKMSSigningAlgorithmSpecEcdsaSha512:
                return @"ECDSA_SHA_512";
            default:
                return nil;
        }
    }];
}

@end
