//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSComprehendModel.h"

@interface AWSComprehendNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSComprehendAugmentedManifestsListItem API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectDominantLanguageItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectDominantLanguageRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectDominantLanguageResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectEntitiesItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectEntitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectEntitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectKeyPhrasesItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectKeyPhrasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectKeyPhrasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSentimentItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSentimentRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSentimentResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSyntaxItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSyntaxRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectSyntaxResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectTargetedSentimentItemResult API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectTargetedSentimentRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchDetectTargetedSentimentResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendBatchItemError API_AVAILABLE(ios(11));
- (void) test_AWSComprehendClassifierEvaluationMetrics API_AVAILABLE(ios(11));
- (void) test_AWSComprehendClassifierMetadata API_AVAILABLE(ios(11));
- (void) test_AWSComprehendClassifyDocumentRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendClassifyDocumentResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendContainsPiiEntitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendContainsPiiEntitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateDocumentClassifierRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateDocumentClassifierResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateEntityRecognizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendCreateEntityRecognizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteDocumentClassifierRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteDocumentClassifierResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteEntityRecognizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteEntityRecognizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteResourcePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDeleteResourcePolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDocumentClassificationJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDocumentClassificationJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDocumentClassifierRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDocumentClassifierResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDominantLanguageDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeDominantLanguageDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEntityRecognizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEntityRecognizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEventsDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeEventsDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeKeyPhrasesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeKeyPhrasesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribePiiEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribePiiEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeResourcePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeResourcePolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeTargetedSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeTargetedSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeTopicsDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDescribeTopicsDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectDominantLanguageRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectDominantLanguageResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectEntitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectEntitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectKeyPhrasesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectKeyPhrasesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectPiiEntitiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectPiiEntitiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectSentimentRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectSentimentResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectSyntaxRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectSyntaxResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectTargetedSentimentRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDetectTargetedSentimentResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClass API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassificationJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassificationJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassifierFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassifierInputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassifierOutputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassifierProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentClassifierSummary API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentLabel API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDocumentReaderConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDominantLanguage API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDominantLanguageDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendDominantLanguageDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEndpointFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEndpointProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntitiesDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntitiesDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntity API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityLabel API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerAnnotations API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerDocuments API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerEntityList API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerEvaluationMetrics API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerInputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerMetadata API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerMetadataEntityTypesListItem API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityRecognizerSummary API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityTypesEvaluationMetrics API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEntityTypesListItem API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEventsDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendEventsDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendImportModelRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendImportModelResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendInputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendKeyPhrase API_AVAILABLE(ios(11));
- (void) test_AWSComprehendKeyPhrasesDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendKeyPhrasesDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassificationJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassificationJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassifierSummariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassifierSummariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassifiersRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDocumentClassifiersResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDominantLanguageDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListDominantLanguageDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntitiesDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntitiesDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntityRecognizerSummariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntityRecognizerSummariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntityRecognizersRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEntityRecognizersResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEventsDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListEventsDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListKeyPhrasesDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListKeyPhrasesDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListPiiEntitiesDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListPiiEntitiesDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListSentimentDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListSentimentDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTargetedSentimentDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTargetedSentimentDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTopicsDetectionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendListTopicsDetectionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendMentionSentiment API_AVAILABLE(ios(11));
- (void) test_AWSComprehendOutputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPartOfSpeechTag API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPiiEntitiesDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPiiEntitiesDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPiiEntity API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPiiOutputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPutResourcePolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendPutResourcePolicyResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendRedactionConfig API_AVAILABLE(ios(11));
- (void) test_AWSComprehendSentimentDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendSentimentDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendSentimentScore API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartDocumentClassificationJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartDocumentClassificationJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartDominantLanguageDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartDominantLanguageDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartEventsDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartEventsDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartKeyPhrasesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartKeyPhrasesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartPiiEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartPiiEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartTargetedSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartTargetedSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartTopicsDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStartTopicsDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopDominantLanguageDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopDominantLanguageDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopEventsDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopEventsDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopKeyPhrasesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopKeyPhrasesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopPiiEntitiesDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopPiiEntitiesDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTargetedSentimentDetectionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTargetedSentimentDetectionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTrainingDocumentClassifierRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTrainingDocumentClassifierResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTrainingEntityRecognizerRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendStopTrainingEntityRecognizerResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendSyntaxToken API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTag API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTargetedSentimentDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTargetedSentimentDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTargetedSentimentEntity API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTargetedSentimentMention API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTopicsDetectionJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSComprehendTopicsDetectionJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSComprehendUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendUpdateEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSComprehendUpdateEndpointResponse API_AVAILABLE(ios(11));
- (void) test_AWSComprehendVpcConfig API_AVAILABLE(ios(11));

