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
#import "AWSFirehoseService.h"
#import "AWSGZIPTestHelper.h"
#import "AWSFirehoseSerializer.h"

/*!
 Tests a selection of operations to ensure they use GZIP Content-Encoding on the
 request.
 */
@interface AWSGZIPEncodingFirehoseTests : AWSGZIPBaseTestCase

@end

@implementation AWSGZIPEncodingFirehoseTests
- (void)testCreateDeliveryStreamShouldNotBeGZIPEncoded {
    NSString *operationName = @"CreateDeliveryStream";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingFirehoseTests testHelperForOperationName:operationName];

    AWSFirehose *FirehoseInstance = [AWSGZIPEncodingFirehoseTests FirehoseForOperationName:operationName];
    AWSFirehoseCreateDeliveryStreamInput *request = [AWSFirehoseCreateDeliveryStreamInput new];

    [testHelper startMockingUsingSerializerClass:[AWSFirehoseRequestSerializer class]];
    [[FirehoseInstance createDeliveryStream:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasNotGzippedForOperationName:(NSString *)operationName
                                     usingTestHelper:testHelper];

    [AWSGZIPEncodingFirehoseTests deregisterFirehoseForOperationName:operationName];
}

- (void)testPutRecordShouldBeGZIPEncoded {
    NSString *operationName = @"PutRecord";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingFirehoseTests testHelperForOperationName:operationName];

    AWSFirehose *FirehoseInstance = [AWSGZIPEncodingFirehoseTests FirehoseForOperationName:operationName];
    AWSFirehosePutRecordInput *request = [AWSFirehosePutRecordInput new];

    [testHelper startMockingUsingSerializerClass:[AWSFirehoseRequestSerializer class]];
    [[FirehoseInstance putRecord:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasGzippedForOperationName:(NSString *)operationName
                                  usingTestHelper:testHelper];

    [AWSGZIPEncodingFirehoseTests deregisterFirehoseForOperationName:operationName];
}

- (void)testPutRecordBatchShouldBeGZIPEncoded {
    NSString *operationName = @"PutRecordBatch";

    AWSGZIPTestHelper *testHelper = [AWSGZIPEncodingFirehoseTests testHelperForOperationName:operationName];

    AWSFirehose *FirehoseInstance = [AWSGZIPEncodingFirehoseTests FirehoseForOperationName:operationName];
    AWSFirehosePutRecordBatchInput *request = [AWSFirehosePutRecordBatchInput new];

    [testHelper startMockingUsingSerializerClass:[AWSFirehoseRequestSerializer class]];
    [[FirehoseInstance putRecordBatch:request] waitUntilFinished];
    [testHelper stopMocking];

    [self assertRequestWasGzippedForOperationName:(NSString *)operationName
                                  usingTestHelper:testHelper];

    [AWSGZIPEncodingFirehoseTests deregisterFirehoseForOperationName:operationName];
}

+ (AWSGZIPTestHelper *)testHelperForOperationName:(NSString *)operationName {
    NSDictionary *JSONDefinition = [[AWSFirehoseResources sharedInstance] JSONObject];
    AWSGZIPTestHelper *testHelper = [[AWSGZIPTestHelper alloc] initWithOperationName:operationName
                                                                      JSONDefinition:JSONDefinition];
    return testHelper;
}

+ (void)deregisterFirehoseForOperationName:(NSString *)operationName {
    NSString *key = [AWSGZIPEncodingFirehoseTests keyForOperationName:operationName];
    [AWSFirehose removeFirehoseForKey:key];
}

+ (AWSFirehose *)FirehoseForOperationName:(NSString *)operationName {
    NSString *key = [AWSGZIPEncodingFirehoseTests keyForOperationName:operationName];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSFirehose registerFirehoseWithConfiguration:configuration forKey:key];
    return [AWSFirehose FirehoseForKey:key];
}

@end
