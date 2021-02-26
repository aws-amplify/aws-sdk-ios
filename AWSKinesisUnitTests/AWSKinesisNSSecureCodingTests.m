//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSKinesisModel.h"

@interface AWSKinesisNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSKinesisAddTagsToStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisCreateStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDecreaseStreamRetentionPeriodInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDeleteStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeLimitsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeLimitsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeStreamSummaryInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDescribeStreamSummaryOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisDisableEnhancedMonitoringInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisEnableEnhancedMonitoringInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisEnhancedMetrics API_AVAILABLE(ios(11));
- (void) test_AWSKinesisEnhancedMonitoringOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisGetRecordsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisGetRecordsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisGetShardIteratorInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisGetShardIteratorOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisHashKeyRange API_AVAILABLE(ios(11));
- (void) test_AWSKinesisIncreaseStreamRetentionPeriodInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListShardsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListShardsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListStreamsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListStreamsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListTagsForStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisListTagsForStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisMergeShardsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordsInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordsOutput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordsRequestEntry API_AVAILABLE(ios(11));
- (void) test_AWSKinesisPutRecordsResultEntry API_AVAILABLE(ios(11));
- (void) test_AWSKinesisRecord API_AVAILABLE(ios(11));
- (void) test_AWSKinesisRemoveTagsFromStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisSequenceNumberRange API_AVAILABLE(ios(11));
- (void) test_AWSKinesisShard API_AVAILABLE(ios(11));
- (void) test_AWSKinesisSplitShardInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisStartStreamEncryptionInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisStopStreamEncryptionInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisStreamDescription API_AVAILABLE(ios(11));
- (void) test_AWSKinesisStreamDescriptionSummary API_AVAILABLE(ios(11));
- (void) test_AWSKinesisTag API_AVAILABLE(ios(11));
- (void) test_AWSKinesisUpdateShardCountInput API_AVAILABLE(ios(11));
- (void) test_AWSKinesisUpdateShardCountOutput API_AVAILABLE(ios(11));

@end

@implementation AWSKinesisNSSecureCodingTests

- (void) test_AWSKinesisAddTagsToStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisAddTagsToStreamInput class]];
}

- (void) test_AWSKinesisCreateStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisCreateStreamInput class]];
}

- (void) test_AWSKinesisDecreaseStreamRetentionPeriodInput {
    [self validateSecureCodingForClass:[AWSKinesisDecreaseStreamRetentionPeriodInput class]];
}

- (void) test_AWSKinesisDeleteStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisDeleteStreamInput class]];
}

- (void) test_AWSKinesisDescribeLimitsInput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeLimitsInput class]];
}

- (void) test_AWSKinesisDescribeLimitsOutput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeLimitsOutput class]];
}

- (void) test_AWSKinesisDescribeStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeStreamInput class]];
}

- (void) test_AWSKinesisDescribeStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeStreamOutput class]];
}

- (void) test_AWSKinesisDescribeStreamSummaryInput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeStreamSummaryInput class]];
}

- (void) test_AWSKinesisDescribeStreamSummaryOutput {
    [self validateSecureCodingForClass:[AWSKinesisDescribeStreamSummaryOutput class]];
}

- (void) test_AWSKinesisDisableEnhancedMonitoringInput {
    [self validateSecureCodingForClass:[AWSKinesisDisableEnhancedMonitoringInput class]];
}

- (void) test_AWSKinesisEnableEnhancedMonitoringInput {
    [self validateSecureCodingForClass:[AWSKinesisEnableEnhancedMonitoringInput class]];
}

- (void) test_AWSKinesisEnhancedMetrics {
    [self validateSecureCodingForClass:[AWSKinesisEnhancedMetrics class]];
}

- (void) test_AWSKinesisEnhancedMonitoringOutput {
    [self validateSecureCodingForClass:[AWSKinesisEnhancedMonitoringOutput class]];
}

- (void) test_AWSKinesisGetRecordsInput {
    [self validateSecureCodingForClass:[AWSKinesisGetRecordsInput class]];
}

- (void) test_AWSKinesisGetRecordsOutput {
    [self validateSecureCodingForClass:[AWSKinesisGetRecordsOutput class]];
}