@end

@implementation AWSComprehendNSSecureCodingTests

- (void) test_AWSComprehendAugmentedManifestsListItem {
    [self validateSecureCodingForClass:[AWSComprehendAugmentedManifestsListItem class]];
}

- (void) test_AWSComprehendBatchDetectDominantLanguageItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectDominantLanguageItemResult class]];
}

- (void) test_AWSComprehendBatchDetectDominantLanguageRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectDominantLanguageRequest class]];
}

- (void) test_AWSComprehendBatchDetectDominantLanguageResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectDominantLanguageResponse class]];
}

- (void) test_AWSComprehendBatchDetectEntitiesItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectEntitiesItemResult class]];
}

- (void) test_AWSComprehendBatchDetectEntitiesRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectEntitiesRequest class]];
}

- (void) test_AWSComprehendBatchDetectEntitiesResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectEntitiesResponse class]];
}

- (void) test_AWSComprehendBatchDetectKeyPhrasesItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectKeyPhrasesItemResult class]];
}

- (void) test_AWSComprehendBatchDetectKeyPhrasesRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectKeyPhrasesRequest class]];
}

- (void) test_AWSComprehendBatchDetectKeyPhrasesResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectKeyPhrasesResponse class]];
}

- (void) test_AWSComprehendBatchDetectSentimentItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSentimentItemResult class]];
}

- (void) test_AWSComprehendBatchDetectSentimentRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSentimentRequest class]];
}

- (void) test_AWSComprehendBatchDetectSentimentResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSentimentResponse class]];
}

- (void) test_AWSComprehendBatchDetectSyntaxItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSyntaxItemResult class]];
}

- (void) test_AWSComprehendBatchDetectSyntaxRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSyntaxRequest class]];
}

- (void) test_AWSComprehendBatchDetectSyntaxResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectSyntaxResponse class]];
}

- (void) test_AWSComprehendBatchDetectTargetedSentimentItemResult {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectTargetedSentimentItemResult class]];
}

- (void) test_AWSComprehendBatchDetectTargetedSentimentRequest {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectTargetedSentimentRequest class]];
}

- (void) test_AWSComprehendBatchDetectTargetedSentimentResponse {
    [self validateSecureCodingForClass:[AWSComprehendBatchDetectTargetedSentimentResponse class]];
}

- (void) test_AWSComprehendBatchItemError {
    [self validateSecureCodingForClass:[AWSComprehendBatchItemError class]];
}

- (void) test_AWSComprehendClassifierEvaluationMetrics {
    [self validateSecureCodingForClass:[AWSComprehendClassifierEvaluationMetrics class]];
}

- (void) test_AWSComprehendClassifierMetadata {
    [self validateSecureCodingForClass:[AWSComprehendClassifierMetadata class]];
}

- (void) test_AWSComprehendClassifyDocumentRequest {
    [self validateSecureCodingForClass:[AWSComprehendClassifyDocumentRequest class]];
}

