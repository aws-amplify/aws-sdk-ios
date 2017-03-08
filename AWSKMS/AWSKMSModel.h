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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSKMSErrorDomain;

typedef NS_ENUM(NSInteger, AWSKMSErrorType) {
    AWSKMSErrorUnknown,
    AWSKMSErrorAlreadyExists,
    AWSKMSErrorDependencyTimeout,
    AWSKMSErrorDisabled,
    AWSKMSErrorExpiredImportToken,
    AWSKMSErrorIncorrectKeyMaterial,
    AWSKMSErrorInvalidAliasName,
    AWSKMSErrorInvalidArn,
    AWSKMSErrorInvalidCiphertext,
    AWSKMSErrorInvalidGrantId,
    AWSKMSErrorInvalidGrantToken,
    AWSKMSErrorInvalidImportToken,
    AWSKMSErrorInvalidKeyUsage,
    AWSKMSErrorInvalidMarker,
    AWSKMSErrorKMSInternal,
    AWSKMSErrorKMSInvalidState,
    AWSKMSErrorKeyUnavailable,
    AWSKMSErrorLimitExceeded,
    AWSKMSErrorMalformedPolicyDocument,
    AWSKMSErrorNotFound,
    AWSKMSErrorTag,
    AWSKMSErrorUnsupportedOperation,
};

typedef NS_ENUM(NSInteger, AWSKMSAlgorithmSpec) {
    AWSKMSAlgorithmSpecUnknown,
    AWSKMSAlgorithmSpecRsaesPkcs1V15,
    AWSKMSAlgorithmSpecRsaesOaepSha1,
    AWSKMSAlgorithmSpecRsaesOaepSha256,
};

typedef NS_ENUM(NSInteger, AWSKMSDataKeySpec) {
    AWSKMSDataKeySpecUnknown,
    AWSKMSDataKeySpecAes256,
    AWSKMSDataKeySpecAes128,
};

typedef NS_ENUM(NSInteger, AWSKMSExpirationModelType) {
    AWSKMSExpirationModelTypeUnknown,
    AWSKMSExpirationModelTypeKeyMaterialExpires,
    AWSKMSExpirationModelTypeKeyMaterialDoesNotExpire,
};

typedef NS_ENUM(NSInteger, AWSKMSGrantOperation) {
    AWSKMSGrantOperationUnknown,
    AWSKMSGrantOperationDecrypt,
    AWSKMSGrantOperationEncrypt,
    AWSKMSGrantOperationGenerateDataKey,
    AWSKMSGrantOperationGenerateDataKeyWithoutPlaintext,
    AWSKMSGrantOperationReEncryptFrom,
    AWSKMSGrantOperationReEncryptTo,
    AWSKMSGrantOperationCreateGrant,
    AWSKMSGrantOperationRetireGrant,
    AWSKMSGrantOperationDescribeKey,
};

typedef NS_ENUM(NSInteger, AWSKMSKeyState) {
    AWSKMSKeyStateUnknown,
    AWSKMSKeyStateEnabled,
    AWSKMSKeyStateDisabled,
    AWSKMSKeyStatePendingDeletion,
    AWSKMSKeyStatePendingImport,
};

typedef NS_ENUM(NSInteger, AWSKMSKeyUsageType) {
    AWSKMSKeyUsageTypeUnknown,
    AWSKMSKeyUsageTypeEncryptDecrypt,
};

typedef NS_ENUM(NSInteger, AWSKMSOriginType) {
    AWSKMSOriginTypeUnknown,
    AWSKMSOriginTypeAwsKms,
    AWSKMSOriginTypeExternal,
};

typedef NS_ENUM(NSInteger, AWSKMSWrappingKeySpec) {
    AWSKMSWrappingKeySpecUnknown,
    AWSKMSWrappingKeySpecRsa2048,
};

