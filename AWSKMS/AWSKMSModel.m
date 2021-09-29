//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasArn" : @"AliasArn",
             @"aliasName" : @"AliasName",
             @"creationDate" : @"CreationDate",
             @"lastUpdatedDate" : @"LastUpdatedDate",
             @"targetKeyId" : @"TargetKeyId",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKMSCancelKeyDeletionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSCancelKeyDeletionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSConnectCustomKeyStoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSConnectCustomKeyStoreResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKMSCreateAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSCreateCustomKeyStoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSCreateGrantRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"grantToken" : @"GrantToken",
             };
}

@end

@implementation AWSKMSCreateKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassPolicyLockoutSafetyCheck" : @"BypassPolicyLockoutSafetyCheck",
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"customerMasterKeySpec" : @"CustomerMasterKeySpec",
             @"detail" : @"Description",
             @"keySpec" : @"KeySpec",
             @"keyUsage" : @"KeyUsage",
             @"multiRegion" : @"MultiRegion",
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

+ (NSValueTransformer *)keySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSKeySpecSymmetricDefault);
        }
        return @(AWSKMSKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSKeySpecSymmetricDefault:
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             };
}

@end

@implementation AWSKMSDeleteCustomKeyStoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSDeleteCustomKeyStoreResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKMSDeleteImportedKeyMaterialRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDescribeCustomKeyStoresRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDescribeKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDisableKeyRotationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSDisconnectCustomKeyStoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             };
}

@end

@implementation AWSKMSDisconnectCustomKeyStoreResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKMSEnableKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSEnableKeyRotationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSEncryptRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSGenerateDataKeyWithoutPlaintextRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ciphertextBlob" : @"CiphertextBlob",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGenerateRandomRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customKeyStoreId" : @"CustomKeyStoreId",
             @"numberOfBytes" : @"NumberOfBytes",
             };
}

@end

@implementation AWSKMSGenerateRandomResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"plaintext" : @"Plaintext",
             };
}

@end

@implementation AWSKMSGetKeyPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSKMSGetKeyPolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSKMSGetKeyRotationStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGetKeyRotationStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyRotationEnabled" : @"KeyRotationEnabled",
             };
}

@end

@implementation AWSKMSGetParametersForImportRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantTokens" : @"GrantTokens",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSGetPublicKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerMasterKeySpec" : @"CustomerMasterKeySpec",
             @"encryptionAlgorithms" : @"EncryptionAlgorithms",
             @"keyId" : @"KeyId",
             @"keySpec" : @"KeySpec",
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

+ (NSValueTransformer *)keySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSKeySpecSymmetricDefault);
        }
        return @(AWSKMSKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSKeySpecSymmetricDefault:
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionContextEquals" : @"EncryptionContextEquals",
             @"encryptionContextSubset" : @"EncryptionContextSubset",
             };
}

@end

@implementation AWSKMSGrantListEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKMSKeyListEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyArn" : @"KeyArn",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSKeyMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"keySpec" : @"KeySpec",
             @"keyState" : @"KeyState",
             @"keyUsage" : @"KeyUsage",
             @"multiRegion" : @"MultiRegion",
             @"multiRegionConfiguration" : @"MultiRegionConfiguration",
             @"origin" : @"Origin",
             @"pendingDeletionWindowInDays" : @"PendingDeletionWindowInDays",
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

+ (NSValueTransformer *)keySpecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RSA_2048"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa2048);
        }
        if ([value caseInsensitiveCompare:@"RSA_3072"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa3072);
        }
        if ([value caseInsensitiveCompare:@"RSA_4096"] == NSOrderedSame) {
            return @(AWSKMSKeySpecRsa4096);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P256"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP256);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P384"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP384);
        }
        if ([value caseInsensitiveCompare:@"ECC_NIST_P521"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccNistP521);
        }
        if ([value caseInsensitiveCompare:@"ECC_SECG_P256K1"] == NSOrderedSame) {
            return @(AWSKMSKeySpecEccSecgP256k1);
        }
        if ([value caseInsensitiveCompare:@"SYMMETRIC_DEFAULT"] == NSOrderedSame) {
            return @(AWSKMSKeySpecSymmetricDefault);
        }
        return @(AWSKMSKeySpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeySpecRsa2048:
                return @"RSA_2048";
            case AWSKMSKeySpecRsa3072:
                return @"RSA_3072";
            case AWSKMSKeySpecRsa4096:
                return @"RSA_4096";
            case AWSKMSKeySpecEccNistP256:
                return @"ECC_NIST_P256";
            case AWSKMSKeySpecEccNistP384:
                return @"ECC_NIST_P384";
            case AWSKMSKeySpecEccNistP521:
                return @"ECC_NIST_P521";
            case AWSKMSKeySpecEccSecgP256k1:
                return @"ECC_SECG_P256K1";
            case AWSKMSKeySpecSymmetricDefault:
                return @"SYMMETRIC_DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSKMSKeyStateCreating);
        }
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
        if ([value caseInsensitiveCompare:@"PendingReplicaDeletion"] == NSOrderedSame) {
            return @(AWSKMSKeyStatePendingReplicaDeletion);
        }
        if ([value caseInsensitiveCompare:@"Unavailable"] == NSOrderedSame) {
            return @(AWSKMSKeyStateUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSKMSKeyStateUpdating);
        }
        return @(AWSKMSKeyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyStateCreating:
                return @"Creating";
            case AWSKMSKeyStateEnabled:
                return @"Enabled";
            case AWSKMSKeyStateDisabled:
                return @"Disabled";
            case AWSKMSKeyStatePendingDeletion:
                return @"PendingDeletion";
            case AWSKMSKeyStatePendingImport:
                return @"PendingImport";
            case AWSKMSKeyStatePendingReplicaDeletion:
                return @"PendingReplicaDeletion";
            case AWSKMSKeyStateUnavailable:
                return @"Unavailable";
            case AWSKMSKeyStateUpdating:
                return @"Updating";
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

+ (NSValueTransformer *)multiRegionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSMultiRegionConfiguration class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListAliasesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"granteePrincipal" : @"GranteePrincipal",
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListGrantsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListKeyPoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextMarker" : @"NextMarker",
             @"policyNames" : @"PolicyNames",
             @"truncated" : @"Truncated",
             };
}

