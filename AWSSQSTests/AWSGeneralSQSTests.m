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
#import "AWSSQS.h"

@interface AWSGeneralSQSTests : XCTestCase

@end

@implementation AWSGeneralSQSTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testSQSConstructors";
    XCTAssertNotNil([AWSSQS defaultSQS]);
    XCTAssertEqual([[AWSSQS defaultSQS] class], [AWSSQS class]);
    XCTAssertNil([AWSSQS SQSForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSQS SQSForKey:key]);
    XCTAssertEqual([[AWSSQS SQSForKey:key] class], [AWSSQS class]);
    XCTAssertEqual([AWSSQS SQSForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSQS removeSQSForKey:key];
    XCTAssertNil([AWSSQS SQSForKey:key]);

}

- (void)testAddPermission {
    NSString *key = @"testAddPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] addPermission:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testChangeMessageVisibility {
    NSString *key = @"testChangeMessageVisibility";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] changeMessageVisibility:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testChangeMessageVisibilityBatch {
    NSString *key = @"testChangeMessageVisibilityBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] changeMessageVisibilityBatch:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testCreateQueue {
    NSString *key = @"testCreateQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] createQueue:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testDeleteMessage {
    NSString *key = @"testDeleteMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] deleteMessage:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testDeleteMessageBatch {
    NSString *key = @"testDeleteMessageBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] deleteMessageBatch:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testDeleteQueue {
    NSString *key = @"testDeleteQueue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] deleteQueue:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testGetQueueAttributes {
    NSString *key = @"testGetQueueAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] getQueueAttributes:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testGetQueueUrl {
    NSString *key = @"testGetQueueUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] getQueueUrl:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testListDeadLetterSourceQueues {
    NSString *key = @"testListDeadLetterSourceQueues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] listDeadLetterSourceQueues:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testListQueues {
    NSString *key = @"testListQueues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] listQueues:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testReceiveMessage {
    NSString *key = @"testReceiveMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] receiveMessage:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testRemovePermission {
    NSString *key = @"testRemovePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] removePermission:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testSendMessage {
    NSString *key = @"testSendMessage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] sendMessage:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testSendMessageBatch {
    NSString *key = @"testSendMessageBatch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] sendMessageBatch:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

- (void)testSetQueueAttributes {
    NSString *key = @"testSetQueueAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSSQS registerSQSWithConfiguration:configuration forKey:key];

    [[[[AWSSQS SQSForKey:key] setQueueAttributes:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSSQS removeSQSForKey:key];
}

@end
