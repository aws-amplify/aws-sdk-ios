//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSKMSErrorCloudHsmClusterInUse,
    AWSKMSErrorCloudHsmClusterInvalidConfiguration,
    AWSKMSErrorCloudHsmClusterNotActive,
    AWSKMSErrorCloudHsmClusterNotFound,
    AWSKMSErrorCloudHsmClusterNotRelated,
    AWSKMSErrorCustomKeyStoreHasCMKs,
    AWSKMSErrorCustomKeyStoreInvalidState,
    AWSKMSErrorCustomKeyStoreNameInUse,
    AWSKMSErrorCustomKeyStoreNotFound,
    AWSKMSErrorDependencyTimeout,
    AWSKMSErrorDisabled,
    AWSKMSErrorExpiredImportToken,
    AWSKMSErrorIncorrectKey,
    AWSKMSErrorIncorrectKeyMaterial,
    AWSKMSErrorIncorrectTrustAnchor,
    AWSKMSErrorInvalidAliasName,
    AWSKMSErrorInvalidArn,
    AWSKMSErrorInvalidCiphertext,
    AWSKMSErrorInvalidGrantId,
    AWSKMSErrorInvalidGrantToken,
    AWSKMSErrorInvalidImportToken,
    AWSKMSErrorInvalidKeyUsage,
    AWSKMSErrorInvalidMarker,
    AWSKMSErrorKMSInternal,
    AWSKMSErrorKMSInvalidMac,
    AWSKMSErrorKMSInvalidSignature,
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

typedef NS_ENUM(NSInteger, AWSKMSConnectionErrorCodeType) {
    AWSKMSConnectionErrorCodeTypeUnknown,
    AWSKMSConnectionErrorCodeTypeInvalidCredentials,
    AWSKMSConnectionErrorCodeTypeClusterNotFound,
    AWSKMSConnectionErrorCodeTypeNetworkErrors,
    AWSKMSConnectionErrorCodeTypeInternalError,
    AWSKMSConnectionErrorCodeTypeInsufficientCloudhsmHsms,
    AWSKMSConnectionErrorCodeTypeUserLockedOut,
    AWSKMSConnectionErrorCodeTypeUserNotFound,
    AWSKMSConnectionErrorCodeTypeUserLoggedIn,
    AWSKMSConnectionErrorCodeTypeSubnetNotFound,
};

typedef NS_ENUM(NSInteger, AWSKMSConnectionStateType) {
    AWSKMSConnectionStateTypeUnknown,
    AWSKMSConnectionStateTypeConnected,
    AWSKMSConnectionStateTypeConnecting,
    AWSKMSConnectionStateTypeFailed,
    AWSKMSConnectionStateTypeDisconnected,
    AWSKMSConnectionStateTypeDisconnecting,
};

typedef NS_ENUM(NSInteger, AWSKMSCustomerMasterKeySpec) {
    AWSKMSCustomerMasterKeySpecUnknown,
    AWSKMSCustomerMasterKeySpecRsa2048,
    AWSKMSCustomerMasterKeySpecRsa3072,
    AWSKMSCustomerMasterKeySpecRsa4096,
    AWSKMSCustomerMasterKeySpecEccNistP256,
    AWSKMSCustomerMasterKeySpecEccNistP384,
    AWSKMSCustomerMasterKeySpecEccNistP521,
    AWSKMSCustomerMasterKeySpecEccSecgP256k1,
    AWSKMSCustomerMasterKeySpecSymmetricDefault,
    AWSKMSCustomerMasterKeySpecHmac224,
    AWSKMSCustomerMasterKeySpecHmac256,
    AWSKMSCustomerMasterKeySpecHmac384,
    AWSKMSCustomerMasterKeySpecHmac512,
};

typedef NS_ENUM(NSInteger, AWSKMSDataKeyPairSpec) {
    AWSKMSDataKeyPairSpecUnknown,
    AWSKMSDataKeyPairSpecRsa2048,
    AWSKMSDataKeyPairSpecRsa3072,
    AWSKMSDataKeyPairSpecRsa4096,
    AWSKMSDataKeyPairSpecEccNistP256,
    AWSKMSDataKeyPairSpecEccNistP384,
    AWSKMSDataKeyPairSpecEccNistP521,
    AWSKMSDataKeyPairSpecEccSecgP256k1,
};

typedef NS_ENUM(NSInteger, AWSKMSDataKeySpec) {
    AWSKMSDataKeySpecUnknown,
    AWSKMSDataKeySpecAes256,
    AWSKMSDataKeySpecAes128,
};

typedef NS_ENUM(NSInteger, AWSKMSEncryptionAlgorithmSpec) {
    AWSKMSEncryptionAlgorithmSpecUnknown,
    AWSKMSEncryptionAlgorithmSpecSymmetricDefault,
    AWSKMSEncryptionAlgorithmSpecRsaesOaepSha1,
    AWSKMSEncryptionAlgorithmSpecRsaesOaepSha256,
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
    AWSKMSGrantOperationSign,
    AWSKMSGrantOperationVerify,
    AWSKMSGrantOperationGetPublicKey,
    AWSKMSGrantOperationCreateGrant,
    AWSKMSGrantOperationRetireGrant,
    AWSKMSGrantOperationDescribeKey,
    AWSKMSGrantOperationGenerateDataKeyPair,
    AWSKMSGrantOperationGenerateDataKeyPairWithoutPlaintext,
    AWSKMSGrantOperationGenerateMac,
    AWSKMSGrantOperationVerifyMac,
};

typedef NS_ENUM(NSInteger, AWSKMSKeyManagerType) {
    AWSKMSKeyManagerTypeUnknown,
    AWSKMSKeyManagerTypeAws,
    AWSKMSKeyManagerTypeCustomer,
};

typedef NS_ENUM(NSInteger, AWSKMSKeySpec) {
    AWSKMSKeySpecUnknown,
    AWSKMSKeySpecRsa2048,
    AWSKMSKeySpecRsa3072,
    AWSKMSKeySpecRsa4096,
    AWSKMSKeySpecEccNistP256,
    AWSKMSKeySpecEccNistP384,
    AWSKMSKeySpecEccNistP521,
    AWSKMSKeySpecEccSecgP256k1,
    AWSKMSKeySpecSymmetricDefault,
    AWSKMSKeySpecHmac224,
    AWSKMSKeySpecHmac256,
    AWSKMSKeySpecHmac384,
    AWSKMSKeySpecHmac512,
};

typedef NS_ENUM(NSInteger, AWSKMSKeyState) {
    AWSKMSKeyStateUnknown,
    AWSKMSKeyStateCreating,
    AWSKMSKeyStateEnabled,
    AWSKMSKeyStateDisabled,
    AWSKMSKeyStatePendingDeletion,
    AWSKMSKeyStatePendingImport,
    AWSKMSKeyStatePendingReplicaDeletion,
    AWSKMSKeyStateUnavailable,
    AWSKMSKeyStateUpdating,
};

typedef NS_ENUM(NSInteger, AWSKMSKeyUsageType) {
    AWSKMSKeyUsageTypeUnknown,
    AWSKMSKeyUsageTypeSignVerify,
    AWSKMSKeyUsageTypeEncryptDecrypt,
    AWSKMSKeyUsageTypeGenerateVerifyMac,
};

typedef NS_ENUM(NSInteger, AWSKMSMacAlgorithmSpec) {
    AWSKMSMacAlgorithmSpecUnknown,
    AWSKMSMacAlgorithmSpecHmacSha224,
    AWSKMSMacAlgorithmSpecHmacSha256,
    AWSKMSMacAlgorithmSpecHmacSha384,
    AWSKMSMacAlgorithmSpecHmacSha512,
};

typedef NS_ENUM(NSInteger, AWSKMSMessageType) {
    AWSKMSMessageTypeUnknown,
    AWSKMSMessageTypeRAW,
    AWSKMSMessageTypeDigest,
};

typedef NS_ENUM(NSInteger, AWSKMSMultiRegionKeyType) {
    AWSKMSMultiRegionKeyTypeUnknown,
    AWSKMSMultiRegionKeyTypePrimary,
    AWSKMSMultiRegionKeyTypeReplica,
};

typedef NS_ENUM(NSInteger, AWSKMSOriginType) {
    AWSKMSOriginTypeUnknown,
    AWSKMSOriginTypeAwsKms,
    AWSKMSOriginTypeExternal,
    AWSKMSOriginTypeAwsCloudhsm,
};

typedef NS_ENUM(NSInteger, AWSKMSSigningAlgorithmSpec) {
    AWSKMSSigningAlgorithmSpecUnknown,
    AWSKMSSigningAlgorithmSpecRsassaPssSha256,
    AWSKMSSigningAlgorithmSpecRsassaPssSha384,
    AWSKMSSigningAlgorithmSpecRsassaPssSha512,
    AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha256,
    AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha384,
    AWSKMSSigningAlgorithmSpecRsassaPkcs1V15Sha512,
    AWSKMSSigningAlgorithmSpecEcdsaSha256,
    AWSKMSSigningAlgorithmSpecEcdsaSha384,
    AWSKMSSigningAlgorithmSpecEcdsaSha512,
};

