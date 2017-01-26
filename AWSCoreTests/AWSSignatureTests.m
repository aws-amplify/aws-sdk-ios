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

#import "AWSSignature.h"
#import "AWSCategory.h"
#import <CommonCrypto/CommonCrypto.h>

@interface AWSSignatureV4Signer ()

+ (NSString *)getCanonicalizedQueryString:(NSString *)query;
+ (NSString *)getCanonicalizedHeaderString:(NSDictionary *)headers;
+ (NSString *)getSignedHeadersString:(NSDictionary *)headers;

@end;

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

- (void)testGetCanonicalizedQueryString {
    /* Uri-Encode(<QueryParameter1>)+"="+"Uri-Encode(<value>)+"&" +        //Sorted By Uri-Encoded(<QueryParameter>)
     * Uri-Encode(<QueryParameter1>)+"="+"Uri-Encode(<value>)+"&" +
     * ...
     * Uri-Encode(<QueryParameter1>)+"="+"Uri-Encode(<value>)
     */
    
    // For Details: http://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html
    
    //GetCanonicalizedQueryString won't do the Uri-Encoding, but responsible for the sort in strict ASCII order. (i.e. case matters, 'F' should precedes 'b')
    
    //test sorting
    NSString *testQueryString = @"Z=5&z=6&a=1&A=2&b=3&B=4";
    NSString *expectedResult = @"A=2&B=4&Z=5&a=1&b=3&z=6";
    NSString *result = [AWSSignatureV4Signer getCanonicalizedQueryString:testQueryString];
    XCTAssertEqualObjects(expectedResult, result);
    
}

-(void)testGetCanonicalizedHeaderString {
    /* Lowercase(<HeaderName1>) + ":" + Trim(<value>) + "\n"            //Sorted By Lowercase(<HeaderName>)
     * Lowercase(<HeaderName2>) + ":" + Trim(<value>) + "\n"
     * ...
     * Lowercase(<HeaderNameN>) + ":" + Trim(<value>) + "\n"
     */
    
    // For Details: http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html
    // Also http://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html
    //need to sort the headers by lowercase character code (i.e. lowercase first, then sort by ascii order)
    
    //test lowercasing
    NSDictionary *testHeadersOne = @{@"KEY1":@"Value1",
                                     @"Key2":@"Value2",
                                     };
    NSString *expectedResultOne = @"key1:Value1\nkey2:Value2\n";
    NSString *resultOne = [AWSSignatureV4Signer getCanonicalizedHeaderString:testHeadersOne];
    XCTAssertEqualObjects(expectedResultOne, resultOne);
    
    //test compress
    // mulitple spaces should be compressed to only one
    NSDictionary *testHeadersTwo = @{@"my-header1":@"a   b   c",
                                     };
    NSString *expectedResultTwo = @"my-header1:a b c\n";
    NSString *resultTwo = [AWSSignatureV4Signer getCanonicalizedHeaderString:testHeadersTwo];
    XCTAssertEqualObjects(expectedResultTwo, resultTwo);
    
    
    
    //test sorting
    NSDictionary *testHeadersThree = @{@"Header-b4":@"VALUE4",
                                       @"header-B3":@"VALUE3",
                                       @"Header-a2":@"VALUE2",
                                       @"header-A1":@"VALUE1",
                                     };
    NSString *expectedResultThree = @"header-a1:VALUE1\nheader-a2:VALUE2\nheader-b3:VALUE3\nheader-b4:VALUE4\n";
    NSString *resultThree = [AWSSignatureV4Signer getCanonicalizedHeaderString:testHeadersThree];
    
    XCTAssertEqualObjects(expectedResultThree, resultThree);
}

-(void)testGetSignedHeadersString {
    // Lowercase(<HeaderName1>) + ";" + Lowervase(<HeaderName2>) + ";" + ... + Lowercase(<HeaderNameN>) //Sorted by  Lowercase(<HeaderName>)
    
    // For Details: http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html
    
    //need to sort by lowercase character code (i.e. lowercase first, then sort by ascii order)
    
    //test lowercasing
    NSDictionary *testHeadersOne = @{@"KEY1":@"doesnotmatter",
                                     @"Key2":@"doesnotmatter",
                                     };
    NSString *expectedResultOne = @"key1;key2";
    NSString *resultOne = [AWSSignatureV4Signer getSignedHeadersString:testHeadersOne];
    XCTAssertEqualObjects(expectedResultOne, resultOne);

    
    //test sorting
    NSDictionary *testHeadersThree = @{@"Header-b4":@"VALUE4",
                                       @"header-B3":@"VALUE3",
                                       @"Header-a2":@"VALUE2",
                                       @"header-A1":@"VALUE1",
                                       };
    
    NSString *expectedResultThree = @"header-a1;header-a2;header-b3;header-b4";
    NSString *resultThree = [AWSSignatureV4Signer getSignedHeadersString:testHeadersThree];
    
    XCTAssertEqualObjects(expectedResultThree, resultThree);
    
    
}

@end
