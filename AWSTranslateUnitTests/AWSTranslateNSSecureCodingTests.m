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
#import "AWSTranslateModel.h"

@interface AWSTranslateNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSTranslateAppliedTerminology API_AVAILABLE(ios(11));
- (void) test_AWSTranslateCreateParallelDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateCreateParallelDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateDeleteParallelDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateDeleteParallelDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateDeleteTerminologyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateDescribeTextTranslationJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateDescribeTextTranslationJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateEncryptionKey API_AVAILABLE(ios(11));
- (void) test_AWSTranslateGetParallelDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateGetParallelDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateGetTerminologyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateGetTerminologyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateImportTerminologyRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateImportTerminologyResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateInputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSTranslateJobDetails API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListParallelDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListParallelDataResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListTerminologiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListTerminologiesResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListTextTranslationJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateListTextTranslationJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateOutputDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSTranslateParallelDataConfig API_AVAILABLE(ios(11));
- (void) test_AWSTranslateParallelDataDataLocation API_AVAILABLE(ios(11));
- (void) test_AWSTranslateParallelDataProperties API_AVAILABLE(ios(11));
- (void) test_AWSTranslateStartTextTranslationJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateStartTextTranslationJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateStopTextTranslationJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateStopTextTranslationJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTerm API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTerminologyData API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTerminologyDataLocation API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTerminologyProperties API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTextTranslationJobFilter API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTextTranslationJobProperties API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTranslateTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTranslateTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSTranslateTranslationSettings API_AVAILABLE(ios(11));
- (void) test_AWSTranslateUpdateParallelDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSTranslateUpdateParallelDataResponse API_AVAILABLE(ios(11));

@end

@implementation AWSTranslateNSSecureCodingTests

- (void) test_AWSTranslateAppliedTerminology {
    [self validateSecureCodingForClass:[AWSTranslateAppliedTerminology class]];
}

- (void) test_AWSTranslateCreateParallelDataRequest {
    [self validateSecureCodingForClass:[AWSTranslateCreateParallelDataRequest class]];
}

- (void) test_AWSTranslateCreateParallelDataResponse {
    [self validateSecureCodingForClass:[AWSTranslateCreateParallelDataResponse class]];
}

- (void) test_AWSTranslateDeleteParallelDataRequest {
    [self validateSecureCodingForClass:[AWSTranslateDeleteParallelDataRequest class]];
}

- (void) test_AWSTranslateDeleteParallelDataResponse {
    [self validateSecureCodingForClass:[AWSTranslateDeleteParallelDataResponse class]];
}

- (void) test_AWSTranslateDeleteTerminologyRequest {
    [self validateSecureCodingForClass:[AWSTranslateDeleteTerminologyRequest class]];
}

- (void) test_AWSTranslateDescribeTextTranslationJobRequest {
    [self validateSecureCodingForClass:[AWSTranslateDescribeTextTranslationJobRequest class]];
}

- (void) test_AWSTranslateDescribeTextTranslationJobResponse {
    [self validateSecureCodingForClass:[AWSTranslateDescribeTextTranslationJobResponse class]];
}

- (void) test_AWSTranslateEncryptionKey {
    [self validateSecureCodingForClass:[AWSTranslateEncryptionKey class]];
}

- (void) test_AWSTranslateGetParallelDataRequest {
    [self validateSecureCodingForClass:[AWSTranslateGetParallelDataRequest class]];
}

- (void) test_AWSTranslateGetParallelDataResponse {
    [self validateSecureCodingForClass:[AWSTranslateGetParallelDataResponse class]];
}

- (void) test_AWSTranslateGetTerminologyRequest {
    [self validateSecureCodingForClass:[AWSTranslateGetTerminologyRequest class]];
}

- (void) test_AWSTranslateGetTerminologyResponse {
    [self validateSecureCodingForClass:[AWSTranslateGetTerminologyResponse class]];
}

- (void) test_AWSTranslateImportTerminologyRequest {
    [self validateSecureCodingForClass:[AWSTranslateImportTerminologyRequest class]];
}

- (void) test_AWSTranslateImportTerminologyResponse {
    [self validateSecureCodingForClass:[AWSTranslateImportTerminologyResponse class]];
}

