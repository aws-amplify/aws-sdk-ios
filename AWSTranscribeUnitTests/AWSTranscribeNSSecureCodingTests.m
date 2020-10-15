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
#import "AWSTranscribeModel.h"

@interface AWSTranscribeNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSTranscribeContentRedaction API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateLanguageModelRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateLanguageModelResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateMedicalVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateMedicalVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateVocabularyFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateVocabularyFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeCreateVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteLanguageModelRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteMedicalTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteMedicalVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteVocabularyFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDeleteVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDescribeLanguageModelRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeDescribeLanguageModelResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetMedicalTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetMedicalTranscriptionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetMedicalVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetMedicalVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetTranscriptionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetVocabularyFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetVocabularyFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeGetVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeInputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeJobExecutionSettings API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeLanguageModel API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListLanguageModelsRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListLanguageModelsResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListMedicalTranscriptionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListMedicalTranscriptionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListMedicalVocabulariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListMedicalVocabulariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListTranscriptionJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListTranscriptionJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListVocabulariesRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListVocabulariesResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListVocabularyFiltersRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeListVocabularyFiltersResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeMedia API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeMedicalTranscript API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeMedicalTranscriptionJob API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeMedicalTranscriptionJobSummary API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeMedicalTranscriptionSetting API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeModelSettings API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeSettings API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStartMedicalTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStartMedicalTranscriptionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStartTranscriptionJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeStartTranscriptionJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeTranscript API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeTranscriptionJob API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeTranscriptionJobSummary API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateMedicalVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateMedicalVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateVocabularyFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateVocabularyFilterResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateVocabularyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeUpdateVocabularyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeVocabularyFilterInfo API_AVAILABLE(ios(11));
- (void) test_AWSTranscribeVocabularyInfo API_AVAILABLE(ios(11));

@end

@implementation AWSTranscribeNSSecureCodingTests

- (void) test_AWSTranscribeContentRedaction {
    [self validateSecureCodingForClass:[AWSTranscribeContentRedaction class]];
}

- (void) test_AWSTranscribeCreateLanguageModelRequest {
    [self validateSecureCodingForClass:[AWSTranscribeCreateLanguageModelRequest class]];
}

- (void) test_AWSTranscribeCreateLanguageModelResponse {
    [self validateSecureCodingForClass:[AWSTranscribeCreateLanguageModelResponse class]];
}

- (void) test_AWSTranscribeCreateMedicalVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeCreateMedicalVocabularyRequest class]];
}

- (void) test_AWSTranscribeCreateMedicalVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeCreateMedicalVocabularyResponse class]];
}

- (void) test_AWSTranscribeCreateVocabularyFilterRequest {
    [self validateSecureCodingForClass:[AWSTranscribeCreateVocabularyFilterRequest class]];
}

- (void) test_AWSTranscribeCreateVocabularyFilterResponse {
    [self validateSecureCodingForClass:[AWSTranscribeCreateVocabularyFilterResponse class]];
}

- (void) test_AWSTranscribeCreateVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeCreateVocabularyRequest class]];
}

- (void) test_AWSTranscribeCreateVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeCreateVocabularyResponse class]];
}

- (void) test_AWSTranscribeDeleteLanguageModelRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteLanguageModelRequest class]];
}

- (void) test_AWSTranscribeDeleteMedicalTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteMedicalTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeDeleteMedicalVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteMedicalVocabularyRequest class]];
}

- (void) test_AWSTranscribeDeleteTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeDeleteVocabularyFilterRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteVocabularyFilterRequest class]];
}

- (void) test_AWSTranscribeDeleteVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDeleteVocabularyRequest class]];
}

- (void) test_AWSTranscribeDescribeLanguageModelRequest {
    [self validateSecureCodingForClass:[AWSTranscribeDescribeLanguageModelRequest class]];
}

- (void) test_AWSTranscribeDescribeLanguageModelResponse {
    [self validateSecureCodingForClass:[AWSTranscribeDescribeLanguageModelResponse class]];
}

- (void) test_AWSTranscribeGetMedicalTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeGetMedicalTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeGetMedicalTranscriptionJobResponse {
    [self validateSecureCodingForClass:[AWSTranscribeGetMedicalTranscriptionJobResponse class]];
}

- (void) test_AWSTranscribeGetMedicalVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeGetMedicalVocabularyRequest class]];
}

- (void) test_AWSTranscribeGetMedicalVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeGetMedicalVocabularyResponse class]];
}

- (void) test_AWSTranscribeGetTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeGetTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeGetTranscriptionJobResponse {
    [self validateSecureCodingForClass:[AWSTranscribeGetTranscriptionJobResponse class]];
}

- (void) test_AWSTranscribeGetVocabularyFilterRequest {
    [self validateSecureCodingForClass:[AWSTranscribeGetVocabularyFilterRequest class]];
}

- (void) test_AWSTranscribeGetVocabularyFilterResponse {
    [self validateSecureCodingForClass:[AWSTranscribeGetVocabularyFilterResponse class]];
}

- (void) test_AWSTranscribeGetVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeGetVocabularyRequest class]];
}

- (void) test_AWSTranscribeGetVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeGetVocabularyResponse class]];
}

