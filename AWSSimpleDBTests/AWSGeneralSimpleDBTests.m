/**
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
#import "AWSTestUtility.h"
#import "AWSSimpleDB.h"

@interface AWSGeneralSimpleDBTests : XCTestCase

@end

@implementation AWSGeneralSimpleDBTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testSimpleDBConstructors";
    XCTAssertNotNil([AWSSimpleDB defaultSimpleDB]);
    XCTAssertEqual([[AWSSimpleDB defaultSimpleDB] class], [AWSSimpleDB class]);
    XCTAssertNil([AWSSimpleDB SimpleDBForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSimpleDB SimpleDBForKey:key]);
    XCTAssertEqual([[AWSSimpleDB SimpleDBForKey:key] class], [AWSSimpleDB class]);
    XCTAssertEqual([AWSSimpleDB SimpleDBForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSimpleDB removeSimpleDBForKey:key];
    XCTAssertNil([AWSSimpleDB SimpleDBForKey:key]);

}

- (void)testBatchDeleteAttributes {
    NSString *key = @"testBatchDeleteAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] batchDeleteAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testBatchPutAttributes {
    NSString *key = @"testBatchPutAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] batchPutAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testCreateDomain {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] createDomain:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testDeleteAttributes {
    NSString *key = @"testDeleteAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] deleteAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testDeleteDomain {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] deleteDomain:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testDomainMetadata {
    NSString *key = @"testDomainMetadata";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] domainMetadata:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testGetAttributes {
    NSString *key = @"testGetAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] getAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] listDomains:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testPutAttributes {
    NSString *key = @"testPutAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] putAttributes:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

- (void)testSelect {
    NSString *key = @"testSelect";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSimpleDB registerSimpleDBWithConfiguration:configuration forKey:key];

    [[[[AWSSimpleDB SimpleDBForKey:key] select:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSimpleDB removeSimpleDBForKey:key];
}

@end
