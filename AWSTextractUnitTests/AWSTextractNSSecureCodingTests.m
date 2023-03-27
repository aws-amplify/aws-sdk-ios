//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSTextractModel.h"

@interface AWSTextractNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSTextractAnalyzeDocumentRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeDocumentResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeExpenseRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeExpenseResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeIDDetections API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeIDRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractAnalyzeIDResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractBlock API_AVAILABLE(ios(11));
- (void) test_AWSTextractBoundingBox API_AVAILABLE(ios(11));
- (void) test_AWSTextractDetectDocumentTextRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractDetectDocumentTextResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractDetectedSignature API_AVAILABLE(ios(11));
- (void) test_AWSTextractDocument API_AVAILABLE(ios(11));
- (void) test_AWSTextractDocumentGroup API_AVAILABLE(ios(11));
- (void) test_AWSTextractDocumentLocation API_AVAILABLE(ios(11));
- (void) test_AWSTextractDocumentMetadata API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseCurrency API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseDetection API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseDocument API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseField API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseGroupProperty API_AVAILABLE(ios(11));
- (void) test_AWSTextractExpenseType API_AVAILABLE(ios(11));
- (void) test_AWSTextractExtraction API_AVAILABLE(ios(11));
- (void) test_AWSTextractGeometry API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetDocumentAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetDocumentAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetDocumentTextDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetDocumentTextDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetExpenseAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetExpenseAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetLendingAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetLendingAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetLendingAnalysisSummaryRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractGetLendingAnalysisSummaryResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractHumanLoopActivationOutput API_AVAILABLE(ios(11));
- (void) test_AWSTextractHumanLoopConfig API_AVAILABLE(ios(11));
- (void) test_AWSTextractHumanLoopDataAttributes API_AVAILABLE(ios(11));
- (void) test_AWSTextractIdentityDocument API_AVAILABLE(ios(11));
- (void) test_AWSTextractIdentityDocumentField API_AVAILABLE(ios(11));
- (void) test_AWSTextractLendingDetection API_AVAILABLE(ios(11));
- (void) test_AWSTextractLendingDocument API_AVAILABLE(ios(11));
- (void) test_AWSTextractLendingField API_AVAILABLE(ios(11));
- (void) test_AWSTextractLendingResult API_AVAILABLE(ios(11));
- (void) test_AWSTextractLendingSummary API_AVAILABLE(ios(11));
- (void) test_AWSTextractLineItemFields API_AVAILABLE(ios(11));
- (void) test_AWSTextractLineItemGroup API_AVAILABLE(ios(11));
- (void) test_AWSTextractNormalizedValue API_AVAILABLE(ios(11));
- (void) test_AWSTextractNotificationChannel API_AVAILABLE(ios(11));
- (void) test_AWSTextractOutputConfig API_AVAILABLE(ios(11));
- (void) test_AWSTextractPageClassification API_AVAILABLE(ios(11));
- (void) test_AWSTextractPoint API_AVAILABLE(ios(11));
- (void) test_AWSTextractPrediction API_AVAILABLE(ios(11));
- (void) test_AWSTextractQueriesConfig API_AVAILABLE(ios(11));
- (void) test_AWSTextractQuery API_AVAILABLE(ios(11));
- (void) test_AWSTextractRelationship API_AVAILABLE(ios(11));
- (void) test_AWSTextractS3Object API_AVAILABLE(ios(11));
- (void) test_AWSTextractSignatureDetection API_AVAILABLE(ios(11));
- (void) test_AWSTextractSplitDocument API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartDocumentAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartDocumentAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartDocumentTextDetectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartDocumentTextDetectionResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartExpenseAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartExpenseAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartLendingAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSTextractStartLendingAnalysisResponse API_AVAILABLE(ios(11));
- (void) test_AWSTextractUndetectedSignature API_AVAILABLE(ios(11));
- (void) test_AWSTextractWarning API_AVAILABLE(ios(11));

@end

@implementation AWSTextractNSSecureCodingTests

- (void) test_AWSTextractAnalyzeDocumentRequest {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeDocumentRequest class]];
}

- (void) test_AWSTextractAnalyzeDocumentResponse {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeDocumentResponse class]];
}

- (void) test_AWSTextractAnalyzeExpenseRequest {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeExpenseRequest class]];
}

- (void) test_AWSTextractAnalyzeExpenseResponse {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeExpenseResponse class]];
}

