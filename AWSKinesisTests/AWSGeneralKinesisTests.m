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
#import "AWSTestUtility.h"
#import "AWSKinesis.h"

@interface AWSGeneralKinesisTests : XCTestCase

@end

@implementation AWSGeneralKinesisTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testKinesisConstructors";
    XCTAssertNotNil([AWSKinesis defaultKinesis]);
    XCTAssertEqual([[AWSKinesis defaultKinesis] class], [AWSKinesis class]);
    XCTAssertNil([AWSKinesis KinesisForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKinesis KinesisForKey:key]);
    XCTAssertEqual([[AWSKinesis KinesisForKey:key] class], [AWSKinesis class]);
    XCTAssertEqual([AWSKinesis KinesisForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKinesis removeKinesisForKey:key];
    XCTAssertNil([AWSKinesis KinesisForKey:key]);

}

- (void)testAddTagsToStream {
    NSString *key = @"testAddTagsToStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] addTagsToStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testCreateStream {
    NSString *key = @"testCreateStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] createStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testDeleteStream {
    NSString *key = @"testDeleteStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] deleteStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testDescribeStream {
    NSString *key = @"testDescribeStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] describeStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testGetRecords {
    NSString *key = @"testGetRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] getRecords:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testGetShardIterator {
    NSString *key = @"testGetShardIterator";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] getShardIterator:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testListStreams {
    NSString *key = @"testListStreams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] listStreams:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testListTagsForStream {
    NSString *key = @"testListTagsForStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] listTagsForStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testMergeShards {
    NSString *key = @"testMergeShards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] mergeShards:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testPutRecord {
    NSString *key = @"testPutRecord";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] putRecord:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testPutRecords {
    NSString *key = @"testPutRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] putRecords:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testRemoveTagsFromStream {
    NSString *key = @"testRemoveTagsFromStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] removeTagsFromStream:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

- (void)testSplitShard {
    NSString *key = @"testSplitShard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];

    [[[[AWSKinesis KinesisForKey:key] splitShard:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSKinesis removeKinesisForKey:key];
}

@end
