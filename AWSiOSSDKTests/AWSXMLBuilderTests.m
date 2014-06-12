/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_XML_BUILDER

#import <XCTest/XCTest.h>
#import "AWSSerialization.h"
#import "XMLDictionary.h"

@interface AWSXMLBuilderTests : XCTestCase

@end

@implementation AWSXMLBuilderTests {
    NSDictionary *rules;
}


- (void)setUp
{
    [super setUp];
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"s3-2006-03-01" ofType:@"json"];
    rules = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

//Alias: PUT Bucket acl
- (void)testPutBucketACLRequest
{
    NSString *testAPIName = @"PutBucketAcl";
    NSDictionary *acpReqDic =
    @{@"AccessControlPolicy" :@{@"Owner":@{@"ID": @"852b113e7a2f2510267",
                                           @"DisplayName": @"OwnerDisplayName"},
                                @"Grants":@[@{@"Grantee":@{@"ID":@"852b113e7a2f2510267",
                                                                      @"DisplayName":@"displayNameJohn",
                                                                      @"Type":@"CanonicalUser"
                                                                      },
                                                         @"Permission":@"FULL_CONTROL"},
                                                       @{@"Grantee":@{@"ID":@"ID2",
                                                                      @"EmailAddress":@"john@amazon.com",
                                                                      @"Type":@"AmazonCustomerByEmail"
                                                                      },
                                                         @"Permission":@"WRITE"}
                                                       ]
                                }
      };

    NSError *error = nil;
    NSString *xmlResultString = [AWSXMLBuilder xmlStringForDictionary:acpReqDic actionName:testAPIName serviceDefinitionRule:rules error:&error];
    if (error) {
        XCTFail(@"got error:%@",error);
    } else {
        //[XMLDictionaryParser sharedInstance].nodeNameMode = XMLDictionaryNodeNameModeNever;
        NSDictionary *resultDic = [NSDictionary dictionaryWithXMLString:xmlResultString];

        NSString *expectedResultPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"xmlSamplePutBucketACLReq" ofType:@"xml"];
        NSDictionary *expectedDic = [NSDictionary dictionaryWithXMLFile:expectedResultPath];
        XCTAssertEqualObjects(resultDic, expectedDic);

    }
}

@end

#endif