@class AWSKMSAliasListEntry;
@class AWSKMSCancelKeyDeletionRequest;
@class AWSKMSCancelKeyDeletionResponse;
@class AWSKMSCreateAliasRequest;
@class AWSKMSCreateGrantRequest;
@class AWSKMSCreateGrantResponse;
@class AWSKMSCreateKeyRequest;
@class AWSKMSCreateKeyResponse;
@class AWSKMSDecryptRequest;
@class AWSKMSDecryptResponse;
@class AWSKMSDeleteAliasRequest;
@class AWSKMSDeleteImportedKeyMaterialRequest;
@class AWSKMSDescribeKeyRequest;
@class AWSKMSDescribeKeyResponse;
@class AWSKMSDisableKeyRequest;
@class AWSKMSDisableKeyRotationRequest;
@class AWSKMSEnableKeyRequest;
@class AWSKMSEnableKeyRotationRequest;
@class AWSKMSEncryptRequest;
@class AWSKMSEncryptResponse;
@class AWSKMSGenerateDataKeyRequest;
@class AWSKMSGenerateDataKeyResponse;
@class AWSKMSGenerateDataKeyWithoutPlaintextRequest;
@class AWSKMSGenerateDataKeyWithoutPlaintextResponse;
@class AWSKMSGenerateRandomRequest;
@class AWSKMSGenerateRandomResponse;
@class AWSKMSGetKeyPolicyRequest;
@class AWSKMSGetKeyPolicyResponse;
@class AWSKMSGetKeyRotationStatusRequest;
@class AWSKMSGetKeyRotationStatusResponse;
@class AWSKMSGetParametersForImportRequest;
@class AWSKMSGetParametersForImportResponse;
@class AWSKMSGrantConstraints;
@class AWSKMSGrantListEntry;
@class AWSKMSImportKeyMaterialRequest;
@class AWSKMSImportKeyMaterialResponse;
@class AWSKMSKeyListEntry;
@class AWSKMSKeyMetadata;
@class AWSKMSListAliasesRequest;
@class AWSKMSListAliasesResponse;
@class AWSKMSListGrantsRequest;
@class AWSKMSListGrantsResponse;
@class AWSKMSListKeyPoliciesRequest;
@class AWSKMSListKeyPoliciesResponse;
@class AWSKMSListKeysRequest;
@class AWSKMSListKeysResponse;
@class AWSKMSListResourceTagsRequest;
@class AWSKMSListResourceTagsResponse;
@class AWSKMSListRetirableGrantsRequest;
@class AWSKMSPutKeyPolicyRequest;
@class AWSKMSReEncryptRequest;
@class AWSKMSReEncryptResponse;
@class AWSKMSRetireGrantRequest;
@class AWSKMSRevokeGrantRequest;
@class AWSKMSScheduleKeyDeletionRequest;
@class AWSKMSScheduleKeyDeletionResponse;
@class AWSKMSTag;
@class AWSKMSTagResourceRequest;
@class AWSKMSUntagResourceRequest;
@class AWSKMSUpdateAliasRequest;
@class AWSKMSUpdateKeyDescriptionRequest;

/**
 <p>Contains information about an alias.</p>
 */
@interface AWSKMSAliasListEntry : AWSModel


/**
 <p>String that contains the key ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasArn;

/**
 <p>String that contains the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>String that contains the key identifier referred to by the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSCancelKeyDeletionRequest : AWSRequest


/**
 <p>The unique identifier for the customer master key (CMK) for which to cancel deletion.</p><p>To specify this value, use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: 1234abcd-12ab-34cd-56ef-1234567890ab</p></li><li><p>Key ARN: arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</p></li></ul><p>To obtain the unique key ID and key ARN for a given CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSCancelKeyDeletionResponse : AWSModel


/**
 <p>The unique identifier of the master key for which deletion is canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSCreateAliasRequest : AWSRequest


/**
 <p>String that contains the display name. The name must start with the word "alias" followed by a forward slash (alias/). Aliases that begin with "alias/AWS" are reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>An identifier of the key for which you are creating the alias. This value cannot be another alias but can be a globally unique identifier or a fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSCreateGrantRequest : AWSRequest


/**
 <p>The conditions under which the operations permitted by the grant are allowed.</p><p>You can use this value to allow the operations permitted by the grant only when a specified encryption context is present. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSKMSGrantConstraints * _Nullable constraints;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The principal that is given permission to perform the operations that the grant permits.</p><p>To specify the principal, use the <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteePrincipal;

/**
 <p>The unique identifier for the customer master key (CMK) that the grant applies to.</p><p>To specify this value, use the globally unique key ID or the Amazon Resource Name (ARN) of the key. Examples:</p><ul><li><p>Globally unique key ID: 12345678-1234-1234-1234-123456789012</p></li><li><p>Key ARN: arn:aws:kms:us-west-2:123456789012:key/12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>A friendly name for identifying the grant. Use this value to prevent unintended creation of duplicate grants when retrying this request.</p><p>When this value is absent, all <code>CreateGrant</code> requests result in a new grant with a unique <code>GrantId</code> even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the <code>CreateGrant</code> request.</p><p>When this value is present, you can retry a <code>CreateGrant</code> request with identical parameters; if the grant already exists, the original <code>GrantId</code> is returned without creating a new grant. Note that the returned grant token is unique with every <code>CreateGrant</code> request, even when a duplicate <code>GrantId</code> is returned. All grant tokens obtained in this way can be used interchangeably.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of operations that the grant permits.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable operations;

/**
 <p>The principal that is given permission to retire the grant by using <a>RetireGrant</a> operation.</p><p>To specify the principal, use the <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retiringPrincipal;

@end

/**
 
 */
