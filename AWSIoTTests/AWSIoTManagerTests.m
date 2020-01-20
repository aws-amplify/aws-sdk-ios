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

#import <XCTest/XCTest.h>
#import "AWSIoT.h"

@interface AWSIoTManagerTests : XCTestCase

@end

@implementation AWSIoTManagerTests

- (void)testReadIdentitySucceedsWithCorrectPassphrase {
    // Since this test mutates the shared keychain, use a random certificateId so we don't collide with future test runs
    NSString *certificateId = [[NSUUID new] UUIDString];
    NSData *p12Data = [self getP12Data];
    BOOL result = [AWSIoTManager importIdentityFromPKCS12Data:p12Data
                                                   passPhrase:@"abc123"
                                                certificateId:certificateId];
    XCTAssert(result);
}

- (void)testReadIdentityFailsWithIncorrectPassphrase {
    // Since this test mutates the shared keychain, use a random certificateId so we don't collide with future test runs
    NSString *certificateId = [[NSUUID new] UUIDString];
    NSData *p12Data = [self getP12Data];
    BOOL result = [AWSIoTManager importIdentityFromPKCS12Data:p12Data
                                                   passPhrase:@"WRONG_PASSPHRASE"
                                                certificateId:certificateId];
    XCTAssertFalse(result);
}

- (NSData *)getP12Data {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *file = [bundle pathForResource:@"test-identity-password-is-abc123" ofType:@"p12"];
    NSData *p12Data = [[NSData alloc] initWithContentsOfFile:file];
    return p12Data;
}

@end
