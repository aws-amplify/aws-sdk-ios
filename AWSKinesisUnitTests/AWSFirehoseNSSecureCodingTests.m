//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSFirehoseModel.h"

@interface AWSFirehoseNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSFirehoseAmazonOpenSearchServerlessBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonOpenSearchServerlessRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonopensearchserviceBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonopensearchserviceDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonopensearchserviceDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonopensearchserviceDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAmazonopensearchserviceRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseAuthenticationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseCloudWatchLoggingOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseReplicateCommand API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseCreateDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseCreateDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDataFormatConversionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeleteDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeleteDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeliveryStreamDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeliveryStreamEncryptionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeliveryStreamEncryptionConfigurationInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDescribeDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDescribeDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDeserializer API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDocumentIdOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseDynamicPartitioningConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseElasticsearchBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseElasticsearchDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseElasticsearchDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseElasticsearchDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseElasticsearchRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseEncryptionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseExtendedS3DestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseExtendedS3DestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseExtendedS3DestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseFailureDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHiveJsonSerDe API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointCommonAttribute API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointRequestConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseHttpEndpointRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseInputFormatConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseKMSEncryptionConfig API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseKinesisStreamSourceConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseKinesisStreamSourceDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseListDeliveryStreamsInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseListDeliveryStreamsOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseListTagsForDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseListTagsForDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseMSKSourceConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseMSKSourceDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseOpenXJsonSerDe API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseOrcSerDe API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseOutputFormatConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseParquetSerDe API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseProcessingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseProcessor API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseProcessorParameter API_AVAILABLE(ios(11));
- (void) test_AWSFirehosePutRecordBatchInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehosePutRecordBatchOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehosePutRecordBatchResponseEntry API_AVAILABLE(ios(11));
- (void) test_AWSFirehosePutRecordInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehosePutRecordOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRecord API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRedshiftDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRedshiftDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRedshiftDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRedshiftRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseS3DestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseS3DestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseS3DestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSchemaConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSerializer API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeRoleConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSnowflakeVpcConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSourceDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSplunkBufferingHints API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSplunkDestinationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSplunkDestinationDescription API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSplunkDestinationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseSplunkRetryOptions API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseStartDeliveryStreamEncryptionInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseStartDeliveryStreamEncryptionOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseStopDeliveryStreamEncryptionInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseStopDeliveryStreamEncryptionOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseTag API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseTagDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseTagDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseUntagDeliveryStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseUntagDeliveryStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseUpdateDestinationInput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseUpdateDestinationOutput API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseVpcConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSFirehoseVpcConfigurationDescription API_AVAILABLE(ios(11));

@end

@implementation AWSFirehoseNSSecureCodingTests

- (void) test_AWSFirehoseAmazonOpenSearchServerlessBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonOpenSearchServerlessBufferingHints class]];
}

- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationConfiguration class]];
}

- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationDescription class]];
}

- (void) test_AWSFirehoseAmazonOpenSearchServerlessDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonOpenSearchServerlessDestinationUpdate class]];
}

- (void) test_AWSFirehoseAmazonOpenSearchServerlessRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonOpenSearchServerlessRetryOptions class]];
}

- (void) test_AWSFirehoseAmazonopensearchserviceBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonopensearchserviceBufferingHints class]];
}

- (void) test_AWSFirehoseAmazonopensearchserviceDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonopensearchserviceDestinationConfiguration class]];
}

- (void) test_AWSFirehoseAmazonopensearchserviceDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonopensearchserviceDestinationDescription class]];
}

- (void) test_AWSFirehoseAmazonopensearchserviceDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonopensearchserviceDestinationUpdate class]];
}

- (void) test_AWSFirehoseAmazonopensearchserviceRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseAmazonopensearchserviceRetryOptions class]];
}

- (void) test_AWSFirehoseAuthenticationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseAuthenticationConfiguration class]];
}

- (void) test_AWSFirehoseBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseBufferingHints class]];
}

- (void) test_AWSFirehoseCloudWatchLoggingOptions {
    [self validateSecureCodingForClass:[AWSFirehoseCloudWatchLoggingOptions class]];
}

- (void) test_AWSFirehoseReplicateCommand {
    [self validateSecureCodingForClass:[AWSFirehoseReplicateCommand class]];
}

- (void) test_AWSFirehoseCreateDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseCreateDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseCreateDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseCreateDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseDataFormatConversionConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseDataFormatConversionConfiguration class]];
}

- (void) test_AWSFirehoseDeleteDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseDeleteDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseDeleteDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseDeleteDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseDeliveryStreamDescription {
    [self validateSecureCodingForClass:[AWSFirehoseDeliveryStreamDescription class]];
}

- (void) test_AWSFirehoseDeliveryStreamEncryptionConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseDeliveryStreamEncryptionConfiguration class]];
}

- (void) test_AWSFirehoseDeliveryStreamEncryptionConfigurationInput {
    [self validateSecureCodingForClass:[AWSFirehoseDeliveryStreamEncryptionConfigurationInput class]];
}

- (void) test_AWSFirehoseDescribeDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseDescribeDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseDescribeDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseDescribeDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseDeserializer {
    [self validateSecureCodingForClass:[AWSFirehoseDeserializer class]];
}

- (void) test_AWSFirehoseDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseDestinationDescription class]];
}

- (void) test_AWSFirehoseDocumentIdOptions {
    [self validateSecureCodingForClass:[AWSFirehoseDocumentIdOptions class]];
}

- (void) test_AWSFirehoseDynamicPartitioningConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseDynamicPartitioningConfiguration class]];
}

- (void) test_AWSFirehoseElasticsearchBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseElasticsearchBufferingHints class]];
}

- (void) test_AWSFirehoseElasticsearchDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseElasticsearchDestinationConfiguration class]];
}

- (void) test_AWSFirehoseElasticsearchDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseElasticsearchDestinationDescription class]];
}

- (void) test_AWSFirehoseElasticsearchDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseElasticsearchDestinationUpdate class]];
}

- (void) test_AWSFirehoseElasticsearchRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseElasticsearchRetryOptions class]];
}

- (void) test_AWSFirehoseEncryptionConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseEncryptionConfiguration class]];
}

- (void) test_AWSFirehoseExtendedS3DestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseExtendedS3DestinationConfiguration class]];
}

- (void) test_AWSFirehoseExtendedS3DestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseExtendedS3DestinationDescription class]];
}

- (void) test_AWSFirehoseExtendedS3DestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseExtendedS3DestinationUpdate class]];
}

- (void) test_AWSFirehoseFailureDescription {
    [self validateSecureCodingForClass:[AWSFirehoseFailureDescription class]];
}

- (void) test_AWSFirehoseHiveJsonSerDe {
    [self validateSecureCodingForClass:[AWSFirehoseHiveJsonSerDe class]];
}

- (void) test_AWSFirehoseHttpEndpointBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointBufferingHints class]];
}

- (void) test_AWSFirehoseHttpEndpointCommonAttribute {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointCommonAttribute class]];
}

- (void) test_AWSFirehoseHttpEndpointConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointConfiguration class]];
}

- (void) test_AWSFirehoseHttpEndpointDescription {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointDescription class]];
}

- (void) test_AWSFirehoseHttpEndpointDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointDestinationConfiguration class]];
}

- (void) test_AWSFirehoseHttpEndpointDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointDestinationDescription class]];
}

- (void) test_AWSFirehoseHttpEndpointDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointDestinationUpdate class]];
}

- (void) test_AWSFirehoseHttpEndpointRequestConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointRequestConfiguration class]];
}

- (void) test_AWSFirehoseHttpEndpointRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseHttpEndpointRetryOptions class]];
}

- (void) test_AWSFirehoseInputFormatConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseInputFormatConfiguration class]];
}

- (void) test_AWSFirehoseKMSEncryptionConfig {
    [self validateSecureCodingForClass:[AWSFirehoseKMSEncryptionConfig class]];
}

- (void) test_AWSFirehoseKinesisStreamSourceConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseKinesisStreamSourceConfiguration class]];
}

- (void) test_AWSFirehoseKinesisStreamSourceDescription {
    [self validateSecureCodingForClass:[AWSFirehoseKinesisStreamSourceDescription class]];
}

- (void) test_AWSFirehoseListDeliveryStreamsInput {
    [self validateSecureCodingForClass:[AWSFirehoseListDeliveryStreamsInput class]];
}

- (void) test_AWSFirehoseListDeliveryStreamsOutput {
    [self validateSecureCodingForClass:[AWSFirehoseListDeliveryStreamsOutput class]];
}

- (void) test_AWSFirehoseListTagsForDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseListTagsForDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseListTagsForDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseListTagsForDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseMSKSourceConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseMSKSourceConfiguration class]];
}

- (void) test_AWSFirehoseMSKSourceDescription {
    [self validateSecureCodingForClass:[AWSFirehoseMSKSourceDescription class]];
}

- (void) test_AWSFirehoseOpenXJsonSerDe {
    [self validateSecureCodingForClass:[AWSFirehoseOpenXJsonSerDe class]];
}

- (void) test_AWSFirehoseOrcSerDe {
    [self validateSecureCodingForClass:[AWSFirehoseOrcSerDe class]];
}

- (void) test_AWSFirehoseOutputFormatConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseOutputFormatConfiguration class]];
}

- (void) test_AWSFirehoseParquetSerDe {
    [self validateSecureCodingForClass:[AWSFirehoseParquetSerDe class]];
}

- (void) test_AWSFirehoseProcessingConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseProcessingConfiguration class]];
}

- (void) test_AWSFirehoseProcessor {
    [self validateSecureCodingForClass:[AWSFirehoseProcessor class]];
}

- (void) test_AWSFirehoseProcessorParameter {
    [self validateSecureCodingForClass:[AWSFirehoseProcessorParameter class]];
}

- (void) test_AWSFirehosePutRecordBatchInput {
    [self validateSecureCodingForClass:[AWSFirehosePutRecordBatchInput class]];
}

- (void) test_AWSFirehosePutRecordBatchOutput {
    [self validateSecureCodingForClass:[AWSFirehosePutRecordBatchOutput class]];
}

