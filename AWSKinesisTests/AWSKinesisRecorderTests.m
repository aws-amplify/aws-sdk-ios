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

NSString *const AWSKinesisRecorderTestStream = @"AWSSDKForiOSv2Test";

@interface AWSKinesisRecorderTests : XCTestCase

@end

@implementation AWSKinesisRecorderTests

static NSString *testStreamName = nil;

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    testStreamName = [NSString stringWithFormat:@"%@-%f", AWSKinesisRecorderTestStream, timeIntervalSinceReferenceDate];

    [[self createTestStream] waitUntilFinished];
}

+ (void)tearDown {
    [[self deleteTestStream] waitUntilFinished];
    [super tearDown];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

+ (AWSTask *)createTestStream {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisCreateStreamInput *createStreamInput = [AWSKinesisCreateStreamInput new];
    createStreamInput.streamName = testStreamName;
    createStreamInput.shardCount = @1;

    return [[kinesis createStream:createStreamInput] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self waitForStreamToBeReady];
    }];
}

+ (AWSTask *)waitForStreamToBeReady {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisDescribeStreamInput *describeStreamInput = [AWSKinesisDescribeStreamInput new];
    describeStreamInput.streamName = testStreamName;

    return [[kinesis describeStream:describeStreamInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisDescribeStreamOutput *describeStreamOutput = task.result;
        if (describeStreamOutput.streamDescription.streamStatus != AWSKinesisStreamStatusActive) {
            sleep(10);
            return [self waitForStreamToBeReady];
        }

        return nil;
    }];
}

+ (AWSTask *)deleteTestStream {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisDeleteStreamInput *deleteStreamInput = [AWSKinesisDeleteStreamInput new];
    deleteStreamInput.streamName = testStreamName;

    return [kinesis deleteStream:deleteStreamInput];
}

- (void)testConstructors {
    @try {
        AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder new];
        XCTFail(@"Expected an exception to be thrown. %@", kinesisRecorder);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }

    XCTAssertNil([AWSKinesisRecorder KinesisRecorderForKey:@"AWSKinesisRecorderTests.testConstructors"]);
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                                credentialsProvider:nil];
    [AWSKinesisRecorder registerKinesisRecorderWithConfiguration:serviceConfiguration
                                                          forKey:@"AWSKinesisRecorderTests.testConstructors"];
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder KinesisRecorderForKey:@"AWSKinesisRecorderTests.testConstructors"];
    XCTAssertNotNil(kinesisRecorder);
    XCTAssertEqual([kinesisRecorder class], [AWSKinesisRecorder class]);
    [AWSKinesisRecorder removeKinesisRecorderForKey:@"AWSKinesisRecorderTests.testConstructors"];
    XCTAssertNil([AWSKinesisRecorder KinesisRecorderForKey:@"AWSKinesisRecorderTests.testConstructors"]);
}

- (void)testSaveLargeData {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 30000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertGreaterThan([data length], 256 * 1024 - 256);
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];
    [[[kinesisRecorder saveRecord:data
                       streamName:@"testSaveLargeData"] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.result);
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(task.error.domain, AWSKinesisRecorderErrorDomain);
        XCTAssertEqual(task.error.code, AWSKinesisRecorderErrorDataTooLarge);
        return [kinesisRecorder removeAllRecords];
    }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        [expectation fulfill];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testRemoveAllRecords {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) {
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [kinesisRecorder saveRecord:data
                                    streamName:@"testRemoveAllRecords"];
        }];
    }

    [[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertGreaterThan(kinesisRecorder.diskBytesUsed, 500000);
        return [kinesisRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(kinesisRecorder.diskBytesUsed, 13000);

        [expectation fulfill];

        return nil;
    }];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testDiskByteLimit {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    __block BOOL byteThresholdReached = NO;
    [[NSNotificationCenter defaultCenter] addObserverForName:AWSKinesisRecorderByteThresholdReachedNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      byteThresholdReached = YES;
                                                      NSNumber *diskByteUsed = note.userInfo[AWSKinesisRecorderByteThresholdReachedNotificationDiskBytesUsedKey];
                                                      XCTAssertGreaterThan([diskByteUsed integerValue], 500 * 1024);
                                                      XCTAssertLessThan([diskByteUsed integerValue], 1.2 * 1024 * 1024);
                                                  }];
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);

    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];
    kinesisRecorder.diskByteLimit = 1 * 1024 * 1024; // 1MB
    kinesisRecorder.notificationByteThreshold = 500 * 1024; // 500KB

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 200; i++) { // About 10 MB data
        task = [task continueWithBlock:^id(AWSTask *task) {
            return [kinesisRecorder saveRecord:data
                                    streamName:[NSString stringWithFormat:@"%d", i]];
        }];
    }

    [[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(kinesisRecorder.diskBytesUsed, 1.2 * 1024 * 1024); // Less than 1.2MB
        return [kinesisRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(kinesisRecorder.diskBytesUsed, 13000);

        [expectation fulfill];

        return nil;
    }];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];

    XCTAssertTrue(byteThresholdReached);

    kinesisRecorder.diskByteLimit = 5 * 1024 * 1024;
    kinesisRecorder.notificationByteThreshold = 0;

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AWSKinesisRecorderByteThresholdReachedNotification
                                                  object:nil];
}