@end

@implementation AWSKMSListKeysRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListKeysResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSKMSListResourceTagsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"retiringPrincipal" : @"RetiringPrincipal",
             };
}

@end

@implementation AWSKMSMultiRegionConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiRegionKeyType" : @"MultiRegionKeyType",
             @"primaryKey" : @"PrimaryKey",
             @"replicaKeys" : @"ReplicaKeys",
             };
}

+ (NSValueTransformer *)multiRegionKeyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARY"] == NSOrderedSame) {
            return @(AWSKMSMultiRegionKeyTypePrimary);
        }
        if ([value caseInsensitiveCompare:@"REPLICA"] == NSOrderedSame) {
            return @(AWSKMSMultiRegionKeyTypeReplica);
        }
        return @(AWSKMSMultiRegionKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSMultiRegionKeyTypePrimary:
                return @"PRIMARY";
            case AWSKMSMultiRegionKeyTypeReplica:
                return @"REPLICA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)primaryKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSMultiRegionKey class]];
}

+ (NSValueTransformer *)replicaKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSMultiRegionKey class]];
}

@end

@implementation AWSKMSMultiRegionKey

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"region" : @"Region",
             };
}

@end

@implementation AWSKMSPutKeyPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSKMSReplicateKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassPolicyLockoutSafetyCheck" : @"BypassPolicyLockoutSafetyCheck",
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             @"policy" : @"Policy",
             @"replicaRegion" : @"ReplicaRegion",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSTag class]];
}

@end

@implementation AWSKMSReplicateKeyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicaKeyMetadata" : @"ReplicaKeyMetadata",
             @"replicaPolicy" : @"ReplicaPolicy",
             @"replicaTags" : @"ReplicaTags",
             };
}

+ (NSValueTransformer *)replicaKeyMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKMSKeyMetadata class]];
}

+ (NSValueTransformer *)replicaTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKMSTag class]];
}

@end

@implementation AWSKMSRetireGrantRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"grantToken" : @"GrantToken",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSRevokeGrantRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantId" : @"GrantId",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSScheduleKeyDeletionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"pendingWindowInDays" : @"PendingWindowInDays",
             };
}

@end

@implementation AWSKMSScheduleKeyDeletionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionDate" : @"DeletionDate",
             @"keyId" : @"KeyId",
             @"keyState" : @"KeyState",
             @"pendingWindowInDays" : @"PendingWindowInDays",
             };
}

+ (NSValueTransformer *)deletionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)keyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSKMSKeyStateCreating);
        }
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
        if ([value caseInsensitiveCompare:@"PendingReplicaDeletion"] == NSOrderedSame) {
            return @(AWSKMSKeyStatePendingReplicaDeletion);
        }
        if ([value caseInsensitiveCompare:@"Unavailable"] == NSOrderedSame) {
            return @(AWSKMSKeyStateUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSKMSKeyStateUpdating);
        }
        return @(AWSKMSKeyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKMSKeyStateCreating:
                return @"Creating";
            case AWSKMSKeyStateEnabled:
                return @"Enabled";
            case AWSKMSKeyStateDisabled:
                return @"Disabled";
            case AWSKMSKeyStatePendingDeletion:
                return @"PendingDeletion";
            case AWSKMSKeyStatePendingImport:
                return @"PendingImport";
            case AWSKMSKeyStatePendingReplicaDeletion:
                return @"PendingReplicaDeletion";
            case AWSKMSKeyStateUnavailable:
                return @"Unavailable";
            case AWSKMSKeyStateUpdating:
                return @"Updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKMSSignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagKey" : @"TagKey",
             @"tagValue" : @"TagValue",
             };
}

@end

@implementation AWSKMSTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSKMSUpdateAliasRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasName" : @"AliasName",
             @"targetKeyId" : @"TargetKeyId",
             };
}

@end

@implementation AWSKMSUpdateCustomKeyStoreRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKMSUpdateKeyDescriptionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"keyId" : @"KeyId",
             };
}

@end

@implementation AWSKMSUpdatePrimaryRegionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyId" : @"KeyId",
             @"primaryRegion" : @"PrimaryRegion",
             };
}

@end

@implementation AWSKMSVerifyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
