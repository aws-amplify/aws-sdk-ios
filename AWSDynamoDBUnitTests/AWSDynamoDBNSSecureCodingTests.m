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
#import "AWSDynamoDBModel.h"

@interface AWSDynamoDBNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSDynamoDBArchivalSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAttributeDefinition API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAttributeValueUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingPolicyDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingPolicyUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingSettingsDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingSettingsUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBackupDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBackupDetails API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBackupSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchExecuteStatementInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchExecuteStatementOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchGetItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchGetItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchStatementError API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchStatementRequest API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchStatementResponse API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchWriteItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBatchWriteItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBBillingModeSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCancellationReason API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCapacity API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCondition API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBConditionCheck API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBConsumedCapacity API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBContinuousBackupsDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBContributorInsightsSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateBackupInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateBackupOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateGlobalSecondaryIndexAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateGlobalTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateGlobalTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateReplicaAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateReplicationGroupMemberAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCreateTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBCsvOptions API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRemove API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteBackupInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteBackupOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteGlobalSecondaryIndexAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteReplicaAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteReplicationGroupMemberAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteRequest API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDeleteTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeBackupInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeBackupOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeContinuousBackupsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeContinuousBackupsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeContributorInsightsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeContributorInsightsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeEndpointsResponse API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeExportInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeExportOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeGlobalTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeGlobalTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeGlobalTableSettingsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeGlobalTableSettingsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeImportInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeImportOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeKinesisStreamingDestinationInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeKinesisStreamingDestinationOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeLimitsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeLimitsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTableReplicaAutoScalingInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTableReplicaAutoScalingOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTimeToLiveInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBDescribeTimeToLiveOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExecuteStatementInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExecuteStatementOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExecuteTransactionInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExecuteTransactionOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExpectedAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExportDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExportSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExportTableToPointInTimeInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBExportTableToPointInTimeOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBFailureException API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGet API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGetItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGetItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalSecondaryIndex API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalSecondaryIndexAutoScalingUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalSecondaryIndexDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalSecondaryIndexInfo API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalSecondaryIndexUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalTable API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalTableDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBImportSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBImportTableDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBImportTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBImportTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBInputFormatOptions API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBItemCollectionMetrics API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBItemResponse API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBKeySchemaElement API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBKeysAndAttributes API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBKinesisDataStreamDestination API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBKinesisStreamingDestinationInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBKinesisStreamingDestinationOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListBackupsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListBackupsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListContributorInsightsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListContributorInsightsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListExportsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListExportsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListGlobalTablesInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListGlobalTablesOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListImportsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListImportsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListTablesInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListTablesOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListTagsOfResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBListTagsOfResourceOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBLocalSecondaryIndex API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBLocalSecondaryIndexDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBLocalSecondaryIndexInfo API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBParameterizedStatement API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPointInTimeRecoveryDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPointInTimeRecoverySpecification API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBProjection API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBProvisionedThroughput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBProvisionedThroughputDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBProvisionedThroughputOverride API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPut API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPutItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPutItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBPutRequest API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBQueryInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBQueryOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplica API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaAutoScalingDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaAutoScalingUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndex API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaSettingsDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaSettingsUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicaUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBReplicationGroupUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRestoreSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRestoreTableFromBackupInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRestoreTableFromBackupOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRestoreTableToPointInTimeInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBRestoreTableToPointInTimeOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBS3BucketSource API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBSSEDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBSSESpecification API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBScanInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBScanOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBSourceTableDetails API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBSourceTableFeatureDetails API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBStreamSpecification API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTableAutoScalingDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTableClassSummary API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTableCreationParameters API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTableDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTag API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTimeToLiveDescription API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTimeToLiveSpecification API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactGetItem API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactGetItemsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactGetItemsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactWriteItem API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactWriteItemsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBTransactWriteItemsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUntagResourceInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdate API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateContinuousBackupsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateContinuousBackupsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateContributorInsightsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateContributorInsightsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateGlobalSecondaryIndexAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateGlobalTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateGlobalTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateGlobalTableSettingsInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateGlobalTableSettingsOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateItemInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateItemOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateReplicationGroupMemberAction API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTableInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTableOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTableReplicaAutoScalingInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTableReplicaAutoScalingOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTimeToLiveInput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBUpdateTimeToLiveOutput API_AVAILABLE(ios(11));
- (void) test_AWSDynamoDBWriteRequest API_AVAILABLE(ios(11));

