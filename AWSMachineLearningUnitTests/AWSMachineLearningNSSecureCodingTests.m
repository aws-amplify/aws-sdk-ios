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
#import "AWSMachineLearningModel.h"

@interface AWSMachineLearningNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSMachineLearningAddTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningAddTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningBatchPrediction API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateBatchPredictionInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateBatchPredictionOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromRDSInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromRDSOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromRedshiftInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromRedshiftOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromS3Input API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateDataSourceFromS3Output API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateEvaluationInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateEvaluationOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateMLModelInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateMLModelOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateRealtimeEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningCreateRealtimeEndpointOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDataSource API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteBatchPredictionInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteBatchPredictionOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteDataSourceInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteDataSourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteEvaluationInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteEvaluationOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteMLModelInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteMLModelOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteRealtimeEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteRealtimeEndpointOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDeleteTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeBatchPredictionsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeBatchPredictionsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeDataSourcesInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeDataSourcesOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeEvaluationsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeEvaluationsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeMLModelsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeMLModelsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeTagsInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningDescribeTagsOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningEvaluation API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetBatchPredictionInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetBatchPredictionOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetDataSourceInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetDataSourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetEvaluationInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetEvaluationOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetMLModelInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningGetMLModelOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningMLModel API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningPerformanceMetrics API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningPredictInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningPredictOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningPrediction API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRDSDataSpec API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRDSDatabase API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRDSDatabaseCredentials API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRDSMetadata API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRealtimeEndpointInfo API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRedshiftDataSpec API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRedshiftDatabase API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRedshiftDatabaseCredentials API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningRedshiftMetadata API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningS3DataSpec API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningTag API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateBatchPredictionInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateBatchPredictionOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateDataSourceInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateDataSourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateEvaluationInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateEvaluationOutput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateMLModelInput API_AVAILABLE(ios(11));
- (void) test_AWSMachineLearningUpdateMLModelOutput API_AVAILABLE(ios(11));

@end

@implementation AWSMachineLearningNSSecureCodingTests

- (void) test_AWSMachineLearningAddTagsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningAddTagsInput class]];
}

- (void) test_AWSMachineLearningAddTagsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningAddTagsOutput class]];
}

- (void) test_AWSMachineLearningBatchPrediction {
    [self validateSecureCodingForClass:[AWSMachineLearningBatchPrediction class]];
}

- (void) test_AWSMachineLearningCreateBatchPredictionInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateBatchPredictionInput class]];
}

- (void) test_AWSMachineLearningCreateBatchPredictionOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateBatchPredictionOutput class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromRDSInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromRDSInput class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromRDSOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromRDSOutput class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromRedshiftInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromRedshiftInput class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromRedshiftOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromRedshiftOutput class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromS3Input {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromS3Input class]];
}

- (void) test_AWSMachineLearningCreateDataSourceFromS3Output {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateDataSourceFromS3Output class]];
}

- (void) test_AWSMachineLearningCreateEvaluationInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateEvaluationInput class]];
}

- (void) test_AWSMachineLearningCreateEvaluationOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateEvaluationOutput class]];
}

- (void) test_AWSMachineLearningCreateMLModelInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateMLModelInput class]];
}

- (void) test_AWSMachineLearningCreateMLModelOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateMLModelOutput class]];
}

- (void) test_AWSMachineLearningCreateRealtimeEndpointInput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateRealtimeEndpointInput class]];
}

- (void) test_AWSMachineLearningCreateRealtimeEndpointOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningCreateRealtimeEndpointOutput class]];
}

- (void) test_AWSMachineLearningDataSource {
    [self validateSecureCodingForClass:[AWSMachineLearningDataSource class]];
}

- (void) test_AWSMachineLearningDeleteBatchPredictionInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteBatchPredictionInput class]];
}

- (void) test_AWSMachineLearningDeleteBatchPredictionOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteBatchPredictionOutput class]];
}

- (void) test_AWSMachineLearningDeleteDataSourceInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteDataSourceInput class]];
}

- (void) test_AWSMachineLearningDeleteDataSourceOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteDataSourceOutput class]];
}

- (void) test_AWSMachineLearningDeleteEvaluationInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteEvaluationInput class]];
}

- (void) test_AWSMachineLearningDeleteEvaluationOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteEvaluationOutput class]];
}

- (void) test_AWSMachineLearningDeleteMLModelInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteMLModelInput class]];
}

- (void) test_AWSMachineLearningDeleteMLModelOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteMLModelOutput class]];
}

- (void) test_AWSMachineLearningDeleteRealtimeEndpointInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteRealtimeEndpointInput class]];
}

- (void) test_AWSMachineLearningDeleteRealtimeEndpointOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteRealtimeEndpointOutput class]];
}

- (void) test_AWSMachineLearningDeleteTagsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteTagsInput class]];
}

- (void) test_AWSMachineLearningDeleteTagsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDeleteTagsOutput class]];
}

- (void) test_AWSMachineLearningDescribeBatchPredictionsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeBatchPredictionsInput class]];
}

- (void) test_AWSMachineLearningDescribeBatchPredictionsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeBatchPredictionsOutput class]];
}