- (void) test_AWSComprehendClassifyDocumentResponse {
    [self validateSecureCodingForClass:[AWSComprehendClassifyDocumentResponse class]];
}

- (void) test_AWSComprehendContainsPiiEntitiesRequest {
    [self validateSecureCodingForClass:[AWSComprehendContainsPiiEntitiesRequest class]];
}

- (void) test_AWSComprehendContainsPiiEntitiesResponse {
    [self validateSecureCodingForClass:[AWSComprehendContainsPiiEntitiesResponse class]];
}

- (void) test_AWSComprehendCreateDocumentClassifierRequest {
    [self validateSecureCodingForClass:[AWSComprehendCreateDocumentClassifierRequest class]];
}

- (void) test_AWSComprehendCreateDocumentClassifierResponse {
    [self validateSecureCodingForClass:[AWSComprehendCreateDocumentClassifierResponse class]];
}

- (void) test_AWSComprehendCreateEndpointRequest {
    [self validateSecureCodingForClass:[AWSComprehendCreateEndpointRequest class]];
}

- (void) test_AWSComprehendCreateEndpointResponse {
    [self validateSecureCodingForClass:[AWSComprehendCreateEndpointResponse class]];
}

- (void) test_AWSComprehendCreateEntityRecognizerRequest {
    [self validateSecureCodingForClass:[AWSComprehendCreateEntityRecognizerRequest class]];
}

- (void) test_AWSComprehendCreateEntityRecognizerResponse {
    [self validateSecureCodingForClass:[AWSComprehendCreateEntityRecognizerResponse class]];
}

- (void) test_AWSComprehendDeleteDocumentClassifierRequest {
    [self validateSecureCodingForClass:[AWSComprehendDeleteDocumentClassifierRequest class]];
}

- (void) test_AWSComprehendDeleteDocumentClassifierResponse {
    [self validateSecureCodingForClass:[AWSComprehendDeleteDocumentClassifierResponse class]];
}

- (void) test_AWSComprehendDeleteEndpointRequest {
    [self validateSecureCodingForClass:[AWSComprehendDeleteEndpointRequest class]];
}

- (void) test_AWSComprehendDeleteEndpointResponse {
    [self validateSecureCodingForClass:[AWSComprehendDeleteEndpointResponse class]];
}

- (void) test_AWSComprehendDeleteEntityRecognizerRequest {
    [self validateSecureCodingForClass:[AWSComprehendDeleteEntityRecognizerRequest class]];
}

- (void) test_AWSComprehendDeleteEntityRecognizerResponse {
    [self validateSecureCodingForClass:[AWSComprehendDeleteEntityRecognizerResponse class]];
}

- (void) test_AWSComprehendDeleteResourcePolicyRequest {
    [self validateSecureCodingForClass:[AWSComprehendDeleteResourcePolicyRequest class]];
}

- (void) test_AWSComprehendDeleteResourcePolicyResponse {
    [self validateSecureCodingForClass:[AWSComprehendDeleteResourcePolicyResponse class]];
}

- (void) test_AWSComprehendDescribeDocumentClassificationJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDocumentClassificationJobRequest class]];
}

- (void) test_AWSComprehendDescribeDocumentClassificationJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDocumentClassificationJobResponse class]];
}

- (void) test_AWSComprehendDescribeDocumentClassifierRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDocumentClassifierRequest class]];
}

- (void) test_AWSComprehendDescribeDocumentClassifierResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDocumentClassifierResponse class]];
}

- (void) test_AWSComprehendDescribeDominantLanguageDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDominantLanguageDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeDominantLanguageDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeDominantLanguageDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeEndpointRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEndpointRequest class]];
}

- (void) test_AWSComprehendDescribeEndpointResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEndpointResponse class]];
}

- (void) test_AWSComprehendDescribeEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeEntityRecognizerRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEntityRecognizerRequest class]];
}

- (void) test_AWSComprehendDescribeEntityRecognizerResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEntityRecognizerResponse class]];
}

- (void) test_AWSComprehendDescribeEventsDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEventsDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeEventsDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeEventsDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeKeyPhrasesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeKeyPhrasesDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeKeyPhrasesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeKeyPhrasesDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribePiiEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribePiiEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribePiiEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribePiiEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeResourcePolicyRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeResourcePolicyRequest class]];
}

- (void) test_AWSComprehendDescribeResourcePolicyResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeResourcePolicyResponse class]];
}

- (void) test_AWSComprehendDescribeSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeTargetedSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeTargetedSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeTargetedSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeTargetedSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendDescribeTopicsDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendDescribeTopicsDetectionJobRequest class]];
}

- (void) test_AWSComprehendDescribeTopicsDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendDescribeTopicsDetectionJobResponse class]];
}

- (void) test_AWSComprehendDetectDominantLanguageRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectDominantLanguageRequest class]];
}

- (void) test_AWSComprehendDetectDominantLanguageResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectDominantLanguageResponse class]];
}

- (void) test_AWSComprehendDetectEntitiesRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectEntitiesRequest class]];
}

- (void) test_AWSComprehendDetectEntitiesResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectEntitiesResponse class]];
}

- (void) test_AWSComprehendDetectKeyPhrasesRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectKeyPhrasesRequest class]];
}

- (void) test_AWSComprehendDetectKeyPhrasesResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectKeyPhrasesResponse class]];
}

- (void) test_AWSComprehendDetectPiiEntitiesRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectPiiEntitiesRequest class]];
}

- (void) test_AWSComprehendDetectPiiEntitiesResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectPiiEntitiesResponse class]];
}

- (void) test_AWSComprehendDetectSentimentRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectSentimentRequest class]];
}

- (void) test_AWSComprehendDetectSentimentResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectSentimentResponse class]];
}

- (void) test_AWSComprehendDetectSyntaxRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectSyntaxRequest class]];
}

- (void) test_AWSComprehendDetectSyntaxResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectSyntaxResponse class]];
}

- (void) test_AWSComprehendDetectTargetedSentimentRequest {
    [self validateSecureCodingForClass:[AWSComprehendDetectTargetedSentimentRequest class]];
}

- (void) test_AWSComprehendDetectTargetedSentimentResponse {
    [self validateSecureCodingForClass:[AWSComprehendDetectTargetedSentimentResponse class]];
}

- (void) test_AWSComprehendDocumentClass {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClass class]];
}

- (void) test_AWSComprehendDocumentClassificationJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassificationJobFilter class]];
}

- (void) test_AWSComprehendDocumentClassificationJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassificationJobProperties class]];
}

- (void) test_AWSComprehendDocumentClassifierFilter {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassifierFilter class]];
}

- (void) test_AWSComprehendDocumentClassifierInputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassifierInputDataConfig class]];
}

- (void) test_AWSComprehendDocumentClassifierOutputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassifierOutputDataConfig class]];
}

- (void) test_AWSComprehendDocumentClassifierProperties {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassifierProperties class]];
}

- (void) test_AWSComprehendDocumentClassifierSummary {
    [self validateSecureCodingForClass:[AWSComprehendDocumentClassifierSummary class]];
}

- (void) test_AWSComprehendDocumentLabel {
    [self validateSecureCodingForClass:[AWSComprehendDocumentLabel class]];
}

- (void) test_AWSComprehendDocumentReaderConfig {
    [self validateSecureCodingForClass:[AWSComprehendDocumentReaderConfig class]];
}

- (void) test_AWSComprehendDominantLanguage {
    [self validateSecureCodingForClass:[AWSComprehendDominantLanguage class]];
}

- (void) test_AWSComprehendDominantLanguageDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendDominantLanguageDetectionJobFilter class]];
}

- (void) test_AWSComprehendDominantLanguageDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendDominantLanguageDetectionJobProperties class]];
}

- (void) test_AWSComprehendEndpointFilter {
    [self validateSecureCodingForClass:[AWSComprehendEndpointFilter class]];
}