@end

@implementation AWSDynamoDBNSSecureCodingTests

- (void) test_AWSDynamoDBArchivalSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBArchivalSummary class]];
}

- (void) test_AWSDynamoDBAttributeDefinition {
    [self validateSecureCodingForClass:[AWSDynamoDBAttributeDefinition class]];
}

- (void) test_AWSDynamoDBAttributeValue {
    [self validateSecureCodingForClass:[AWSDynamoDBAttributeValue class]];
}

- (void) test_AWSDynamoDBAttributeValueUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBAttributeValueUpdate class]];
}

- (void) test_AWSDynamoDBAutoScalingPolicyDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingPolicyDescription class]];
}

- (void) test_AWSDynamoDBAutoScalingPolicyUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingPolicyUpdate class]];
}

- (void) test_AWSDynamoDBAutoScalingSettingsDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingSettingsDescription class]];
}

- (void) test_AWSDynamoDBAutoScalingSettingsUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingSettingsUpdate class]];
}

- (void) test_AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription class]];
}

- (void) test_AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate class]];
}

- (void) test_AWSDynamoDBBackupDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBBackupDescription class]];
}

- (void) test_AWSDynamoDBBackupDetails {
    [self validateSecureCodingForClass:[AWSDynamoDBBackupDetails class]];
}

- (void) test_AWSDynamoDBBackupSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBBackupSummary class]];
}

- (void) test_AWSDynamoDBBatchExecuteStatementInput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchExecuteStatementInput class]];
}

- (void) test_AWSDynamoDBBatchExecuteStatementOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchExecuteStatementOutput class]];
}

- (void) test_AWSDynamoDBBatchGetItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchGetItemInput class]];
}

- (void) test_AWSDynamoDBBatchGetItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchGetItemOutput class]];
}

- (void) test_AWSDynamoDBBatchStatementError {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchStatementError class]];
}

- (void) test_AWSDynamoDBBatchStatementRequest {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchStatementRequest class]];
}

- (void) test_AWSDynamoDBBatchStatementResponse {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchStatementResponse class]];
}

- (void) test_AWSDynamoDBBatchWriteItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchWriteItemInput class]];
}

- (void) test_AWSDynamoDBBatchWriteItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBBatchWriteItemOutput class]];
}

- (void) test_AWSDynamoDBBillingModeSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBBillingModeSummary class]];
}

- (void) test_AWSDynamoDBCancellationReason {
    [self validateSecureCodingForClass:[AWSDynamoDBCancellationReason class]];
}

- (void) test_AWSDynamoDBCapacity {
    [self validateSecureCodingForClass:[AWSDynamoDBCapacity class]];
}

- (void) test_AWSDynamoDBCondition {
    [self validateSecureCodingForClass:[AWSDynamoDBCondition class]];
}

- (void) test_AWSDynamoDBConditionCheck {
    [self validateSecureCodingForClass:[AWSDynamoDBConditionCheck class]];
}

- (void) test_AWSDynamoDBConsumedCapacity {
    [self validateSecureCodingForClass:[AWSDynamoDBConsumedCapacity class]];
}

- (void) test_AWSDynamoDBContinuousBackupsDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBContinuousBackupsDescription class]];
}

- (void) test_AWSDynamoDBContributorInsightsSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBContributorInsightsSummary class]];
}

