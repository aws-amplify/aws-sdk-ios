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

#if !AWS_TEST_BJS_INSTEAD

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSKinesis.h"
#import "AWSTestUtility.h"

NSString *const AWSFirehoseRecorderTestStream = @"test-permanent-firehose";

@interface AWSFirehoseRecorderTests : XCTestCase

@end

@implementation AWSFirehoseRecorderTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

+ (void)tearDown {
    [super tearDown];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    @try {
        AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder new];
        XCTFail(@"Expected an exception to be thrown. %@", firehoseRecorder);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }

    XCTAssertNil([AWSFirehoseRecorder FirehoseRecorderForKey:@"AWSFirehoseRecorderTests.testConstructors"]);
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                                credentialsProvider:nil];
    [AWSFirehoseRecorder registerFirehoseRecorderWithConfiguration:serviceConfiguration
                                                            forKey:@"AWSFirehoseRecorderTests.testConstructors"];
    AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder FirehoseRecorderForKey:@"AWSFirehoseRecorderTests.testConstructors"];
    XCTAssertNotNil(firehoseRecorder);
    XCTAssertEqual([firehoseRecorder class], [AWSFirehoseRecorder class]);
    [AWSFirehoseRecorder removeFirehoseRecorderForKey:@"AWSFirehoseRecorderTests.testConstructors"];
    XCTAssertNil([AWSFirehoseRecorder FirehoseRecorderForKey:@"AWSFirehoseRecorderTests.testConstructors"]);
}

- (void)testSaveLargeData {
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 30000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertGreaterThan([data length], 256 * 1024 - 256);
    AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];
    [[[firehoseRecorder saveRecord:data
                        streamName:@"testSaveLargeData"] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(task.error.domain, AWSFirehoseRecorderErrorDomain);
        XCTAssertEqual(task.error.code, AWSFirehoseRecorderErrorDataTooLarge);
        return [firehoseRecorder removeAllRecords];
    }] waitUntilFinished];
}

- (void)testRemoveAllRecords {
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);
    AWSFirehoseRecorder *FirehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [FirehoseRecorder saveRecord:data
                                     streamName:@"testRemoveAllRecords"];
        }];
    }

    [[[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertGreaterThan(FirehoseRecorder.diskBytesUsed, 500000);
        return [FirehoseRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(FirehoseRecorder.diskBytesUsed, 13000);
        return nil;
    }] waitUntilFinished];
}

- (void)testDiskByteLimit {
    __block BOOL byteThresholdReached = NO;
    [[NSNotificationCenter defaultCenter] addObserverForName:AWSFirehoseRecorderByteThresholdReachedNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      byteThresholdReached = YES;
                                                      NSNumber *diskByteUsed = note.userInfo[AWSFirehoseRecorderByteThresholdReachedNotificationDiskBytesUsedKey];
                                                      XCTAssertGreaterThan([diskByteUsed integerValue], 500 * 1024);
                                                      XCTAssertLessThan([diskByteUsed integerValue], 1.2 * 1024 * 1024);
                                                  }];
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);

    AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];
    firehoseRecorder.diskByteLimit = 1 * 1024 * 1024; // 1MB
    firehoseRecorder.notificationByteThreshold = 500 * 1024; // 500KB

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 200; i++) { // About 10 MB data
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [firehoseRecorder saveRecord:data
                                     streamName:[NSString stringWithFormat:@"%d", i]];
        }];
    }

    [[[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(firehoseRecorder.diskBytesUsed, 1.2 * 1024 * 1024); // Less than 1.2MB
        return [firehoseRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(firehoseRecorder.diskBytesUsed, 13000);
        return nil;
    }] waitUntilFinished];

    XCTAssertTrue(byteThresholdReached);

    firehoseRecorder.diskByteLimit = 5 * 1024 * 1024;
    firehoseRecorder.notificationByteThreshold = 0;

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AWSFirehoseRecorderByteThresholdReachedNotification
                                                  object:nil];
}

- (void)testDiskAgeLimit {
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);

    AWSFirehoseRecorder *FirehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];
    FirehoseRecorder.diskAgeLimit = 1;

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) { // About 500KB data
        task = [task continueWithBlock:^id(AWSTask *task) {
            if (i == 9) {
                sleep(1);
            }
            return [FirehoseRecorder saveRecord:data
                                     streamName:[NSString stringWithFormat:@"%d", i]];
        }];
    }

    [[[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(FirehoseRecorder.diskBytesUsed, 62000);
        return [FirehoseRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(FirehoseRecorder.diskBytesUsed, 13000);
        return nil;
    }] waitUntilFinished];

    FirehoseRecorder.diskAgeLimit = 0.0;
}

- (void)testSubmitAllRecordsReturnsErrorOnInvalidPoolId {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    NSString *poolId = @"invalidPoolId";
    AWSCognitoCredentialsProvider *invalidCreds = \
        [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                   identityPoolId:poolId];

    AWSServiceConfiguration *configuration = \
        [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                    credentialsProvider:invalidCreds];

    [AWSFirehoseRecorder registerFirehoseRecorderWithConfiguration:configuration
                                                            forKey:poolId];
    AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder FirehoseRecorderForKey:poolId];
    [firehoseRecorder saveRecord:[@"testString" dataUsingEncoding:NSUTF8StringEncoding]
                      streamName:@"streamName"];

    AWSTask *submitTask = firehoseRecorder.submitAllRecords;

    [submitTask continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Task should have an error due to invalid pool id.");
        [expectation fulfill];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testAll {
    AWSFirehoseRecorder *firehoseRecorder = [AWSFirehoseRecorder defaultFirehoseRecorder];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (int32_t i = 0; i < 1234; i++) {
        [tasks addObject:[firehoseRecorder saveRecord:[[NSString stringWithFormat:@"TestString-%02d\n", i] dataUsingEncoding:NSUTF8StringEncoding]
                                           streamName:AWSFirehoseRecorderTestStream]];
    }
    
    [[[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(AWSTask *task) {
        sleep(10);
        return [firehoseRecorder submitAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        
        return nil;
    }] waitUntilFinished];
}

@end

#endif
