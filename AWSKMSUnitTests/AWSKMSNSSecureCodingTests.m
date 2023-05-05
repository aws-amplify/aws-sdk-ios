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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSKMSModel.h"

@interface AWSKMSNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSKMSAliasListEntry API_AVAILABLE(ios(11));
- (void) test_AWSKMSCancelKeyDeletionRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSCancelKeyDeletionResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSConnectCustomKeyStoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSConnectCustomKeyStoreResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateCustomKeyStoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateCustomKeyStoreResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateGrantRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateGrantResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSCreateKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSCustomKeyStoresListEntry API_AVAILABLE(ios(11));
- (void) test_AWSKMSDecryptRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDecryptResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSDeleteAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDeleteCustomKeyStoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDeleteCustomKeyStoreResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSDeleteImportedKeyMaterialRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDescribeCustomKeyStoresRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDescribeCustomKeyStoresResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSDescribeKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDescribeKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSDisableKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDisableKeyRotationRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDisconnectCustomKeyStoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSDisconnectCustomKeyStoreResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSEnableKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSEnableKeyRotationRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSEncryptRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSEncryptResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyPairRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyPairResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyPairWithoutPlaintextRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyPairWithoutPlaintextResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyWithoutPlaintextRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateDataKeyWithoutPlaintextResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateMacRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateMacResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateRandomRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGenerateRandomResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetKeyPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetKeyPolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetKeyRotationStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetKeyRotationStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetParametersForImportRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetParametersForImportResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetPublicKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSGetPublicKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSGrantConstraints API_AVAILABLE(ios(11));
- (void) test_AWSKMSGrantListEntry API_AVAILABLE(ios(11));
- (void) test_AWSKMSImportKeyMaterialRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSImportKeyMaterialResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSKeyListEntry API_AVAILABLE(ios(11));
- (void) test_AWSKMSKeyMetadata API_AVAILABLE(ios(11));
- (void) test_AWSKMSListAliasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSListAliasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSListGrantsRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSListGrantsResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSListKeyPoliciesRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSListKeyPoliciesResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSListKeysRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSListKeysResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSListResourceTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSListResourceTagsResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSListRetirableGrantsRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSMultiRegionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSKMSMultiRegionKey API_AVAILABLE(ios(11));
- (void) test_AWSKMSPutKeyPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSReEncryptRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSReEncryptResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSRecipientInfo API_AVAILABLE(ios(11));
- (void) test_AWSKMSReplicateKeyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSReplicateKeyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSRetireGrantRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSRevokeGrantRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSScheduleKeyDeletionRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSScheduleKeyDeletionResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSSignRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSSignResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSTag API_AVAILABLE(ios(11));
- (void) test_AWSKMSTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSUpdateAliasRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSUpdateCustomKeyStoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSUpdateCustomKeyStoreResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSUpdateKeyDescriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSUpdatePrimaryRegionRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSVerifyMacRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSVerifyMacResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSVerifyRequest API_AVAILABLE(ios(11));
- (void) test_AWSKMSVerifyResponse API_AVAILABLE(ios(11));
- (void) test_AWSKMSXksKeyConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSKMSXksProxyAuthenticationCredentialType API_AVAILABLE(ios(11));
- (void) test_AWSKMSXksProxyConfigurationType API_AVAILABLE(ios(11));

@end

@implementation AWSKMSNSSecureCodingTests

- (void) test_AWSKMSAliasListEntry {
    [self validateSecureCodingForClass:[AWSKMSAliasListEntry class]];
}

- (void) test_AWSKMSCancelKeyDeletionRequest {
    [self validateSecureCodingForClass:[AWSKMSCancelKeyDeletionRequest class]];
}

- (void) test_AWSKMSCancelKeyDeletionResponse {
    [self validateSecureCodingForClass:[AWSKMSCancelKeyDeletionResponse class]];
}

- (void) test_AWSKMSConnectCustomKeyStoreRequest {
    [self validateSecureCodingForClass:[AWSKMSConnectCustomKeyStoreRequest class]];
}

- (void) test_AWSKMSConnectCustomKeyStoreResponse {
    [self validateSecureCodingForClass:[AWSKMSConnectCustomKeyStoreResponse class]];
}

- (void) test_AWSKMSCreateAliasRequest {
    [self validateSecureCodingForClass:[AWSKMSCreateAliasRequest class]];
}