- (void) test_AWSTranslateInputDataConfig {
    [self validateSecureCodingForClass:[AWSTranslateInputDataConfig class]];
}

- (void) test_AWSTranslateJobDetails {
    [self validateSecureCodingForClass:[AWSTranslateJobDetails class]];
}

- (void) test_AWSTranslateListParallelDataRequest {
    [self validateSecureCodingForClass:[AWSTranslateListParallelDataRequest class]];
}

- (void) test_AWSTranslateListParallelDataResponse {
    [self validateSecureCodingForClass:[AWSTranslateListParallelDataResponse class]];
}

- (void) test_AWSTranslateListTerminologiesRequest {
    [self validateSecureCodingForClass:[AWSTranslateListTerminologiesRequest class]];
}

- (void) test_AWSTranslateListTerminologiesResponse {
    [self validateSecureCodingForClass:[AWSTranslateListTerminologiesResponse class]];
}

- (void) test_AWSTranslateListTextTranslationJobsRequest {
    [self validateSecureCodingForClass:[AWSTranslateListTextTranslationJobsRequest class]];
}

- (void) test_AWSTranslateListTextTranslationJobsResponse {
    [self validateSecureCodingForClass:[AWSTranslateListTextTranslationJobsResponse class]];
}

- (void) test_AWSTranslateOutputDataConfig {
    [self validateSecureCodingForClass:[AWSTranslateOutputDataConfig class]];
}

- (void) test_AWSTranslateParallelDataConfig {
    [self validateSecureCodingForClass:[AWSTranslateParallelDataConfig class]];
}

- (void) test_AWSTranslateParallelDataDataLocation {
    [self validateSecureCodingForClass:[AWSTranslateParallelDataDataLocation class]];
}

- (void) test_AWSTranslateParallelDataProperties {
    [self validateSecureCodingForClass:[AWSTranslateParallelDataProperties class]];
}

- (void) test_AWSTranslateStartTextTranslationJobRequest {
    [self validateSecureCodingForClass:[AWSTranslateStartTextTranslationJobRequest class]];
}

- (void) test_AWSTranslateStartTextTranslationJobResponse {
    [self validateSecureCodingForClass:[AWSTranslateStartTextTranslationJobResponse class]];
}

- (void) test_AWSTranslateStopTextTranslationJobRequest {
    [self validateSecureCodingForClass:[AWSTranslateStopTextTranslationJobRequest class]];
}

- (void) test_AWSTranslateStopTextTranslationJobResponse {
    [self validateSecureCodingForClass:[AWSTranslateStopTextTranslationJobResponse class]];
}

- (void) test_AWSTranslateTerm {
    [self validateSecureCodingForClass:[AWSTranslateTerm class]];
}

- (void) test_AWSTranslateTerminologyData {
    [self validateSecureCodingForClass:[AWSTranslateTerminologyData class]];
}

- (void) test_AWSTranslateTerminologyDataLocation {
    [self validateSecureCodingForClass:[AWSTranslateTerminologyDataLocation class]];
}

- (void) test_AWSTranslateTerminologyProperties {
    [self validateSecureCodingForClass:[AWSTranslateTerminologyProperties class]];
}

- (void) test_AWSTranslateTextTranslationJobFilter {
    [self validateSecureCodingForClass:[AWSTranslateTextTranslationJobFilter class]];
}

- (void) test_AWSTranslateTextTranslationJobProperties {
    [self validateSecureCodingForClass:[AWSTranslateTextTranslationJobProperties class]];
}

- (void) test_AWSTranslateTranslateTextRequest {
    [self validateSecureCodingForClass:[AWSTranslateTranslateTextRequest class]];
}

- (void) test_AWSTranslateTranslateTextResponse {
    [self validateSecureCodingForClass:[AWSTranslateTranslateTextResponse class]];
}

- (void) test_AWSTranslateTranslationSettings {
    [self validateSecureCodingForClass:[AWSTranslateTranslationSettings class]];
}

- (void) test_AWSTranslateUpdateParallelDataRequest {
    [self validateSecureCodingForClass:[AWSTranslateUpdateParallelDataRequest class]];
}

- (void) test_AWSTranslateUpdateParallelDataResponse {
    [self validateSecureCodingForClass:[AWSTranslateUpdateParallelDataResponse class]];
}

@end

