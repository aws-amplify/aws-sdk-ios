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

#import <XCTest/XCTest.h>
#import "AWSKinesis.h"
#import "AWSTestUtility.h"

@interface AWSFirehoseTests : XCTestCase

@property (nonatomic, strong) NSString *streamName;

@end

@implementation AWSFirehoseTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupSessionCredentialsProvider];
    _streamName = [AWSTestUtility getIntegrationTestConfigurationValueForPackageId:@"firehose"
                                                                         configKey:@"firehose_stream_name"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testListDeliveryStreams {
    AWSFirehose *firehose = [AWSFirehose defaultFirehose];

    AWSFirehoseListDeliveryStreamsInput *listDeliveryStreamsInput = [AWSFirehoseListDeliveryStreamsInput new];
    [[[firehose listDeliveryStreams:listDeliveryStreamsInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result class], [AWSFirehoseListDeliveryStreamsOutput class]);

        AWSFirehoseListDeliveryStreamsOutput *listDeliveryStreamsOutput = task.result;

        __block BOOL didFind = NO;
        for (NSString *streamName in listDeliveryStreamsOutput.deliveryStreamNames) {
            if ([streamName isEqualToString:self.streamName]) {
                didFind = YES;
                break;
            }
        }

        XCTAssertTrue(didFind);

        return nil;
    }] waitUntilFinished];
}

- (void)testPutRecord {
    AWSFirehose *firehose = [AWSFirehose defaultFirehose];

    NSString *const testString = @"testPutRecord\n";

    AWSFirehoseRecord *record = [AWSFirehoseRecord new];
    record.data = [testString dataUsingEncoding:NSUTF8StringEncoding];

    AWSFirehosePutRecordInput *putRecordInput = [AWSFirehosePutRecordInput new];
    putRecordInput.deliveryStreamName = self.streamName;
    putRecordInput.record = record;

    [[[firehose putRecord:putRecordInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result class], [AWSFirehosePutRecordOutput class]);

        AWSFirehosePutRecordOutput *putRecordOutput = task.result;
        XCTAssertNotNil(putRecordOutput.recordId);

        return nil;
    }] waitUntilFinished];
}

- (void)testPutRecordBatch {
    AWSFirehose *firehose = [AWSFirehose defaultFirehose];

    NSString *const testString = @"putRecordBatch\n";

    AWSFirehoseRecord *record = [AWSFirehoseRecord new];
    record.data = [testString dataUsingEncoding:NSUTF8StringEncoding];

    AWSFirehosePutRecordBatchInput *putRecordBatchInput = [AWSFirehosePutRecordBatchInput new];
    putRecordBatchInput.deliveryStreamName = self.streamName;
    putRecordBatchInput.records = @[record];

    [[[firehose putRecordBatch:putRecordBatchInput] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertEqual([task.result class], [AWSFirehosePutRecordBatchOutput class]);

        AWSFirehosePutRecordBatchOutput *putRecordBatchOutput = task.result;

        XCTAssertEqual([putRecordBatchOutput.failedPutCount intValue], 0);
        XCTAssertNotNil(putRecordBatchOutput.requestResponses);

        for (AWSFirehosePutRecordBatchResponseEntry *entry in putRecordBatchOutput.requestResponses) {
            XCTAssertNotNil(entry.recordId);
        }

        return nil;
    }] waitUntilFinished];
}

@end

#endif