- (void) test_AWSFirehosePutRecordBatchResponseEntry {
    [self validateSecureCodingForClass:[AWSFirehosePutRecordBatchResponseEntry class]];
}

- (void) test_AWSFirehosePutRecordInput {
    [self validateSecureCodingForClass:[AWSFirehosePutRecordInput class]];
}

- (void) test_AWSFirehosePutRecordOutput {
    [self validateSecureCodingForClass:[AWSFirehosePutRecordOutput class]];
}

- (void) test_AWSFirehoseRecord {
    [self validateSecureCodingForClass:[AWSFirehoseRecord class]];
}

- (void) test_AWSFirehoseRedshiftDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseRedshiftDestinationConfiguration class]];
}

- (void) test_AWSFirehoseRedshiftDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseRedshiftDestinationDescription class]];
}

- (void) test_AWSFirehoseRedshiftDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseRedshiftDestinationUpdate class]];
}

- (void) test_AWSFirehoseRedshiftRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseRedshiftRetryOptions class]];
}

- (void) test_AWSFirehoseRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseRetryOptions class]];
}

- (void) test_AWSFirehoseS3DestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseS3DestinationConfiguration class]];
}

- (void) test_AWSFirehoseS3DestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseS3DestinationDescription class]];
}

- (void) test_AWSFirehoseS3DestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseS3DestinationUpdate class]];
}

- (void) test_AWSFirehoseSchemaConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseSchemaConfiguration class]];
}

- (void) test_AWSFirehoseSerializer {
    [self validateSecureCodingForClass:[AWSFirehoseSerializer class]];
}

- (void) test_AWSFirehoseSnowflakeDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeDestinationConfiguration class]];
}

- (void) test_AWSFirehoseSnowflakeDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeDestinationDescription class]];
}

- (void) test_AWSFirehoseSnowflakeDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeDestinationUpdate class]];
}

- (void) test_AWSFirehoseSnowflakeRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeRetryOptions class]];
}

- (void) test_AWSFirehoseSnowflakeRoleConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeRoleConfiguration class]];
}

- (void) test_AWSFirehoseSnowflakeVpcConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseSnowflakeVpcConfiguration class]];
}

- (void) test_AWSFirehoseSourceDescription {
    [self validateSecureCodingForClass:[AWSFirehoseSourceDescription class]];
}

- (void) test_AWSFirehoseSplunkBufferingHints {
    [self validateSecureCodingForClass:[AWSFirehoseSplunkBufferingHints class]];
}

- (void) test_AWSFirehoseSplunkDestinationConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseSplunkDestinationConfiguration class]];
}

- (void) test_AWSFirehoseSplunkDestinationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseSplunkDestinationDescription class]];
}

- (void) test_AWSFirehoseSplunkDestinationUpdate {
    [self validateSecureCodingForClass:[AWSFirehoseSplunkDestinationUpdate class]];
}

- (void) test_AWSFirehoseSplunkRetryOptions {
    [self validateSecureCodingForClass:[AWSFirehoseSplunkRetryOptions class]];
}

- (void) test_AWSFirehoseStartDeliveryStreamEncryptionInput {
    [self validateSecureCodingForClass:[AWSFirehoseStartDeliveryStreamEncryptionInput class]];
}

- (void) test_AWSFirehoseStartDeliveryStreamEncryptionOutput {
    [self validateSecureCodingForClass:[AWSFirehoseStartDeliveryStreamEncryptionOutput class]];
}

- (void) test_AWSFirehoseStopDeliveryStreamEncryptionInput {
    [self validateSecureCodingForClass:[AWSFirehoseStopDeliveryStreamEncryptionInput class]];
}

- (void) test_AWSFirehoseStopDeliveryStreamEncryptionOutput {
    [self validateSecureCodingForClass:[AWSFirehoseStopDeliveryStreamEncryptionOutput class]];
}

- (void) test_AWSFirehoseTag {
    [self validateSecureCodingForClass:[AWSFirehoseTag class]];
}

- (void) test_AWSFirehoseTagDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseTagDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseTagDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseTagDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseUntagDeliveryStreamInput {
    [self validateSecureCodingForClass:[AWSFirehoseUntagDeliveryStreamInput class]];
}

- (void) test_AWSFirehoseUntagDeliveryStreamOutput {
    [self validateSecureCodingForClass:[AWSFirehoseUntagDeliveryStreamOutput class]];
}

- (void) test_AWSFirehoseUpdateDestinationInput {
    [self validateSecureCodingForClass:[AWSFirehoseUpdateDestinationInput class]];
}

- (void) test_AWSFirehoseUpdateDestinationOutput {
    [self validateSecureCodingForClass:[AWSFirehoseUpdateDestinationOutput class]];
}

- (void) test_AWSFirehoseVpcConfiguration {
    [self validateSecureCodingForClass:[AWSFirehoseVpcConfiguration class]];
}

- (void) test_AWSFirehoseVpcConfigurationDescription {
    [self validateSecureCodingForClass:[AWSFirehoseVpcConfigurationDescription class]];
}

@end

