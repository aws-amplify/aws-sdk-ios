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

#if !AWS_TEST_BJS_INSTEAD

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

+ (BFTask *)createTestStream {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisCreateStreamInput *createStreamInput = [AWSKinesisCreateStreamInput new];
    createStreamInput.streamName = testStreamName;
    createStreamInput.shardCount = @1;

    return [[kinesis createStream:createStreamInput] continueWithSuccessBlock:^id(BFTask *task) {
        return [self waitForStreamToBeReady];
    }];
}

+ (BFTask *)waitForStreamToBeReady {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisDescribeStreamInput *describeStreamInput = [AWSKinesisDescribeStreamInput new];
    describeStreamInput.streamName = testStreamName;

    return [[kinesis describeStream:describeStreamInput] continueWithSuccessBlock:^id(BFTask *task) {
        AWSKinesisDescribeStreamOutput *describeStreamOutput = task.result;
        if (describeStreamOutput.streamDescription.streamStatus != AWSKinesisStreamStatusActive) {
            sleep(10);
            return [self waitForStreamToBeReady];
        }

        return nil;
    }];
}

+ (BFTask *)deleteTestStream {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];

    AWSKinesisDeleteStreamInput *deleteStreamInput = [AWSKinesisDeleteStreamInput new];
    deleteStreamInput.streamName = testStreamName;

    return [kinesis deleteStream:deleteStreamInput];
}

- (void)testAll {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    AWSKinesisRecorder *kinesisRecorder = [AWSKinesisRecorder defaultKinesisRecorder];

    NSMutableArray *tasks = [NSMutableArray new];
    for (int32_t i = 0; i < 1234; i++) {
        [tasks addObject:[kinesisRecorder saveRecord:[[NSString stringWithFormat:@"TestString-%02d", i] dataUsingEncoding:NSUTF8StringEncoding]
                                          streamName:testStreamName]];
    }

    NSMutableArray *returnedRecords = [NSMutableArray new];

    [[[[[[[BFTask taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(BFTask *task) {
        sleep(10);
        return [kinesisRecorder submitAllRecords];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        sleep(10);
        AWSKinesisDescribeStreamInput *describeStreamInput = [AWSKinesisDescribeStreamInput new];
        describeStreamInput.streamName = testStreamName;
        return [kinesis describeStream:describeStreamInput];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSKinesisDescribeStreamOutput *describeStreamOutput = task.result;
        XCTAssertTrue(1 == [describeStreamOutput.streamDescription.shards count]);
        AWSKinesisShard *shard = describeStreamOutput.streamDescription.shards[0];

        AWSKinesisGetShardIteratorInput *getShardIteratorInput = [AWSKinesisGetShardIteratorInput new];
        getShardIteratorInput.streamName = testStreamName;
        getShardIteratorInput.shardId = shard.shardId;
        getShardIteratorInput.shardIteratorType = AWSKinesisShardIteratorTypeAtSequenceNumber;
        getShardIteratorInput.startingSequenceNumber = shard.sequenceNumberRange.startingSequenceNumber;

        return [kinesis getShardIterator:getShardIteratorInput];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSKinesisGetShardIteratorOutput *getShardIteratorOutput = task.result;
        return [self getRecords:returnedRecords
                  shardIterator:getShardIteratorOutput.shardIterator
                        counter:0];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        } else {
            int32_t i = 0;
            for (AWSKinesisRecord *record in returnedRecords) {
                XCTAssertTrue([[[NSString alloc] initWithData:record.data encoding:NSUTF8StringEncoding] hasPrefix:@"TestString-"]);
                i++;
            }
            XCTAssertTrue(i == 1234, @"Record count: %d", i);
        }

        return nil;
    }] waitUntilFinished];
}

- (BFTask *)getRecords:(NSMutableArray *)returnedRecords shardIterator:(NSString *)shardIterator counter:(int32_t)counter {
    AWSKinesis *kinesis = [AWSKinesis defaultKinesis];
    AWSKinesisGetRecordsInput *getRecordsInput = [AWSKinesisGetRecordsInput new];
    getRecordsInput.shardIterator = shardIterator;
    return [[kinesis getRecords:getRecordsInput] continueWithSuccessBlock:^id(BFTask *task) {
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