- (void) test_AWSKMSCreateCustomKeyStoreRequest {
    [self validateSecureCodingForClass:[AWSKMSCreateCustomKeyStoreRequest class]];
}

- (void) test_AWSKMSCreateCustomKeyStoreResponse {
    [self validateSecureCodingForClass:[AWSKMSCreateCustomKeyStoreResponse class]];
}

- (void) test_AWSKMSCreateGrantRequest {
    [self validateSecureCodingForClass:[AWSKMSCreateGrantRequest class]];
}

- (void) test_AWSKMSCreateGrantResponse {
    [self validateSecureCodingForClass:[AWSKMSCreateGrantResponse class]];
}

- (void) test_AWSKMSCreateKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSCreateKeyRequest class]];
}

- (void) test_AWSKMSCreateKeyResponse {
    [self validateSecureCodingForClass:[AWSKMSCreateKeyResponse class]];
}

- (void) test_AWSKMSCustomKeyStoresListEntry {
    [self validateSecureCodingForClass:[AWSKMSCustomKeyStoresListEntry class]];
}

- (void) test_AWSKMSDecryptRequest {
    [self validateSecureCodingForClass:[AWSKMSDecryptRequest class]];
}

- (void) test_AWSKMSDecryptResponse {
    [self validateSecureCodingForClass:[AWSKMSDecryptResponse class]];
}

- (void) test_AWSKMSDeleteAliasRequest {
    [self validateSecureCodingForClass:[AWSKMSDeleteAliasRequest class]];
}

- (void) test_AWSKMSDeleteCustomKeyStoreRequest {
    [self validateSecureCodingForClass:[AWSKMSDeleteCustomKeyStoreRequest class]];
}

- (void) test_AWSKMSDeleteCustomKeyStoreResponse {
    [self validateSecureCodingForClass:[AWSKMSDeleteCustomKeyStoreResponse class]];
}

- (void) test_AWSKMSDeleteImportedKeyMaterialRequest {
    [self validateSecureCodingForClass:[AWSKMSDeleteImportedKeyMaterialRequest class]];
}

- (void) test_AWSKMSDescribeCustomKeyStoresRequest {
    [self validateSecureCodingForClass:[AWSKMSDescribeCustomKeyStoresRequest class]];
}

- (void) test_AWSKMSDescribeCustomKeyStoresResponse {
    [self validateSecureCodingForClass:[AWSKMSDescribeCustomKeyStoresResponse class]];
}

- (void) test_AWSKMSDescribeKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSDescribeKeyRequest class]];
}

- (void) test_AWSKMSDescribeKeyResponse {
    [self validateSecureCodingForClass:[AWSKMSDescribeKeyResponse class]];
}

- (void) test_AWSKMSDisableKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSDisableKeyRequest class]];
}

- (void) test_AWSKMSDisableKeyRotationRequest {
    [self validateSecureCodingForClass:[AWSKMSDisableKeyRotationRequest class]];
}

- (void) test_AWSKMSDisconnectCustomKeyStoreRequest {
    [self validateSecureCodingForClass:[AWSKMSDisconnectCustomKeyStoreRequest class]];
}

- (void) test_AWSKMSDisconnectCustomKeyStoreResponse {
    [self validateSecureCodingForClass:[AWSKMSDisconnectCustomKeyStoreResponse class]];
}

- (void) test_AWSKMSEnableKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSEnableKeyRequest class]];
}

- (void) test_AWSKMSEnableKeyRotationRequest {
    [self validateSecureCodingForClass:[AWSKMSEnableKeyRotationRequest class]];
}

- (void) test_AWSKMSEncryptRequest {
    [self validateSecureCodingForClass:[AWSKMSEncryptRequest class]];
}

- (void) test_AWSKMSEncryptResponse {
    [self validateSecureCodingForClass:[AWSKMSEncryptResponse class]];
}

- (void) test_AWSKMSGenerateDataKeyPairRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyPairRequest class]];
}

- (void) test_AWSKMSGenerateDataKeyPairResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyPairResponse class]];
}

- (void) test_AWSKMSGenerateDataKeyPairWithoutPlaintextRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyPairWithoutPlaintextRequest class]];
}

- (void) test_AWSKMSGenerateDataKeyPairWithoutPlaintextResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyPairWithoutPlaintextResponse class]];
}

- (void) test_AWSKMSGenerateDataKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyRequest class]];
}

- (void) test_AWSKMSGenerateDataKeyResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyResponse class]];
}

- (void) test_AWSKMSGenerateDataKeyWithoutPlaintextRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyWithoutPlaintextRequest class]];
}