typedef NS_ENUM(NSInteger, AWSKMSWrappingKeySpec) {
    AWSKMSWrappingKeySpecUnknown,
    AWSKMSWrappingKeySpecRsa2048,
};

@class AWSKMSAliasListEntry;
@class AWSKMSCancelKeyDeletionRequest;
@class AWSKMSCancelKeyDeletionResponse;
@class AWSKMSConnectCustomKeyStoreRequest;
@class AWSKMSConnectCustomKeyStoreResponse;
@class AWSKMSCreateAliasRequest;
@class AWSKMSCreateCustomKeyStoreRequest;
@class AWSKMSCreateCustomKeyStoreResponse;
@class AWSKMSCreateGrantRequest;
@class AWSKMSCreateGrantResponse;
@class AWSKMSCreateKeyRequest;
@class AWSKMSCreateKeyResponse;
@class AWSKMSCustomKeyStoresListEntry;
@class AWSKMSDecryptRequest;
@class AWSKMSDecryptResponse;
@class AWSKMSDeleteAliasRequest;
@class AWSKMSDeleteCustomKeyStoreRequest;
@class AWSKMSDeleteCustomKeyStoreResponse;
@class AWSKMSDeleteImportedKeyMaterialRequest;
@class AWSKMSDescribeCustomKeyStoresRequest;
@class AWSKMSDescribeCustomKeyStoresResponse;
@class AWSKMSDescribeKeyRequest;
@class AWSKMSDescribeKeyResponse;
@class AWSKMSDisableKeyRequest;
@class AWSKMSDisableKeyRotationRequest;
@class AWSKMSDisconnectCustomKeyStoreRequest;
@class AWSKMSDisconnectCustomKeyStoreResponse;
@class AWSKMSEnableKeyRequest;
@class AWSKMSEnableKeyRotationRequest;
@class AWSKMSEncryptRequest;
@class AWSKMSEncryptResponse;
@class AWSKMSGenerateDataKeyPairRequest;
@class AWSKMSGenerateDataKeyPairResponse;
@class AWSKMSGenerateDataKeyPairWithoutPlaintextRequest;
@class AWSKMSGenerateDataKeyPairWithoutPlaintextResponse;
@class AWSKMSGenerateDataKeyRequest;
@class AWSKMSGenerateDataKeyResponse;
@class AWSKMSGenerateDataKeyWithoutPlaintextRequest;
@class AWSKMSGenerateDataKeyWithoutPlaintextResponse;
@class AWSKMSGenerateMacRequest;
@class AWSKMSGenerateMacResponse;
@class AWSKMSGenerateRandomRequest;
@class AWSKMSGenerateRandomResponse;
@class AWSKMSGetKeyPolicyRequest;
@class AWSKMSGetKeyPolicyResponse;
@class AWSKMSGetKeyRotationStatusRequest;
@class AWSKMSGetKeyRotationStatusResponse;
@class AWSKMSGetParametersForImportRequest;
@class AWSKMSGetParametersForImportResponse;
@class AWSKMSGetPublicKeyRequest;
@class AWSKMSGetPublicKeyResponse;
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
@class AWSKMSMultiRegionConfiguration;
@class AWSKMSMultiRegionKey;
@class AWSKMSPutKeyPolicyRequest;
@class AWSKMSReEncryptRequest;
@class AWSKMSReEncryptResponse;
@class AWSKMSReplicateKeyRequest;
@class AWSKMSReplicateKeyResponse;
@class AWSKMSRetireGrantRequest;
@class AWSKMSRevokeGrantRequest;
@class AWSKMSScheduleKeyDeletionRequest;
@class AWSKMSScheduleKeyDeletionResponse;
@class AWSKMSSignRequest;
@class AWSKMSSignResponse;
@class AWSKMSTag;
@class AWSKMSTagResourceRequest;
@class AWSKMSUntagResourceRequest;
@class AWSKMSUpdateAliasRequest;
@class AWSKMSUpdateCustomKeyStoreRequest;
@class AWSKMSUpdateCustomKeyStoreResponse;
@class AWSKMSUpdateKeyDescriptionRequest;
@class AWSKMSUpdatePrimaryRegionRequest;
@class AWSKMSVerifyMacRequest;
@class AWSKMSVerifyMacResponse;
@class AWSKMSVerifyRequest;
@class AWSKMSVerifyResponse;

/**
 <p>Contains information about an alias.</p>
 */
@interface AWSKMSAliasListEntry : AWSModel


/**
 <p>String that contains the key ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasArn;

/**
 <p>String that contains the alias. This value begins with <code>alias/</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>Date and time that the alias was most recently created in the account and Region. Formatted as Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Date and time that the alias was most recently associated with a KMS key in the account and Region. Formatted as Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>String that contains the key identifier of the KMS key associated with the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSCancelKeyDeletionRequest : AWSRequest


/**
 <p>Identifies the KMS key whose deletion is being canceled.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSCancelKeyDeletionResponse : AWSModel


/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key whose deletion is canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSConnectCustomKeyStoreRequest : AWSRequest


/**
 <p>Enter the key store ID of the custom key store that you want to connect. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

@end

/**
 
 */
@interface AWSKMSConnectCustomKeyStoreResponse : AWSModel


@end

/**
 
 */
@interface AWSKMSCreateAliasRequest : AWSRequest


/**
 <p>Specifies the alias name. This value must begin with <code>alias/</code> followed by a name, such as <code>alias/ExampleAlias</code>. </p><p>The <code>AliasName</code> value must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin with <code>alias/aws/</code>. The <code>alias/aws/</code> prefix is reserved for <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon Web Services managed keys</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>Associates the alias with the specified <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key</a>. The KMS key must be in the same Amazon Web Services Region. </p><p>A valid key ID is required. If you supply a null or empty string value, this operation returns an error.</p><p>For help finding the key ID and ARN, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn">Finding the Key ID and ARN</a> in the <i><i>Key Management Service Developer Guide</i></i>.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSCreateCustomKeyStoreRequest : AWSRequest


/**
 <p>Identifies the CloudHSM cluster for the custom key store. Enter the cluster ID of any active CloudHSM cluster that is not already associated with a custom key store. To find the cluster ID, use the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudHsmClusterId;

/**
 <p>Specifies a friendly name for the custom key store. The name must be unique in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreName;

/**
 <p>Enter the password of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser"><code>kmsuser</code> crypto user (CU) account</a> in the specified CloudHSM cluster. KMS logs into the cluster as this user to manage key material on your behalf.</p><p>The password must be a string of 7 to 32 characters. Its value is case sensitive.</p><p>This parameter tells KMS the <code>kmsuser</code> account password; it does not change the password in the CloudHSM cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyStorePassword;

/**
 <p>Enter the content of the trust anchor certificate for the cluster. This is the content of the <code>customerCA.crt</code> file that you created when you <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html">initialized the cluster</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trustAnchorCertificate;

@end

/**
 
 */
@interface AWSKMSCreateCustomKeyStoreResponse : AWSModel


/**
 <p>A unique identifier for the new custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

@end

/**
 
 */
@interface AWSKMSCreateGrantRequest : AWSRequest


/**
 <p>Specifies a grant constraint. </p><p>KMS supports the <code>EncryptionContextEquals</code> and <code>EncryptionContextSubset</code> grant constraints. Each constraint value can include up to 8 encryption context pairs. The encryption context value in each constraint cannot exceed 384 characters. For information about grant constraints, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints">Using grant constraints</a> in the <i>Key Management Service Developer Guide</i>. For more information about encryption context, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i><i>Key Management Service Developer Guide</i></i>. </p><p>The encryption context grant constraints allow the permissions in the grant only when the encryption context in the request matches (<code>EncryptionContextEquals</code>) or includes (<code>EncryptionContextSubset</code>) the encryption context specified in this structure. </p><p>The encryption context grant constraints are supported only on <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations">grant operations</a> that include an <code>EncryptionContext</code> parameter, such as cryptographic operations on symmetric encryption KMS keys. Grants with grant constraints can include the <a>DescribeKey</a> and <a>RetireGrant</a> operations, but the constraint doesn't apply to these operations. If a grant with a grant constraint includes the <code>CreateGrant</code> operation, the constraint requires that any grants created with the <code>CreateGrant</code> permission have an equally strict or stricter encryption context constraint.</p><p>You cannot use an encryption context grant constraint for cryptographic operations with asymmetric KMS keys or HMAC KMS keys. These keys don't support an encryption context. </p><p/>
 */
@property (nonatomic, strong) AWSKMSGrantConstraints * _Nullable constraints;