@interface AWSKMSCreateGrantResponse : AWSModel


/**
 <p>The unique identifier for the grant.</p><p>You can use the <code>GrantId</code> in a subsequent <a>RetireGrant</a> or <a>RevokeGrant</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>The grant token.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantToken;

@end

/**
 
 */
@interface AWSKMSCreateKeyRequest : AWSRequest


/**
 <p>A flag to indicate whether to bypass the key policy lockout safety check.</p><important><p>Setting this value to true increases the likelihood that the CMK becomes unmanageable. Do not set this value to true indiscriminately.</p><p>For more information, refer to the scenario in the <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p></important><p>Use this parameter only when you include a policy in the request and you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the CMK.</p><p>The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>A description of the CMK.</p><p>Use a description that helps you decide whether the CMK is appropriate for a task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The intended use of the CMK.</p><p>You can use CMKs only for symmetric encryption and decryption.</p>
 */
@property (nonatomic, assign) AWSKMSKeyUsageType keyUsage;

/**
 <p>The source of the CMK's key material.</p><p>The default is <code>AWS_KMS</code>, which means AWS KMS creates the key material. When this parameter is set to <code>EXTERNAL</code>, the request creates a CMK without key material so that you can import key material from your existing key management infrastructure. For more information about importing key material into AWS KMS, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>The CMK's <code>Origin</code> is immutable and is set when the CMK is created.</p>
 */
@property (nonatomic, assign) AWSKMSOriginType origin;

/**
 <p>The key policy to attach to the CMK.</p><p>If you specify a policy and do not set <code>BypassPolicyLockoutSafetyCheck</code> to true, the policy must meet the following criteria:</p><ul><li><p>It must allow the principal that is making the <code>CreateKey</code> request to make a subsequent <a>PutKeyPolicy</a> request on the CMK. This reduces the likelihood that the CMK becomes unmanageable. For more information, refer to the scenario in the <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p></li><li><p>The principals that are specified in the key policy must exist and be visible to AWS KMS. When you create a new AWS principal (for example, an IAM user or role), you might need to enforce a delay before specifying the new principal in a key policy because the new principal might not immediately be visible to AWS KMS. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes that I make are not always immediately visible</a> in the <i>IAM User Guide</i>.</p></li></ul><p>If you do not specify a policy, AWS KMS attaches a default key policy to the CMK. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default Key Policy</a> in the <i>AWS Key Management Service Developer Guide</i>.</p><p>The policy size limit is 32 KiB (32768 bytes).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>One or more tags. Each tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p><p>Use this parameter to tag the CMK when it is created. Alternately, you can omit this parameter and instead tag the CMK after it is created using <a>TagResource</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKMSCreateKeyResponse : AWSModel


/**
 <p>Metadata associated with the CMK.</p>
 */
@property (nonatomic, strong) AWSKMSKeyMetadata * _Nullable keyMetadata;

@end

/**
 
 */
@interface AWSKMSDecryptRequest : AWSRequest


/**
 <p>Ciphertext to be decrypted. The blob includes metadata.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The encryption context. If this was specified in the <a>Encrypt</a> function, it must be specified here or the decryption operation will fail. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

@end

/**
 
 */
@interface AWSKMSDecryptResponse : AWSModel