- (void) test_AWSTextractAnalyzeIDDetections {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeIDDetections class]];
}

- (void) test_AWSTextractAnalyzeIDRequest {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeIDRequest class]];
}

- (void) test_AWSTextractAnalyzeIDResponse {
    [self validateSecureCodingForClass:[AWSTextractAnalyzeIDResponse class]];
}

- (void) test_AWSTextractBlock {
    [self validateSecureCodingForClass:[AWSTextractBlock class]];
}

- (void) test_AWSTextractBoundingBox {
    [self validateSecureCodingForClass:[AWSTextractBoundingBox class]];
}

- (void) test_AWSTextractDetectDocumentTextRequest {
    [self validateSecureCodingForClass:[AWSTextractDetectDocumentTextRequest class]];
}

- (void) test_AWSTextractDetectDocumentTextResponse {
    [self validateSecureCodingForClass:[AWSTextractDetectDocumentTextResponse class]];
}

- (void) test_AWSTextractDetectedSignature {
    [self validateSecureCodingForClass:[AWSTextractDetectedSignature class]];
}

- (void) test_AWSTextractDocument {
    [self validateSecureCodingForClass:[AWSTextractDocument class]];
}

- (void) test_AWSTextractDocumentGroup {
    [self validateSecureCodingForClass:[AWSTextractDocumentGroup class]];
}

- (void) test_AWSTextractDocumentLocation {
    [self validateSecureCodingForClass:[AWSTextractDocumentLocation class]];
}

- (void) test_AWSTextractDocumentMetadata {
    [self validateSecureCodingForClass:[AWSTextractDocumentMetadata class]];
}

- (void) test_AWSTextractExpenseCurrency {
    [self validateSecureCodingForClass:[AWSTextractExpenseCurrency class]];
}

- (void) test_AWSTextractExpenseDetection {
    [self validateSecureCodingForClass:[AWSTextractExpenseDetection class]];
}

- (void) test_AWSTextractExpenseDocument {
    [self validateSecureCodingForClass:[AWSTextractExpenseDocument class]];
}

- (void) test_AWSTextractExpenseField {
    [self validateSecureCodingForClass:[AWSTextractExpenseField class]];
}

- (void) test_AWSTextractExpenseGroupProperty {
    [self validateSecureCodingForClass:[AWSTextractExpenseGroupProperty class]];
}

- (void) test_AWSTextractExpenseType {
    [self validateSecureCodingForClass:[AWSTextractExpenseType class]];
}

- (void) test_AWSTextractExtraction {
    [self validateSecureCodingForClass:[AWSTextractExtraction class]];
}

- (void) test_AWSTextractGeometry {
    [self validateSecureCodingForClass:[AWSTextractGeometry class]];
}

- (void) test_AWSTextractGetDocumentAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractGetDocumentAnalysisRequest class]];
}

- (void) test_AWSTextractGetDocumentAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractGetDocumentAnalysisResponse class]];
}

- (void) test_AWSTextractGetDocumentTextDetectionRequest {
    [self validateSecureCodingForClass:[AWSTextractGetDocumentTextDetectionRequest class]];
}

- (void) test_AWSTextractGetDocumentTextDetectionResponse {
    [self validateSecureCodingForClass:[AWSTextractGetDocumentTextDetectionResponse class]];
}

- (void) test_AWSTextractGetExpenseAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractGetExpenseAnalysisRequest class]];
}

- (void) test_AWSTextractGetExpenseAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractGetExpenseAnalysisResponse class]];
}

- (void) test_AWSTextractGetLendingAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractGetLendingAnalysisRequest class]];
}

- (void) test_AWSTextractGetLendingAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractGetLendingAnalysisResponse class]];
}

- (void) test_AWSTextractGetLendingAnalysisSummaryRequest {
    [self validateSecureCodingForClass:[AWSTextractGetLendingAnalysisSummaryRequest class]];
}

- (void) test_AWSTextractGetLendingAnalysisSummaryResponse {
    [self validateSecureCodingForClass:[AWSTextractGetLendingAnalysisSummaryResponse class]];
}

- (void) test_AWSTextractHumanLoopActivationOutput {
    [self validateSecureCodingForClass:[AWSTextractHumanLoopActivationOutput class]];
}

- (void) test_AWSTextractHumanLoopConfig {
    [self validateSecureCodingForClass:[AWSTextractHumanLoopConfig class]];
}