/**
 <p>A list of grant tokens. </p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The identity that gets the permissions specified in the grant.</p><p>To specify the principal, use the <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon Web Services principals include Amazon Web Services accounts (root), IAM users, IAM roles, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon Web Services Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteePrincipal;

/**
 <p>Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.</p><p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>A friendly name for the grant. Use this value to prevent the unintended creation of duplicate grants when retrying this request.</p><p>When this value is absent, all <code>CreateGrant</code> requests result in a new grant with a unique <code>GrantId</code> even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the <code>CreateGrant</code> request.</p><p>When this value is present, you can retry a <code>CreateGrant</code> request with identical parameters; if the grant already exists, the original <code>GrantId</code> is returned without creating a new grant. Note that the returned grant token is unique with every <code>CreateGrant</code> request, even when a duplicate <code>GrantId</code> is returned. All grant tokens for the same grant ID can be used interchangeably.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of operations that the grant permits. </p><p>This list must include only operations that are permitted in a grant. Also, the operation must be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption KMS key that allows the <a>Sign</a> operation, or a grant for an asymmetric KMS key that allows the <a>GenerateDataKey</a> operation. If you try, KMS returns a <code>ValidationError</code> exception. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations">Grant operations</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable operations;

/**
 <p>The principal that has permission to use the <a>RetireGrant</a> operation to retire the grant. </p><p>To specify the principal, use the <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon Web Services principals include Amazon Web Services accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax to use for specifying a principal, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon Web Services Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p><p>The grant determines the retiring principal. Other principals might have permission to retire the grant or revoke the grant. For details, see <a>RevokeGrant</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring and revoking grants</a> in the <i>Key Management Service Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable retiringPrincipal;

@end

/**
 
 */
@interface AWSKMSCreateGrantResponse : AWSModel


/**
 <p>The unique identifier for the grant.</p><p>You can use the <code>GrantId</code> in a <a>ListGrants</a>, <a>RetireGrant</a>, or <a>RevokeGrant</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>The grant token.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantToken;

@end

/**
 
 */
@interface AWSKMSCreateKeyRequest : AWSRequest


/**
 <p>A flag to indicate whether to bypass the key policy lockout safety check.</p><important><p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p><p>For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i><i>Key Management Service Developer Guide</i></i>.</p></important><p>Use this parameter only when you include a policy in the request and you intend to prevent the principal that is making the request from making a subsequent <a>PutKeyPolicy</a> request on the KMS key.</p><p>The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>Creates the KMS key in the specified <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a> and the key material in its associated CloudHSM cluster. To create a KMS key in a custom key store, you must also specify the <code>Origin</code> parameter with a value of <code>AWS_CLOUDHSM</code>. The CloudHSM cluster that is associated with the custom key store must have at least two active HSMs, each in a different Availability Zone in the Region.</p><p>This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot create any other type of KMS key in a custom key store.</p><p>To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p><p>The response includes the custom key store ID and the ID of the CloudHSM cluster.</p><p>This operation is part of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature</a> feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a single-tenant key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>Instead, use the <code>KeySpec</code> parameter.</p><p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> parameters work the same way. Only the names differ. We recommend that you use <code>KeySpec</code> parameter in your code. However, to avoid breaking changes, KMS will support both parameters.</p>
 */
@property (nonatomic, assign) AWSKMSCustomerMasterKeySpec customerMasterKeySpec;

/**
 <p>A description of the KMS key.</p><p>Use a description that helps you decide whether the KMS key is appropriate for a task. The default value is an empty string (no description).</p><p>To set or change the description after the key is created, use <a>UpdateKeyDescription</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies the type of KMS key to create. The default value, <code>SYMMETRIC_DEFAULT</code>, creates a KMS key with a 256-bit symmetric key for encryption and decryption. For help choosing a key spec for your KMS key, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-types.html#symm-asymm-choose">Choosing a KMS key type</a> in the <i><i>Key Management Service Developer Guide</i></i>.</p><p>The <code>KeySpec</code> determines whether the KMS key contains a symmetric key or an asymmetric key pair. It also determines the algorithms that the KMS key supports. You can't change the <code>KeySpec</code> after the KMS key is created. To further restrict the algorithms that can be used with the KMS key, use a condition key in its key policy or IAM policy. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm">kms:EncryptionAlgorithm</a>, <a href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-mac-algorithm">kms:MacAlgorithm</a> or <a href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm">kms:Signing Algorithm</a> in the <i><i>Key Management Service Developer Guide</i></i>.</p><important><p><a href="http://aws.amazon.com/kms/features/#AWS_Service_Integration">Amazon Web Services services that are integrated with KMS</a> use symmetric encryption KMS keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.</p></important><p>KMS supports the following key specs for KMS keys:</p><ul><li><p>Symmetric encryption key (default)</p><ul><li><p><code>SYMMETRIC_DEFAULT</code> (AES-256-GCM)</p></li></ul></li><li><p>HMAC keys (symmetric)</p><ul><li><p><code>HMAC_224</code></p></li><li><p><code>HMAC_256</code></p></li><li><p><code>HMAC_384</code></p></li><li><p><code>HMAC_512</code></p></li></ul></li><li><p>Asymmetric RSA key pairs</p><ul><li><p><code>RSA_2048</code></p></li><li><p><code>RSA_3072</code></p></li><li><p><code>RSA_4096</code></p></li></ul></li><li><p>Asymmetric NIST-recommended elliptic curve key pairs</p><ul><li><p><code>ECC_NIST_P256</code> (secp256r1)</p></li><li><p><code>ECC_NIST_P384</code> (secp384r1)</p></li><li><p><code>ECC_NIST_P521</code> (secp521r1)</p></li></ul></li><li><p>Other asymmetric elliptic curve key pairs</p><ul><li><p><code>ECC_SECG_P256K1</code> (secp256k1), commonly used for cryptocurrencies.</p></li></ul></li></ul>
 */
@property (nonatomic, assign) AWSKMSKeySpec keySpec;

/**
 <p>Determines the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations</a> for which you can use the KMS key. The default value is <code>ENCRYPT_DECRYPT</code>. This parameter is optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You can't change the <code>KeyUsage</code> value after the KMS key is created.</p><p>Select only one valid value.</p><ul><li><p>For symmetric encryption KMS keys, omit the parameter or specify <code>ENCRYPT_DECRYPT</code>.</p></li><li><p>For HMAC KMS keys (symmetric), specify <code>GENERATE_VERIFY_MAC</code>.</p></li><li><p>For asymmetric KMS keys with RSA key material, specify <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.</p></li><li><p>For asymmetric KMS keys with ECC key material, specify <code>SIGN_VERIFY</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSKMSKeyUsageType keyUsage;

/**
 <p>Creates a multi-Region primary key that you can replicate into other Amazon Web Services Regions. You cannot change this value after you create the KMS key. </p><p>For a multi-Region key, set this parameter to <code>True</code>. For a single-Region KMS key, omit this parameter or set it to <code>False</code>. The default value is <code>False</code>.</p><p>This operation supports <i>multi-Region keys</i>, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p><p>This value creates a <i>primary key</i>, not a replica. To create a <i>replica key</i>, use the <a>ReplicateKey</a> operation. </p><p>You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. However, you cannot create a multi-Region key in a custom key store.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiRegion;

/**
 <p>The source of the key material for the KMS key. You cannot change the origin after you create the KMS key. The default is <code>AWS_KMS</code>, which means that KMS creates the key material.</p><p>To create a KMS key with no key material (for imported key material), set the value to <code>EXTERNAL</code>. For more information about importing key material into KMS, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material</a> in the <i>Key Management Service Developer Guide</i>. This value is valid only for symmetric encryption KMS keys.</p><p>To create a KMS key in an KMS <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a> and create its key material in the associated CloudHSM cluster, set this value to <code>AWS_CLOUDHSM</code>. You must also use the <code>CustomKeyStoreId</code> parameter to identify the custom key store. This value is valid only for symmetric encryption KMS keys.</p>
 */
@property (nonatomic, assign) AWSKMSOriginType origin;

/**
 <p>The key policy to attach to the KMS key.</p><p>If you provide a key policy, it must meet the following criteria:</p><ul><li><p>If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the key policy must allow the principal that is making the <code>CreateKey</code> request to make a subsequent <a>PutKeyPolicy</a> request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section of the <i><i>Key Management Service Developer Guide</i></i>.</p></li><li><p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal (for example, an IAM user or role), you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes that I make are not always immediately visible</a> in the <i>Amazon Web Services Identity and Access Management User Guide</i>.</p></li></ul><p>If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default Key Policy</a> in the <i>Key Management Service Developer Guide</i>. </p><p>The key policy size quota is 32 kilobytes (32768 bytes).</p><p>For help writing and formatting a JSON policy document, see the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM JSON Policy Reference</a> in the <i><i>Identity and Access Management User Guide</i></i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the <a>TagResource</a> operation.</p><note><p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p></note><p>To use this parameter, you must have <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a> permission in an IAM policy.</p><p>Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p><p>When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging Keys</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKMSCreateKeyResponse : AWSModel


/**
 <p>Metadata associated with the KMS key.</p>
 */