- (void) test_AWSDynamoDBCreateBackupInput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateBackupInput class]];
}

- (void) test_AWSDynamoDBCreateBackupOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateBackupOutput class]];
}

- (void) test_AWSDynamoDBCreateGlobalSecondaryIndexAction {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateGlobalSecondaryIndexAction class]];
}

- (void) test_AWSDynamoDBCreateGlobalTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateGlobalTableInput class]];
}

- (void) test_AWSDynamoDBCreateGlobalTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateGlobalTableOutput class]];
}

- (void) test_AWSDynamoDBCreateReplicaAction {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateReplicaAction class]];
}

- (void) test_AWSDynamoDBCreateReplicationGroupMemberAction {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateReplicationGroupMemberAction class]];
}

- (void) test_AWSDynamoDBCreateTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateTableInput class]];
}

- (void) test_AWSDynamoDBCreateTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBCreateTableOutput class]];
}

- (void) test_AWSDynamoDBCsvOptions {
    [self validateSecureCodingForClass:[AWSDynamoDBCsvOptions class]];
}

- (void) test_AWSDynamoDBRemove {
    [self validateSecureCodingForClass:[AWSDynamoDBRemove class]];
}

- (void) test_AWSDynamoDBDeleteBackupInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteBackupInput class]];
}

- (void) test_AWSDynamoDBDeleteBackupOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteBackupOutput class]];
}

- (void) test_AWSDynamoDBDeleteGlobalSecondaryIndexAction {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteGlobalSecondaryIndexAction class]];
}

- (void) test_AWSDynamoDBDeleteItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteItemInput class]];
}

- (void) test_AWSDynamoDBDeleteItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteItemOutput class]];
}

- (void) test_AWSDynamoDBDeleteReplicaAction {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteReplicaAction class]];
}

- (void) test_AWSDynamoDBDeleteReplicationGroupMemberAction {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteReplicationGroupMemberAction class]];
}

- (void) test_AWSDynamoDBDeleteRequest {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteRequest class]];
}

- (void) test_AWSDynamoDBDeleteTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteTableInput class]];
}

- (void) test_AWSDynamoDBDeleteTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDeleteTableOutput class]];
}

- (void) test_AWSDynamoDBDescribeBackupInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeBackupInput class]];
}

- (void) test_AWSDynamoDBDescribeBackupOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeBackupOutput class]];
}

- (void) test_AWSDynamoDBDescribeContinuousBackupsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeContinuousBackupsInput class]];
}

- (void) test_AWSDynamoDBDescribeContinuousBackupsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeContinuousBackupsOutput class]];
}

- (void) test_AWSDynamoDBDescribeContributorInsightsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeContributorInsightsInput class]];
}

- (void) test_AWSDynamoDBDescribeContributorInsightsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeContributorInsightsOutput class]];
}

- (void) test_AWSDynamoDBDescribeEndpointsRequest {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeEndpointsRequest class]];
}

- (void) test_AWSDynamoDBDescribeEndpointsResponse {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeEndpointsResponse class]];
}

- (void) test_AWSDynamoDBDescribeExportInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeExportInput class]];
}

- (void) test_AWSDynamoDBDescribeExportOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeExportOutput class]];
}

- (void) test_AWSDynamoDBDescribeGlobalTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeGlobalTableInput class]];
}

- (void) test_AWSDynamoDBDescribeGlobalTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeGlobalTableOutput class]];
}

- (void) test_AWSDynamoDBDescribeGlobalTableSettingsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeGlobalTableSettingsInput class]];
}

- (void) test_AWSDynamoDBDescribeGlobalTableSettingsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeGlobalTableSettingsOutput class]];
}

- (void) test_AWSDynamoDBDescribeImportInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeImportInput class]];
}

- (void) test_AWSDynamoDBDescribeImportOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeImportOutput class]];
}

- (void) test_AWSDynamoDBDescribeKinesisStreamingDestinationInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeKinesisStreamingDestinationInput class]];
}