- (void) test_AWSComprehendEndpointProperties {
    [self validateSecureCodingForClass:[AWSComprehendEndpointProperties class]];
}

- (void) test_AWSComprehendEntitiesDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendEntitiesDetectionJobFilter class]];
}

- (void) test_AWSComprehendEntitiesDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendEntitiesDetectionJobProperties class]];
}

- (void) test_AWSComprehendEntity {
    [self validateSecureCodingForClass:[AWSComprehendEntity class]];
}

- (void) test_AWSComprehendEntityLabel {
    [self validateSecureCodingForClass:[AWSComprehendEntityLabel class]];
}

- (void) test_AWSComprehendEntityRecognizerAnnotations {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerAnnotations class]];
}

- (void) test_AWSComprehendEntityRecognizerDocuments {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerDocuments class]];
}

- (void) test_AWSComprehendEntityRecognizerEntityList {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerEntityList class]];
}

- (void) test_AWSComprehendEntityRecognizerEvaluationMetrics {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerEvaluationMetrics class]];
}

- (void) test_AWSComprehendEntityRecognizerFilter {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerFilter class]];
}

- (void) test_AWSComprehendEntityRecognizerInputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerInputDataConfig class]];
}

- (void) test_AWSComprehendEntityRecognizerMetadata {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerMetadata class]];
}

- (void) test_AWSComprehendEntityRecognizerMetadataEntityTypesListItem {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerMetadataEntityTypesListItem class]];
}

- (void) test_AWSComprehendEntityRecognizerProperties {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerProperties class]];
}

- (void) test_AWSComprehendEntityRecognizerSummary {
    [self validateSecureCodingForClass:[AWSComprehendEntityRecognizerSummary class]];
}

- (void) test_AWSComprehendEntityTypesEvaluationMetrics {
    [self validateSecureCodingForClass:[AWSComprehendEntityTypesEvaluationMetrics class]];
}

- (void) test_AWSComprehendEntityTypesListItem {
    [self validateSecureCodingForClass:[AWSComprehendEntityTypesListItem class]];
}

- (void) test_AWSComprehendEventsDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendEventsDetectionJobFilter class]];
}

- (void) test_AWSComprehendEventsDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendEventsDetectionJobProperties class]];
}

- (void) test_AWSComprehendImportModelRequest {
    [self validateSecureCodingForClass:[AWSComprehendImportModelRequest class]];
}

- (void) test_AWSComprehendImportModelResponse {
    [self validateSecureCodingForClass:[AWSComprehendImportModelResponse class]];
}

- (void) test_AWSComprehendInputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendInputDataConfig class]];
}

- (void) test_AWSComprehendKeyPhrase {
    [self validateSecureCodingForClass:[AWSComprehendKeyPhrase class]];
}

- (void) test_AWSComprehendKeyPhrasesDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendKeyPhrasesDetectionJobFilter class]];
}

- (void) test_AWSComprehendKeyPhrasesDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendKeyPhrasesDetectionJobProperties class]];
}

- (void) test_AWSComprehendListDocumentClassificationJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassificationJobsRequest class]];
}

- (void) test_AWSComprehendListDocumentClassificationJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassificationJobsResponse class]];
}

- (void) test_AWSComprehendListDocumentClassifierSummariesRequest {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassifierSummariesRequest class]];
}

- (void) test_AWSComprehendListDocumentClassifierSummariesResponse {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassifierSummariesResponse class]];
}

- (void) test_AWSComprehendListDocumentClassifiersRequest {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassifiersRequest class]];
}

- (void) test_AWSComprehendListDocumentClassifiersResponse {
    [self validateSecureCodingForClass:[AWSComprehendListDocumentClassifiersResponse class]];
}

- (void) test_AWSComprehendListDominantLanguageDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListDominantLanguageDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListDominantLanguageDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListDominantLanguageDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListEndpointsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListEndpointsRequest class]];
}

- (void) test_AWSComprehendListEndpointsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListEndpointsResponse class]];
}

- (void) test_AWSComprehendListEntitiesDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListEntitiesDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListEntitiesDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListEntitiesDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListEntityRecognizerSummariesRequest {
    [self validateSecureCodingForClass:[AWSComprehendListEntityRecognizerSummariesRequest class]];
}

- (void) test_AWSComprehendListEntityRecognizerSummariesResponse {
    [self validateSecureCodingForClass:[AWSComprehendListEntityRecognizerSummariesResponse class]];
}

- (void) test_AWSComprehendListEntityRecognizersRequest {
    [self validateSecureCodingForClass:[AWSComprehendListEntityRecognizersRequest class]];
}

- (void) test_AWSComprehendListEntityRecognizersResponse {
    [self validateSecureCodingForClass:[AWSComprehendListEntityRecognizersResponse class]];
}

- (void) test_AWSComprehendListEventsDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListEventsDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListEventsDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListEventsDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListKeyPhrasesDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListKeyPhrasesDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListKeyPhrasesDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListKeyPhrasesDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListPiiEntitiesDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListPiiEntitiesDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListPiiEntitiesDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListPiiEntitiesDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListSentimentDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListSentimentDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListSentimentDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListSentimentDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSComprehendListTagsForResourceRequest class]];
}

- (void) test_AWSComprehendListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSComprehendListTagsForResourceResponse class]];
}

- (void) test_AWSComprehendListTargetedSentimentDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListTargetedSentimentDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListTargetedSentimentDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListTargetedSentimentDetectionJobsResponse class]];
}

- (void) test_AWSComprehendListTopicsDetectionJobsRequest {
    [self validateSecureCodingForClass:[AWSComprehendListTopicsDetectionJobsRequest class]];
}

- (void) test_AWSComprehendListTopicsDetectionJobsResponse {
    [self validateSecureCodingForClass:[AWSComprehendListTopicsDetectionJobsResponse class]];
}

- (void) test_AWSComprehendMentionSentiment {
    [self validateSecureCodingForClass:[AWSComprehendMentionSentiment class]];
}

- (void) test_AWSComprehendOutputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendOutputDataConfig class]];
}

- (void) test_AWSComprehendPartOfSpeechTag {
    [self validateSecureCodingForClass:[AWSComprehendPartOfSpeechTag class]];
}

- (void) test_AWSComprehendPiiEntitiesDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendPiiEntitiesDetectionJobFilter class]];
}

- (void) test_AWSComprehendPiiEntitiesDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendPiiEntitiesDetectionJobProperties class]];
}

- (void) test_AWSComprehendPiiEntity {
    [self validateSecureCodingForClass:[AWSComprehendPiiEntity class]];
}

- (void) test_AWSComprehendPiiOutputDataConfig {
    [self validateSecureCodingForClass:[AWSComprehendPiiOutputDataConfig class]];
}

- (void) test_AWSComprehendPutResourcePolicyRequest {
    [self validateSecureCodingForClass:[AWSComprehendPutResourcePolicyRequest class]];
}

- (void) test_AWSComprehendPutResourcePolicyResponse {
    [self validateSecureCodingForClass:[AWSComprehendPutResourcePolicyResponse class]];
}

- (void) test_AWSComprehendRedactionConfig {
    [self validateSecureCodingForClass:[AWSComprehendRedactionConfig class]];
}

- (void) test_AWSComprehendSentimentDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendSentimentDetectionJobFilter class]];
}

- (void) test_AWSComprehendSentimentDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendSentimentDetectionJobProperties class]];
}

- (void) test_AWSComprehendSentimentScore {
    [self validateSecureCodingForClass:[AWSComprehendSentimentScore class]];
}

- (void) test_AWSComprehendStartDocumentClassificationJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartDocumentClassificationJobRequest class]];
}

- (void) test_AWSComprehendStartDocumentClassificationJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartDocumentClassificationJobResponse class]];
}

