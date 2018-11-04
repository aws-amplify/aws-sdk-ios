//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSGZIPBaseTestCase.h"

#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSKinesisService.h"
#import "AWSGZIPTestHelper.h"
#import "AWSKinesisSerializer.h"

/*!
 Tests a selection of operations to ensure they use GZIP Content-Encoding on the
 request.
 */
@interface AWSGZIPEncodingKinesisTests : AWSGZIPBaseTestCase

@end

@implementation AWSGZIPEncodingKinesisTests

- (void)testAddTagsToStreamShouldNotBeGzipEncoded {
    NSString *operationName = @"AddTagsToStream";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingKinesisTests testHelperForOperationName:operationName];

    AWSKinesis *kinesisInstance = [AWSGZIPEncodingKinesisTests KinesisForOperationName:operationName];
    AWSKinesisAddTagsToStreamInput *request = [AWSKinesisAddTagsToStreamInput new];

    [testHelper startMockingUsingSerializerClass:[AWSKinesisRequestSerializer class]];
    [[kinesisInstance addTagsToStream:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasNotGzippedForOperationName:(NSString *)operationName
                                     usingTestHelper:testHelper];

    [AWSGZIPEncodingKinesisTests deregisterKinesisForOperationName:operationName];
}

- (void)testCreateStreamShouldNotBeGzipEncoded {
    NSString *operationName = @"CreateStream";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingKinesisTests testHelperForOperationName:operationName];

    AWSKinesis *kinesisInstance = [AWSGZIPEncodingKinesisTests KinesisForOperationName:operationName];
    AWSKinesisCreateStreamInput *request = [AWSKinesisCreateStreamInput new];

    [testHelper startMockingUsingSerializerClass:[AWSKinesisRequestSerializer class]];
    [[kinesisInstance createStream:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasNotGzippedForOperationName:(NSString *)operationName
                                     usingTestHelper:testHelper];

    [AWSGZIPEncodingKinesisTests deregisterKinesisForOperationName:operationName];
}

- (void)testPutRecordShouldBeGzipEncoded {
    NSString *operationName = @"PutRecord";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingKinesisTests testHelperForOperationName:operationName];

    AWSKinesis *kinesisInstance = [AWSGZIPEncodingKinesisTests KinesisForOperationName:operationName];
    AWSKinesisPutRecordInput *request = [AWSKinesisPutRecordInput new];

    [testHelper startMockingUsingSerializerClass:[AWSKinesisRequestSerializer class]];
    [[kinesisInstance putRecord:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasGzippedForOperationName:(NSString *)operationName
                                  usingTestHelper:testHelper];

    [AWSGZIPEncodingKinesisTests deregisterKinesisForOperationName:operationName];
}

- (void)testPutRecordsShouldBeGzipEncoded {
    NSString *operationName = @"PutRecords";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingKinesisTests testHelperForOperationName:operationName];

    AWSKinesis *kinesisInstance = [AWSGZIPEncodingKinesisTests KinesisForOperationName:operationName];
    AWSKinesisPutRecordsInput *request = [AWSKinesisPutRecordsInput new];

    [testHelper startMockingUsingSerializerClass:[AWSKinesisRequestSerializer class]];
    [[kinesisInstance putRecords:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasGzippedForOperationName:(NSString *)operationName
                                  usingTestHelper:testHelper];

    [AWSGZIPEncodingKinesisTests deregisterKinesisForOperationName:operationName];
}

+ (AWSGZIPTestHelper *)testHelperForOperationName:(NSString *)operationName {
    NSDictionary *JSONDefinition = [[AWSKinesisResources sharedInstance] JSONObject];
    AWSGZIPTestHelper *testHelper = [[AWSGZIPTestHelper alloc] initWithOperationName:operationName
                                                                      JSONDefinition:JSONDefinition];
    return testHelper;
}

+ (void)deregisterKinesisForOperationName:(NSString *)operationName {
    NSString *key = [AWSGZIPEncodingKinesisTests keyForOperationName:operationName];
    [AWSKinesis removeKinesisForKey:key];
}

+ (AWSKinesis *)KinesisForOperationName:(NSString *)operationName {
    NSString *key = [AWSGZIPEncodingKinesisTests keyForOperationName:operationName];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesis registerKinesisWithConfiguration:configuration forKey:key];
    return [AWSKinesis KinesisForKey:key];
}

@end