- (void) test_AWSDynamoDBDescribeKinesisStreamingDestinationOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeKinesisStreamingDestinationOutput class]];
}

- (void) test_AWSDynamoDBDescribeLimitsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeLimitsInput class]];
}

- (void) test_AWSDynamoDBDescribeLimitsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeLimitsOutput class]];
}

- (void) test_AWSDynamoDBDescribeTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTableInput class]];
}

- (void) test_AWSDynamoDBDescribeTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTableOutput class]];
}

- (void) test_AWSDynamoDBDescribeTableReplicaAutoScalingInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTableReplicaAutoScalingInput class]];
}

- (void) test_AWSDynamoDBDescribeTableReplicaAutoScalingOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTableReplicaAutoScalingOutput class]];
}

- (void) test_AWSDynamoDBDescribeTimeToLiveInput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTimeToLiveInput class]];
}

- (void) test_AWSDynamoDBDescribeTimeToLiveOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBDescribeTimeToLiveOutput class]];
}

- (void) test_AWSDynamoDBEndpoint {
    [self validateSecureCodingForClass:[AWSDynamoDBEndpoint class]];
}

- (void) test_AWSDynamoDBExecuteStatementInput {
    [self validateSecureCodingForClass:[AWSDynamoDBExecuteStatementInput class]];
}

- (void) test_AWSDynamoDBExecuteStatementOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBExecuteStatementOutput class]];
}

- (void) test_AWSDynamoDBExecuteTransactionInput {
    [self validateSecureCodingForClass:[AWSDynamoDBExecuteTransactionInput class]];
}

- (void) test_AWSDynamoDBExecuteTransactionOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBExecuteTransactionOutput class]];
}

- (void) test_AWSDynamoDBExpectedAttributeValue {
    [self validateSecureCodingForClass:[AWSDynamoDBExpectedAttributeValue class]];
}

- (void) test_AWSDynamoDBExportDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBExportDescription class]];
}

- (void) test_AWSDynamoDBExportSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBExportSummary class]];
}

- (void) test_AWSDynamoDBExportTableToPointInTimeInput {
    [self validateSecureCodingForClass:[AWSDynamoDBExportTableToPointInTimeInput class]];
}

- (void) test_AWSDynamoDBExportTableToPointInTimeOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBExportTableToPointInTimeOutput class]];
}

- (void) test_AWSDynamoDBFailureException {
    [self validateSecureCodingForClass:[AWSDynamoDBFailureException class]];
}

- (void) test_AWSDynamoDBGet {
    [self validateSecureCodingForClass:[AWSDynamoDBGet class]];
}

- (void) test_AWSDynamoDBGetItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBGetItemInput class]];
}

- (void) test_AWSDynamoDBGetItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBGetItemOutput class]];
}

- (void) test_AWSDynamoDBGlobalSecondaryIndex {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

- (void) test_AWSDynamoDBGlobalSecondaryIndexAutoScalingUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalSecondaryIndexAutoScalingUpdate class]];
}

- (void) test_AWSDynamoDBGlobalSecondaryIndexDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalSecondaryIndexDescription class]];
}

- (void) test_AWSDynamoDBGlobalSecondaryIndexInfo {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalSecondaryIndexInfo class]];
}

- (void) test_AWSDynamoDBGlobalSecondaryIndexUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalSecondaryIndexUpdate class]];
}

- (void) test_AWSDynamoDBGlobalTable {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalTable class]];
}

- (void) test_AWSDynamoDBGlobalTableDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalTableDescription class]];
}

- (void) test_AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate class]];
}

- (void) test_AWSDynamoDBImportSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBImportSummary class]];
}

- (void) test_AWSDynamoDBImportTableDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBImportTableDescription class]];
}

- (void) test_AWSDynamoDBImportTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBImportTableInput class]];
}

- (void) test_AWSDynamoDBImportTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBImportTableOutput class]];
}

