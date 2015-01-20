/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "SimpleDB.h"
#import "AWSTestUtility.h"

NSString *const AWSSimpleDBTestDomainNamePrefix = @"ios-v2-test-";
static NSString *_testDomainName = nil;

@interface AWSSimpleDBTests : XCTestCase

@end

@implementation AWSSimpleDBTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    //[AWSTestUtility setupCrdentialsViaFile];

    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    _testDomainName = [NSString stringWithFormat:@"%@%lld", AWSSimpleDBTestDomainNamePrefix, (int64_t)timeIntervalSinceReferenceDate];

    [[self createTestDomain] waitUntilFinished];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

+ (void)tearDown {
    [[self deleteTestDomain] waitUntilFinished];

    [super tearDown];
}

- (void)testListDomains {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBListDomainsRequest *listDomainsRequest = [AWSSimpleDBListDomainsRequest new];
    [[[sdb listDomains:listDomainsRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSimpleDBListDomainsResult *listDomainsResult = task.result;
            XCTAssertNotNil(listDomainsResult.domainNames, @" doemainNames Array should not be nil.");
            AWSLogDebug(@"[%@]", listDomainsResult);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testSelect {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBSelectRequest *selectRequest = [AWSSimpleDBSelectRequest new];
    selectRequest.selectExpression = [NSString stringWithFormat:@"select * from `%@`", _testDomainName];
    [[[sdb select:selectRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSimpleDBSelectResult *selectResult = task.result;
            XCTAssertNotNil(selectResult, @"selectResult should not be nil.");
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testSelectWithNonEnglishTableName {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBSelectRequest *selectRequest = [AWSSimpleDBSelectRequest new];
    selectRequest.selectExpression = [NSString stringWithFormat:@"select * from `%@` where fakeAttribute = 'フェイクアトリビュート'", _testDomainName];
    [[[sdb select:selectRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSimpleDBSelectResult *selectResult = task.result;
            XCTAssertNotNil(selectResult, @"selectResult should not be nil.");
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testSelectWithLike {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];
    NSString *myItemName = [NSString stringWithFormat:@"itemName%@",NSStringFromSelector(_cmd)];

    AWSSimpleDBPutAttributesRequest *putAttributesRequest = [AWSSimpleDBPutAttributesRequest new];
    putAttributesRequest.domainName = _testDomainName;
    putAttributesRequest.itemName =myItemName;

    AWSSimpleDBReplaceableAttribute *attribute1 = [AWSSimpleDBReplaceableAttribute new];
    attribute1.name = @"Color";
    attribute1.value = @"Blue";
    attribute1.replace = @YES;

    AWSSimpleDBReplaceableAttribute *attribute2 = [AWSSimpleDBReplaceableAttribute new];
    attribute2.name = @"Size";
    attribute2.value = @"20";

    putAttributesRequest.attributes = @[attribute1,attribute2];

    [[[[sdb putAttributes:putAttributesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSSimpleDBSelectRequest *selectRequest = [AWSSimpleDBSelectRequest new];
        selectRequest.selectExpression = [NSString stringWithFormat:@"select * from `%@` where Color like 'Bl%%'", _testDomainName];

        sleep(2);
        return [sdb select:selectRequest];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSSimpleDBSelectResult  *selectResult = task.result;
        XCTAssertNotNil(selectResult.items, @"selectResult should not be nil.");

        BOOL isFound = NO;
        for (AWSSimpleDBItem *anItem in selectResult.items) {
            if ([anItem.name isEqualToString:myItemName]) {
                for (AWSSimpleDBAttribute *attribute in anItem.attributes) {
                    if ([attribute.name isEqualToString:@"Color"] && [attribute.value isEqualToString:@"Blue"]) {
                        isFound = YES;
                    }
                }
            }
        }

        XCTAssertTrue(isFound, @"can not find the expected result from select response.");


        return nil;
    }] waitUntilFinished];
}

-(void)testCheckRetainTrailingSpace {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];
    NSString *myItemName = [NSString stringWithFormat:@"itemName%@",NSStringFromSelector(_cmd)];

    AWSSimpleDBPutAttributesRequest *putAttributesRequest = [AWSSimpleDBPutAttributesRequest new];
    putAttributesRequest.domainName = _testDomainName;
    putAttributesRequest.itemName = myItemName;

    AWSSimpleDBReplaceableAttribute *attribute1 = [AWSSimpleDBReplaceableAttribute new];
    attribute1.name = @"Color";
    attribute1.value = @"RedWithTrailingSpace     ";
    //attribute1.replace = @YES;

    AWSSimpleDBReplaceableAttribute *attribute2 = [AWSSimpleDBReplaceableAttribute new];
    attribute2.name = @"Size";
    attribute2.value = @"99 ";

    putAttributesRequest.attributes = @[attribute1,attribute2];

    [[[[sdb putAttributes:putAttributesRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSSimpleDBSelectRequest *selectRequest = [AWSSimpleDBSelectRequest new];
        selectRequest.selectExpression = [NSString stringWithFormat:@"select * from `%@`", _testDomainName];

        sleep(2);
        return [sdb select:selectRequest];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        AWSSimpleDBSelectResult  *selectResult = task.result;
        XCTAssertNotNil(selectResult.items, @"selectResult should not be nil.");

        BOOL isFound1 = NO;
        BOOL isFound2 = NO;
        for (AWSSimpleDBItem *anItem in selectResult.items) {
            if ([anItem.name isEqualToString:myItemName]) {
                for (AWSSimpleDBAttribute *attribute in anItem.attributes) {
                    if ([attribute.name isEqualToString:@"Color"] && [attribute.value isEqualToString:@"RedWithTrailingSpace     "]) {
                        isFound1 = YES;
                    }
                    if ([attribute.name isEqualToString:@"Size"] && [attribute.value isEqualToString:@"99 "]) {
                        isFound2 = YES;
                    }

                }
            }
        }

        XCTAssertTrue(isFound1&&isFound2, @"can not find the expected result from select response.");


        return nil;
    }] waitUntilFinished];
}

- (void)testDomainMetaDataFailed {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBDomainMetadataRequest *metaDataRequest = [AWSSimpleDBDomainMetadataRequest new];
    metaDataRequest.domainName = @""; //domainName is empty

    [[[sdb domainMetadata:metaDataRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidDomainName error but got nil");
        return nil;
    }]waitUntilFinished];
}

+ (BFTask *)createTestDomain {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBCreateDomainRequest *createDomainRequest = [AWSSimpleDBCreateDomainRequest new];
    createDomainRequest.domainName = _testDomainName;
    return [sdb createDomain:createDomainRequest];
}

+ (BFTask *)deleteTestDomain {
    AWSSimpleDB *sdb = [AWSSimpleDB defaultSimpleDB];

    AWSSimpleDBDeleteDomainRequest *deleteDomainRequest = [AWSSimpleDBDeleteDomainRequest new];
    deleteDomainRequest.domainName = _testDomainName;
    return [sdb deleteDomain:deleteDomainRequest];
}

@end

#endif