- (void) test_AWSTextractHumanLoopDataAttributes {
    [self validateSecureCodingForClass:[AWSTextractHumanLoopDataAttributes class]];
}

- (void) test_AWSTextractIdentityDocument {
    [self validateSecureCodingForClass:[AWSTextractIdentityDocument class]];
}

- (void) test_AWSTextractIdentityDocumentField {
    [self validateSecureCodingForClass:[AWSTextractIdentityDocumentField class]];
}

- (void) test_AWSTextractLendingDetection {
    [self validateSecureCodingForClass:[AWSTextractLendingDetection class]];
}

- (void) test_AWSTextractLendingDocument {
    [self validateSecureCodingForClass:[AWSTextractLendingDocument class]];
}

- (void) test_AWSTextractLendingField {
    [self validateSecureCodingForClass:[AWSTextractLendingField class]];
}

- (void) test_AWSTextractLendingResult {
    [self validateSecureCodingForClass:[AWSTextractLendingResult class]];
}

- (void) test_AWSTextractLendingSummary {
    [self validateSecureCodingForClass:[AWSTextractLendingSummary class]];
}

- (void) test_AWSTextractLineItemFields {
    [self validateSecureCodingForClass:[AWSTextractLineItemFields class]];
}

- (void) test_AWSTextractLineItemGroup {
    [self validateSecureCodingForClass:[AWSTextractLineItemGroup class]];
}

- (void) test_AWSTextractNormalizedValue {
    [self validateSecureCodingForClass:[AWSTextractNormalizedValue class]];
}

- (void) test_AWSTextractNotificationChannel {
    [self validateSecureCodingForClass:[AWSTextractNotificationChannel class]];
}

- (void) test_AWSTextractOutputConfig {
    [self validateSecureCodingForClass:[AWSTextractOutputConfig class]];
}

- (void) test_AWSTextractPageClassification {
    [self validateSecureCodingForClass:[AWSTextractPageClassification class]];
}

- (void) test_AWSTextractPoint {
    [self validateSecureCodingForClass:[AWSTextractPoint class]];
}

- (void) test_AWSTextractPrediction {
    [self validateSecureCodingForClass:[AWSTextractPrediction class]];
}

- (void) test_AWSTextractQueriesConfig {
    [self validateSecureCodingForClass:[AWSTextractQueriesConfig class]];
}

- (void) test_AWSTextractQuery {
    [self validateSecureCodingForClass:[AWSTextractQuery class]];
}

- (void) test_AWSTextractRelationship {
    [self validateSecureCodingForClass:[AWSTextractRelationship class]];
}

- (void) test_AWSTextractS3Object {
    [self validateSecureCodingForClass:[AWSTextractS3Object class]];
}

- (void) test_AWSTextractSignatureDetection {
    [self validateSecureCodingForClass:[AWSTextractSignatureDetection class]];
}

- (void) test_AWSTextractSplitDocument {
    [self validateSecureCodingForClass:[AWSTextractSplitDocument class]];
}

- (void) test_AWSTextractStartDocumentAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractStartDocumentAnalysisRequest class]];
}

- (void) test_AWSTextractStartDocumentAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractStartDocumentAnalysisResponse class]];
}

- (void) test_AWSTextractStartDocumentTextDetectionRequest {
    [self validateSecureCodingForClass:[AWSTextractStartDocumentTextDetectionRequest class]];
}

- (void) test_AWSTextractStartDocumentTextDetectionResponse {
    [self validateSecureCodingForClass:[AWSTextractStartDocumentTextDetectionResponse class]];
}

- (void) test_AWSTextractStartExpenseAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractStartExpenseAnalysisRequest class]];
}

- (void) test_AWSTextractStartExpenseAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractStartExpenseAnalysisResponse class]];
}

- (void) test_AWSTextractStartLendingAnalysisRequest {
    [self validateSecureCodingForClass:[AWSTextractStartLendingAnalysisRequest class]];
}

- (void) test_AWSTextractStartLendingAnalysisResponse {
    [self validateSecureCodingForClass:[AWSTextractStartLendingAnalysisResponse class]];
}

- (void) test_AWSTextractUndetectedSignature {
    [self validateSecureCodingForClass:[AWSTextractUndetectedSignature class]];
}

- (void) test_AWSTextractWarning {
    [self validateSecureCodingForClass:[AWSTextractWarning class]];
}

@end