- (void) test_AWSMachineLearningDescribeDataSourcesInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeDataSourcesInput class]];
}

- (void) test_AWSMachineLearningDescribeDataSourcesOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeDataSourcesOutput class]];
}

- (void) test_AWSMachineLearningDescribeEvaluationsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeEvaluationsInput class]];
}

- (void) test_AWSMachineLearningDescribeEvaluationsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeEvaluationsOutput class]];
}

- (void) test_AWSMachineLearningDescribeMLModelsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeMLModelsInput class]];
}

- (void) test_AWSMachineLearningDescribeMLModelsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeMLModelsOutput class]];
}

- (void) test_AWSMachineLearningDescribeTagsInput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeTagsInput class]];
}

- (void) test_AWSMachineLearningDescribeTagsOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningDescribeTagsOutput class]];
}

- (void) test_AWSMachineLearningEvaluation {
    [self validateSecureCodingForClass:[AWSMachineLearningEvaluation class]];
}

- (void) test_AWSMachineLearningGetBatchPredictionInput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetBatchPredictionInput class]];
}

- (void) test_AWSMachineLearningGetBatchPredictionOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetBatchPredictionOutput class]];
}

- (void) test_AWSMachineLearningGetDataSourceInput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetDataSourceInput class]];
}

- (void) test_AWSMachineLearningGetDataSourceOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetDataSourceOutput class]];
}

- (void) test_AWSMachineLearningGetEvaluationInput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetEvaluationInput class]];
}

- (void) test_AWSMachineLearningGetEvaluationOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetEvaluationOutput class]];
}

- (void) test_AWSMachineLearningGetMLModelInput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetMLModelInput class]];
}

- (void) test_AWSMachineLearningGetMLModelOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningGetMLModelOutput class]];
}

- (void) test_AWSMachineLearningMLModel {
    [self validateSecureCodingForClass:[AWSMachineLearningMLModel class]];
}

- (void) test_AWSMachineLearningPerformanceMetrics {
    [self validateSecureCodingForClass:[AWSMachineLearningPerformanceMetrics class]];
}

- (void) test_AWSMachineLearningPredictInput {
    [self validateSecureCodingForClass:[AWSMachineLearningPredictInput class]];
}

- (void) test_AWSMachineLearningPredictOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningPredictOutput class]];
}

- (void) test_AWSMachineLearningPrediction {
    [self validateSecureCodingForClass:[AWSMachineLearningPrediction class]];
}

- (void) test_AWSMachineLearningRDSDataSpec {
    [self validateSecureCodingForClass:[AWSMachineLearningRDSDataSpec class]];
}

- (void) test_AWSMachineLearningRDSDatabase {
    [self validateSecureCodingForClass:[AWSMachineLearningRDSDatabase class]];
}

- (void) test_AWSMachineLearningRDSDatabaseCredentials {
    [self validateSecureCodingForClass:[AWSMachineLearningRDSDatabaseCredentials class]];
}

- (void) test_AWSMachineLearningRDSMetadata {
    [self validateSecureCodingForClass:[AWSMachineLearningRDSMetadata class]];
}

- (void) test_AWSMachineLearningRealtimeEndpointInfo {
    [self validateSecureCodingForClass:[AWSMachineLearningRealtimeEndpointInfo class]];
}

- (void) test_AWSMachineLearningRedshiftDataSpec {
    [self validateSecureCodingForClass:[AWSMachineLearningRedshiftDataSpec class]];
}

- (void) test_AWSMachineLearningRedshiftDatabase {
    [self validateSecureCodingForClass:[AWSMachineLearningRedshiftDatabase class]];
}

- (void) test_AWSMachineLearningRedshiftDatabaseCredentials {
    [self validateSecureCodingForClass:[AWSMachineLearningRedshiftDatabaseCredentials class]];
}

- (void) test_AWSMachineLearningRedshiftMetadata {
    [self validateSecureCodingForClass:[AWSMachineLearningRedshiftMetadata class]];
}

- (void) test_AWSMachineLearningS3DataSpec {
    [self validateSecureCodingForClass:[AWSMachineLearningS3DataSpec class]];
}

- (void) test_AWSMachineLearningTag {
    [self validateSecureCodingForClass:[AWSMachineLearningTag class]];
}

- (void) test_AWSMachineLearningUpdateBatchPredictionInput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateBatchPredictionInput class]];
}

- (void) test_AWSMachineLearningUpdateBatchPredictionOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateBatchPredictionOutput class]];
}

- (void) test_AWSMachineLearningUpdateDataSourceInput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateDataSourceInput class]];
}

- (void) test_AWSMachineLearningUpdateDataSourceOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateDataSourceOutput class]];
}

- (void) test_AWSMachineLearningUpdateEvaluationInput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateEvaluationInput class]];
}

- (void) test_AWSMachineLearningUpdateEvaluationOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateEvaluationOutput class]];
}

- (void) test_AWSMachineLearningUpdateMLModelInput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateMLModelInput class]];
}

- (void) test_AWSMachineLearningUpdateMLModelOutput {
    [self validateSecureCodingForClass:[AWSMachineLearningUpdateMLModelOutput class]];
}

@end
