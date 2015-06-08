/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "AWSSignature.h"
#import "AWSCategory.h"
#import <CommonCrypto/CommonCrypto.h>

@interface AWSSignatureTests : XCTestCase

@end

@implementation AWSSignatureTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSignerUtility {
    
    NSString *aString = @"a random string";
    NSString *secretKey = @"aKey";
    
    //unsupport algorithm, should return nil
    NSString *signature = [[AWSSignatureSignerUtility HMACSign:[aString dataUsingEncoding:NSUTF8StringEncoding]
                                                       withKey:secretKey
                                                usingAlgorithm:kCCHmacAlgMD5] aws_stringWithURLEncoding];
    
    XCTAssertNil(signature);
    
}

@end