- (void) test_AWSKMSGenerateDataKeyWithoutPlaintextResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateDataKeyWithoutPlaintextResponse class]];
}

- (void) test_AWSKMSGenerateMacRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateMacRequest class]];
}

- (void) test_AWSKMSGenerateMacResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateMacResponse class]];
}

- (void) test_AWSKMSGenerateRandomRequest {
    [self validateSecureCodingForClass:[AWSKMSGenerateRandomRequest class]];
}

- (void) test_AWSKMSGenerateRandomResponse {
    [self validateSecureCodingForClass:[AWSKMSGenerateRandomResponse class]];
}

- (void) test_AWSKMSGetKeyPolicyRequest {
    [self validateSecureCodingForClass:[AWSKMSGetKeyPolicyRequest class]];
}

- (void) test_AWSKMSGetKeyPolicyResponse {
    [self validateSecureCodingForClass:[AWSKMSGetKeyPolicyResponse class]];
}

- (void) test_AWSKMSGetKeyRotationStatusRequest {
    [self validateSecureCodingForClass:[AWSKMSGetKeyRotationStatusRequest class]];
}

- (void) test_AWSKMSGetKeyRotationStatusResponse {
    [self validateSecureCodingForClass:[AWSKMSGetKeyRotationStatusResponse class]];
}

- (void) test_AWSKMSGetParametersForImportRequest {
    [self validateSecureCodingForClass:[AWSKMSGetParametersForImportRequest class]];
}

- (void) test_AWSKMSGetParametersForImportResponse {
    [self validateSecureCodingForClass:[AWSKMSGetParametersForImportResponse class]];
}

- (void) test_AWSKMSGetPublicKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSGetPublicKeyRequest class]];
}

- (void) test_AWSKMSGetPublicKeyResponse {
    [self validateSecureCodingForClass:[AWSKMSGetPublicKeyResponse class]];
}

- (void) test_AWSKMSGrantConstraints {
    [self validateSecureCodingForClass:[AWSKMSGrantConstraints class]];
}

- (void) test_AWSKMSGrantListEntry {
    [self validateSecureCodingForClass:[AWSKMSGrantListEntry class]];
}

- (void) test_AWSKMSImportKeyMaterialRequest {
    [self validateSecureCodingForClass:[AWSKMSImportKeyMaterialRequest class]];
}

- (void) test_AWSKMSImportKeyMaterialResponse {
    [self validateSecureCodingForClass:[AWSKMSImportKeyMaterialResponse class]];
}

- (void) test_AWSKMSKeyListEntry {
    [self validateSecureCodingForClass:[AWSKMSKeyListEntry class]];
}

- (void) test_AWSKMSKeyMetadata {
    [self validateSecureCodingForClass:[AWSKMSKeyMetadata class]];
}

- (void) test_AWSKMSListAliasesRequest {
    [self validateSecureCodingForClass:[AWSKMSListAliasesRequest class]];
}

- (void) test_AWSKMSListAliasesResponse {
    [self validateSecureCodingForClass:[AWSKMSListAliasesResponse class]];
}

- (void) test_AWSKMSListGrantsRequest {
    [self validateSecureCodingForClass:[AWSKMSListGrantsRequest class]];
}

- (void) test_AWSKMSListGrantsResponse {
    [self validateSecureCodingForClass:[AWSKMSListGrantsResponse class]];
}

- (void) test_AWSKMSListKeyPoliciesRequest {
    [self validateSecureCodingForClass:[AWSKMSListKeyPoliciesRequest class]];
}

- (void) test_AWSKMSListKeyPoliciesResponse {
    [self validateSecureCodingForClass:[AWSKMSListKeyPoliciesResponse class]];
}

- (void) test_AWSKMSListKeysRequest {
    [self validateSecureCodingForClass:[AWSKMSListKeysRequest class]];
}

- (void) test_AWSKMSListKeysResponse {
    [self validateSecureCodingForClass:[AWSKMSListKeysResponse class]];
}

- (void) test_AWSKMSListResourceTagsRequest {
    [self validateSecureCodingForClass:[AWSKMSListResourceTagsRequest class]];
}

- (void) test_AWSKMSListResourceTagsResponse {
    [self validateSecureCodingForClass:[AWSKMSListResourceTagsResponse class]];
}

- (void) test_AWSKMSListRetirableGrantsRequest {
    [self validateSecureCodingForClass:[AWSKMSListRetirableGrantsRequest class]];
}