@property (nonatomic, strong) AWSKMSKeyMetadata * _Nullable keyMetadata;

@end

/**
 <p>Contains information about each custom key store in the custom key store list.</p>
 */
@interface AWSKMSCustomKeyStoresListEntry : AWSModel


/**
 <p>A unique identifier for the CloudHSM cluster that is associated with the custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudHsmClusterId;

/**
 <p>Describes the connection error. This field appears in the response only when the <code>ConnectionState</code> is <code>FAILED</code>. For help resolving these errors, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How to Fix a Connection Failure</a> in <i>Key Management Service Developer Guide</i>.</p><p>Valid values are:</p><ul><li><p><code>CLUSTER_NOT_FOUND</code> - KMS cannot find the CloudHSM cluster with the specified cluster ID.</p></li><li><p><code>INSUFFICIENT_CLOUDHSM_HSMS</code> - The associated CloudHSM cluster does not contain any active HSMs. To connect a custom key store to its CloudHSM cluster, the cluster must contain at least one active HSM.</p></li><li><p><code>INTERNAL_ERROR</code> - KMS could not complete the request due to an internal error. Retry the request. For <code>ConnectCustomKeyStore</code> requests, disconnect the custom key store before trying to connect again.</p></li><li><p><code>INVALID_CREDENTIALS</code> - KMS does not have the correct password for the <code>kmsuser</code> crypto user in the CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must change the <code>kmsuser</code> account password and update the key store password value for the custom key store.</p></li><li><p><code>NETWORK_ERRORS</code> - Network errors are preventing KMS from connecting to the custom key store.</p></li><li><p><code>SUBNET_NOT_FOUND</code> - A subnet in the CloudHSM cluster configuration was deleted. If KMS cannot find all of the subnets in the cluster configuration, attempts to connect the custom key store to the CloudHSM cluster fail. To fix this error, create a cluster from a recent backup and associate it with your custom key store. (This process creates a new cluster configuration with a VPC and private subnets.) For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How to Fix a Connection Failure</a> in the <i>Key Management Service Developer Guide</i>.</p></li><li><p><code>USER_LOCKED_OUT</code> - The <code>kmsuser</code> CU account is locked out of the associated CloudHSM cluster due to too many failed password attempts. Before you can connect your custom key store to its CloudHSM cluster, you must change the <code>kmsuser</code> account password and update the key store password value for the custom key store.</p></li><li><p><code>USER_LOGGED_IN</code> - The <code>kmsuser</code> CU account is logged into the the associated CloudHSM cluster. This prevents KMS from rotating the <code>kmsuser</code> account password and logging into the cluster. Before you can connect your custom key store to its CloudHSM cluster, you must log the <code>kmsuser</code> CU out of the cluster. If you changed the <code>kmsuser</code> password to log into the cluster, you must also and update the key store password value for the custom key store. For help, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2">How to Log Out and Reconnect</a> in the <i>Key Management Service Developer Guide</i>.</p></li><li><p><code>USER_NOT_FOUND</code> - KMS cannot find a <code>kmsuser</code> CU account in the associated CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must create a <code>kmsuser</code> CU account in the cluster, and then update the key store password value for the custom key store.</p></li></ul>
 */
@property (nonatomic, assign) AWSKMSConnectionErrorCodeType connectionErrorCode;

/**
 <p>Indicates whether the custom key store is connected to its CloudHSM cluster.</p><p>You can create and use KMS keys in your custom key stores only when its connection state is <code>CONNECTED</code>.</p><p>The value is <code>DISCONNECTED</code> if the key store has never been connected or you use the <a>DisconnectCustomKeyStore</a> operation to disconnect it. If the value is <code>CONNECTED</code> but you are having trouble using the custom key store, make sure that its associated CloudHSM cluster is active and contains at least one active HSM.</p><p>A value of <code>FAILED</code> indicates that an attempt to connect was unsuccessful. The <code>ConnectionErrorCode</code> field in the response indicates the cause of the failure. For help resolving a connection failure, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting a Custom Key Store</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSConnectionStateType connectionState;

/**
 <p>The date and time when the custom key store was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique identifier for the custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>The user-specified friendly name for the custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreName;

/**
 <p>The trust anchor certificate of the associated CloudHSM cluster. When you <a href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr">initialize the cluster</a>, you create this certificate and save it in the <code>customerCA.crt</code> file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trustAnchorCertificate;

@end

/**
 
 */
@interface AWSKMSDecryptRequest : AWSRequest


/**
 <p>Ciphertext to be decrypted. The blob includes metadata.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same algorithm that was used to encrypt the data. If you specify a different algorithm, the <code>Decrypt</code> operation fails.</p><p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the only supported algorithm that is valid for symmetric encryption KMS keys.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec encryptionAlgorithm;

/**
 <p>Specifies the encryption context to use when decrypting the data. An encryption context is valid only for <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations</a> with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens. </p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the KMS key that KMS uses to decrypt the ciphertext.</p><p>Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the <code>Decrypt</code> operation throws an <code>IncorrectKeyException</code>.</p><p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDecryptResponse : AWSModel


/**
 <p>The encryption algorithm that was used to decrypt the ciphertext.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec encryptionAlgorithm;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that was used to decrypt the ciphertext.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSDeleteAliasRequest : AWSRequest


/**
 <p>The alias to be deleted. The alias name must begin with <code>alias/</code> followed by the alias name, such as <code>alias/ExampleAlias</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

@end

/**
 
 */
@interface AWSKMSDeleteCustomKeyStoreRequest : AWSRequest


/**
 <p>Enter the ID of the custom key store you want to delete. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

@end

/**
 
 */
@interface AWSKMSDeleteCustomKeyStoreResponse : AWSModel


@end

/**
 
 */
@interface AWSKMSDeleteImportedKeyMaterialRequest : AWSRequest


/**
 <p>Identifies the KMS key from which you are deleting imported key material. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDescribeCustomKeyStoresRequest : AWSRequest


/**
 <p>Gets only information about the specified custom key store. Enter the key store ID.</p><p>By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, you can use either the <code>CustomKeyStoreId</code> or <code>CustomKeyStoreName</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>Gets only information about the specified custom key store. Enter the friendly name of the custom key store.</p><p>By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, you can use either the <code>CustomKeyStoreId</code> or <code>CustomKeyStoreName</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreName;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSKMSDescribeCustomKeyStoresResponse : AWSModel


/**
 <p>Contains metadata about each custom key store.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSCustomKeyStoresListEntry *> * _Nullable customKeyStores;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSDescribeKeyRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Describes the specified KMS key. </p><p>If you specify a predefined Amazon Web Services alias (an Amazon Web Services alias with no key ID), KMS associates the alias with an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html##aws-managed-cmk">Amazon Web Services managed key</a> and returns its <code>KeyId</code> and <code>Arn</code> in the response.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
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
 <p>Identifies the KMS key to disable.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDisableKeyRotationRequest : AWSRequest


/**
 <p>Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks">asymmetric KMS keys</a>, <a href="https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html">HMAC KMS keys</a>, KMS keys with <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported key material</a>, or KMS keys in a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a>.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSDisconnectCustomKeyStoreRequest : AWSRequest


/**
 <p>Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

@end

/**
 
 */
@interface AWSKMSDisconnectCustomKeyStoreResponse : AWSModel


@end

/**
 
 */
@interface AWSKMSEnableKeyRequest : AWSRequest