- (void) test_AWSKinesisGetShardIteratorInput {
    [self validateSecureCodingForClass:[AWSKinesisGetShardIteratorInput class]];
}

- (void) test_AWSKinesisGetShardIteratorOutput {
    [self validateSecureCodingForClass:[AWSKinesisGetShardIteratorOutput class]];
}

- (void) test_AWSKinesisHashKeyRange {
    [self validateSecureCodingForClass:[AWSKinesisHashKeyRange class]];
}

- (void) test_AWSKinesisIncreaseStreamRetentionPeriodInput {
    [self validateSecureCodingForClass:[AWSKinesisIncreaseStreamRetentionPeriodInput class]];
}

- (void) test_AWSKinesisListShardsInput {
    [self validateSecureCodingForClass:[AWSKinesisListShardsInput class]];
}

- (void) test_AWSKinesisListShardsOutput {
    [self validateSecureCodingForClass:[AWSKinesisListShardsOutput class]];
}

- (void) test_AWSKinesisListStreamsInput {
    [self validateSecureCodingForClass:[AWSKinesisListStreamsInput class]];
}

- (void) test_AWSKinesisListStreamsOutput {
    [self validateSecureCodingForClass:[AWSKinesisListStreamsOutput class]];
}

- (void) test_AWSKinesisListTagsForStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisListTagsForStreamInput class]];
}

- (void) test_AWSKinesisListTagsForStreamOutput {
    [self validateSecureCodingForClass:[AWSKinesisListTagsForStreamOutput class]];
}

- (void) test_AWSKinesisMergeShardsInput {
    [self validateSecureCodingForClass:[AWSKinesisMergeShardsInput class]];
}

- (void) test_AWSKinesisPutRecordInput {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordInput class]];
}

- (void) test_AWSKinesisPutRecordOutput {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordOutput class]];
}

- (void) test_AWSKinesisPutRecordsInput {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordsInput class]];
}

- (void) test_AWSKinesisPutRecordsOutput {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordsOutput class]];
}

- (void) test_AWSKinesisPutRecordsRequestEntry {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordsRequestEntry class]];
}

- (void) test_AWSKinesisPutRecordsResultEntry {
    [self validateSecureCodingForClass:[AWSKinesisPutRecordsResultEntry class]];
}

- (void) test_AWSKinesisRecord {
    [self validateSecureCodingForClass:[AWSKinesisRecord class]];
}

- (void) test_AWSKinesisRemoveTagsFromStreamInput {
    [self validateSecureCodingForClass:[AWSKinesisRemoveTagsFromStreamInput class]];
}

- (void) test_AWSKinesisSequenceNumberRange {
    [self validateSecureCodingForClass:[AWSKinesisSequenceNumberRange class]];
}

- (void) test_AWSKinesisShard {
    [self validateSecureCodingForClass:[AWSKinesisShard class]];
}

- (void) test_AWSKinesisSplitShardInput {
    [self validateSecureCodingForClass:[AWSKinesisSplitShardInput class]];
}

- (void) test_AWSKinesisStartStreamEncryptionInput {
    [self validateSecureCodingForClass:[AWSKinesisStartStreamEncryptionInput class]];
}

- (void) test_AWSKinesisStopStreamEncryptionInput {
    [self validateSecureCodingForClass:[AWSKinesisStopStreamEncryptionInput class]];
}

- (void) test_AWSKinesisStreamDescription {
    [self validateSecureCodingForClass:[AWSKinesisStreamDescription class]];
}

- (void) test_AWSKinesisStreamDescriptionSummary {
    [self validateSecureCodingForClass:[AWSKinesisStreamDescriptionSummary class]];
}

- (void) test_AWSKinesisTag {
    [self validateSecureCodingForClass:[AWSKinesisTag class]];
}

- (void) test_AWSKinesisUpdateShardCountInput {
    [self validateSecureCodingForClass:[AWSKinesisUpdateShardCountInput class]];
}

- (void) test_AWSKinesisUpdateShardCountOutput {
    [self validateSecureCodingForClass:[AWSKinesisUpdateShardCountOutput class]];
}


@end