- (void)testDiskAgeLimit {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < 5000; i++) {
        [mutableString appendString:@"0123456789"];
    }
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    XCTAssertLessThan([data length], 50 * 1024 - 256);

    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];
    kinesisRecorder.diskAgeLimit = 1;

    AWSTask *task = [AWSTask taskWithResult:nil];
    for (int i = 0; i < 10; i++) { // About 500KB data
        task = [task continueWithBlock:^id(AWSTask *task) {
            if (i == 9) {
                sleep(1);
            }
            return [kinesisRecorder saveRecord:data
                                    streamName:[NSString stringWithFormat:@"%d", i]];
        }];
    }

    [[task continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(kinesisRecorder.diskBytesUsed, 62000);
        return [kinesisRecorder removeAllRecords];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertLessThan(kinesisRecorder.diskBytesUsed, 13000);

        [expectation fulfill];

        return nil;
    }];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];

    kinesisRecorder.diskAgeLimit = 0.0;
}

- (void)testAll {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (int32_t i = 0; i < 1234; i++) {
        [tasks addObject:[kinesisRecorder saveRecord:[[NSString stringWithFormat:@"TestString-%02d", i] dataUsingEncoding:NSUTF8StringEncoding]
                                          streamName:testStreamName]];
    }
    
    NSMutableArray *returnedRecords = [NSMutableArray new];
    NSMutableSet *uniqueReturnedPartitionKeys = [NSMutableSet new];
    
    [[[[[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(AWSTask *task) {
        return [kinesisRecorder submitAllRecords];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisDescribeStreamInput *describeStreamInput = [AWSKinesisDescribeStreamInput new];
        describeStreamInput.streamName = testStreamName;
        return [kinesis describeStream:describeStreamInput];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisDescribeStreamOutput *describeStreamOutput = task.result;
        XCTAssertTrue(1 == [describeStreamOutput.streamDescription.shards count]);
        AWSKinesisShard *shard = describeStreamOutput.streamDescription.shards[0];
        
        AWSKinesisGetShardIteratorInput *getShardIteratorInput = [AWSKinesisGetShardIteratorInput new];
        getShardIteratorInput.streamName = testStreamName;
        getShardIteratorInput.shardId = shard.shardId;
        getShardIteratorInput.shardIteratorType = AWSKinesisShardIteratorTypeAtSequenceNumber;
        getShardIteratorInput.startingSequenceNumber = shard.sequenceNumberRange.startingSequenceNumber;
        
        return [kinesis getShardIterator:getShardIteratorInput];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisGetShardIteratorOutput *getShardIteratorOutput = task.result;
        return [self getRecords:returnedRecords
                  shardIterator:getShardIteratorOutput.shardIterator
                        counter:0];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        } else {
            int32_t i = 0;
            for (AWSKinesisRecord *record in returnedRecords) {
                XCTAssertTrue([[[NSString alloc] initWithData:record.data encoding:NSUTF8StringEncoding] hasPrefix:@"TestString-"]);
                [uniqueReturnedPartitionKeys addObject:[record partitionKey]];
                i++;
            }
            XCTAssertTrue(i == 1234, @"Record count: %d", i);
            XCTAssertTrue([uniqueReturnedPartitionKeys count] > 1);
        }
        
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:240 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testAllWithPartitionKey {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];
    
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];
    NSString *partitionKey = [[NSUUID UUID] UUIDString];
    
    NSMutableArray *tasks = [NSMutableArray new];
    for (int32_t i = 0; i < 1000; i++) {
        [tasks addObject:[kinesisRecorder saveRecord:[[NSString stringWithFormat:@"TestString-%02d", i] dataUsingEncoding:NSUTF8StringEncoding]
                                          streamName:testStreamName
                                          partitionKey:partitionKey]];
    }
    
    NSMutableArray *returnedRecords = [NSMutableArray new];
    
    [[[[[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(AWSTask *task) {
        return [kinesisRecorder submitAllRecords];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisDescribeStreamInput *describeStreamInput = [AWSKinesisDescribeStreamInput new];
        describeStreamInput.streamName = testStreamName;
        return [kinesis describeStream:describeStreamInput];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisDescribeStreamOutput *describeStreamOutput = task.result;
        XCTAssertTrue(1 == [describeStreamOutput.streamDescription.shards count]);
        AWSKinesisShard *shard = describeStreamOutput.streamDescription.shards[0];
        
        AWSKinesisGetShardIteratorInput *getShardIteratorInput = [AWSKinesisGetShardIteratorInput new];
        getShardIteratorInput.streamName = testStreamName;
        getShardIteratorInput.shardId = shard.shardId;
        getShardIteratorInput.shardIteratorType = AWSKinesisShardIteratorTypeAtSequenceNumber;
        getShardIteratorInput.startingSequenceNumber = shard.sequenceNumberRange.startingSequenceNumber;
        
        return [kinesis getShardIterator:getShardIteratorInput];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisGetShardIteratorOutput *getShardIteratorOutput = task.result;
        return [self getRecords:returnedRecords
                  shardIterator:getShardIteratorOutput.shardIterator
                        counter:0];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        } else {
            int32_t i = 0;
            for (AWSKinesisRecord *record in returnedRecords) {
                if([partitionKey isEqualToString:[record partitionKey]]){
                    XCTAssertTrue([[[NSString alloc] initWithData:record.data encoding:NSUTF8StringEncoding] hasPrefix:@"TestString-"]);
                    i++;
                }

            }
            XCTAssertTrue(i == 1000, @"Record count: %d", i);
        }
        
        [expectation fulfill];
        
        return nil;
    }];
    
    [self waitForExpectationsWithTimeout:240 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testSubmitAllRecordsReturnsError {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test finished running."];

    NSString *poolId = @"invalidPoolId";
    AWSCognitoCredentialsProvider *invalidCreds = \
        [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                   identityPoolId:poolId];

    AWSServiceConfiguration *configuration = \
        [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                    credentialsProvider:invalidCreds];

    [AWSKinesisRecorder registerKinesisRecorderWithConfiguration:configuration
                                                          forKey:poolId];

    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder KinesisRecorderForKey:poolId];
    [kinesisRecorder saveRecord:[@"testString" dataUsingEncoding:NSUTF8StringEncoding]
                     streamName:testStreamName];

    AWSTask *submitTask = kinesisRecorder.submitAllRecords;

    [submitTask continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"Task should have an error due to invalid pool id.");
        [expectation fulfill];
        return nil;
    }];

    [self waitForExpectationsWithTimeout:5 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (AWSTask *)getRecords:(NSMutableArray *)returnedRecords shardIterator:(NSString *)shardIterator counter:(int32_t)counter {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    AWSKinesisGetRecordsInput *getRecordsInput = [AWSKinesisGetRecordsInput new];
    getRecordsInput.shardIterator = shardIterator;
    return [[kinesis getRecords:getRecordsInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSKinesisGetRecordsOutput *getRecordsOutput = task.result;
        [returnedRecords addObjectsFromArray:getRecordsOutput.records];

        if (counter < 10 || [getRecordsOutput.records count] > 0) {
            return [self getRecords:returnedRecords
                      shardIterator:getRecordsOutput.nextShardIterator
                            counter:counter + 1];
        }
        return nil;
    }];
}

@end

#endif