- (void) test_AWSComprehendStartDominantLanguageDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartDominantLanguageDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartDominantLanguageDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartDominantLanguageDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartEventsDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartEventsDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartEventsDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartEventsDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartKeyPhrasesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartKeyPhrasesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartKeyPhrasesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartKeyPhrasesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartPiiEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartPiiEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartPiiEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartPiiEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartTargetedSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartTargetedSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartTargetedSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartTargetedSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendStartTopicsDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStartTopicsDetectionJobRequest class]];
}

- (void) test_AWSComprehendStartTopicsDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStartTopicsDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopDominantLanguageDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopDominantLanguageDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopDominantLanguageDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopDominantLanguageDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopEventsDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopEventsDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopEventsDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopEventsDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopKeyPhrasesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopKeyPhrasesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopKeyPhrasesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopKeyPhrasesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopPiiEntitiesDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopPiiEntitiesDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopPiiEntitiesDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopPiiEntitiesDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopTargetedSentimentDetectionJobRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopTargetedSentimentDetectionJobRequest class]];
}

- (void) test_AWSComprehendStopTargetedSentimentDetectionJobResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopTargetedSentimentDetectionJobResponse class]];
}

- (void) test_AWSComprehendStopTrainingDocumentClassifierRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopTrainingDocumentClassifierRequest class]];
}

- (void) test_AWSComprehendStopTrainingDocumentClassifierResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopTrainingDocumentClassifierResponse class]];
}

- (void) test_AWSComprehendStopTrainingEntityRecognizerRequest {
    [self validateSecureCodingForClass:[AWSComprehendStopTrainingEntityRecognizerRequest class]];
}

- (void) test_AWSComprehendStopTrainingEntityRecognizerResponse {
    [self validateSecureCodingForClass:[AWSComprehendStopTrainingEntityRecognizerResponse class]];
}

- (void) test_AWSComprehendSyntaxToken {
    [self validateSecureCodingForClass:[AWSComprehendSyntaxToken class]];
}

- (void) test_AWSComprehendTag {
    [self validateSecureCodingForClass:[AWSComprehendTag class]];
}

- (void) test_AWSComprehendTagResourceRequest {
    [self validateSecureCodingForClass:[AWSComprehendTagResourceRequest class]];
}

- (void) test_AWSComprehendTagResourceResponse {
    [self validateSecureCodingForClass:[AWSComprehendTagResourceResponse class]];
}

- (void) test_AWSComprehendTargetedSentimentDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendTargetedSentimentDetectionJobFilter class]];
}

- (void) test_AWSComprehendTargetedSentimentDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendTargetedSentimentDetectionJobProperties class]];
}

- (void) test_AWSComprehendTargetedSentimentEntity {
    [self validateSecureCodingForClass:[AWSComprehendTargetedSentimentEntity class]];
}

- (void) test_AWSComprehendTargetedSentimentMention {
    [self validateSecureCodingForClass:[AWSComprehendTargetedSentimentMention class]];
}

- (void) test_AWSComprehendTopicsDetectionJobFilter {
    [self validateSecureCodingForClass:[AWSComprehendTopicsDetectionJobFilter class]];
}

- (void) test_AWSComprehendTopicsDetectionJobProperties {
    [self validateSecureCodingForClass:[AWSComprehendTopicsDetectionJobProperties class]];
}

- (void) test_AWSComprehendUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSComprehendUntagResourceRequest class]];
}

- (void) test_AWSComprehendUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSComprehendUntagResourceResponse class]];
}

- (void) test_AWSComprehendUpdateEndpointRequest {
    [self validateSecureCodingForClass:[AWSComprehendUpdateEndpointRequest class]];
}

- (void) test_AWSComprehendUpdateEndpointResponse {
    [self validateSecureCodingForClass:[AWSComprehendUpdateEndpointResponse class]];
}

- (void) test_AWSComprehendVpcConfig {
    [self validateSecureCodingForClass:[AWSComprehendVpcConfig class]];
}

@end