- (void) test_AWSDynamoDBInputFormatOptions {
    [self validateSecureCodingForClass:[AWSDynamoDBInputFormatOptions class]];
}

- (void) test_AWSDynamoDBItemCollectionMetrics {
    [self validateSecureCodingForClass:[AWSDynamoDBItemCollectionMetrics class]];
}

- (void) test_AWSDynamoDBItemResponse {
    [self validateSecureCodingForClass:[AWSDynamoDBItemResponse class]];
}

- (void) test_AWSDynamoDBKeySchemaElement {
    [self validateSecureCodingForClass:[AWSDynamoDBKeySchemaElement class]];
}

- (void) test_AWSDynamoDBKeysAndAttributes {
    [self validateSecureCodingForClass:[AWSDynamoDBKeysAndAttributes class]];
}

- (void) test_AWSDynamoDBKinesisDataStreamDestination {
    [self validateSecureCodingForClass:[AWSDynamoDBKinesisDataStreamDestination class]];
}

- (void) test_AWSDynamoDBKinesisStreamingDestinationInput {
    [self validateSecureCodingForClass:[AWSDynamoDBKinesisStreamingDestinationInput class]];
}

- (void) test_AWSDynamoDBKinesisStreamingDestinationOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBKinesisStreamingDestinationOutput class]];
}

- (void) test_AWSDynamoDBListBackupsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListBackupsInput class]];
}

- (void) test_AWSDynamoDBListBackupsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListBackupsOutput class]];
}

- (void) test_AWSDynamoDBListContributorInsightsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListContributorInsightsInput class]];
}

- (void) test_AWSDynamoDBListContributorInsightsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListContributorInsightsOutput class]];
}

- (void) test_AWSDynamoDBListExportsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListExportsInput class]];
}

- (void) test_AWSDynamoDBListExportsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListExportsOutput class]];
}

- (void) test_AWSDynamoDBListGlobalTablesInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListGlobalTablesInput class]];
}

- (void) test_AWSDynamoDBListGlobalTablesOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListGlobalTablesOutput class]];
}

- (void) test_AWSDynamoDBListImportsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListImportsInput class]];
}

- (void) test_AWSDynamoDBListImportsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListImportsOutput class]];
}

- (void) test_AWSDynamoDBListTablesInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListTablesInput class]];
}

- (void) test_AWSDynamoDBListTablesOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListTablesOutput class]];
}

- (void) test_AWSDynamoDBListTagsOfResourceInput {
    [self validateSecureCodingForClass:[AWSDynamoDBListTagsOfResourceInput class]];
}

- (void) test_AWSDynamoDBListTagsOfResourceOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBListTagsOfResourceOutput class]];
}

- (void) test_AWSDynamoDBLocalSecondaryIndex {
    [self validateSecureCodingForClass:[AWSDynamoDBLocalSecondaryIndex class]];
}

- (void) test_AWSDynamoDBLocalSecondaryIndexDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBLocalSecondaryIndexDescription class]];
}

- (void) test_AWSDynamoDBLocalSecondaryIndexInfo {
    [self validateSecureCodingForClass:[AWSDynamoDBLocalSecondaryIndexInfo class]];
}

- (void) test_AWSDynamoDBParameterizedStatement {
    [self validateSecureCodingForClass:[AWSDynamoDBParameterizedStatement class]];
}

- (void) test_AWSDynamoDBPointInTimeRecoveryDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBPointInTimeRecoveryDescription class]];
}

- (void) test_AWSDynamoDBPointInTimeRecoverySpecification {
    [self validateSecureCodingForClass:[AWSDynamoDBPointInTimeRecoverySpecification class]];
}

- (void) test_AWSDynamoDBProjection {
    [self validateSecureCodingForClass:[AWSDynamoDBProjection class]];
}

- (void) test_AWSDynamoDBProvisionedThroughput {
    [self validateSecureCodingForClass:[AWSDynamoDBProvisionedThroughput class]];
}

