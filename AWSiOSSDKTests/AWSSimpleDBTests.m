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

#if AWS_TEST_SIMPLEDB

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
            AZLogDebug(@"[%@]", listDomainsResult);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testSelect {
    [[AZLogger defaultLogger] setLogLevel:AZLogLevelVerbose];
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
