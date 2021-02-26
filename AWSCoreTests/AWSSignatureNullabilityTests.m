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
#import "AWSSignature.h"

@interface AWSSignatureNullabilityTests : XCTestCase

@end

@implementation AWSSignatureNullabilityTests


- (void)testsha256HMACWithNilData {
    NSData *secretKey = [@"aKey" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:nil
                                                              withKey:secretKey];
    XCTAssertNotNil(signature);
}

- (void)testhashWithNilData {
    NSData *hash = [AWSSignatureSignerUtility hash:nil];
    XCTAssertNotNil(hash);
}

- (void)testhashStringWithNilData {
    NSString *hash = [AWSSignatureSignerUtility hashString:nil];
    XCTAssertNotNil(hash);
}

- (void)testhexEncodeWithNilData {
    NSString *hex = [AWSSignatureSignerUtility hexEncode:nil];
    XCTAssertNotNil(hex);
}

- (void)testHMACSignWithNilData {
    NSString *secretKey = @"aKey";
    NSString *signature = [AWSSignatureSignerUtility HMACSign:nil
                                                      withKey:secretKey
                                               usingAlgorithm:0];
    XCTAssertNotNil(signature);
}

- (void)testHMACSignWithInvalidAlgorithm {
    NSString *secretKey = @"aKey";
    NSString *signature = [AWSSignatureSignerUtility HMACSign:nil
                                                      withKey:secretKey
                                               usingAlgorithm:1];
    XCTAssertNil(signature);
}


@end
