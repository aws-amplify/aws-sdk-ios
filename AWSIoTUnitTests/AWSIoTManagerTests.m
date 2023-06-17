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
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSIoT.h"

static id mockNetworking = nil;

@interface AWSIoTManager (UnitTest)

+ (BOOL)readPk12:(NSData *)pk12Data passPhrase:(NSString *)passPhrase certRef:(SecCertificateRef *)certRef privateKeyRef:(SecKeyRef *)privateKeyRef publicKeyRef:(SecKeyRef *)publicKeyRef;

@end

@interface AWSIoTManagerTests : XCTestCase

@end

@implementation AWSIoTManagerTests

- (void)testReadPk12
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];

    NSString *passPhrase = @"abc123";
    NSURL *p12URL = [bundle URLForResource:@"test-identity-password-is-abc123"
                             withExtension:@"p12"];
    XCTAssertNotNil(p12URL);

    NSData *p12Data = [NSData dataWithContentsOfURL:p12URL];
    XCTAssertNotNil(p12Data);

    SecCertificateRef cert;
    SecKeyRef privateKey;
    SecKeyRef publicKeyRef;
    BOOL result = [AWSIoTManager readPk12:p12Data
                               passPhrase:passPhrase
                                  certRef:&cert
                            privateKeyRef:&privateKey
                             publicKeyRef:&publicKeyRef];

    XCTAssertTrue(result);
    XCTAssertNotNil((__bridge id)cert);
    XCTAssertNotNil((__bridge id)privateKey);
    XCTAssertNotNil((__bridge id)publicKeyRef);
}

@end
