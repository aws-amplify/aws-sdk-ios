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

#if AWS_TEST_XML_PARSER

#import <XCTest/XCTest.h>
#import "AWSSerialization.h"

@interface AWSXMLParserTests : XCTestCase

@end

@implementation AWSXMLParserTests {
    NSDictionary *rules;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"s3-2006-03-01" ofType:@"json"];
    rules = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];

}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testListObjects
{
    NSString *testAPIName = @"ListObjects";
    //read XML data from sample file
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"xmlSampleListObjects" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    //call xmlParser
    NSError *error = nil;
    NSDictionary *resultDic = [AWSXMLParser dictionaryForXMLData:xmlData actionName:testAPIName serviceDefinitionRule:rules error:&error];
    if (error) {
        XCTFail(@"Parse XML return error:%@",error);
    }

    NSDictionary *expectedDic = @{
                                  @"Contents" :         @[
                                          @{
                                              @"ETag" : @"\"828ef3fdfa96f00ad9f27c383fc9ac7f\"",
                                              @"Key" : @"Nelson",
                                              @"LastModified" : @"2006-01-01T12:00:00.000Z",
                                              @"Owner" :                 @{
                                                      @"DisplayName" : @"webfile",
                                                      @"ID" : @"bcaf161ca5fb16fd081034f"
                                                      },
                                              @"Size" : @5,
                                              @"StorageClass" : @"STANDARD",
                                              },
                                          @{
                                              @"ETag" : @"\"828ef3fdfa96f00ad9f27c383fc9ac7f\"",
                                              @"Key" : @"Neo",
                                              @"LastModified" : @"2006-01-01T12:00:00.000Z",
                                              @"Owner" :                 @{
                                                      @"DisplayName" : @"webfile",
                                                      @"ID" : @"bcaf1ffd86a5fb16fd081034f",
                                                      },
                                              @"Size" : @4,
                                              @"StorageClass" : @"STANDARD"
                                              }
                                          ],
                                  @"IsTruncated" : @false,
                                  @"Marker" : @"Ned",
                                  @"MaxKeys" : @40,
                                  @"Name" : @"quotes",
                                  @"Prefix" : @"N",
                                  
                                  };
    XCTAssertEqualObjects(resultDic, expectedDic);
}

- (void)testListParts
{
    NSString *testAPIName = @"ListParts";
    //read XML data from sample file
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"xmlSampleListParts" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    //call xmlParser
    NSError *error = nil;
    NSDictionary *resultDic = [AWSXMLParser dictionaryForXMLData:xmlData actionName:testAPIName serviceDefinitionRule:rules error:&error];
    if (error) {
        XCTFail(@"Parse XML return error:%@",error);
    }
    NSDictionary *expectedDic = @{
                                  @"Bucket" : @"example-bucket",
                                  @"Initiator" :         @{
                                          @"DisplayName" : @"umat-user-11116a31-17b5-4fb7-9df5-b288870f11xx",
                                          @"ID" : @"arn:aws:iam::111122223333:user/some-user-11116a31-17b5-4fb7-9df5-b288870f11xx",
                                          },
                                  @"IsTruncated" : @1,
                                  @"Key" : @"example-object",
                                  @"MaxParts" : @2,
                                  @"NextPartNumberMarker" : @3,
                                  @"Owner" :         @{
                                          @"DisplayName" : @"someName",
                                          @"ID" : @"75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a",
                                          },
                                  @"PartNumberMarker" : @1,
                                  @"Parts" :         @[
                                          @{
                                              @"ETag" : @"\"7778aef83f66abc1fa1e8477f296d394\"",
                                              @"LastModified" : @"2010-11-10T20:48:34.000Z",
                                              @"PartNumber" : @2,
                                              @"Size" : @10485760,
                                              },
                                          @{
                                              @"ETag" : @"\"aaaa18db4cc2f85cedef654fccc4a4x8\"",
                                              @"LastModified" : @"2010-11-10T20:48:33.000Z",
                                              @"PartNumber" : @3,
                                              @"Size" : @10485760,
                                              }
                                          ],
                                  @"StorageClass" : @"STANDARD",
                                  @"UploadId" : @"XXBsb2FkIElEIGZvciBlbHZpbmcncyVcdS1tb3ZpZS5tMnRzEEEwbG9hZA",
                                  
                                  };
    XCTAssertEqualObjects(resultDic, expectedDic);
}

- (void)testListBuckets
{
    NSString *testAPIName = @"ListBuckets";
    //read XML data from sample file
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"xmlSampleListBuckets" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    //call xmlParser
    NSError *error = nil;
    NSDictionary *resultDic = [AWSXMLParser dictionaryForXMLData:xmlData actionName:testAPIName serviceDefinitionRule:rules error:&error];
    if (error) {
        XCTFail(@"Parse XML return error:%@",error);
    }
    NSDictionary *expectedDic = @{
                                  @"Buckets" :         @[
                                          @{
                                              @"CreationDate" : @"2006-02-03T16:45:09.000Z",
                                              @"Name" : @"quotes",
                                              },
                                          @{
                                              @"CreationDate" : @"2006-02-03T16:41:58.000Z",
                                              @"Name" : @"samples",
                                              }
                                          ],
                                  @"Owner" :         @{
                                          @"DisplayName" : @"webfile",
                                          @"ID" : @"bcaf1ffd86f461ca5fb16fd081034f",
                                          },
                                  
                                  };
    
    XCTAssertEqualObjects(resultDic, expectedDic);
}

@end

#endif