/**
 <p>Identifies the KMS key to enable.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSEnableKeyRotationRequest : AWSRequest


/**
 <p>Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">asymmetric KMS keys</a>, <a href="https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html">HMAC KMS keys</a>, KMS keys with <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported key material</a>, or KMS keys in a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a>. To enable or disable automatic rotation of a set of related <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate">multi-Region keys</a>, set the property on the primary key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSEncryptRequest : AWSRequest


/**
 <p>Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The algorithm must be compatible with the KMS key that you specify.</p><p>This parameter is required only for asymmetric KMS keys. The default value, <code>SYMMETRIC_DEFAULT</code>, is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key, we recommend RSAES_OAEP_SHA_256.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec encryptionAlgorithm;

/**
 <p>Specifies the encryption context that will be used to encrypt the data. An encryption context is valid only for <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations</a> with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context. </p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Identifies the KMS key to use in the encryption operation. The KMS key must have a <code>KeyUsage</code> of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
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
 <p>The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The encryption algorithm that was used to encrypt the plaintext.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec encryptionAlgorithm;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that was used to encrypt the plaintext.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyPairRequest : AWSRequest


/**
 <p>Specifies the encryption context that will be used when encrypting the private key in the data key pair.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Determines the type of data key pair that is generated. </p><p>The KMS rule that restricts the use of asymmetric RSA KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeyPairSpec keyPairSpec;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyPairResponse : AWSModel


/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that encrypted the private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The type of data key pair that was generated.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeyPairSpec keyPairSpec;

/**
 <p>The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable privateKeyCiphertextBlob;

/**
 <p>The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable privateKeyPlaintext;

/**
 <p>The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable publicKey;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyPairWithoutPlaintextRequest : AWSRequest


/**
 <p>Specifies the encryption context that will be used when encrypting the private key in the data key pair.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Determines the type of data key pair that is generated.</p><p>The KMS rule that restricts the use of asymmetric RSA KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeyPairSpec keyPairSpec;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyPairWithoutPlaintextResponse : AWSModel


/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that encrypted the private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The type of data key pair that was generated.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeyPairSpec keyPairSpec;

/**
 <p>The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable privateKeyCiphertextBlob;

/**
 <p>The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable publicKey;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyRequest : AWSRequest


/**
 <p>Specifies the encryption context that will be used when encrypting the data key.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Specifies the length of the data key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p><p>You must specify either the <code>KeySpec</code> or the <code>NumberOfBytes</code> parameter (but not both) in every <code>GenerateDataKey</code> request.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeySpec keySpec;

/**
 <p>Specifies the length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys, use the <code>KeySpec</code> parameter.</p><p>You must specify either the <code>KeySpec</code> or the <code>NumberOfBytes</code> parameter (but not both) in every <code>GenerateDataKey</code> request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyResponse : AWSModel


/**
 <p>The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that encrypted the data key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data outside of KMS. Then, remove it from memory as soon as possible.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyWithoutPlaintextRequest : AWSRequest


/**
 <p>Specifies the encryption context that will be used when encrypting the data key.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContext;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The length of the data key. Use <code>AES_128</code> to generate a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric key.</p>
 */
@property (nonatomic, assign) AWSKMSDataKeySpec keySpec;

/**
 <p>The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the <code>KeySpec</code> field instead of this one.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateDataKeyWithoutPlaintextResponse : AWSModel


/**
 <p>The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that encrypted the data key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGenerateMacRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message and the key as described in <a href="https://datatracker.ietf.org/doc/html/rfc2104">RFC 2104</a>.</p><p>To identify an HMAC KMS key, use the <a>DescribeKey</a> operation and see the <code>KeySpec</code> field in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The MAC algorithm used in the operation.</p><p> The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC algorithms that your HMAC KMS key supports, use the <a>DescribeKey</a> operation and see the <code>MacAlgorithms</code> field in the <code>DescribeKey</code> response.</p>
 */
@property (nonatomic, assign) AWSKMSMacAlgorithmSpec macAlgorithm;

/**
 <p>The message to be hashed. Specify a message of up to 4,096 bytes. </p><p><code>GenerateMac</code> and <a>VerifyMac</a> do not provide special handling for message digests. If you generate an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.</p>
 */
@property (nonatomic, strong) NSData * _Nullable message;

@end

/**
 
 */
@interface AWSKMSGenerateMacResponse : AWSModel


/**
 <p>The HMAC KMS key used in the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The hash-based message authentication code (HMAC) for the given message, key, and MAC algorithm.</p>
 */
@property (nonatomic, strong) NSData * _Nullable mac;

/**
 <p>The MAC algorithm that was used to generate the HMAC.</p>
 */
@property (nonatomic, assign) AWSKMSMacAlgorithmSpec macAlgorithm;

@end

/**
 
 */
@interface AWSKMSGenerateRandomRequest : AWSRequest


/**
 <p>Generates the random byte string in the CloudHSM cluster that is associated with the specified <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a>. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>The length of the byte string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfBytes;

@end

/**
 
 */
@interface AWSKMSGenerateRandomResponse : AWSModel


/**
 <p>The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable plaintext;

@end

/**
 
 */
@interface AWSKMSGetKeyPolicyRequest : AWSRequest


/**
 <p>Gets the key policy for the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Specifies the name of the key policy. The only valid name is <code>default</code>. To get the names of key policies, use <a>ListKeyPolicies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSKMSGetKeyPolicyResponse : AWSModel


/**
 <p>A key policy document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSKMSGetKeyRotationStatusRequest : AWSRequest


/**
 <p>Gets the rotation status for the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
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
 <p>The identifier of the symmetric encryption KMS key into which you will import key material. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The algorithm you will use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html">Encrypt the Key Material</a> in the <i>Key Management Service Developer Guide</i>.</p>
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
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key to use in a subsequent <a>ImportKeyMaterial</a> request. This is the same KMS key specified in the <code>GetParametersForImport</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an <a>ImportKeyMaterial</a> request and you must send another <code>GetParametersForImport</code> request to get new ones.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable parametersValidTo;

/**
 <p>The public key to use to encrypt the key material before importing it with <a>ImportKeyMaterial</a>.</p>
 */
@property (nonatomic, strong) NSData * _Nullable publicKey;

@end

/**
 
 */
@interface AWSKMSGetPublicKeyRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Identifies the asymmetric KMS key that includes the public key.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSGetPublicKeyResponse : AWSModel


/**
 <p>Instead, use the <code>KeySpec</code> field in the <code>GetPublicKey</code> response.</p><p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have the same value. We recommend that you use the <code>KeySpec</code> field in your code. However, to avoid breaking changes, KMS will support both fields.</p>
 */
@property (nonatomic, assign) AWSKMSCustomerMasterKeySpec customerMasterKeySpec;

/**
 <p>The encryption algorithms that KMS supports for this key. </p><p>This information is critical. If a public key encrypts data outside of KMS by using an unsupported encryption algorithm, the ciphertext cannot be decrypted. </p><p>This field appears in the response only when the <code>KeyUsage</code> of the public key is <code>ENCRYPT_DECRYPT</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable encryptionAlgorithms;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the asymmetric KMS key from which the public key was downloaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The type of the of the public key that was downloaded.</p>
 */
@property (nonatomic, assign) AWSKMSKeySpec keySpec;

/**
 <p>The permitted use of the public key. Valid values are <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>. </p><p>This information is critical. If a public key with <code>SIGN_VERIFY</code> key usage encrypts data outside of KMS, the ciphertext cannot be decrypted. </p>
 */
@property (nonatomic, assign) AWSKMSKeyUsageType keyUsage;

/**
 <p>The exported public key. </p><p>The value is a DER-encoded X.509 public key, also known as <code>SubjectPublicKeyInfo</code> (SPKI), as defined in <a href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p><p/>
 */
@property (nonatomic, strong) NSData * _Nullable publicKey;

/**
 <p>The signing algorithms that KMS supports for this key.</p><p>This field appears in the response only when the <code>KeyUsage</code> of the public key is <code>SIGN_VERIFY</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable signingAlgorithms;

@end

/**
 <p>Use this structure to allow <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations</a> in the grant only when the operation request includes the specified <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption context</a>. </p><p>KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks">symmetric encryption KMS key</a>. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with HMAC KMS keys or asymmetric KMS keys, and management operations, such as <a>DescribeKey</a> or <a>RetireGrant</a>.</p><important><p>In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.</p><p>However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.</p><p>To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the <code>kms:EncryptionContext:</code> and <code>kms:EncryptionContextKeys</code> conditions in an IAM or key policy. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context">kms:EncryptionContext:</a> in the <i><i>Key Management Service Developer Guide</i></i>.</p></important>
 */
@interface AWSKMSGrantConstraints : AWSModel


/**
 <p>A list of key-value pairs that must match the encryption context in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operation</a> request. The grant allows the operation only when the encryption context in the request is the same as the encryption context specified in this constraint.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContextEquals;

/**
 <p>A list of key-value pairs that must be included in the encryption context of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operation</a> request. The grant allows the cryptographic operation only when the encryption context in the request includes the key-value pairs specified in this constraint, although it can include additional key-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable encryptionContextSubset;

@end

/**
 <p>Contains information about a grant.</p>
 */
@interface AWSKMSGrantListEntry : AWSModel