- (void) test_AWSKMSMultiRegionConfiguration {
    [self validateSecureCodingForClass:[AWSKMSMultiRegionConfiguration class]];
}

- (void) test_AWSKMSMultiRegionKey {
    [self validateSecureCodingForClass:[AWSKMSMultiRegionKey class]];
}

- (void) test_AWSKMSPutKeyPolicyRequest {
    [self validateSecureCodingForClass:[AWSKMSPutKeyPolicyRequest class]];
}

- (void) test_AWSKMSReEncryptRequest {
    [self validateSecureCodingForClass:[AWSKMSReEncryptRequest class]];
}

- (void) test_AWSKMSReEncryptResponse {
    [self validateSecureCodingForClass:[AWSKMSReEncryptResponse class]];
}

- (void) test_AWSKMSRecipientInfo {
    [self validateSecureCodingForClass:[AWSKMSRecipientInfo class]];
}

- (void) test_AWSKMSReplicateKeyRequest {
    [self validateSecureCodingForClass:[AWSKMSReplicateKeyRequest class]];
}

- (void) test_AWSKMSReplicateKeyResponse {
    [self validateSecureCodingForClass:[AWSKMSReplicateKeyResponse class]];
}

- (void) test_AWSKMSRetireGrantRequest {
    [self validateSecureCodingForClass:[AWSKMSRetireGrantRequest class]];
}

- (void) test_AWSKMSRevokeGrantRequest {
    [self validateSecureCodingForClass:[AWSKMSRevokeGrantRequest class]];
}

- (void) test_AWSKMSScheduleKeyDeletionRequest {
    [self validateSecureCodingForClass:[AWSKMSScheduleKeyDeletionRequest class]];
}

- (void) test_AWSKMSScheduleKeyDeletionResponse {
    [self validateSecureCodingForClass:[AWSKMSScheduleKeyDeletionResponse class]];
}

- (void) test_AWSKMSSignRequest {
    [self validateSecureCodingForClass:[AWSKMSSignRequest class]];
}

- (void) test_AWSKMSSignResponse {
    [self validateSecureCodingForClass:[AWSKMSSignResponse class]];
}

- (void) test_AWSKMSTag {
    [self validateSecureCodingForClass:[AWSKMSTag class]];
}

- (void) test_AWSKMSTagResourceRequest {
    [self validateSecureCodingForClass:[AWSKMSTagResourceRequest class]];
}

- (void) test_AWSKMSUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSKMSUntagResourceRequest class]];
}

- (void) test_AWSKMSUpdateAliasRequest {
    [self validateSecureCodingForClass:[AWSKMSUpdateAliasRequest class]];
}

- (void) test_AWSKMSUpdateCustomKeyStoreRequest {
    [self validateSecureCodingForClass:[AWSKMSUpdateCustomKeyStoreRequest class]];
}

- (void) test_AWSKMSUpdateCustomKeyStoreResponse {
    [self validateSecureCodingForClass:[AWSKMSUpdateCustomKeyStoreResponse class]];
}

- (void) test_AWSKMSUpdateKeyDescriptionRequest {
    [self validateSecureCodingForClass:[AWSKMSUpdateKeyDescriptionRequest class]];
}

- (void) test_AWSKMSUpdatePrimaryRegionRequest {
    [self validateSecureCodingForClass:[AWSKMSUpdatePrimaryRegionRequest class]];
}

- (void) test_AWSKMSVerifyMacRequest {
    [self validateSecureCodingForClass:[AWSKMSVerifyMacRequest class]];
}

- (void) test_AWSKMSVerifyMacResponse {
    [self validateSecureCodingForClass:[AWSKMSVerifyMacResponse class]];
}

- (void) test_AWSKMSVerifyRequest {
    [self validateSecureCodingForClass:[AWSKMSVerifyRequest class]];
}

- (void) test_AWSKMSVerifyResponse {
    [self validateSecureCodingForClass:[AWSKMSVerifyResponse class]];
}

- (void) test_AWSKMSXksKeyConfigurationType {
    [self validateSecureCodingForClass:[AWSKMSXksKeyConfigurationType class]];
}

- (void) test_AWSKMSXksProxyAuthenticationCredentialType {
    [self validateSecureCodingForClass:[AWSKMSXksProxyAuthenticationCredentialType class]];
}

- (void) test_AWSKMSXksProxyConfigurationType {
    [self validateSecureCodingForClass:[AWSKMSXksProxyConfigurationType class]];
}

@end