- (void) test_AWSTranscribeInputDataConfig {
    [self validateSecureCodingForClass:[AWSTranscribeInputDataConfig class]];
}

- (void) test_AWSTranscribeJobExecutionSettings {
    [self validateSecureCodingForClass:[AWSTranscribeJobExecutionSettings class]];
}

- (void) test_AWSTranscribeLanguageModel {
    [self validateSecureCodingForClass:[AWSTranscribeLanguageModel class]];
}

- (void) test_AWSTranscribeListLanguageModelsRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListLanguageModelsRequest class]];
}

- (void) test_AWSTranscribeListLanguageModelsResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListLanguageModelsResponse class]];
}

- (void) test_AWSTranscribeListMedicalTranscriptionJobsRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListMedicalTranscriptionJobsRequest class]];
}

- (void) test_AWSTranscribeListMedicalTranscriptionJobsResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListMedicalTranscriptionJobsResponse class]];
}

- (void) test_AWSTranscribeListMedicalVocabulariesRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListMedicalVocabulariesRequest class]];
}

- (void) test_AWSTranscribeListMedicalVocabulariesResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListMedicalVocabulariesResponse class]];
}

- (void) test_AWSTranscribeListTranscriptionJobsRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListTranscriptionJobsRequest class]];
}

- (void) test_AWSTranscribeListTranscriptionJobsResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListTranscriptionJobsResponse class]];
}

- (void) test_AWSTranscribeListVocabulariesRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListVocabulariesRequest class]];
}

- (void) test_AWSTranscribeListVocabulariesResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListVocabulariesResponse class]];
}

- (void) test_AWSTranscribeListVocabularyFiltersRequest {
    [self validateSecureCodingForClass:[AWSTranscribeListVocabularyFiltersRequest class]];
}

- (void) test_AWSTranscribeListVocabularyFiltersResponse {
    [self validateSecureCodingForClass:[AWSTranscribeListVocabularyFiltersResponse class]];
}

- (void) test_AWSTranscribeMedia {
    [self validateSecureCodingForClass:[AWSTranscribeMedia class]];
}

- (void) test_AWSTranscribeMedicalTranscript {
    [self validateSecureCodingForClass:[AWSTranscribeMedicalTranscript class]];
}

- (void) test_AWSTranscribeMedicalTranscriptionJob {
    [self validateSecureCodingForClass:[AWSTranscribeMedicalTranscriptionJob class]];
}

- (void) test_AWSTranscribeMedicalTranscriptionJobSummary {
    [self validateSecureCodingForClass:[AWSTranscribeMedicalTranscriptionJobSummary class]];
}

- (void) test_AWSTranscribeMedicalTranscriptionSetting {
    [self validateSecureCodingForClass:[AWSTranscribeMedicalTranscriptionSetting class]];
}

- (void) test_AWSTranscribeModelSettings {
    [self validateSecureCodingForClass:[AWSTranscribeModelSettings class]];
}

- (void) test_AWSTranscribeSettings {
    [self validateSecureCodingForClass:[AWSTranscribeSettings class]];
}

- (void) test_AWSTranscribeStartMedicalTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeStartMedicalTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeStartMedicalTranscriptionJobResponse {
    [self validateSecureCodingForClass:[AWSTranscribeStartMedicalTranscriptionJobResponse class]];
}

- (void) test_AWSTranscribeStartTranscriptionJobRequest {
    [self validateSecureCodingForClass:[AWSTranscribeStartTranscriptionJobRequest class]];
}

- (void) test_AWSTranscribeStartTranscriptionJobResponse {
    [self validateSecureCodingForClass:[AWSTranscribeStartTranscriptionJobResponse class]];
}

- (void) test_AWSTranscribeTranscript {
    [self validateSecureCodingForClass:[AWSTranscribeTranscript class]];
}

- (void) test_AWSTranscribeTranscriptionJob {
    [self validateSecureCodingForClass:[AWSTranscribeTranscriptionJob class]];
}

- (void) test_AWSTranscribeTranscriptionJobSummary {
    [self validateSecureCodingForClass:[AWSTranscribeTranscriptionJobSummary class]];
}

- (void) test_AWSTranscribeUpdateMedicalVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateMedicalVocabularyRequest class]];
}

- (void) test_AWSTranscribeUpdateMedicalVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateMedicalVocabularyResponse class]];
}

- (void) test_AWSTranscribeUpdateVocabularyFilterRequest {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateVocabularyFilterRequest class]];
}

- (void) test_AWSTranscribeUpdateVocabularyFilterResponse {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateVocabularyFilterResponse class]];
}

- (void) test_AWSTranscribeUpdateVocabularyRequest {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateVocabularyRequest class]];
}

- (void) test_AWSTranscribeUpdateVocabularyResponse {
    [self validateSecureCodingForClass:[AWSTranscribeUpdateVocabularyResponse class]];
}

- (void) test_AWSTranscribeVocabularyFilterInfo {
    [self validateSecureCodingForClass:[AWSTranscribeVocabularyFilterInfo class]];
}

- (void) test_AWSTranscribeVocabularyInfo {
    [self validateSecureCodingForClass:[AWSTranscribeVocabularyInfo class]];
}

@end