/**
 <p>ARN of the key used to perform the decryption. This value is returned if no errors are encountered during the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Decrypted plaintext data. This value may not be returned if the customer master key is not available or if you didn't have permission to use it.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSDeleteAliasRequest : AWSRequest


/**
 <p>The alias to be deleted. The name must start with the word "alias" followed by a forward slash (alias/). Aliases that begin with "alias/AWS" are reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

@end

/**
 
 */
@interface AWSKMSDeleteImportedKeyMaterialRequest : AWSRequest


/**
 <p>The identifier of the CMK whose key material to delete. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p><p>A valid identifier is the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDescribeKeyRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Alias ARN Example - arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li><li><p>Alias Name Example - alias/MyAliasName</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDescribeKeyResponse : AWSModel


/**
 <p>Metadata associated with the key.</p>
 */
@property (nonatomic, strong) AWSKMSKeyMetadata * _Nullable keyMetadata;

@end

/**
 
 */
@interface AWSKMSDisableKeyRequest : AWSRequest


/**
 <p>A unique identifier for the CMK.</p><p>Use the CMK's unique identifier or its Amazon Resource Name (ARN). For example:</p><ul><li><p>Unique ID: 1234abcd-12ab-34cd-56ef-1234567890ab</p></li><li><p>ARN: arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDisableKeyRotationRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSEnableKeyRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSEnableKeyRotationRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSEncryptRequest : AWSRequest


/**
 <p>Name-value pair that specifies the encryption context to be used for authenticated encryption. If used here, the same value must be supplied to the <code>Decrypt</code> API or decryption will fail. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Alias ARN Example - arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li><li><p>Alias Name Example - alias/MyAliasName</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Data to be encrypted.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSEncryptResponse : AWSModel


/**
 <p>The encrypted plaintext. If you are using the CLI, the value is Base64 encoded. Otherwise, it is not encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The ID of the key used during encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyRequest : AWSRequest


/**
 <p>A set of key-value pairs that represents additional authenticated data.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The identifier of the CMK under which to generate and encrypt the data encryption key.</p><p>A valid identifier is the unique key ID or the Amazon Resource Name (ARN) of the CMK, or the alias name or ARN of an alias that refers to the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>CMK ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The length of the data encryption key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeySpec keySpec;

/**
 <p>The length of the data encryption key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyResponse : AWSModel


/**
 <p>The encrypted data encryption key.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The identifier of the CMK under which the data encryption key was generated and encrypted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The data encryption key. Use this data key for local encryption and decryption, then remove it from memory as soon as possible.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyWithoutPlaintextRequest : AWSRequest


/**
 <p>A set of key-value pairs that represents additional authenticated data.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The identifier of the CMK under which to generate and encrypt the data encryption key.</p><p>A valid identifier is the unique key ID or the Amazon Resource Name (ARN) of the CMK, or the alias name or ARN of an alias that refers to the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>CMK ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The length of the data encryption key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeySpec keySpec;

/**
 <p>The length of the data encryption key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyWithoutPlaintextResponse : AWSModel


/**
 <p>The encrypted data encryption key.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The identifier of the CMK under which the data encryption key was generated and encrypted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGenerateRandomRequest : AWSRequest


/**
 <p>The length of the byte string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateRandomResponse : AWSModel


/**
 <p>The unpredictable byte string.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSGetKeyPolicyRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>String that contains the name of the policy. Currently, this must be "default". Policy names can be discovered by calling <a>ListKeyPolicies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSKMSGetKeyPolicyResponse : AWSModel


/**
 <p>A policy document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSKMSGetKeyRotationStatusRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGetKeyRotationStatusResponse : AWSModel


/**
 <p>A Boolean value that specifies whether key rotation is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keyRotationEnabled;

@end

/**
 
 */
@interface AWSKMSGetParametersForImportRequest : AWSRequest


/**
 <p>The identifier of the CMK into which you will import key material. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p><p>A valid identifier is the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The algorithm you will use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>. For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html">Encrypt the Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSAlgorithmSpec wrappingAlgorithm;

/**
 <p>The type of wrapping key (public key) to return in the response. Only 2048-bit RSA public keys are supported.</p>
 */
@property (nonatomic, assign) AWSKMSWrappingKeySpec wrappingKeySpec;