/**
 <p>A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.</p>
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
 <p>The identity that gets the permissions in the grant.</p><p>The <code>GranteePrincipal</code> field in the <code>ListGrants</code> response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the <code>GranteePrincipal</code> field contains the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service principal</a>, which might represent several different grantee principals.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteePrincipal;

/**
 <p>The Amazon Web Services account under which the grant was issued.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuingAccount;

/**
 <p>The unique identifier for the KMS key to which the grant applies.</p>
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
 <p>The encrypted key material to import. The key material must be encrypted with the public wrapping key that <a>GetParametersForImport</a> returned, using the wrapping algorithm that you specified in the same <code>GetParametersForImport</code> request.</p>
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
 <p>The identifier of the symmetric encryption KMS key that receives the imported key material. This must be the same KMS key specified in the <code>KeyID</code> parameter of the corresponding <a>GetParametersForImport</a> request. The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>. You cannot perform this operation on an asymmetric KMS key, an HMAC KMS key, a KMS key in a custom key store, or on a KMS key in a different Amazon Web Services account</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The time at which the imported key material expires. When the key material expires, KMS deletes the key material and the KMS key becomes unusable. You must omit this parameter when the <code>ExpirationModel</code> parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>. Otherwise it is required.</p>
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
 <p>Contains metadata about a KMS key.</p><p>This data type is used as a response element for the <a>CreateKey</a> and <a>DescribeKey</a> operations.</p>
 Required parameters: [KeyId]
 */
@interface AWSKMSKeyMetadata : AWSModel


/**
 <p>The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccountId;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key. For examples, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Key Management Service (KMS)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you create a KMS key in a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a>, KMS creates the key material for the KMS key in the associated CloudHSM cluster. This value is present only when the KMS key is created in a custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudHsmClusterId;

/**
 <p>The date and time when the KMS key was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A unique identifier for the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store</a> that contains the KMS key. This value is present only when the KMS key is created in a custom key store.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>Instead, use the <code>KeySpec</code> field.</p><p>The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have the same value. We recommend that you use the <code>KeySpec</code> field in your code. However, to avoid breaking changes, KMS will support both fields.</p>
 */
@property (nonatomic, assign) AWSKMSCustomerMasterKeySpec customerMasterKeySpec;

/**
 <p>The date and time after which KMS deletes this KMS key. This value is present only when the KMS key is scheduled for deletion, that is, when its <code>KeyState</code> is <code>PendingDeletion</code>.</p><p>When the primary key in a multi-Region key is scheduled for deletion but still has replica keys, its key state is <code>PendingReplicaDeletion</code> and the length of its waiting period is displayed in the <code>PendingDeletionWindowInDays</code> field.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The description of the KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the KMS key is enabled. When <code>KeyState</code> is <code>Enabled</code> this value is true, otherwise it is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The encryption algorithms that the KMS key supports. You cannot use the KMS key with other encryption algorithms within KMS.</p><p>This value is present only when the <code>KeyUsage</code> of the KMS key is <code>ENCRYPT_DECRYPT</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable encryptionAlgorithms;

/**
 <p>Specifies whether the KMS key's key material expires. This value is present only when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value is omitted.</p>
 */
@property (nonatomic, assign) AWSKMSExpirationModelType expirationModel;

/**
 <p>The globally unique identifier for the KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The manager of the KMS key. KMS keys in your Amazon Web Services account are either customer managed or Amazon Web Services managed. For more information about the difference, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys">KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSKeyManagerType keyManager;

/**
 <p>Describes the type of key material in the KMS key.</p>
 */
@property (nonatomic, assign) AWSKMSKeySpec keySpec;

/**
 <p>The current status of the KMS key.</p><p>For more information about how key state affects the use of a KMS key, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSKeyState keyState;

/**
 <p>The <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations</a> for which you can use the KMS key.</p>
 */
@property (nonatomic, assign) AWSKMSKeyUsageType keyUsage;

/**
 <p>The message authentication code (MAC) algorithm that the HMAC KMS key supports.</p><p>This value is present only when the <code>KeyUsage</code> of the KMS key is <code>GENERATE_VERIFY_MAC</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable macAlgorithms;

/**
 <p>Indicates whether the KMS key is a multi-Region (<code>True</code>) or regional (<code>False</code>) key. This value is <code>True</code> for multi-Region primary and replica keys and <code>False</code> for regional KMS keys.</p><p>For more information about multi-Region keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Multi-Region keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiRegion;

/**
 <p>Lists the primary and replica keys in same multi-Region key. This field is present only when the value of the <code>MultiRegion</code> field is <code>True</code>.</p><p>For more information about any listed KMS key, use the <a>DescribeKey</a> operation.</p><ul><li><p><code>MultiRegionKeyType</code> indicates whether the KMS key is a <code>PRIMARY</code> or <code>REPLICA</code> key.</p></li><li><p><code>PrimaryKey</code> displays the key ARN and Region of the primary key. This field displays the current KMS key if it is the primary key.</p></li><li><p><code>ReplicaKeys</code> displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.</p></li></ul>
 */
@property (nonatomic, strong) AWSKMSMultiRegionConfiguration * _Nullable multiRegionConfiguration;

/**
 <p>The source of the key material for the KMS key. When this value is <code>AWS_KMS</code>, KMS created the key material. When this value is <code>EXTERNAL</code>, the key material was imported or the KMS key doesn't have any key material. When this value is <code>AWS_CLOUDHSM</code>, the key material was created in the CloudHSM cluster associated with a custom key store.</p>
 */
@property (nonatomic, assign) AWSKMSOriginType origin;

/**
 <p>The waiting period before the primary key in a multi-Region key is deleted. This waiting period begins when the last of its replica keys is deleted. This value is present only when the <code>KeyState</code> of the KMS key is <code>PendingReplicaDeletion</code>. That indicates that the KMS key is the primary key in a multi-Region key, it is scheduled for deletion, and it still has existing replica keys.</p><p>When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its deletion date is displayed in the <code>DeletionDate</code> field. However, when the primary key in a multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its replica keys are deleted. This value displays that waiting period. When the last replica key in the multi-Region key is deleted, the <code>KeyState</code> of the scheduled primary key changes from <code>PendingReplicaDeletion</code> to <code>PendingDeletion</code> and the deletion date appears in the <code>DeletionDate</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingDeletionWindowInDays;

/**
 <p>The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing algorithms within KMS.</p><p>This field appears only when the <code>KeyUsage</code> of the KMS key is <code>SIGN_VERIFY</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable signingAlgorithms;

/**
 <p>The time at which the imported key material expires. When the key material expires, KMS deletes the key material and the KMS key becomes unusable. This value is present only for KMS keys whose <code>Origin</code> is <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validTo;

@end

/**
 
 */
@interface AWSKMSListAliasesRequest : AWSRequest


/**
 <p>Lists only aliases that are associated with the specified KMS key. Enter a KMS key in your Amazon Web Services account. </p><p>This parameter is optional. If you omit it, <code>ListAliases</code> returns all aliases in the account and Region.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
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
 <p>A list of aliases.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSAliasListEntry *> * _Nullable aliases;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListGrantsRequest : AWSRequest


/**
 <p>Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant. </p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>Returns only grants where the specified principal is the grantee principal for the grant.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granteePrincipal;

/**
 <p>Returns only grants for the specified KMS key. This parameter is required.</p><p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
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
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListKeyPoliciesRequest : AWSRequest


/**
 <p>Gets the names of key policies for the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p><p>Only one policy can be attached to a key.</p>
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
 <p>A list of key policy names. The only valid value is <code>default</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListKeysRequest : AWSRequest


/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.</p>
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
 <p>A list of KMS keys.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSKeyListEntry *> * _Nullable keys;

/**
 <p>When <code>Truncated</code> is true, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListResourceTagsRequest : AWSRequest


/**
 <p>Gets tags on the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.</p>
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
 <p>A list of tags. Each tag consists of a tag key and a tag value.</p><note><p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

/**
 <p>A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the <code>NextMarker</code> element in thisresponse to the <code>Marker</code> parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncated;

@end

/**
 
 */
@interface AWSKMSListRetirableGrantsRequest : AWSRequest


/**
 <p>Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.</p><p>This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of <code>NextMarker</code> from the truncated response you just received.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The retiring principal for which to list grants. Enter a principal in your Amazon Web Services account.</p><p>To specify the retiring principal, use the <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon Web Services principals include Amazon Web Services accounts (root), IAM users, federated users, and assumed role users. For examples of the ARN syntax for specifying a principal, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon Web Services Identity and Access Management (IAM)</a> in the Example ARNs section of the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable retiringPrincipal;

@end

/**
 <p>Describes the configuration of this multi-Region key. This field appears only when the KMS key is a primary or replica of a multi-Region key.</p><p>For more information about any listed KMS key, use the <a>DescribeKey</a> operation.</p>
 */
@interface AWSKMSMultiRegionConfiguration : AWSModel


/**
 <p>Indicates whether the KMS key is a <code>PRIMARY</code> or <code>REPLICA</code> key.</p>
 */
@property (nonatomic, assign) AWSKMSMultiRegionKeyType multiRegionKeyType;

/**
 <p>Displays the key ARN and Region of the primary key. This field includes the current KMS key if it is the primary key.</p>
 */
@property (nonatomic, strong) AWSKMSMultiRegionKey * _Nullable primaryKey;

