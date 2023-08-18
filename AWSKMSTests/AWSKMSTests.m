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
    
    [AWSTestUtility setupSessionCredentialsProvider];
    self.kms = [AWSKMS defaultKMS];

    _sharedKeyMetadata = [self createKey];
    
    XCTAssertNotNil(_sharedKeyMetadata);

    // wait for KMS to propagate changes. KMS APIs are eventually consistent.
    // ref: https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html
    XCTestExpectation *delay = [self expectationWithDescription:@"delay"];
    [delay setInverted:YES];
    [self waitForExpectations:@[delay] timeout:5];
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
    XCTestExpectation *expectation = [self expectationWithDescription:@"key is created"];
    [[self.kms createKey:createRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCreateKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        AWSKMSCreateKeyResponse *response = t.result;
        keyMetadata = response.keyMetadata;
        [expectation fulfill];
        return nil;
    }];

    [self waitForExpectations:@[expectation] timeout:10];
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

    XCTestExpectation *operationFinished = [self expectationWithDescription:@"createAlias operation finished"];
    [[self.kms createAlias:createAliasRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [operationFinished fulfill];
        return nil;
    }];

    [self waitForExpectations:@[operationFinished] timeout:10];
}

- (void)testDeleteKey {
    AWSKMSScheduleKeyDeletionRequest *deleteRequest = [AWSKMSScheduleKeyDeletionRequest new];
    deleteRequest.keyId = self.sharedKeyMetadata.keyId;
    deleteRequest.pendingWindowInDays = [NSNumber numberWithInt:7];

    XCTestExpectation *operationFinished = [self expectationWithDescription:@"scheduleKeyDeletion operation finished"];
    [[self.kms scheduleKeyDeletion:deleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [operationFinished fulfill];
        return nil;
    }];
    [self waitForExpectations:@[operationFinished] timeout:10];
}


- (void)testCancelDeleteKey {
    AWSKMSScheduleKeyDeletionRequest *deleteRequest = [AWSKMSScheduleKeyDeletionRequest new];
    deleteRequest.keyId = self.sharedKeyMetadata.keyId;
    deleteRequest.pendingWindowInDays = [NSNumber numberWithInt:7];

    XCTestExpectation *scheduleKeyDeletion = [self expectationWithDescription:@"scheduleKeyDeletion operation finished"];
    [[self.kms scheduleKeyDeletion:deleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [scheduleKeyDeletion fulfill];
        return nil;
    }];
    [self waitForExpectations:@[scheduleKeyDeletion] timeout:10];


    XCTestExpectation *cancelKeyDeletion = [self expectationWithDescription:@"cancelKeyDeletion operation finished"];
    AWSKMSCancelKeyDeletionRequest *cancelDeleteRequest = [AWSKMSCancelKeyDeletionRequest new];
    cancelDeleteRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[self.kms cancelKeyDeletion:cancelDeleteRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCancelKeyDeletionResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [cancelKeyDeletion fulfill];
        return nil;
    }];
    [self waitForExpectations:@[cancelKeyDeletion] timeout:10];

    XCTestExpectation *describeKey = [self expectationWithDescription:@"describeKey operation finished"];
    AWSKMSDescribeKeyRequest *describeRequest = [AWSKMSDescribeKeyRequest new];
    describeRequest.keyId = self.sharedKeyMetadata.keyId;
    
    [[self.kms describeKey:describeRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDescribeKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        XCTAssertTrue([[NSNumber numberWithInt:0] isEqualToNumber:t.result.keyMetadata.enabled]);
        [describeKey fulfill];
        return nil;
    }];
    [self waitForExpectations:@[describeKey] timeout:10];
}

- (void)testDescribeKey {
    AWSKMSDescribeKeyRequest *describeRequest = [AWSKMSDescribeKeyRequest new];
    describeRequest.keyId = self.sharedKeyMetadata.keyId;

    XCTestExpectation *describeKey = [self expectationWithDescription:@"describeKey operation finished"];
    [[self.kms describeKey:describeRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDescribeKeyResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [describeKey fulfill];
        return nil;
    }];
    [self waitForExpectations:@[describeKey] timeout:10];
}

- (void)testDisableKeyRotation {
    AWSKMSDisableKeyRotationRequest *disableRotationRequest = [AWSKMSDisableKeyRotationRequest new];
    disableRotationRequest.keyId = self.sharedKeyMetadata.keyId;

    XCTestExpectation *operationFinished = [self expectationWithDescription:@"disableKeyRotation operation finished"];
    [[self.kms disableKeyRotation:disableRotationRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        [operationFinished fulfill];
        return nil;
    }];
    [self waitForExpectations:@[operationFinished] timeout:10];
}

-(void)testEncryptDecrypt {
    __block NSString *text = @"abc123~!@#$%^&*()_+/\t.,<>?:'{-}";
    AWSKMSEncryptRequest *encryptRequest = [AWSKMSEncryptRequest new];
    encryptRequest.plaintext = [text dataUsingEncoding:NSUTF8StringEncoding];
    encryptRequest.keyId = self.sharedKeyMetadata.keyId;
    
    __block NSData *encryptedData = nil; // Set inside encrypt block
    XCTestExpectation *encrypt = [self expectationWithDescription:@"encrypt operation finished"];
    [[self.kms encrypt:encryptRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSEncryptResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        AWSKMSEncryptResponse *response = t.result;
        XCTAssertNotNil(response.ciphertextBlob);
        encryptedData = response.ciphertextBlob;
        
        NSString *keyIdEnding = [NSString stringWithFormat:@"/%@", self.sharedKeyMetadata.keyId];
        XCTAssertTrue([response.keyId hasSuffix:keyIdEnding]);
        [encrypt fulfill];
        return nil;
    }];
    [self waitForExpectations:@[encrypt] timeout:10];
    
    AWSKMSDecryptRequest * decryptRequest = [AWSKMSDecryptRequest new];
    decryptRequest.ciphertextBlob = encryptedData;
    XCTestExpectation *decrypt = [self expectationWithDescription:@"decrypt operation finished"];
    [[self.kms decrypt:decryptRequest] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDecryptResponse *> * _Nonnull t) {
        XCTAssertNil(t.error);
        XCTAssertNotNil(t.result);
        
        NSString *decryptedString = [[NSString alloc] initWithData:t.result.plaintext encoding:NSUTF8StringEncoding];
        XCTAssertNotNil(decryptedString);
        XCTAssertTrue([decryptedString isEqualToString:text]);
        [decrypt fulfill];
        return nil;
    }];
    [self waitForExpectations:@[decrypt] timeout:10];
}

@end
