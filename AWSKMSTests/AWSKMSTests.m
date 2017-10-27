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

#import <XCTest/XCTest.h>
#import "AWSKMS.h"
#import "AWSTestUtility.h"

@interface AWSKMSTests : XCTestCase

@property AWSKMS *kms;
@property AWSKMSKeyMetadata *sharedKeyMetadata;

@end

@implementation AWSKMSTests

- (void)setUp {
    [super setUp];
    
    _sharedKeyMetadata = nil;
    
    [AWSTestUtility setupCognitoCredentialsProvider];
    self.kms = [AWSKMS defaultKMS];

    _sharedKeyMetadata = [self createKey];
    
    XCTAssertNotNil(_sharedKeyMetadata);
}

- (void)tearDown {
    [self deleteKey:_sharedKeyMetadata.keyId];
    [super tearDown];
}

/**
 Creates a key used in functional tests
 */
- (AWSKMSKeyMetadata *)createKey {
    AWSKMSCreateKeyRequest *createRequest = [AWSKMSCreateKeyRequest new];
    createRequest.detail = @"Test Key";
    createRequest.keyUsage = AWSKMSKeyUsageTypeEncryptDecrypt;
    createRequest.origin = AWSKMSOriginTypeAwsKms;
    
    __block AWSKMSKeyMetadata *keyMetadata = nil;
    
    [[[self.kms createKey:createRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCreateKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        AWSKMSCreateKeyResponse *response = t.result;
        keyMetadata = response.keyMetadata;
        
        return nil;
    }] waitUntilFinished];
    
    return keyMetadata;
}

/**
 Clean up keys if needed
 */
- (void)deleteKey:(NSString *)keyId {
    AWSKMSScheduleKeyDeletionRequest *deleteRequest = [AWSKMSScheduleKeyDeletionRequest new];
    deleteRequest.keyId = keyId;
    deleteRequest.pendingWindowInDays = [NSNumber numberWithInt:7];
    
    [[self.kms scheduleKeyDeletion:deleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull t) {
        return nil;
    }];
}

- (void)testCreateAlias {
    AWSKMSCreateAliasRequest *createAliasRequest = [AWSKMSCreateAliasRequest new];
    createAliasRequest.targetKeyId = self.sharedKeyMetadata.keyId;
    createAliasRequest.aliasName = [NSString stringWithFormat:@"alias/testKey%@", self.sharedKeyMetadata.keyId];
    
    [[[self.kms createAlias:createAliasRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteKey {
    AWSKMSScheduleKeyDeletionRequest *deleteRequest = [AWSKMSScheduleKeyDeletionRequest new];
    deleteRequest.keyId = self.sharedKeyMetadata.keyId;
    deleteRequest.pendingWindowInDays = [NSNumber numberWithInt:7];
    
    [[[self.kms scheduleKeyDeletion:deleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
}


- (void)testCancelDeleteKey {
    AWSKMSScheduleKeyDeletionRequest *deleteRequest = [AWSKMSScheduleKeyDeletionRequest new];
    deleteRequest.keyId = self.sharedKeyMetadata.keyId;
    deleteRequest.pendingWindowInDays = [NSNumber numberWithInt:7];
    
    [[[self.kms scheduleKeyDeletion:deleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
    
    AWSKMSCancelKeyDeletionRequest *cancelDeleteRequest = [AWSKMSCancelKeyDeletionRequest new];
    cancelDeleteRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[[self.kms cancelKeyDeletion:cancelDeleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCancelKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
    
    AWSKMSDescribeKeyRequest *describeRequest = [AWSKMSDescribeKeyRequest new];
    describeRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[[self.kms describeKey:describeRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDescribeKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        XCTAssertTrue([[NSNumber numberWithInt:0] isEqualToNumber:t.result.keyMetadata.enabled]);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testDescribeKey {
    AWSKMSDescribeKeyRequest *describeRequest = [AWSKMSDescribeKeyRequest new];
    describeRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[[self.kms describeKey:describeRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDescribeKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
}

- (void)testDisableKeyRotation {
    AWSKMSDisableKeyRotationRequest *disableRotationRequest = [AWSKMSDisableKeyRotationRequest new];
    disableRotationRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[[self.kms disableKeyRotation:disableRotationRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        return nil;
    }] waitUntilFinished];
}

-(void)testEncryptDecrypt {
    __block NSString *text = @"abc123~!@#$%^&*()_+/\t.,<>?:'{-}";
    AWSKMSEncryptRequest *encryptRequest = [AWSKMSEncryptRequest new];
    encryptRequest.plaintext = [text dataUsingEncoding:NSUTF8StringEncoding];
    encryptRequest.keyId = self.sharedKeyMetadata.keyId;
    
    __block NSData *encryptedData = nil; // Set inside encrypt block
    
    [[[self.kms encrypt:encryptRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSEncryptResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        AWSKMSEncryptResponse *response = t.result;
        XCTAssertNotNil(response.ciphertextBlob);
        encryptedData = response.ciphertextBlob;
        
        NSString *keyIdEnding = [NSString stringWithFormat:@"/%@", self.sharedKeyMetadata.keyId];
        XCTAssertTrue([response.keyId hasSuffix:keyIdEnding]);
        return nil;
    }] waitUntilFinished];
    
    AWSKMSDecryptRequest * decryptRequest = [AWSKMSDecryptRequest new];
    decryptRequest.ciphertextBlob = encryptedData;
    
    [[[self.kms decrypt:decryptRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDecryptResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        NSString *decryptedString = [[NSString alloc] initWithData:t.result.plaintext encoding:NSUTF8StringEncoding];
        XCTAssertNotNil(decryptedString);
        XCTAssertTrue([decryptedString isEqualToString:text]);
        return nil;
    }] waitUntilFinished];
}

@end