/**
 <p>displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSMultiRegionKey *> * _Nullable replicaKeys;

@end

/**
 <p>Describes the primary or replica key in a multi-Region key.</p>
 */
@interface AWSKMSMultiRegionKey : AWSModel


/**
 <p>Displays the key ARN of a primary or replica key of a multi-Region key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 
 */
@interface AWSKMSPutKeyPolicyRequest : AWSRequest


/**
 <p>A flag to indicate whether to bypass the key policy lockout safety check.</p><important><p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p><p>For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>Key Management Service Developer Guide</i>.</p></important><p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <code>PutKeyPolicy</code> request on the KMS key.</p><p>The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>Sets the key policy on the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The key policy to attach to the KMS key.</p><p>The key policy must meet the following criteria:</p><ul><li><p>If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the key policy must allow the principal that is making the <code>PutKeyPolicy</code> request to make a subsequent <code>PutKeyPolicy</code> request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section of the <i>Key Management Service Developer Guide</i>.</p></li><li><p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal (for example, an IAM user or role), you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes that I make are not always immediately visible</a> in the <i>Amazon Web Services Identity and Access Management User Guide</i>.</p></li></ul><p>The key policy cannot exceed 32 kilobytes (32768 bytes). For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/resource-limits.html">Resource Quotas</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The name of the key policy. The only valid value is <code>default</code>.</p>
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
 <p>Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted it. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the encryption algorithm used for symmetric encryption KMS keys.</p><p>This parameter is required only when the destination KMS key is an asymmetric KMS key.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec destinationEncryptionAlgorithm;

/**
 <p>Specifies that encryption context to use when the reencrypting the data.</p><p>A destination encryption context is valid only when the destination KMS key is a symmetric encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include fields for metadata.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable destinationEncryptionContext;

/**
 <p>A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric encryption KMS key or an asymmetric KMS key with a <code>KeyUsage</code> value of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code> value of a KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationKeyId;

/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is reencrypted. The default value, <code>SYMMETRIC_DEFAULT</code>, represents the algorithm used for symmetric encryption KMS keys.</p><p>Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different algorithm, the decrypt attempt fails.</p><p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec sourceEncryptionAlgorithm;

/**
 <p>Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption context that was used to encrypt the ciphertext.</p><p>An <i>encryption context</i> is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption context</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable sourceEncryptionContext;

/**
 <p>Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.</p><p>Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the <code>ReEncrypt</code> operation throws an <code>IncorrectKeyException</code>.</p><p>This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceKeyId;

@end

/**
 
 */
@interface AWSKMSReEncryptResponse : AWSModel


/**
 <p>The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ciphertextBlob;

/**
 <p>The encryption algorithm that was used to reencrypt the data.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec destinationEncryptionAlgorithm;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key that was used to reencrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.</p>
 */
@property (nonatomic, assign) AWSKMSEncryptionAlgorithmSpec sourceEncryptionAlgorithm;

/**
 <p>Unique identifier of the KMS key used to originally encrypt the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceKeyId;

@end

/**
 
 */
@interface AWSKMSReplicateKeyRequest : AWSRequest


/**
 <p>A flag to indicate whether to bypass the key policy lockout safety check.</p><important><p>Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.</p><p>For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section in the <i>Key Management Service Developer Guide</i>.</p></important><p>Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent <code>PutKeyPolicy</code> request on the KMS key.</p><p>The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassPolicyLockoutSafetyCheck;

/**
 <p>A description of the KMS key. The default value is an empty string (no description).</p><p>The description is not a shared property of multi-Region keys. You can specify the same description or a different description for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key is a multi-Region primary key, use the <a>DescribeKey</a> operation to check the value of the <code>MultiRegionKeyType</code> property.</p><p>Specify the key ID or key ARN of a multi-Region primary key.</p><p>For example:</p><ul><li><p>Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key policy, KMS attaches the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">default key policy</a> to the KMS key.</p><p>The key policy is not a shared property of multi-Region keys. You can specify the same key policy or a different key policy for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p><p>If you provide a key policy, it must meet the following criteria:</p><ul><li><p>If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the key policy must give the caller <code>kms:PutKeyPolicy</code> permission on the replica key. This reduces the risk that the KMS key becomes unmanageable. For more information, refer to the scenario in the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default Key Policy</a> section of the <i><i>Key Management Service Developer Guide</i></i>.</p></li><li><p>Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal (for example, an IAM user or role), you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes that I make are not always immediately visible</a> in the <i><i>Identity and Access Management User Guide</i></i>.</p></li><li><p>The key policy size quota is 32 kilobytes (32768 bytes).</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Region ID of the Amazon Web Services Region for this replica key. </p><p>Enter the Region ID, such as <code>us-east-1</code> or <code>ap-southeast-2</code>. For a list of Amazon Web Services Regions in which KMS is supported, see <a href="https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region">KMS service endpoints</a> in the <i>Amazon Web Services General Reference</i>.</p><note><p>HMAC KMS keys are not supported in all Amazon Web Services Regions. If you try to replicate an HMAC KMS key in an Amazon Web Services Region in which HMAC keys are not supported, the <code>ReplicateKey</code> operation returns an <code>UnsupportedOperationException</code>. For a list of Regions in which HMAC KMS keys are supported, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html">HMAC keys in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p></note><p>The replica must be in a different Amazon Web Services Region than its primary key and other replicas of that primary key, but in the same Amazon Web Services partition. KMS must be available in the replica Region. If the Region is not enabled by default, the Amazon Web Services account must be enabled in the Region. For information about Amazon Web Services partitions, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General Reference</i>. For information about enabling and disabling Regions, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable">Enabling a Region</a> and <a href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable">Disabling a Region</a> in the <i>Amazon Web Services General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaRegion;

/**
 <p>Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the <a>TagResource</a> operation.</p><note><p>Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.</p></note><p>To use this parameter, you must have <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a> permission in an IAM policy.</p><p>Tags are not a shared property of multi-Region keys. You can specify the same tags or different tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.</p><p>Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p><p>When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging Keys</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKMSReplicateKeyResponse : AWSModel


/**
 <p>Displays details about the new replica key, including its Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key states of KMS keys</a>. It also includes the ARN and Amazon Web Services Region of its primary key and other replica keys.</p>
 */
@property (nonatomic, strong) AWSKMSKeyMetadata * _Nullable replicaKeyMetadata;

/**
 <p>The key policy of the new replica key. The value is a key policy document in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaPolicy;

/**
 <p>The tags on the new replica key. The value is a list of tag key and tag value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable replicaTags;

@end

/**
 
 */
@interface AWSKMSRetireGrantRequest : AWSRequest


/**
 <p>Identifies the grant to retire. To get the grant ID, use <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.</p><ul><li><p>Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>Identifies the grant to be retired. You can use a grant token to identify a new grant even before it has achieved eventual consistency.</p><p>Only the <a>CreateGrant</a> operation returns a grant token. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency">Eventual consistency</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantToken;

/**
 <p>The key ARN KMS key associated with the grant. To find the key ARN, use the <a>ListKeys</a> operation.</p><p>For example: <code>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSRevokeGrantRequest : AWSRequest


/**
 <p>Identifies the grant to revoke. To get the grant ID, use <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantId;

/**
 <p>A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p><p>Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSScheduleKeyDeletionRequest : AWSRequest


/**
 <p>The unique identifier of the KMS key to delete.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The waiting period, specified in number of days. After the waiting period ends, KMS deletes the KMS key.</p><p>If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.</p><p>This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingWindowInDays;

@end

/**
 
 */
@interface AWSKMSScheduleKeyDeletionResponse : AWSModel


/**
 <p>The date and time after which KMS deletes the KMS key.</p><p>If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The deletion date for the primary key isn't known until its last replica key is deleted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the KMS key whose deletion is scheduled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The current status of the KMS key.</p><p>For more information about how key state affects the use of a KMS key, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key states of KMS keys</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSKMSKeyState keyState;

/**
 <p>The waiting period before the KMS key is deleted. </p><p>If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingWindowInDays;

@end

/**
 
 */
@interface AWSKMSSignRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the message. The <code>KeyUsage</code> type of the KMS key must be <code>SIGN_VERIFY</code>. To find the <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger message, provide the message digest.</p><p>If you provide a message, KMS generates a hash digest of the message and then signs it.</p>
 */
@property (nonatomic, strong) NSData * _Nullable message;

/**
 <p>Tells KMS whether the value of the <code>Message</code> parameter is a message or message digest. The default value, RAW, indicates a message. To indicate a message digest, enter <code>DIGEST</code>.</p>
 */
@property (nonatomic, assign) AWSKMSMessageType messageType;

/**
 <p>Specifies the signing algorithm to use when signing the message. </p><p>Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS key.</p>
 */
@property (nonatomic, assign) AWSKMSSigningAlgorithmSpec signingAlgorithm;

@end

/**
 
 */
@interface AWSKMSSignResponse : AWSModel