@end

/**
 
 */
@interface AWSKMSGetParametersForImportResponse : AWSModel


/**
 <p>The import token to send in a subsequent <a>ImportKeyMaterial</a> request.</p>
 */
@property (nonatomic, strong) NSData * _Nullable importToken;

/**
 <p>The identifier of the CMK to use in a subsequent <a>ImportKeyMaterial</a> request. This is the same CMK specified in the <code>GetParametersForImport</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an <a>ImportKeyMaterial</a> request and you must send another <code>GetParametersForImport</code> request to retrieve new ones.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable parametersValidTo;

/**
 <p>The public key to use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>.</p>
 */
@property (nonatomic, strong) NSData * _Nullable publicKey;

@end

/**
 <p>A structure for specifying the conditions under which the operations permitted by the grant are allowed.</p><p>You can use this structure to allow the operations permitted by the grant only when a specified encryption context is present. For more information about encryption context, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/encryption-context.html">Encryption Context</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@interface AWSKMSGrantConstraints : AWSModel


/**
 <p>Contains a list of key-value pairs that must be present in the encryption context of a subsequent operation permitted by the grant. When a subsequent operation permitted by the grant includes an encryption context that matches this list, the grant allows the operation. Otherwise, the operation is not allowed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContextEquals;

/**
 <p>Contains a list of key-value pairs, a subset of which must be present in the encryption context of a subsequent operation permitted by the grant. When a subsequent operation permitted by the grant includes an encryption context that matches this list or is a subset of this list, the grant allows the operation. Otherwise, the operation is not allowed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContextSubset;

@end

/**
 <p>Contains information about an entry in a list of grants.</p>
 */
@interface AWSKMSGrantListEntry : AWSModel


/**
 <p>The conditions under which the grant's operations are allowed.</p>
 */
@property (nonatomic, strong) AWSKMSGrantConstraints * _Nullable constraints;

/**
 <p>The date and time when the grant was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The unique identifier for the grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>The principal that receives the grant's permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteePrincipal;

/**
 <p>The AWS account under which the grant was issued.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuingAccount;

/**
 <p>The unique identifier for the customer master key (CMK) to which the grant applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The friendly name that identifies the grant. If a name was provided in the <a>CreateGrant</a> request, that name is returned. Otherwise this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The list of operations permitted by the grant.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable operations;

/**
 <p>The principal that can retire the grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retiringPrincipal;

@end

/**
 
 */
@interface AWSKMSImportKeyMaterialRequest : AWSRequest


/**
 <p>The encrypted key material to import. It must be encrypted with the public key that you received in the response to a previous <a>GetParametersForImport</a> request, using the wrapping algorithm that you specified in that request.</p>
 */
@property (nonatomic, strong) NSData * _Nullable encryptedKeyMaterial;

/**
 <p>Specifies whether the key material expires. The default is <code>KEY_MATERIAL_EXPIRES</code>, in which case you must include the <code>ValidTo</code> parameter. When this parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>, you must omit the <code>ValidTo</code> parameter.</p>
 */
@property (nonatomic, assign) AWSKMSExpirationModelType expirationModel;

/**
 <p>The import token that you received in the response to a previous <a>GetParametersForImport</a> request. It must be from the same response that contained the public key that you used to encrypt the key material.</p>
 */
@property (nonatomic, strong) NSData * _Nullable importToken;

/**
 <p>The identifier of the CMK to import the key material into. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.</p><p>A valid identifier is the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The time at which the imported key material expires. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. You must omit this parameter when the <code>ExpirationModel</code> parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>. Otherwise it is required.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validTo;

@end

/**
 
 */
@interface AWSKMSImportKeyMaterialResponse : AWSModel


@end

/**
 <p>Contains information about each entry in the key list.</p>
 */
@interface AWSKMSKeyListEntry : AWSModel


/**
 <p>ARN of the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyArn;

/**
 <p>Unique identifier of the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 <p>Contains metadata about a customer master key (CMK).</p><p>This data type is used as a response element for the <a>CreateKey</a> and <a>DescribeKey</a> operations.</p>
 Required parameters: [KeyId]
 */
@interface AWSKMSKeyMetadata : AWSModel