- (void) test_AWSDynamoDBProvisionedThroughputDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBProvisionedThroughputDescription class]];
}

- (void) test_AWSDynamoDBProvisionedThroughputOverride {
    [self validateSecureCodingForClass:[AWSDynamoDBProvisionedThroughputOverride class]];
}

- (void) test_AWSDynamoDBPut {
    [self validateSecureCodingForClass:[AWSDynamoDBPut class]];
}

- (void) test_AWSDynamoDBPutItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBPutItemInput class]];
}

- (void) test_AWSDynamoDBPutItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBPutItemOutput class]];
}

- (void) test_AWSDynamoDBPutRequest {
    [self validateSecureCodingForClass:[AWSDynamoDBPutRequest class]];
}

- (void) test_AWSDynamoDBQueryInput {
    [self validateSecureCodingForClass:[AWSDynamoDBQueryInput class]];
}

- (void) test_AWSDynamoDBQueryOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBQueryOutput class]];
}

- (void) test_AWSDynamoDBReplica {
    [self validateSecureCodingForClass:[AWSDynamoDBReplica class]];
}

- (void) test_AWSDynamoDBReplicaAutoScalingDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaAutoScalingDescription class]];
}

- (void) test_AWSDynamoDBReplicaAutoScalingUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaAutoScalingUpdate class]];
}

- (void) test_AWSDynamoDBReplicaDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaDescription class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndex {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndex class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingDescription class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndexAutoScalingUpdate class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndexDescription class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription class]];
}

- (void) test_AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate class]];
}

- (void) test_AWSDynamoDBReplicaSettingsDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaSettingsDescription class]];
}

- (void) test_AWSDynamoDBReplicaSettingsUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaSettingsUpdate class]];
}

- (void) test_AWSDynamoDBReplicaUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicaUpdate class]];
}

- (void) test_AWSDynamoDBReplicationGroupUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBReplicationGroupUpdate class]];
}

- (void) test_AWSDynamoDBRestoreSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBRestoreSummary class]];
}

- (void) test_AWSDynamoDBRestoreTableFromBackupInput {
    [self validateSecureCodingForClass:[AWSDynamoDBRestoreTableFromBackupInput class]];
}

- (void) test_AWSDynamoDBRestoreTableFromBackupOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBRestoreTableFromBackupOutput class]];
}

- (void) test_AWSDynamoDBRestoreTableToPointInTimeInput {
    [self validateSecureCodingForClass:[AWSDynamoDBRestoreTableToPointInTimeInput class]];
}

- (void) test_AWSDynamoDBRestoreTableToPointInTimeOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBRestoreTableToPointInTimeOutput class]];
}

- (void) test_AWSDynamoDBS3BucketSource {
    [self validateSecureCodingForClass:[AWSDynamoDBS3BucketSource class]];
}

- (void) test_AWSDynamoDBSSEDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBSSEDescription class]];
}

- (void) test_AWSDynamoDBSSESpecification {
    [self validateSecureCodingForClass:[AWSDynamoDBSSESpecification class]];
}

- (void) test_AWSDynamoDBScanInput {
    [self validateSecureCodingForClass:[AWSDynamoDBScanInput class]];
}

- (void) test_AWSDynamoDBScanOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBScanOutput class]];
}

- (void) test_AWSDynamoDBSourceTableDetails {
    [self validateSecureCodingForClass:[AWSDynamoDBSourceTableDetails class]];
}

- (void) test_AWSDynamoDBSourceTableFeatureDetails {
    [self validateSecureCodingForClass:[AWSDynamoDBSourceTableFeatureDetails class]];
}

- (void) test_AWSDynamoDBStreamSpecification {
    [self validateSecureCodingForClass:[AWSDynamoDBStreamSpecification class]];
}

- (void) test_AWSDynamoDBTableAutoScalingDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBTableAutoScalingDescription class]];
}

- (void) test_AWSDynamoDBTableClassSummary {
    [self validateSecureCodingForClass:[AWSDynamoDBTableClassSummary class]];
}