/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the asymmetric KMS key that was used to sign the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The cryptographic signature that was generated for the message. </p><ul><li><p>When used with the supported RSA signing algorithms, the encoding of this value is defined by <a href="https://tools.ietf.org/html/rfc8017">PKCS #1 in RFC 8017</a>.</p></li><li><p>When used with the <code>ECDSA_SHA_256</code>, <code>ECDSA_SHA_384</code>, or <code>ECDSA_SHA_512</code> signing algorithms, this value is a DER-encoded object as defined by ANS X9.62–2005 and <a href="https://tools.ietf.org/html/rfc3279#section-2.2.3">RFC 3279 Section 2.2.3</a>. This is the most commonly used signature format and is appropriate for most uses. </p></li></ul><p>When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable signature;

/**
 <p>The signing algorithm that was used to sign the message.</p>
 */
@property (nonatomic, assign) AWSKMSSigningAlgorithmSpec signingAlgorithm;

@end

/**
 <p>A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.</p><p>For information about the rules that apply to tag keys and tag values, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined Tag Restrictions</a> in the <i>Amazon Web Services Billing and Cost Management User Guide</i>.</p>
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
 <p>Identifies a customer managed key in the account and Region.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>One or more tags. </p><p>Each tag consists of a tag key and a tag value. The tag value can be an empty (null) string. </p><p>You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.</p>
 */
@property (nonatomic, strong) NSArray<AWSKMSTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKMSUntagResourceRequest : AWSRequest


/**
 <p>Identifies the KMS key from which you are removing tags.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
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
 <p>Identifies the alias that is changing its KMS key. This value must begin with <code>alias/</code> followed by the alias name, such as <code>alias/ExampleAlias</code>. You cannot use UpdateAlias to change the alias name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aliasName;

/**
 <p>Identifies the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key</a> to associate with the alias. You don't have permission to associate an alias with an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon Web Services managed key</a>.</p><p>The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the new target KMS key must be the same type as the current target KMS key (both symmetric or both asymmetric) and they must have the same key usage. </p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p><p>To verify that the alias is mapped to the correct KMS key, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyId;

@end

/**
 
 */
@interface AWSKMSUpdateCustomKeyStoreRequest : AWSRequest


/**
 <p>Associates the custom key store with a related CloudHSM cluster. </p><p>Enter the cluster ID of the cluster that you used to create the custom key store or a cluster that shares a backup history and has the same cluster certificate as the original cluster. You cannot use this parameter to associate a custom key store with an unrelated cluster. In addition, the replacement cluster must <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore">fulfill the requirements</a> for a cluster associated with a custom key store. To view the cluster certificate of a cluster, use the <a href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudHsmClusterId;

/**
 <p>Identifies the custom key store that you want to update. Enter the ID of the custom key store. To find the ID of a custom key store, use the <a>DescribeCustomKeyStores</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customKeyStoreId;

/**
 <p>Enter the current password of the <code>kmsuser</code> crypto user (CU) in the CloudHSM cluster that is associated with the custom key store.</p><p>This parameter tells KMS the current password of the <code>kmsuser</code> crypto user (CU). It does not set or change the password of any users in the CloudHSM cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyStorePassword;

/**
 <p>Changes the friendly name of the custom key store to the value that you specify. The custom key store name must be unique in the Amazon Web Services account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestCustomKeyStoreName;

@end

/**
 
 */
@interface AWSKMSUpdateCustomKeyStoreResponse : AWSModel


@end

/**
 
 */
@interface AWSKMSUpdateKeyDescriptionRequest : AWSRequest


/**
 <p>New description for the KMS key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Updates the description of the specified KMS key.</p><p>Specify the key ID or key ARN of the KMS key.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 
 */
@interface AWSKMSUpdatePrimaryRegionRequest : AWSRequest


/**
 <p>Identifies the current primary key. When the operation completes, this KMS key will be a replica key.</p><p>Specify the key ID or key ARN of a multi-Region primary key.</p><p>For example:</p><ul><li><p>Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The Amazon Web Services Region of the new primary key. Enter the Region ID, such as <code>us-east-1</code> or <code>ap-southeast-2</code>. There must be an existing replica key in this Region. </p><p>When the operation completes, the multi-Region key in this Region will be the primary key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable primaryRegion;

@end

/**
 
 */
@interface AWSKMSVerifyMacRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>The KMS key that will be used in the verification.</p><p>Enter a key ID of the KMS key that was used to generate the HMAC. If you identify a different KMS key, the <code>VerifyMac</code> operation fails.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The HMAC to verify. Enter the HMAC that was generated by the <a>GenerateMac</a> operation when you specified the same message, HMAC KMS key, and MAC algorithm as the values specified in this request.</p>
 */
@property (nonatomic, strong) NSData * _Nullable mac;

/**
 <p>The MAC algorithm that will be used in the verification. Enter the same MAC algorithm that was used to compute the HMAC. This algorithm must be supported by the HMAC KMS key identified by the <code>KeyId</code> parameter.</p>
 */
@property (nonatomic, assign) AWSKMSMacAlgorithmSpec macAlgorithm;

/**
 <p>The message that will be used in the verification. Enter the same message that was used to generate the HMAC.</p><p><a>GenerateMac</a> and <code>VerifyMac</code> do not provide special handling for message digests. If you generated an HMAC for a hash digest of a message, you must verify the HMAC for the same hash digest.</p>
 */
@property (nonatomic, strong) NSData * _Nullable message;

@end

/**
 
 */
@interface AWSKMSVerifyMacResponse : AWSModel


/**
 <p>The HMAC KMS key used in the verification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The MAC algorithm used in the verification.</p>
 */
@property (nonatomic, assign) AWSKMSMacAlgorithmSpec macAlgorithm;

/**
 <p>A Boolean value that indicates whether the HMAC was verified. A value of <code>True</code> indicates that the HMAC (<code>Mac</code>) was generated with the specified <code>Message</code>, HMAC KMS key (<code>KeyID</code>) and <code>MacAlgorithm.</code>.</p><p>If the HMAC is not verified, the <code>VerifyMac</code> operation fails with a <code>KMSInvalidMacException</code> exception. This exception indicates that one or more of the inputs changed since the HMAC was computed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable macValid;

@end

/**
 
 */
@interface AWSKMSVerifyRequest : AWSRequest


/**
 <p>A list of grant tokens.</p><p>Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved <i>eventual consistency</i>. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant token</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant token</a> in the <i>Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable grantTokens;

/**
 <p>Identifies the asymmetric KMS key that will be used to verify the signature. This must be the same KMS key that was used to generate the signature. If you specify a different KMS key, the signature verification fails.</p><p>To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with <code>"alias/"</code>. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.</p><p>For example:</p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Alias name: <code>alias/ExampleAlias</code></p></li><li><p>Alias ARN: <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code></p></li></ul><p>To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or <a>DescribeKey</a>. To get the alias name and alias ARN, use <a>ListAliases</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a hash digest of the message. If you submit a digest, use the <code>MessageType</code> parameter with a value of <code>DIGEST</code>.</p><p>If the message specified here is different from the message that was signed, the signature verification fails. A message and its hash digest are considered to be the same message.</p>
 */
@property (nonatomic, strong) NSData * _Nullable message;

/**
 <p>Tells KMS whether the value of the <code>Message</code> parameter is a message or message digest. The default value, RAW, indicates a message. To indicate a message digest, enter <code>DIGEST</code>.</p><important><p>Use the <code>DIGEST</code> value only when the value of the <code>Message</code> parameter is a message digest. If you use the <code>DIGEST</code> value with a raw message, the security of the verification operation can be compromised.</p></important>
 */
@property (nonatomic, assign) AWSKMSMessageType messageType;

/**
 <p>The signature that the <code>Sign</code> operation generated.</p>
 */
@property (nonatomic, strong) NSData * _Nullable signature;

/**
 <p>The signing algorithm that was used to sign the message. If you submit a different algorithm, the signature verification fails.</p>
 */
@property (nonatomic, assign) AWSKMSSigningAlgorithmSpec signingAlgorithm;

@end

/**
 
 */
@interface AWSKMSVerifyResponse : AWSModel


/**
 <p>The Amazon Resource Name (<a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key ARN</a>) of the asymmetric KMS key that was used to verify the signature.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>A Boolean value that indicates whether the signature was verified. A value of <code>True</code> indicates that the <code>Signature</code> was produced by signing the <code>Message</code> with the specified <code>KeyID</code> and <code>SigningAlgorithm.</code> If the signature is not verified, the <code>Verify</code> operation fails with a <code>KMSInvalidSignatureException</code> exception. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable signatureValid;

/**
 <p>The signing algorithm that was used to verify the signature.</p>
 */
@property (nonatomic, assign) AWSKMSSigningAlgorithmSpec signingAlgorithm;

@end

NS_ASSUME_NONNULL_END