/**
 <p>The twelve-digit account ID of the AWS account that owns the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccountId;

/**
 <p>The Amazon Resource Name (ARN) of the CMK. For examples, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">AWS Key Management Service (AWS KMS)</a> in the Example ARNs section of the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the CMK was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time after which AWS KMS deletes the CMK. This value is present only when <code>KeyState</code> is <code>PendingDeletion</code>, otherwise this value is omitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The description of the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the CMK is enabled. When <code>KeyState</code> is <code>Enabled</code> this value is true, otherwise it is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies whether the CMK's key material expires. This value is present only when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value is omitted.</p>
 */
@property (nonatomic, assign) AWSKMSExpirationModelType expirationModel;

/**
 <p>The globally unique identifier for the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The state of the CMK.</p><p>For more information about how key state affects the use of a CMK, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How Key State Affects the Use of a Customer Master Key</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSKeyState keyState;

/**
 <p>The cryptographic operations for which you can use the CMK. Currently the only allowed value is <code>ENCRYPT_DECRYPT</code>, which means you can use the CMK for the <a>Encrypt</a> and <a>Decrypt</a> operations.</p>
 */
@property (nonatomic, assign) AWSKMSKeyUsageType keyUsage;

/**
 <p>The source of the CMK's key material. When this value is <code>AWS_KMS</code>, AWS KMS created the key material. When this value is <code>EXTERNAL</code>, the key material was imported from your existing key management infrastructure or the CMK lacks key material.</p>
 */
@property (nonatomic, assign) AWSKMSOriginType origin;

/**
 <p>The time at which the imported key material expires. When the key material expires, AWS KMS deletes the key material and the CMK becomes unusable. This value is present only for CMKs whose <code>Origin</code> is <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validTo;

@end

/**
 
 */
@interface AWSKMSListAliasesRequest : AWSRequest


/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSListAliasesResponse : AWSModel


/**
 <p>A list of key aliases in the user's account.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSAliasListEntry *> * _Nullable aliases;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To retrieve more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListGrantsRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSListGrantsResponse : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSGrantListEntry *> * _Nullable grants;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To retrieve more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListKeyPoliciesRequest : AWSRequest


/**
 <p>A unique identifier for the customer master key (CMK). You can use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p><p>Currently only 1 policy can be attached to a key.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSListKeyPoliciesResponse : AWSModel


/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A list of policy names. Currently, there is only one policy and it is named "Default".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To retrieve more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListKeysRequest : AWSRequest


/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSListKeysResponse : AWSModel


/**
 <p>A list of keys.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSKeyListEntry *> * _Nullable keys;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To retrieve more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListResourceTagsRequest : AWSRequest


/**
 <p>A unique identifier for the CMK whose tags you are listing. You can use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p><p>Do not attempt to construct this value. Use only the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSListResourceTagsResponse : AWSModel


/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p><p>Do not assume or infer any information from this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A list of tags. Each tag consists of a tag key and a tag value.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To retrieve more items, pass the value of the <code>NextMarker</code> element in this response to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListRetirableGrantsRequest : AWSRequest


/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, AWS KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The retiring principal for which to list grants.</p><p>To specify the retiring principal, use the <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include AWS accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax for specifying a principal, see <a href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retiringPrincipal;

@end

/**
 
 */
@interface AWSKMSPutKeyPolicyRequest : AWSRequest