- (void) test_AWSDynamoDBTableCreationParameters {
    [self validateSecureCodingForClass:[AWSDynamoDBTableCreationParameters class]];
}

- (void) test_AWSDynamoDBTableDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBTableDescription class]];
}

- (void) test_AWSDynamoDBTag {
    [self validateSecureCodingForClass:[AWSDynamoDBTag class]];
}

- (void) test_AWSDynamoDBTagResourceInput {
    [self validateSecureCodingForClass:[AWSDynamoDBTagResourceInput class]];
}

- (void) test_AWSDynamoDBTimeToLiveDescription {
    [self validateSecureCodingForClass:[AWSDynamoDBTimeToLiveDescription class]];
}

- (void) test_AWSDynamoDBTimeToLiveSpecification {
    [self validateSecureCodingForClass:[AWSDynamoDBTimeToLiveSpecification class]];
}

- (void) test_AWSDynamoDBTransactGetItem {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactGetItem class]];
}

- (void) test_AWSDynamoDBTransactGetItemsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactGetItemsInput class]];
}

- (void) test_AWSDynamoDBTransactGetItemsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactGetItemsOutput class]];
}

- (void) test_AWSDynamoDBTransactWriteItem {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactWriteItem class]];
}

- (void) test_AWSDynamoDBTransactWriteItemsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactWriteItemsInput class]];
}

- (void) test_AWSDynamoDBTransactWriteItemsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBTransactWriteItemsOutput class]];
}

- (void) test_AWSDynamoDBUntagResourceInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUntagResourceInput class]];
}

- (void) test_AWSDynamoDBUpdate {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdate class]];
}

- (void) test_AWSDynamoDBUpdateContinuousBackupsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateContinuousBackupsInput class]];
}

- (void) test_AWSDynamoDBUpdateContinuousBackupsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateContinuousBackupsOutput class]];
}

- (void) test_AWSDynamoDBUpdateContributorInsightsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateContributorInsightsInput class]];
}

- (void) test_AWSDynamoDBUpdateContributorInsightsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateContributorInsightsOutput class]];
}

- (void) test_AWSDynamoDBUpdateGlobalSecondaryIndexAction {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateGlobalSecondaryIndexAction class]];
}

- (void) test_AWSDynamoDBUpdateGlobalTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateGlobalTableInput class]];
}

- (void) test_AWSDynamoDBUpdateGlobalTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateGlobalTableOutput class]];
}

- (void) test_AWSDynamoDBUpdateGlobalTableSettingsInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateGlobalTableSettingsInput class]];
}

- (void) test_AWSDynamoDBUpdateGlobalTableSettingsOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateGlobalTableSettingsOutput class]];
}

- (void) test_AWSDynamoDBUpdateItemInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateItemInput class]];
}

- (void) test_AWSDynamoDBUpdateItemOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateItemOutput class]];
}

- (void) test_AWSDynamoDBUpdateReplicationGroupMemberAction {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateReplicationGroupMemberAction class]];
}

- (void) test_AWSDynamoDBUpdateTableInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTableInput class]];
}

- (void) test_AWSDynamoDBUpdateTableOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTableOutput class]];
}

- (void) test_AWSDynamoDBUpdateTableReplicaAutoScalingInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTableReplicaAutoScalingInput class]];
}

- (void) test_AWSDynamoDBUpdateTableReplicaAutoScalingOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTableReplicaAutoScalingOutput class]];
}

- (void) test_AWSDynamoDBUpdateTimeToLiveInput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTimeToLiveInput class]];
}

- (void) test_AWSDynamoDBUpdateTimeToLiveOutput {
    [self validateSecureCodingForClass:[AWSDynamoDBUpdateTimeToLiveOutput class]];
}

- (void) test_AWSDynamoDBWriteRequest {
    [self validateSecureCodingForClass:[AWSDynamoDBWriteRequest class]];
}

@end