/**
 <p>A flag to indicate whether to bypass the key policy lockout safety check.</p><important><p>Setting this value to true increases the likelihood that the CMK becomes unmanageable. Do not set this value to true indiscriminately.</p><p>For more information, refer to the scenario in the <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p></important><p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <code>PutKeyPolicy</code> request on the CMK.</p><p>The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>A unique identifier for the CMK.</p><p>Use the CMK's unique identifier or its Amazon Resource Name (ARN). For example:</p><ul><li><p>Unique ID: 1234abcd-12ab-34cd-56ef-1234567890ab</p></li><li><p>ARN: arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The key policy to attach to the CMK.</p><p>If you do not set <code>BypassPolicyLockoutSafetyCheck</code> to true, the policy must meet the following criteria:</p><ul><li><p>It must allow the principal that is making the <code>PutKeyPolicy</code> request to make a subsequent <code>PutKeyPolicy</code> request on the CMK. This reduces the likelihood that the CMK becomes unmanageable. For more information, refer to the scenario in the <a href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>AWS Key Management Service Developer Guide</i>.</p></li><li><p>The principals that are specified in the key policy must exist and be visible to AWS KMS. When you create a new AWS principal (for example, an IAM user or role), you might need to enforce a delay before specifying the new principal in a key policy because the new principal might not immediately be visible to AWS KMS. For more information, see <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes that I make are not always immediately visible</a> in the <i>IAM User Guide</i>.</p></li></ul><p>The policy size limit is 32 KiB (32768 bytes).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The name of the key policy.</p><p>This value must be <code>default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSKMSReEncryptRequest : AWSRequest


/**
 <p>Ciphertext of the data to reencrypt.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>Encryption context to use when the data is reencrypted.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable destinationEncryptionContext;

/**
 <p>A unique identifier for the CMK to use to reencrypt the data. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Alias ARN Example - arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li><li><p>Alias Name Example - alias/MyAliasName</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable destinationKeyId;

/**
 <p>A list of grant tokens.</p><p>For more information, see <a href="http://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Encryption context used to encrypt and decrypt the data specified in the <code>CiphertextBlob</code> parameter.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sourceEncryptionContext;

@end

/**
 
 */
@interface AWSKMSReEncryptResponse : AWSModel


/**
 <p>The reencrypted data.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>Unique identifier of the CMK used to reencrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Unique identifier of the CMK used to originally encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceKeyId;

@end

/**
 
 */
@interface AWSKMSRetireGrantRequest : AWSRequest


/**
 <p>Unique identifier of the grant to retire. The grant ID is returned in the response to a <code>CreateGrant</code> operation.</p><ul><li><p>Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>Token that identifies the grant to be retired.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantToken;

/**
 <p>The Amazon Resource Name of the CMK associated with the grant. Example:</p><ul><li><p>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSRevokeGrantRequest : AWSRequest


/**
 <p>Identifier of the grant to be revoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>A unique identifier for the customer master key associated with the grant. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSScheduleKeyDeletionRequest : AWSRequest


/**
 <p>The unique identifier for the customer master key (CMK) to delete.</p><p>To specify this value, use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: 1234abcd-12ab-34cd-56ef-1234567890ab</p></li><li><p>Key ARN: arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</p></li></ul><p>To obtain the unique key ID and key ARN for a given CMK, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the customer master key (CMK).</p><p>This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingWindowInDays;

@end

/**
 
 */
@interface AWSKMSScheduleKeyDeletionResponse : AWSModel


/**
 <p>The date and time after which AWS KMS deletes the customer master key (CMK).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The unique identifier of the customer master key (CMK) for which deletion is scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 <p>A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p>
 Required parameters: [TagKey, TagValue]
 */
@interface AWSKMSTag : AWSModel


/**
 <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagKey;

/**
 <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagValue;

@end

/**
 
 */
@interface AWSKMSTagResourceRequest : AWSRequest


/**
 <p>A unique identifier for the CMK you are tagging. You can use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>One or more tags. Each tag consists of a tag key and a tag value.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKMSUntagResourceRequest : AWSRequest


/**
 <p>A unique identifier for the CMK from which you are removing tags. You can use the unique key ID or the Amazon Resource Name (ARN) of the CMK. Examples:</p><ul><li><p>Unique key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>One or more tag keys. Specify only the tag keys, not the tag values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSKMSUpdateAliasRequest : AWSRequest


/**
 <p>String that contains the name of the alias to be modified. The name must start with the word "alias" followed by a forward slash (alias/). Aliases that begin with "alias/aws" are reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>Unique identifier of the customer master key to be mapped to the alias. This value can be a globally unique identifier or the fully specified ARN of a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul><p>You can call <a>ListAliases</a> to verify that the alias is mapped to the correct <code>TargetKeyId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSUpdateKeyDescriptionRequest : AWSRequest


/**
 <p>New description for the CMK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A unique identifier for the CMK. This value can be a globally unique identifier or the fully specified ARN to a key.</p><ul><li><p>Key ARN Example - arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</p></li><li><p>Globally Unique Key ID Example - 12345678-1234-1234-1234-123456789012</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

NS_ASSUME_NONNULL_END
