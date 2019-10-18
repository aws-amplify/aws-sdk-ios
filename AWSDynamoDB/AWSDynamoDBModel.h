//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSDynamoDBErrorDomain;

typedef NS_ENUM(NSInteger, AWSDynamoDBErrorType) {
    AWSDynamoDBErrorUnknown,
    AWSDynamoDBErrorBackupInUse,
    AWSDynamoDBErrorBackupNotFound,
    AWSDynamoDBErrorConditionalCheckFailed,
    AWSDynamoDBErrorContinuousBackupsUnavailable,
    AWSDynamoDBErrorGlobalTableAlreadyExists,
    AWSDynamoDBErrorGlobalTableNotFound,
    AWSDynamoDBErrorIdempotentParameterMismatch,
    AWSDynamoDBErrorIndexNotFound,
    AWSDynamoDBErrorInternalServer,
    AWSDynamoDBErrorInvalidRestoreTime,
    AWSDynamoDBErrorItemCollectionSizeLimitExceeded,
    AWSDynamoDBErrorLimitExceeded,
    AWSDynamoDBErrorPointInTimeRecoveryUnavailable,
    AWSDynamoDBErrorProvisionedThroughputExceeded,
    AWSDynamoDBErrorReplicaAlreadyExists,
    AWSDynamoDBErrorReplicaNotFound,
    AWSDynamoDBErrorRequestLimitExceeded,
    AWSDynamoDBErrorResourceInUse,
    AWSDynamoDBErrorResourceNotFound,
    AWSDynamoDBErrorTableAlreadyExists,
    AWSDynamoDBErrorTableInUse,
    AWSDynamoDBErrorTableNotFound,
    AWSDynamoDBErrorTransactionCanceled,
    AWSDynamoDBErrorTransactionConflict,
    AWSDynamoDBErrorTransactionInProgress,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBAttributeAction) {
    AWSDynamoDBAttributeActionUnknown,
    AWSDynamoDBAttributeActionAdd,
    AWSDynamoDBAttributeActionPut,
    AWSDynamoDBAttributeActionDelete,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBBackupStatus) {
    AWSDynamoDBBackupStatusUnknown,
    AWSDynamoDBBackupStatusCreating,
    AWSDynamoDBBackupStatusDeleted,
    AWSDynamoDBBackupStatusAvailable,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBBackupType) {
    AWSDynamoDBBackupTypeUnknown,
    AWSDynamoDBBackupTypeUser,
    AWSDynamoDBBackupTypeSystem,
    AWSDynamoDBBackupTypeAwsBackup,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBBackupTypeFilter) {
    AWSDynamoDBBackupTypeFilterUnknown,
    AWSDynamoDBBackupTypeFilterUser,
    AWSDynamoDBBackupTypeFilterSystem,
    AWSDynamoDBBackupTypeFilterAwsBackup,
    AWSDynamoDBBackupTypeFilterAll,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBBillingMode) {
    AWSDynamoDBBillingModeUnknown,
    AWSDynamoDBBillingModeProvisioned,
    AWSDynamoDBBillingModePayPerRequest,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBComparisonOperator) {
    AWSDynamoDBComparisonOperatorUnknown,
    AWSDynamoDBComparisonOperatorEQ,
    AWSDynamoDBComparisonOperatorNE,
    AWSDynamoDBComparisonOperatorIN,
    AWSDynamoDBComparisonOperatorLE,
    AWSDynamoDBComparisonOperatorLT,
    AWSDynamoDBComparisonOperatorGE,
    AWSDynamoDBComparisonOperatorGT,
    AWSDynamoDBComparisonOperatorBetween,
    AWSDynamoDBComparisonOperatorNotNull,
    AWSDynamoDBComparisonOperatorNull,
    AWSDynamoDBComparisonOperatorContains,
    AWSDynamoDBComparisonOperatorNotContains,
    AWSDynamoDBComparisonOperatorBeginsWith,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBConditionalOperator) {
    AWSDynamoDBConditionalOperatorUnknown,
    AWSDynamoDBConditionalOperatorAnd,
    AWSDynamoDBConditionalOperatorOr,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBContinuousBackupsStatus) {
    AWSDynamoDBContinuousBackupsStatusUnknown,
    AWSDynamoDBContinuousBackupsStatusEnabled,
    AWSDynamoDBContinuousBackupsStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBGlobalTableStatus) {
    AWSDynamoDBGlobalTableStatusUnknown,
    AWSDynamoDBGlobalTableStatusCreating,
    AWSDynamoDBGlobalTableStatusActive,
    AWSDynamoDBGlobalTableStatusDeleting,
    AWSDynamoDBGlobalTableStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBIndexStatus) {
    AWSDynamoDBIndexStatusUnknown,
    AWSDynamoDBIndexStatusCreating,
    AWSDynamoDBIndexStatusUpdating,
    AWSDynamoDBIndexStatusDeleting,
    AWSDynamoDBIndexStatusActive,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBKeyType) {
    AWSDynamoDBKeyTypeUnknown,
    AWSDynamoDBKeyTypeHash,
    AWSDynamoDBKeyTypeRange,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBPointInTimeRecoveryStatus) {
    AWSDynamoDBPointInTimeRecoveryStatusUnknown,
    AWSDynamoDBPointInTimeRecoveryStatusEnabled,
    AWSDynamoDBPointInTimeRecoveryStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBProjectionType) {
    AWSDynamoDBProjectionTypeUnknown,
    AWSDynamoDBProjectionTypeAll,
    AWSDynamoDBProjectionTypeKeysOnly,
    AWSDynamoDBProjectionTypeInclude,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBReplicaStatus) {
    AWSDynamoDBReplicaStatusUnknown,
    AWSDynamoDBReplicaStatusCreating,
    AWSDynamoDBReplicaStatusUpdating,
    AWSDynamoDBReplicaStatusDeleting,
    AWSDynamoDBReplicaStatusActive,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBReturnConsumedCapacity) {
    AWSDynamoDBReturnConsumedCapacityUnknown,
    AWSDynamoDBReturnConsumedCapacityIndexes,
    AWSDynamoDBReturnConsumedCapacityTotal,
    AWSDynamoDBReturnConsumedCapacityNone,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBReturnItemCollectionMetrics) {
    AWSDynamoDBReturnItemCollectionMetricsUnknown,
    AWSDynamoDBReturnItemCollectionMetricsSize,
    AWSDynamoDBReturnItemCollectionMetricsNone,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBReturnValue) {
    AWSDynamoDBReturnValueUnknown,
    AWSDynamoDBReturnValueNone,
    AWSDynamoDBReturnValueAllOld,
    AWSDynamoDBReturnValueUpdatedOld,
    AWSDynamoDBReturnValueAllNew,
    AWSDynamoDBReturnValueUpdatedNew,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBReturnValuesOnConditionCheckFailure) {
    AWSDynamoDBReturnValuesOnConditionCheckFailureUnknown,
    AWSDynamoDBReturnValuesOnConditionCheckFailureAllOld,
    AWSDynamoDBReturnValuesOnConditionCheckFailureNone,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBSSEStatus) {
    AWSDynamoDBSSEStatusUnknown,
    AWSDynamoDBSSEStatusEnabling,
    AWSDynamoDBSSEStatusEnabled,
    AWSDynamoDBSSEStatusDisabling,
    AWSDynamoDBSSEStatusDisabled,
    AWSDynamoDBSSEStatusUpdating,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBSSEType) {
    AWSDynamoDBSSETypeUnknown,
    AWSDynamoDBSSETypeAES256,
    AWSDynamoDBSSETypeKms,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBScalarAttributeType) {
    AWSDynamoDBScalarAttributeTypeUnknown,
    AWSDynamoDBScalarAttributeTypeS,
    AWSDynamoDBScalarAttributeTypeN,
    AWSDynamoDBScalarAttributeTypeB,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBSelect) {
    AWSDynamoDBSelectUnknown,
    AWSDynamoDBSelectAllAttributes,
    AWSDynamoDBSelectAllProjectedAttributes,
    AWSDynamoDBSelectSpecificAttributes,
    AWSDynamoDBSelectCount,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBStreamViewType) {
    AWSDynamoDBStreamViewTypeUnknown,
    AWSDynamoDBStreamViewTypeNewImage,
    AWSDynamoDBStreamViewTypeOldImage,
    AWSDynamoDBStreamViewTypeNewAndOldImages,
    AWSDynamoDBStreamViewTypeKeysOnly,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBTableStatus) {
    AWSDynamoDBTableStatusUnknown,
    AWSDynamoDBTableStatusCreating,
    AWSDynamoDBTableStatusUpdating,
    AWSDynamoDBTableStatusDeleting,
    AWSDynamoDBTableStatusActive,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBTimeToLiveStatus) {
    AWSDynamoDBTimeToLiveStatusUnknown,
    AWSDynamoDBTimeToLiveStatusEnabling,
    AWSDynamoDBTimeToLiveStatusDisabling,
    AWSDynamoDBTimeToLiveStatusEnabled,
    AWSDynamoDBTimeToLiveStatusDisabled,
};

@class AWSDynamoDBAttributeDefinition;
@class AWSDynamoDBAttributeValue;
@class AWSDynamoDBAttributeValueUpdate;
@class AWSDynamoDBAutoScalingPolicyDescription;
@class AWSDynamoDBAutoScalingPolicyUpdate;
@class AWSDynamoDBAutoScalingSettingsDescription;
@class AWSDynamoDBAutoScalingSettingsUpdate;
@class AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription;
@class AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate;
@class AWSDynamoDBBackupDescription;
@class AWSDynamoDBBackupDetails;
@class AWSDynamoDBBackupSummary;
@class AWSDynamoDBBatchGetItemInput;
@class AWSDynamoDBBatchGetItemOutput;
@class AWSDynamoDBBatchWriteItemInput;
@class AWSDynamoDBBatchWriteItemOutput;
@class AWSDynamoDBBillingModeSummary;
@class AWSDynamoDBCancellationReason;
@class AWSDynamoDBCapacity;
@class AWSDynamoDBCondition;
@class AWSDynamoDBConditionCheck;
@class AWSDynamoDBConsumedCapacity;
@class AWSDynamoDBContinuousBackupsDescription;
@class AWSDynamoDBCreateBackupInput;
@class AWSDynamoDBCreateBackupOutput;
@class AWSDynamoDBCreateGlobalSecondaryIndexAction;
@class AWSDynamoDBCreateGlobalTableInput;
@class AWSDynamoDBCreateGlobalTableOutput;
@class AWSDynamoDBCreateReplicaAction;
@class AWSDynamoDBCreateTableInput;
@class AWSDynamoDBCreateTableOutput;
@class AWSDynamoDBRemove;
@class AWSDynamoDBDeleteBackupInput;
@class AWSDynamoDBDeleteBackupOutput;
@class AWSDynamoDBDeleteGlobalSecondaryIndexAction;
@class AWSDynamoDBDeleteItemInput;
@class AWSDynamoDBDeleteItemOutput;
@class AWSDynamoDBDeleteReplicaAction;
@class AWSDynamoDBDeleteRequest;
@class AWSDynamoDBDeleteTableInput;
@class AWSDynamoDBDeleteTableOutput;
@class AWSDynamoDBDescribeBackupInput;
@class AWSDynamoDBDescribeBackupOutput;
@class AWSDynamoDBDescribeContinuousBackupsInput;
@class AWSDynamoDBDescribeContinuousBackupsOutput;
@class AWSDynamoDBDescribeEndpointsRequest;
@class AWSDynamoDBDescribeEndpointsResponse;
@class AWSDynamoDBDescribeGlobalTableInput;
@class AWSDynamoDBDescribeGlobalTableOutput;
@class AWSDynamoDBDescribeGlobalTableSettingsInput;
@class AWSDynamoDBDescribeGlobalTableSettingsOutput;
@class AWSDynamoDBDescribeLimitsInput;
@class AWSDynamoDBDescribeLimitsOutput;
@class AWSDynamoDBDescribeTableInput;
@class AWSDynamoDBDescribeTableOutput;
@class AWSDynamoDBDescribeTimeToLiveInput;
@class AWSDynamoDBDescribeTimeToLiveOutput;
@class AWSDynamoDBEndpoint;
@class AWSDynamoDBExpectedAttributeValue;
@class AWSDynamoDBGet;
@class AWSDynamoDBGetItemInput;
@class AWSDynamoDBGetItemOutput;
@class AWSDynamoDBGlobalSecondaryIndex;
@class AWSDynamoDBGlobalSecondaryIndexDescription;
@class AWSDynamoDBGlobalSecondaryIndexInfo;
@class AWSDynamoDBGlobalSecondaryIndexUpdate;
@class AWSDynamoDBGlobalTable;
@class AWSDynamoDBGlobalTableDescription;
@class AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate;
@class AWSDynamoDBItemCollectionMetrics;
@class AWSDynamoDBItemResponse;
@class AWSDynamoDBKeySchemaElement;
@class AWSDynamoDBKeysAndAttributes;
@class AWSDynamoDBListBackupsInput;
@class AWSDynamoDBListBackupsOutput;
@class AWSDynamoDBListGlobalTablesInput;
@class AWSDynamoDBListGlobalTablesOutput;
@class AWSDynamoDBListTablesInput;
@class AWSDynamoDBListTablesOutput;
@class AWSDynamoDBListTagsOfResourceInput;
@class AWSDynamoDBListTagsOfResourceOutput;
@class AWSDynamoDBLocalSecondaryIndex;
@class AWSDynamoDBLocalSecondaryIndexDescription;
@class AWSDynamoDBLocalSecondaryIndexInfo;
@class AWSDynamoDBPointInTimeRecoveryDescription;
@class AWSDynamoDBPointInTimeRecoverySpecification;
@class AWSDynamoDBProjection;
@class AWSDynamoDBProvisionedThroughput;
@class AWSDynamoDBProvisionedThroughputDescription;
@class AWSDynamoDBPut;
@class AWSDynamoDBPutItemInput;
@class AWSDynamoDBPutItemOutput;
@class AWSDynamoDBPutRequest;
@class AWSDynamoDBQueryInput;
@class AWSDynamoDBQueryOutput;
@class AWSDynamoDBReplica;
@class AWSDynamoDBReplicaDescription;
@class AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription;
@class AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate;
@class AWSDynamoDBReplicaSettingsDescription;
@class AWSDynamoDBReplicaSettingsUpdate;
@class AWSDynamoDBReplicaUpdate;
@class AWSDynamoDBRestoreSummary;
@class AWSDynamoDBRestoreTableFromBackupInput;
@class AWSDynamoDBRestoreTableFromBackupOutput;
@class AWSDynamoDBRestoreTableToPointInTimeInput;
@class AWSDynamoDBRestoreTableToPointInTimeOutput;
@class AWSDynamoDBSSEDescription;
@class AWSDynamoDBSSESpecification;
@class AWSDynamoDBScanInput;
@class AWSDynamoDBScanOutput;
@class AWSDynamoDBSourceTableDetails;
@class AWSDynamoDBSourceTableFeatureDetails;
@class AWSDynamoDBStreamSpecification;
@class AWSDynamoDBTableDescription;
@class AWSDynamoDBTag;
@class AWSDynamoDBTagResourceInput;
@class AWSDynamoDBTimeToLiveDescription;
@class AWSDynamoDBTimeToLiveSpecification;
@class AWSDynamoDBTransactGetItem;
@class AWSDynamoDBTransactGetItemsInput;
@class AWSDynamoDBTransactGetItemsOutput;
@class AWSDynamoDBTransactWriteItem;
@class AWSDynamoDBTransactWriteItemsInput;
@class AWSDynamoDBTransactWriteItemsOutput;
@class AWSDynamoDBUntagResourceInput;
@class AWSDynamoDBUpdate;
@class AWSDynamoDBUpdateContinuousBackupsInput;
@class AWSDynamoDBUpdateContinuousBackupsOutput;
@class AWSDynamoDBUpdateGlobalSecondaryIndexAction;
@class AWSDynamoDBUpdateGlobalTableInput;
@class AWSDynamoDBUpdateGlobalTableOutput;
@class AWSDynamoDBUpdateGlobalTableSettingsInput;
@class AWSDynamoDBUpdateGlobalTableSettingsOutput;
@class AWSDynamoDBUpdateItemInput;
@class AWSDynamoDBUpdateItemOutput;
@class AWSDynamoDBUpdateTableInput;
@class AWSDynamoDBUpdateTableOutput;
@class AWSDynamoDBUpdateTimeToLiveInput;
@class AWSDynamoDBUpdateTimeToLiveOutput;
@class AWSDynamoDBWriteRequest;

/**
 <p>Represents an attribute for describing the key schema for the table and indexes.</p>
 Required parameters: [AttributeName, AttributeType]
 */
@interface AWSDynamoDBAttributeDefinition : AWSModel


/**
 <p>A name for the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The data type for the attribute, where:</p><ul><li><p><code>S</code> - the attribute is of type String</p></li><li><p><code>N</code> - the attribute is of type Number</p></li><li><p><code>B</code> - the attribute is of type Binary</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBScalarAttributeType attributeType;

@end

/**
 <p>Represents the data for an attribute.</p><p>Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@interface AWSDynamoDBAttributeValue : AWSModel


/**
 <p>An attribute of type Binary. For example:</p><p><code>"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"</code></p>
 */
@property (nonatomic, strong) NSData * _Nullable B;

/**
 <p>An attribute of type Boolean. For example:</p><p><code>"BOOL": true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable BOOLEAN;

/**
 <p>An attribute of type Binary Set. For example:</p><p><code>"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]</code></p>
 */
@property (nonatomic, strong) NSArray<NSData *> * _Nullable BS;

/**
 <p>An attribute of type List. For example:</p><p><code>"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]</code></p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable L;

/**
 <p>An attribute of type Map. For example:</p><p><code>"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable M;

/**
 <p>An attribute of type Number. For example:</p><p><code>"N": "123.45"</code></p><p>Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable N;

/**
 <p>An attribute of type Number Set. For example:</p><p><code>"NS": ["42.2", "-19", "7.5", "3.14"]</code></p><p>Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB treats them as number type attributes for mathematical operations.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable NS;

/**
 <p>An attribute of type Null. For example:</p><p><code>"NULL": true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable NIL;

/**
 <p>An attribute of type String. For example:</p><p><code>"S": "Hello"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable S;

/**
 <p>An attribute of type String Set. For example:</p><p><code>"SS": ["Giraffe", "Hippo" ,"Zebra"]</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable SS;

@end

/**
 <p>For the <code>UpdateItem</code> operation, represents the attributes to be modified, the action to perform on each, and the new value for each.</p><note><p>You cannot use <code>UpdateItem</code> to update any primary key attributes. Instead, you will need to delete the item, and then use <code>PutItem</code> to create a new item with new attributes.</p></note><p>Attribute values cannot be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests with empty values will be rejected with a <code>ValidationException</code> exception.</p>
 */
@interface AWSDynamoDBAttributeValueUpdate : AWSModel


/**
 <p>Specifies how to perform the update. Valid values are <code>PUT</code> (default), <code>DELETE</code>, and <code>ADD</code>. The behavior depends on whether the specified primary key already exists in the table.</p><p><b>If an item with the specified <i>Key</i> is found in the table:</b></p><ul><li><p><code>PUT</code> - Adds the specified attribute to the item. If the attribute already exists, it is replaced by the new value. </p></li><li><p><code>DELETE</code> - If no value is specified, the attribute and its value are removed from the item. The data type of the specified value must match the existing value's data type.</p><p>If a <i>set</i> of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set <code>[a,b,c]</code> and the <code>DELETE</code> action specified <code>[a,c]</code>, then the final attribute value would be <code>[b]</code>. Specifying an empty set is an error.</p></li><li><p><code>ADD</code> - If the attribute does not already exist, then the attribute and its values are added to the item. If the attribute does exist, then the behavior of <code>ADD</code> depends on the data type of the attribute:</p><ul><li><p>If the existing attribute is a number, and if <code>Value</code> is also a number, then the <code>Value</code> is mathematically added to the existing attribute. If <code>Value</code> is a negative number, then it is subtracted from the existing attribute.</p><note><p> If you use <code>ADD</code> to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses 0 as the initial value.</p><p>In addition, if you use <code>ADD</code> to update an existing item, and intend to increment or decrement an attribute value which does not yet exist, DynamoDB uses <code>0</code> as the initial value. For example, suppose that the item you want to update does not yet have an attribute named <i>itemcount</i>, but you decide to <code>ADD</code> the number <code>3</code> to this attribute anyway, even though it currently does not exist. DynamoDB will create the <i>itemcount</i> attribute, set its initial value to <code>0</code>, and finally add <code>3</code> to it. The result will be a new <i>itemcount</i> attribute in the item, with a value of <code>3</code>.</p></note></li><li><p>If the existing data type is a set, and if the <code>Value</code> is also a set, then the <code>Value</code> is added to the existing set. (This is a <i>set</i> operation, not mathematical addition.) For example, if the attribute value was the set <code>[1,2]</code>, and the <code>ADD</code> action specified <code>[3]</code>, then the final attribute value would be <code>[1,2,3]</code>. An error occurs if an Add action is specified for a set attribute and the attribute type specified does not match the existing set type. </p><p>Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the <code>Value</code> must also be a set of strings. The same holds true for number sets and binary sets.</p></li></ul><p>This action is only valid for an existing attribute whose data type is number or is a set. Do not use <code>ADD</code> for any other data types.</p></li></ul><p><b>If no item with the specified <i>Key</i> is found:</b></p><ul><li><p><code>PUT</code> - DynamoDB creates a new item with the specified primary key, and then adds the attribute. </p></li><li><p><code>DELETE</code> - Nothing happens; there is no attribute to delete.</p></li><li><p><code>ADD</code> - DynamoDB creates an item with the supplied primary key and number (or set of numbers) for the attribute value. The only data types allowed are number and number set; no other data types can be specified.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBAttributeAction action;

/**
 <p>Represents the data for an attribute.</p><p>Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data Types</a> in the <i>Amazon DynamoDB Developer Guide</i>. </p>
 */
@property (nonatomic, strong) AWSDynamoDBAttributeValue * _Nullable value;

@end

/**
 <p>Represents the properties of the scaling policy.</p>
 */
@interface AWSDynamoDBAutoScalingPolicyDescription : AWSModel


/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Represents a target tracking scaling policy configuration.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription * _Nullable targetTrackingScalingPolicyConfiguration;

@end

/**
 <p>Represents the autoscaling policy to be modified.</p>
 Required parameters: [TargetTrackingScalingPolicyConfiguration]
 */
@interface AWSDynamoDBAutoScalingPolicyUpdate : AWSModel


/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Represents a target tracking scaling policy configuration.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate * _Nullable targetTrackingScalingPolicyConfiguration;

@end

/**
 <p>Represents the autoscaling settings for a global table or global secondary index.</p>
 */
@interface AWSDynamoDBAutoScalingSettingsDescription : AWSModel


/**
 <p>Disabled autoscaling for this global table or global secondary index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoScalingDisabled;

/**
 <p>Role ARN used for configuring autoScaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingRoleArn;

/**
 <p>The maximum capacity units that a global table or global secondary index should be scaled up to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumUnits;

/**
 <p>The minimum capacity units that a global table or global secondary index should be scaled down to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumUnits;

/**
 <p>Information about the scaling policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAutoScalingPolicyDescription *> * _Nullable scalingPolicies;

@end

/**
 <p>Represents the autoscaling settings to be modified for a global table or global secondary index.</p>
 */
@interface AWSDynamoDBAutoScalingSettingsUpdate : AWSModel


/**
 <p>Disabled autoscaling for this global table or global secondary index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoScalingDisabled;

/**
 <p>Role ARN used for configuring autoscaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingRoleArn;

/**
 <p>The maximum capacity units that a global table or global secondary index should be scaled up to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumUnits;

/**
 <p>The minimum capacity units that a global table or global secondary index should be scaled down to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumUnits;

/**
 <p>The scaling policy to apply for scaling target global table or global secondary index capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingPolicyUpdate * _Nullable scalingPolicyUpdate;

@end

/**
 <p>Represents the properties of a target tracking scaling policy.</p>
 Required parameters: [TargetValue]
 */
@interface AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationDescription : AWSModel


/**
 <p>Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in is disabled and the target tracking policy won't remove capacity from the scalable resource. Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable resource. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableScaleIn;

/**
 <p>The amount of time, in seconds, after a scale in activity completes before another scale in activity can start. The cooldown period is used to block subsequent scale in requests until it has expired. You should scale in conservatively to protect your application's availability. However, if another alarm triggers a scale out policy during the cooldown period after a scale-in, application autoscaling scales out your scalable target immediately. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleInCooldown;

/**
 <p>The amount of time, in seconds, after a scale out activity completes before another scale out activity can start. While the cooldown period is in effect, the capacity that has been added by the previous scale out event that initiated the cooldown is calculated as part of the desired capacity for the next scale out. You should continuously (but not excessively) scale out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleOutCooldown;

/**
 <p>The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetValue;

@end

/**
 <p>Represents the settings of a target tracking scaling policy that will be modified.</p>
 Required parameters: [TargetValue]
 */
@interface AWSDynamoDBAutoScalingTargetTrackingScalingPolicyConfigurationUpdate : AWSModel


/**
 <p>Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in is disabled and the target tracking policy won't remove capacity from the scalable resource. Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable resource. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableScaleIn;

/**
 <p>The amount of time, in seconds, after a scale in activity completes before another scale in activity can start. The cooldown period is used to block subsequent scale in requests until it has expired. You should scale in conservatively to protect your application's availability. However, if another alarm triggers a scale out policy during the cooldown period after a scale-in, application autoscaling scales out your scalable target immediately. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleInCooldown;

/**
 <p>The amount of time, in seconds, after a scale out activity completes before another scale out activity can start. While the cooldown period is in effect, the capacity that has been added by the previous scale out event that initiated the cooldown is calculated as part of the desired capacity for the next scale out. You should continuously (but not excessively) scale out.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scaleOutCooldown;

/**
 <p>The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetValue;

@end

/**
 <p>Contains the description of the backup created for the table.</p>
 */
@interface AWSDynamoDBBackupDescription : AWSModel


/**
 <p>Contains the details of the backup created for the table. </p>
 */
@property (nonatomic, strong) AWSDynamoDBBackupDetails * _Nullable backupDetails;

/**
 <p>Contains the details of the table when the backup was created. </p>
 */
@property (nonatomic, strong) AWSDynamoDBSourceTableDetails * _Nullable sourceTableDetails;

/**
 <p>Contains the details of the features enabled on the table when the backup was created. For example, LSIs, GSIs, streams, TTL.</p>
 */
@property (nonatomic, strong) AWSDynamoDBSourceTableFeatureDetails * _Nullable sourceTableFeatureDetails;

@end

/**
 <p>Contains the details of the backup created for the table.</p>
 Required parameters: [BackupArn, BackupName, BackupStatus, BackupType, BackupCreationDateTime]
 */
@interface AWSDynamoDBBackupDetails : AWSModel


/**
 <p>ARN associated with the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

/**
 <p>Time at which the backup was created. This is the request time of the backup. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable backupCreationDateTime;

/**
 <p>Time at which the automatic on-demand backup created by DynamoDB will expire. This <code>SYSTEM</code> on-demand backup expires automatically 35 days after its creation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backupExpiryDateTime;

/**
 <p>Name of the requested backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupName;

/**
 <p>Size of the backup in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeBytes;

/**
 <p>Backup can be in one of the following states: CREATING, ACTIVE, DELETED. </p>
 */
@property (nonatomic, assign) AWSDynamoDBBackupStatus backupStatus;

/**
 <p>BackupType:</p><ul><li><p><code>USER</code> - You create and manage these using the on-demand backup feature.</p></li><li><p><code>SYSTEM</code> - If you delete a table with point-in-time recovery enabled, a <code>SYSTEM</code> backup is automatically created and is retained for 35 days (at no additional cost). System backups allow you to restore the deleted table to the state it was in just before the point of deletion. </p></li><li><p><code>AWS_BACKUP</code> - On-demand backup created by you from AWS Backup service.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBackupType backupType;

@end

/**
 <p>Contains details for the backup.</p>
 */
@interface AWSDynamoDBBackupSummary : AWSModel


/**
 <p>ARN associated with the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

/**
 <p>Time at which the backup was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backupCreationDateTime;

/**
 <p>Time at which the automatic on-demand backup created by DynamoDB will expire. This <code>SYSTEM</code> on-demand backup expires automatically 35 days after its creation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable backupExpiryDateTime;

/**
 <p>Name of the specified backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupName;

/**
 <p>Size of the backup in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupSizeBytes;

/**
 <p>Backup can be in one of the following states: CREATING, ACTIVE, DELETED.</p>
 */
@property (nonatomic, assign) AWSDynamoDBBackupStatus backupStatus;

/**
 <p>BackupType:</p><ul><li><p><code>USER</code> - You create and manage these using the on-demand backup feature.</p></li><li><p><code>SYSTEM</code> - If you delete a table with point-in-time recovery enabled, a <code>SYSTEM</code> backup is automatically created and is retained for 35 days (at no additional cost). System backups allow you to restore the deleted table to the state it was in just before the point of deletion. </p></li><li><p><code>AWS_BACKUP</code> - On-demand backup created by you from AWS Backup service.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBackupType backupType;

/**
 <p>ARN associated with the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableArn;

/**
 <p>Unique identifier for the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableId;

/**
 <p>Name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the input of a <code>BatchGetItem</code> operation.</p>
 Required parameters: [RequestItems]
 */
@interface AWSDynamoDBBatchGetItemInput : AWSRequest


/**
 <p>A map of one or more table names and, for each table, a map that describes one or more items to retrieve from that table. Each table name can be used only once per <code>BatchGetItem</code> request.</p><p>Each element in the map of items to retrieve consists of the following:</p><ul><li><p><code>ConsistentRead</code> - If <code>true</code>, a strongly consistent read is used; if <code>false</code> (the default), an eventually consistent read is used.</p></li><li><p><code>ExpressionAttributeNames</code> - One or more substitution tokens for attribute names in the <code>ProjectionExpression</code> parameter. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information about expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><code>Keys</code> - An array of primary key attribute values that define specific items in the table. For each primary key, you must provide <i>all</i> of the key attributes. For example, with a simple primary key, you only need to provide the partition key value. For a composite key, you must provide <i>both</i> the partition key value and the sort key value.</p></li><li><p><code>ProjectionExpression</code> - A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes are returned. If any of the requested attributes are not found, they do not appear in the result.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><code>AttributesToGet</code> - This is a legacy parameter. Use <code>ProjectionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a> in the <i>Amazon DynamoDB Developer Guide</i>. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBKeysAndAttributes *> * _Nullable requestItems;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

@end

/**
 <p>Represents the output of a <code>BatchGetItem</code> operation.</p>
 */
@interface AWSDynamoDBBatchGetItemOutput : AWSModel


/**
 <p>The read capacity units consumed by the entire <code>BatchGetItem</code> operation.</p><p>Each element consists of:</p><ul><li><p><code>TableName</code> - The table that consumed the provisioned throughput.</p></li><li><p><code>CapacityUnits</code> - The total number of capacity units consumed.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>A map of table name to a list of items. Each object in <code>Responses</code> consists of a table name, along with a map of attribute data consisting of the data type and attribute value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> *> * _Nullable responses;

/**
 <p>A map of tables and their respective keys that were not processed with the current response. The <code>UnprocessedKeys</code> value is in the same form as <code>RequestItems</code>, so the value can be provided directly to a subsequent <code>BatchGetItem</code> operation. For more information, see <code>RequestItems</code> in the Request Parameters section.</p><p>Each element consists of:</p><ul><li><p><code>Keys</code> - An array of primary key attribute values that define specific items in the table.</p></li><li><p><code>ProjectionExpression</code> - One or more attributes to be retrieved from the table or index. By default, all attributes are returned. If a requested attribute is not found, it does not appear in the result.</p></li><li><p><code>ConsistentRead</code> - The consistency of a read operation. If set to <code>true</code>, then a strongly consistent read is used; otherwise, an eventually consistent read is used.</p></li></ul><p>If there are no unprocessed keys remaining, the response contains an empty <code>UnprocessedKeys</code> map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBKeysAndAttributes *> * _Nullable unprocessedKeys;

@end

/**
 <p>Represents the input of a <code>BatchWriteItem</code> operation.</p>
 Required parameters: [RequestItems]
 */
@interface AWSDynamoDBBatchWriteItemInput : AWSRequest


/**
 <p>A map of one or more table names and, for each table, a list of operations to be performed (<code>DeleteRequest</code> or <code>PutRequest</code>). Each element in the map consists of the following:</p><ul><li><p><code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation on the specified item. The item to be deleted is identified by a <code>Key</code> subelement:</p><ul><li><p><code>Key</code> - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value. For each primary key, you must provide <i>all</i> of the key attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for <i>both</i> the partition key and the sort key.</p></li></ul></li><li><p><code>PutRequest</code> - Perform a <code>PutItem</code> operation on the specified item. The item to be put is identified by an <code>Item</code> subelement:</p><ul><li><p><code>Item</code> - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values are rejected with a <code>ValidationException</code> exception.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBWriteRequest *> *> * _Nullable requestItems;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Determines whether item collection metrics are returned. If set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

@end

/**
 <p>Represents the output of a <code>BatchWriteItem</code> operation.</p>
 */
@interface AWSDynamoDBBatchWriteItemOutput : AWSModel


/**
 <p>The capacity units consumed by the entire <code>BatchWriteItem</code> operation.</p><p>Each element consists of:</p><ul><li><p><code>TableName</code> - The table that consumed the provisioned throughput.</p></li><li><p><code>CapacityUnits</code> - The total number of capacity units consumed.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>A list of tables that were processed by <code>BatchWriteItem</code> and, for each table, information about any item collections that were affected by individual <code>DeleteItem</code> or <code>PutItem</code> operations.</p><p>Each entry consists of the following subelements:</p><ul><li><p><code>ItemCollectionKey</code> - The partition key value of the item collection. This is the same as the partition key value of the item.</p></li><li><p><code>SizeEstimateRangeGB</code> - An estimate of item collection size, expressed in GB. This is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on the table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBItemCollectionMetrics *> *> * _Nullable itemCollectionMetrics;

/**
 <p>A map of tables and requests against those tables that were not processed. The <code>UnprocessedItems</code> value is in the same form as <code>RequestItems</code>, so you can provide this value directly to a subsequent <code>BatchGetItem</code> operation. For more information, see <code>RequestItems</code> in the Request Parameters section.</p><p>Each <code>UnprocessedItems</code> entry consists of a table name and, for that table, a list of operations to perform (<code>DeleteRequest</code> or <code>PutRequest</code>).</p><ul><li><p><code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation on the specified item. The item to be deleted is identified by a <code>Key</code> subelement:</p><ul><li><p><code>Key</code> - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value.</p></li></ul></li><li><p><code>PutRequest</code> - Perform a <code>PutItem</code> operation on the specified item. The item to be put is identified by an <code>Item</code> subelement:</p><ul><li><p><code>Item</code> - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a <code>ValidationException</code> exception.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p></li></ul></li></ul><p>If there are no unprocessed items remaining, the response contains an empty <code>UnprocessedItems</code> map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBWriteRequest *> *> * _Nullable unprocessedItems;

@end

/**
 <p>Contains the details for the read/write capacity mode.</p>
 */
@interface AWSDynamoDBBillingModeSummary : AWSModel


/**
 <p>Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.</p><ul><li><p><code>PROVISIONED</code> - Sets the read/write capacity mode to <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for predictable workloads.</p></li><li><p><code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to <code>PAY_PER_REQUEST</code>. We recommend using <code>PAY_PER_REQUEST</code> for unpredictable workloads. </p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBillingMode billingMode;

/**
 <p>Represents the time when <code>PAY_PER_REQUEST</code> was last set as the read/write capacity mode.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateToPayPerRequestDateTime;

@end

/**
 <p>An ordered list of errors for each item in the request which caused the transaction to get cancelled. The values of the list are ordered according to the ordering of the <code>TransactWriteItems</code> request parameter. If no error occurred for the associated item an error with a Null code and Null message will be present. </p>
 */
@interface AWSDynamoDBCancellationReason : AWSModel


/**
 <p>Status code for the result of the cancelled transaction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>Item in the request which caused the transaction to get cancelled.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

/**
 <p>Cancellation reason message description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Represents the amount of provisioned throughput capacity consumed on a table or an index.</p>
 */
@interface AWSDynamoDBCapacity : AWSModel


/**
 <p>The total number of capacity units consumed on a table or an index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityUnits;

/**
 <p>The total number of read capacity units consumed on a table or an index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The total number of write capacity units consumed on a table or an index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeCapacityUnits;

@end

/**
 <p>Represents the selection criteria for a <code>Query</code> or <code>Scan</code> operation:</p><ul><li><p>For a <code>Query</code> operation, <code>Condition</code> is used for specifying the <code>KeyConditions</code> to use when querying a table or an index. For <code>KeyConditions</code>, only the following comparison operators are supported:</p><p><code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code></p><p><code>Condition</code> is also used in a <code>QueryFilter</code>, which evaluates the query results and returns only the desired values.</p></li><li><p>For a <code>Scan</code> operation, <code>Condition</code> is used in a <code>ScanFilter</code>, which evaluates the scan results and returns only the desired values.</p></li></ul>
 Required parameters: [ComparisonOperator]
 */
@interface AWSDynamoDBCondition : AWSModel


/**
 <p>One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <code>ComparisonOperator</code> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable attributeValueList;

/**
 <p>A comparator for evaluating attributes. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all data types, including lists and maps.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all data types, including lists and maps.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <code>AttributeValue</code> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all data types, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all data types, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <code>false</code>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements in a list.</p><p><code>AttributeValueList</code> can contain one or more <code>AttributeValue</code> elements of type String, Number, or Binary. These attributes are compared against an existing attribute of an item. If any elements of the input are equal to the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><code>AttributeValueList</code> must contain two <code>AttributeValue</code> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul><p>For usage examples of <code>AttributeValueList</code> and <code>ComparisonOperator</code>, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBComparisonOperator comparisonOperator;

@end

/**
 <p>Represents a request to perform a check that an item exists or to check the condition of specific attributes of the item..</p>
 Required parameters: [Key, TableName, ConditionExpression]
 */
@interface AWSDynamoDBConditionCheck : AWSModel


/**
 <p>A condition that must be satisfied in order for a conditional update to succeed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>One or more substitution tokens for attribute names in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>The primary key of the item to be checked. Each element consists of an attribute name and a value for that attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item attributes if the <code>ConditionCheck</code> condition fails. For <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE and ALL_OLD.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

/**
 <p>Name of the table for the check item request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the request asked for it. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@interface AWSDynamoDBConsumedCapacity : AWSModel


/**
 <p>The total number of capacity units consumed by the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityUnits;

/**
 <p>The amount of throughput consumed on each global index affected by the operation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCapacity *> * _Nullable globalSecondaryIndexes;

/**
 <p>The amount of throughput consumed on each local index affected by the operation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCapacity *> * _Nullable localSecondaryIndexes;

/**
 <p>The total number of read capacity units consumed by the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The amount of throughput consumed on the table affected by the operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBCapacity * _Nullable table;

/**
 <p>The name of the table that was affected by the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The total number of write capacity units consumed by the operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeCapacityUnits;

@end

/**
 <p>Represents the continuous backups and point in time recovery settings on the table.</p>
 Required parameters: [ContinuousBackupsStatus]
 */
@interface AWSDynamoDBContinuousBackupsDescription : AWSModel


/**
 <p><code>ContinuousBackupsStatus</code> can be one of the following states: ENABLED, DISABLED</p>
 */
@property (nonatomic, assign) AWSDynamoDBContinuousBackupsStatus continuousBackupsStatus;

/**
 <p>The description of the point in time recovery settings applied to the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBPointInTimeRecoveryDescription * _Nullable pointInTimeRecoveryDescription;

@end

/**
 
 */
@interface AWSDynamoDBCreateBackupInput : AWSRequest


/**
 <p>Specified name for the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupName;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSDynamoDBCreateBackupOutput : AWSModel


/**
 <p>Contains the details of the backup created for the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBBackupDetails * _Nullable backupDetails;

@end

/**
 <p>Represents a new global secondary index to be added to an existing table.</p>
 Required parameters: [IndexName, KeySchema, Projection]
 */
@interface AWSDynamoDBCreateGlobalSecondaryIndexAction : AWSModel


/**
 <p>The name of the global secondary index to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The key schema for the global secondary index.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for the specified global secondary index.</p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 
 */
@interface AWSDynamoDBCreateGlobalTableInput : AWSRequest


/**
 <p>The global table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>The Regions where the global table needs to be created.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplica *> * _Nullable replicationGroup;

@end

/**
 
 */
@interface AWSDynamoDBCreateGlobalTableOutput : AWSModel


/**
 <p>Contains the details of the global table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBGlobalTableDescription * _Nullable globalTableDescription;

@end

/**
 <p>Represents a replica to be added.</p>
 Required parameters: [RegionName]
 */
@interface AWSDynamoDBCreateReplicaAction : AWSModel


/**
 <p>The region of the replica to be added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p>Represents the input of a <code>CreateTable</code> operation.</p>
 Required parameters: [AttributeDefinitions, TableName, KeySchema]
 */
@interface AWSDynamoDBCreateTableInput : AWSRequest


/**
 <p>An array of attributes that describe the key schema for the table and indexes.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.</p><ul><li><p><code>PROVISIONED</code> - Sets the billing mode to <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for predictable workloads.</p></li><li><p><code>PAY_PER_REQUEST</code> - Sets the billing mode to <code>PAY_PER_REQUEST</code>. We recommend using <code>PAY_PER_REQUEST</code> for unpredictable workloads. </p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBillingMode billingMode;

/**
 <p>One or more global secondary indexes (the maximum is 20) to be created on the table. Each global secondary index in the array includes the following:</p><ul><li><p><code>IndexName</code> - The name of the global secondary index. Must be unique only for this table.</p><p/></li><li><p><code>KeySchema</code> - Specifies the key schema for the global secondary index.</p></li><li><p><code>Projection</code> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><code>ProjectionType</code> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes is in <code>NonKeyAttributes</code>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><code>NonKeyAttributes</code> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <code>NonKeyAttributes</code>, summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><code>ProvisionedThroughput</code> - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndex *> * _Nullable globalSecondaryIndexes;

/**
 <p>Specifies the attributes that make up the primary key for a table or an index. The attributes in <code>KeySchema</code> must also be defined in the <code>AttributeDefinitions</code> array. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data Model</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>Each <code>KeySchemaElement</code> in the array is composed of:</p><ul><li><p><code>AttributeName</code> - The name of this key attribute.</p></li><li><p><code>KeyType</code> - The role that the key attribute will assume:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from the DynamoDB usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note><p>For a simple primary key (partition key), you must provide exactly one element with a <code>KeyType</code> of <code>HASH</code>.</p><p>For a composite primary key (partition key and sort key), you must provide exactly two elements, in this order: The first element must have a <code>KeyType</code> of <code>HASH</code>, and the second element must have a <code>KeyType</code> of <code>RANGE</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key">Working with Tables</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>One or more local secondary indexes (the maximum is 5) to be created on the table. Each index is scoped to a given partition key value. There is a 10 GB size limit per partition key value; otherwise, the size of a local secondary index is unconstrained.</p><p>Each local secondary index in the array includes the following:</p><ul><li><p><code>IndexName</code> - The name of the local secondary index. Must be unique only for this table.</p><p/></li><li><p><code>KeySchema</code> - Specifies the key schema for the local secondary index. The key schema must begin with the same partition key as the table.</p></li><li><p><code>Projection</code> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><code>ProjectionType</code> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes is in <code>NonKeyAttributes</code>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><code>NonKeyAttributes</code> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <code>NonKeyAttributes</code>, summed across all of the secondary indexes, must not exceed 100. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBLocalSecondaryIndex *> * _Nullable localSecondaryIndexes;

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <code>UpdateTable</code> operation.</p><p> If you set BillingMode as <code>PROVISIONED</code>, you must specify this property. If you set BillingMode as <code>PAY_PER_REQUEST</code>, you cannot specify this property. </p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

/**
 <p>Represents the settings used to enable server-side encryption.</p>
 */
@property (nonatomic, strong) AWSDynamoDBSSESpecification * _Nullable SSESpecification;

/**
 <p>The settings for DynamoDB Streams on the table. These settings consist of:</p><ul><li><p><code>StreamEnabled</code> - Indicates whether DynamoDB Streams is to be enabled (true) or disabled (false).</p></li><li><p><code>StreamViewType</code> - When an item in the table is modified, <code>StreamViewType</code> determines what information is written to the table's stream. Valid values for <code>StreamViewType</code> are:</p><ul><li><p><code>KEYS_ONLY</code> - Only the key attributes of the modified item are written to the stream.</p></li><li><p><code>NEW_IMAGE</code> - The entire item, as it appears after it was modified, is written to the stream.</p></li><li><p><code>OLD_IMAGE</code> - The entire item, as it appeared before it was modified, is written to the stream.</p></li><li><p><code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of the item are written to the stream.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 <p>The name of the table to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>A list of key-value pairs to label the table. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging for DynamoDB</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBTag *> * _Nullable tags;

@end

/**
 <p>Represents the output of a <code>CreateTable</code> operation.</p>
 */
@interface AWSDynamoDBCreateTableOutput : AWSModel


/**
 <p>Represents the properties of the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 <p>Represents a request to perform a <code>DeleteItem</code> operation.</p>
 Required parameters: [Key, TableName]
 */
@interface AWSDynamoDBRemove : AWSModel


/**
 <p>A condition that must be satisfied in order for a conditional delete to succeed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>One or more substitution tokens for attribute names in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>The primary key of the item to be deleted. Each element consists of an attribute name and a value for that attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item attributes if the <code>Delete</code> condition fails. For <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE and ALL_OLD.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

/**
 <p>Name of the table in which the item to be deleted resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSDynamoDBDeleteBackupInput : AWSRequest


/**
 <p>The ARN associated with the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

@end

/**
 
 */
@interface AWSDynamoDBDeleteBackupOutput : AWSModel


/**
 <p>Contains the description of the backup created for the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBBackupDescription * _Nullable backupDescription;

@end

/**
 <p>Represents a global secondary index to be deleted from an existing table.</p>
 Required parameters: [IndexName]
 */
@interface AWSDynamoDBDeleteGlobalSecondaryIndexAction : AWSModel


/**
 <p>The name of the global secondary index to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 <p>Represents the input of a <code>DeleteItem</code> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBDeleteItemInput : AWSRequest


/**
 <p>A condition that must be satisfied in order for a conditional <code>DeleteItem</code> to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Functions: <code>attribute_exists | attribute_not_exists | attribute_type | contains | begins_with | size</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN </code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information about condition expressions, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <code>ExpressionAttributeValues</code> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A map of attribute names to <code>AttributeValue</code> objects, representing the primary key of the item to delete.</p><p>For the primary key, you must provide all of the attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Determines whether item collection metrics are returned. If set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <code>ReturnValues</code> if you want to get the item attributes as they appeared before they were deleted. For <code>DeleteItem</code>, the valid values are:</p><ul><li><p><code>NONE</code> - If <code>ReturnValues</code> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <code>ReturnValues</code>.)</p></li><li><p><code>ALL_OLD</code> - The content of the old item is returned.</p></li></ul><note><p>The <code>ReturnValues</code> parameter is used by several DynamoDB operations; however, <code>DeleteItem</code> does not recognize any values other than <code>NONE</code> or <code>ALL_OLD</code>.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table from which to delete the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>DeleteItem</code> operation.</p>
 */
@interface AWSDynamoDBDeleteItemOutput : AWSModel


/**
 <p>A map of attribute names to <code>AttributeValue</code> objects, representing the item as it appeared before the <code>DeleteItem</code> operation. This map appears in the response only if <code>ReturnValues</code> was specified as <code>ALL_OLD</code> in the request.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by the <code>DeleteItem</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the <code>DeleteItem</code> operation. <code>ItemCollectionMetrics</code> is only returned if the <code>ReturnItemCollectionMetrics</code> parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.</p><p>Each <code>ItemCollectionMetrics</code> element consists of:</p><ul><li><p><code>ItemCollectionKey</code> - The partition key value of the item collection. This is the same as the partition key value of the item itself.</p></li><li><p><code>SizeEstimateRangeGB</code> - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents a replica to be removed.</p>
 Required parameters: [RegionName]
 */
@interface AWSDynamoDBDeleteReplicaAction : AWSModel


/**
 <p>The region of the replica to be removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p>Represents a request to perform a <code>DeleteItem</code> operation on an item.</p>
 Required parameters: [Key]
 */
@interface AWSDynamoDBDeleteRequest : AWSModel


/**
 <p>A map of attribute name to attribute values, representing the primary key of the item to delete. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

@end

/**
 <p>Represents the input of a <code>DeleteTable</code> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBDeleteTableInput : AWSRequest


/**
 <p>The name of the table to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>DeleteTable</code> operation.</p>
 */
@interface AWSDynamoDBDeleteTableOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 
 */
@interface AWSDynamoDBDescribeBackupInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) associated with the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

@end

/**
 
 */
@interface AWSDynamoDBDescribeBackupOutput : AWSModel


/**
 <p>Contains the description of the backup created for the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBBackupDescription * _Nullable backupDescription;

@end

/**
 
 */
@interface AWSDynamoDBDescribeContinuousBackupsInput : AWSRequest


/**
 <p>Name of the table for which the customer wants to check the continuous backups and point in time recovery settings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSDynamoDBDescribeContinuousBackupsOutput : AWSModel


/**
 <p>Represents the continuous backups and point in time recovery settings on the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBContinuousBackupsDescription * _Nullable continuousBackupsDescription;

@end

/**
 
 */
@interface AWSDynamoDBDescribeEndpointsRequest : AWSRequest


@end

/**
 
 */
@interface AWSDynamoDBDescribeEndpointsResponse : AWSModel


/**
 <p>List of endpoints.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBEndpoint *> * _Nullable endpoints;

@end

/**
 
 */
@interface AWSDynamoDBDescribeGlobalTableInput : AWSRequest


/**
 <p>The name of the global table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

@end

/**
 
 */
@interface AWSDynamoDBDescribeGlobalTableOutput : AWSModel


/**
 <p>Contains the details of the global table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBGlobalTableDescription * _Nullable globalTableDescription;

@end

/**
 
 */
@interface AWSDynamoDBDescribeGlobalTableSettingsInput : AWSRequest


/**
 <p>The name of the global table to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

@end

/**
 
 */
@interface AWSDynamoDBDescribeGlobalTableSettingsOutput : AWSModel


/**
 <p>The name of the global table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>The Region-specific settings for the global table.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaSettingsDescription *> * _Nullable replicaSettings;

@end

/**
 <p>Represents the input of a <code>DescribeLimits</code> operation. Has no content.</p>
 */
@interface AWSDynamoDBDescribeLimitsInput : AWSRequest


@end

/**
 <p>Represents the output of a <code>DescribeLimits</code> operation.</p>
 */
@interface AWSDynamoDBDescribeLimitsOutput : AWSModel


/**
 <p>The maximum total read capacity units that your account allows you to provision across all of your tables in this Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accountMaxReadCapacityUnits;

/**
 <p>The maximum total write capacity units that your account allows you to provision across all of your tables in this Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accountMaxWriteCapacityUnits;

/**
 <p>The maximum read capacity units that your account allows you to provision for a new table that you are creating in this Region, including the read capacity units provisioned for its global secondary indexes (GSIs).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tableMaxReadCapacityUnits;

/**
 <p>The maximum write capacity units that your account allows you to provision for a new table that you are creating in this Region, including the write capacity units provisioned for its global secondary indexes (GSIs).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tableMaxWriteCapacityUnits;

@end

/**
 <p>Represents the input of a <code>DescribeTable</code> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBDescribeTableInput : AWSRequest


/**
 <p>The name of the table to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>DescribeTable</code> operation.</p>
 */
@interface AWSDynamoDBDescribeTableOutput : AWSModel


/**
 <p>The properties of the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable table;

@end

/**
 
 */
@interface AWSDynamoDBDescribeTimeToLiveInput : AWSRequest


/**
 <p>The name of the table to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSDynamoDBDescribeTimeToLiveOutput : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSDynamoDBTimeToLiveDescription * _Nullable timeToLiveDescription;

@end

/**
 <p>An endpoint information details.</p>
 Required parameters: [Address, CachePeriodInMinutes]
 */
@interface AWSDynamoDBEndpoint : AWSModel


/**
 <p>IP address of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>Endpoint cache time to live (TTL) value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cachePeriodInMinutes;

@end

/**
 <p>Represents a condition to be compared with an attribute value. This condition can be used with <code>DeleteItem</code>, <code>PutItem</code> or <code>UpdateItem</code> operations; if the comparison evaluates to true, the operation succeeds; if not, the operation fails. You can use <code>ExpectedAttributeValue</code> in one of two different ways:</p><ul><li><p>Use <code>AttributeValueList</code> to specify one or more values to compare against an attribute. Use <code>ComparisonOperator</code> to specify how you want to perform the comparison. If the comparison evaluates to true, then the conditional operation succeeds.</p></li><li><p>Use <code>Value</code> to specify a value that DynamoDB will compare against an attribute. If the values match, then <code>ExpectedAttributeValue</code> evaluates to true and the conditional operation succeeds. Optionally, you can also set <code>Exists</code> to false, indicating that you <i>do not</i> expect to find the attribute value in the table. In this case, the conditional operation succeeds only if the comparison evaluates to false.</p></li></ul><p><code>Value</code> and <code>Exists</code> are incompatible with <code>AttributeValueList</code> and <code>ComparisonOperator</code>. Note that if you use both sets of parameters at once, DynamoDB will return a <code>ValidationException</code> exception.</p>
 */
@interface AWSDynamoDBExpectedAttributeValue : AWSModel


/**
 <p>One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <code>ComparisonOperator</code> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p><p>For information on specifying data types in JSON, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable attributeValueList;

/**
 <p>A comparator for evaluating attributes in the <code>AttributeValueList</code>. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all data types, including lists and maps.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all data types, including lists and maps.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <code>AttributeValue</code> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all data types, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all data types, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <code>false</code>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><code>AttributeValueList</code> can contain only one <code>AttributeValue</code> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements in a list.</p><p><code>AttributeValueList</code> can contain one or more <code>AttributeValue</code> elements of type String, Number, or Binary. These attributes are compared against an existing attribute of an item. If any elements of the input are equal to the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><code>AttributeValueList</code> must contain two <code>AttributeValue</code> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <code>AttributeValue</code> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBComparisonOperator comparisonOperator;

/**
 <p>Causes DynamoDB to evaluate the value before attempting a conditional operation:</p><ul><li><p>If <code>Exists</code> is <code>true</code>, DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the operation succeeds. If it is not found, the operation fails with a <code>ConditionCheckFailedException</code>.</p></li><li><p>If <code>Exists</code> is <code>false</code>, DynamoDB assumes that the attribute value does not exist in the table. If in fact the value does not exist, then the assumption is valid and the operation succeeds. If the value is found, despite the assumption that it does not exist, the operation fails with a <code>ConditionCheckFailedException</code>.</p></li></ul><p>The default setting for <code>Exists</code> is <code>true</code>. If you supply a <code>Value</code> all by itself, DynamoDB assumes the attribute exists: You don't have to set <code>Exists</code> to <code>true</code>, because it is implied.</p><p>DynamoDB returns a <code>ValidationException</code> if:</p><ul><li><p><code>Exists</code> is <code>true</code> but there is no <code>Value</code> to check. (You expect a value to exist, but don't specify what that value is.)</p></li><li><p><code>Exists</code> is <code>false</code> but you also provide a <code>Value</code>. (You cannot expect an attribute to have a value, while also expecting it not to exist.)</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable exists;

/**
 <p>Represents the data for the expected attribute.</p><p>Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAttributeValue * _Nullable value;

@end

/**
 <p>Specifies an item and related attribute values to retrieve in a <code>TransactGetItem</code> object.</p>
 Required parameters: [Key, TableName]
 */
@interface AWSDynamoDBGet : AWSModel


/**
 <p>One or more substitution tokens for attribute names in the ProjectionExpression parameter.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>A map of attribute names to <code>AttributeValue</code> objects that specifies the primary key of the item to retrieve.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>A string that identifies one or more attributes of the specified item to retrieve from the table. The attributes in the expression must be separated by commas. If no attribute names are specified, then all attributes of the specified item are returned. If any of the requested attributes are not found, they do not appear in the result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>The name of the table from which to retrieve the specified item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the input of a <code>GetItem</code> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBGetItemInput : AWSRequest


/**
 <p>This is a legacy parameter. Use <code>ProjectionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>Determines the read consistency model: If set to <code>true</code>, then the operation uses strongly consistent reads; otherwise, the operation uses eventually consistent reads.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>A map of attribute names to <code>AttributeValue</code> objects, representing the primary key of the item to retrieve.</p><p>For the primary key, you must provide all of the attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes are returned. If any of the requested attributes are not found, they do not appear in the result.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>The name of the table containing the requested item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>GetItem</code> operation.</p>
 */
@interface AWSDynamoDBGetItemOutput : AWSModel


/**
 <p>The capacity units consumed by the <code>GetItem</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Read/Write Capacity Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>A map of attribute names to <code>AttributeValue</code> objects, as specified by <code>ProjectionExpression</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

@end

/**
 <p>Represents the properties of a global secondary index.</p>
 Required parameters: [IndexName, KeySchema, Projection]
 */
@interface AWSDynamoDBGlobalSecondaryIndex : AWSModel


/**
 <p>The name of the global secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for the specified global secondary index.</p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 <p>Represents the properties of a global secondary index.</p>
 */
@interface AWSDynamoDBGlobalSecondaryIndexDescription : AWSModel


/**
 <p>Indicates whether the index is currently backfilling. <i>Backfilling</i> is the process of reading items from the table and determining whether they can be added to the index. (Not all items will qualify: For example, a partition key cannot have any duplicate values.) If an item can be added to the index, DynamoDB will do so. After all items have been processed, the backfilling operation is complete and <code>Backfilling</code> is false.</p><note><p>For indexes that were created during a <code>CreateTable</code> operation, the <code>Backfilling</code> attribute does not appear in the <code>DescribeTable</code> output.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable backfilling;

/**
 <p>The Amazon Resource Name (ARN) that uniquely identifies the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name of the global secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexSizeBytes;

/**
 <p>The current state of the global secondary index:</p><ul><li><p><code>CREATING</code> - The index is being created.</p></li><li><p><code>UPDATING</code> - The index is being updated.</p></li><li><p><code>DELETING</code> - The index is being deleted.</p></li><li><p><code>ACTIVE</code> - The index is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBIndexStatus indexStatus;

/**
 <p>The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for the specified global secondary index.</p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughputDescription * _Nullable provisionedThroughput;

@end

/**
 <p>Represents the properties of a global secondary index for the table when the backup was created.</p>
 */
@interface AWSDynamoDBGlobalSecondaryIndexInfo : AWSModel


/**
 <p>The name of the global secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for the specified global secondary index. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 <p>Represents one of the following:</p><ul><li><p>A new global secondary index to be added to an existing table.</p></li><li><p>New provisioned throughput parameters for an existing global secondary index.</p></li><li><p>An existing global secondary index to be removed from an existing table.</p></li></ul>
 */
@interface AWSDynamoDBGlobalSecondaryIndexUpdate : AWSModel


/**
 <p>The parameters required for creating a global secondary index on an existing table:</p><ul><li><p><code>IndexName </code></p></li><li><p><code>KeySchema </code></p></li><li><p><code>AttributeDefinitions </code></p></li><li><p><code>Projection </code></p></li><li><p><code>ProvisionedThroughput </code></p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBCreateGlobalSecondaryIndexAction * _Nullable create;

/**
 <p>The name of an existing global secondary index to be removed.</p>
 */
@property (nonatomic, strong) AWSDynamoDBDeleteGlobalSecondaryIndexAction * _Nullable remove;

/**
 <p>The name of an existing global secondary index, along with new provisioned throughput settings to be applied to that index.</p>
 */
@property (nonatomic, strong) AWSDynamoDBUpdateGlobalSecondaryIndexAction * _Nullable update;

@end

/**
 <p>Represents the properties of a global table.</p>
 */
@interface AWSDynamoDBGlobalTable : AWSModel


/**
 <p>The global table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>The regions where the global table has replicas.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplica *> * _Nullable replicationGroup;

@end

/**
 <p>Contains details about the global table.</p>
 */
@interface AWSDynamoDBGlobalTableDescription : AWSModel


/**
 <p>The creation time of the global table.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The unique identifier of the global table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableArn;

/**
 <p>The global table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>The current state of the global table:</p><ul><li><p><code>CREATING</code> - The global table is being created.</p></li><li><p><code>UPDATING</code> - The global table is being updated.</p></li><li><p><code>DELETING</code> - The global table is being deleted.</p></li><li><p><code>ACTIVE</code> - The global table is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBGlobalTableStatus globalTableStatus;

/**
 <p>The regions where the global table has replicas.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaDescription *> * _Nullable replicationGroup;

@end

/**
 <p>Represents the settings of a global secondary index for a global table that will be modified.</p>
 Required parameters: [IndexName]
 */
@interface AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate : AWSModel


/**
 <p>The name of the global secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>AutoScaling settings for managing a global secondary index's write capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsUpdate * _Nullable provisionedWriteCapacityAutoScalingSettingsUpdate;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException.</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedWriteCapacityUnits;

@end

/**
 <p>Information about item collections, if any, that were affected by the operation. <code>ItemCollectionMetrics</code> is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.</p>
 */
@interface AWSDynamoDBItemCollectionMetrics : AWSModel


/**
 <p>The partition key value of the item collection. This value is the same as the partition key value of the item.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable itemCollectionKey;

/**
 <p>An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable sizeEstimateRangeGB;

@end

/**
 <p>Details for the requested item.</p>
 */
@interface AWSDynamoDBItemResponse : AWSModel


/**
 <p>Map of attribute data consisting of the data type and attribute value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

@end

/**
 <p>Represents <i>a single element</i> of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.</p><p>A <code>KeySchemaElement</code> represents exactly one attribute of the primary key. For example, a simple primary key would be represented by one <code>KeySchemaElement</code> (for the partition key). A composite primary key would require one <code>KeySchemaElement</code> for the partition key, and another <code>KeySchemaElement</code> for the sort key.</p><p>A <code>KeySchemaElement</code> must be a scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number, or Binary. The attribute cannot be nested within a List or a Map.</p>
 Required parameters: [AttributeName, KeyType]
 */
@interface AWSDynamoDBKeySchemaElement : AWSModel


/**
 <p>The name of a key attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The role that this key attribute will assume:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBKeyType keyType;

@end

/**
 <p>Represents a set of primary keys and, for each key, the attributes to retrieve from the table.</p><p>For each primary key, you must provide <i>all</i> of the key attributes. For example, with a simple primary key, you only need to provide the partition key. For a composite primary key, you must provide <i>both</i> the partition key and the sort key.</p>
 Required parameters: [Keys]
 */
@interface AWSDynamoDBKeysAndAttributes : AWSModel


/**
 <p>This is a legacy parameter. Use <code>ProjectionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>The consistency of a read operation. If set to <code>true</code>, then a strongly consistent read is used; otherwise, an eventually consistent read is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>The primary key attribute values that define the items and the attributes associated with the items.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable keys;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the <code>ProjectionExpression</code> must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

@end

/**
 
 */
@interface AWSDynamoDBListBackupsInput : AWSRequest


/**
 <p>The backups from the table specified by <code>BackupType</code> are listed.</p><p>Where <code>BackupType</code> can be:</p><ul><li><p><code>USER</code> - On-demand backup created by you.</p></li><li><p><code>SYSTEM</code> - On-demand backup automatically created by DynamoDB.</p></li><li><p><code>ALL</code> - All types of on-demand backups (USER and SYSTEM).</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBackupTypeFilter backupType;

/**
 <p><code>LastEvaluatedBackupArn</code> is the Amazon Resource Name (ARN) of the backup last evaluated when the current page of results was returned, inclusive of the current page of results. This value may be specified as the <code>ExclusiveStartBackupArn</code> of a new <code>ListBackups</code> operation in order to fetch the next page of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartBackupArn;

/**
 <p>Maximum number of backups to return at once.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The backups from the table specified by <code>TableName</code> are listed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>Only backups created after this time are listed. <code>TimeRangeLowerBound</code> is inclusive.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timeRangeLowerBound;

/**
 <p>Only backups created before this time are listed. <code>TimeRangeUpperBound</code> is exclusive. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable timeRangeUpperBound;

@end

/**
 
 */
@interface AWSDynamoDBListBackupsOutput : AWSModel


/**
 <p>List of <code>BackupSummary</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBBackupSummary *> * _Nullable backupSummaries;

/**
 <p> The ARN of the backup last evaluated when the current page of results was returned, inclusive of the current page of results. This value may be specified as the <code>ExclusiveStartBackupArn</code> of a new <code>ListBackups</code> operation in order to fetch the next page of results. </p><p> If <code>LastEvaluatedBackupArn</code> is empty, then the last page of results has been processed and there are no more results to be retrieved. </p><p> If <code>LastEvaluatedBackupArn</code> is not empty, this may or may not indicate that there is more data to be returned. All results are guaranteed to have been returned if and only if no value for <code>LastEvaluatedBackupArn</code> is returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedBackupArn;

@end

/**
 
 */
@interface AWSDynamoDBListGlobalTablesInput : AWSRequest


/**
 <p>The first global table name that this operation will evaluate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartGlobalTableName;

/**
 <p>The maximum number of table names to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Lists the global tables in a specific Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 
 */
@interface AWSDynamoDBListGlobalTablesOutput : AWSModel


/**
 <p>List of global table names.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalTable *> * _Nullable globalTables;

/**
 <p>Last evaluated global table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedGlobalTableName;

@end

/**
 <p>Represents the input of a <code>ListTables</code> operation.</p>
 */
@interface AWSDynamoDBListTablesInput : AWSRequest


/**
 <p>The first table name that this operation will evaluate. Use the value that was returned for <code>LastEvaluatedTableName</code> in a previous operation, so that you can obtain the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartTableName;

/**
 <p>A maximum number of table names to return. If this parameter is not specified, the limit is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

@end

/**
 <p>Represents the output of a <code>ListTables</code> operation.</p>
 */
@interface AWSDynamoDBListTablesOutput : AWSModel


/**
 <p>The name of the last table in the current page of results. Use this value as the <code>ExclusiveStartTableName</code> in a new request to obtain the next page of results, until all the table names are returned.</p><p>If you do not receive a <code>LastEvaluatedTableName</code> value in the response, this means that there are no more table names to be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedTableName;

/**
 <p>The names of the tables associated with the current account at the current endpoint. The maximum size of this array is 100.</p><p>If <code>LastEvaluatedTableName</code> also appears in the output, you can use this value as the <code>ExclusiveStartTableName</code> parameter in a subsequent <code>ListTables</code> request and obtain the next page of results.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tableNames;

@end

/**
 
 */
@interface AWSDynamoDBListTagsOfResourceInput : AWSRequest


/**
 <p>An optional string that, if supplied, must be copied from the output of a previous call to ListTagOfResource. When provided in this manner, this API fetches the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon DynamoDB resource with tags to be listed. This value is an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSDynamoDBListTagsOfResourceOutput : AWSModel


/**
 <p>If this value is returned, there are additional results to be displayed. To retrieve them, call ListTagsOfResource again, with NextToken set to this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tags currently associated with the Amazon DynamoDB resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBTag *> * _Nullable tags;

@end

/**
 <p>Represents the properties of a local secondary index.</p>
 Required parameters: [IndexName, KeySchema, Projection]
 */
@interface AWSDynamoDBLocalSecondaryIndex : AWSModel


/**
 <p>The name of the local secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The complete key schema for the local secondary index, consisting of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the local secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

@end

/**
 <p>Represents the properties of a local secondary index.</p>
 */
@interface AWSDynamoDBLocalSecondaryIndexDescription : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that uniquely identifies the index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>Represents the name of the local secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexSizeBytes;

/**
 <p>The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The complete key schema for the local secondary index, consisting of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

@end

/**
 <p>Represents the properties of a local secondary index for the table when the backup was created.</p>
 */
@interface AWSDynamoDBLocalSecondaryIndexInfo : AWSModel


/**
 <p>Represents the name of the local secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The complete key schema for a local secondary index, which consists of one or more pairs of attribute names and key types:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB' usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into the global secondary index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. </p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

@end

/**
 <p>The description of the point in time settings applied to the table.</p>
 */
@interface AWSDynamoDBPointInTimeRecoveryDescription : AWSModel


/**
 <p>Specifies the earliest point in time you can restore your table to. It You can restore your table to any point in time during the last 35 days. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestRestorableDateTime;

/**
 <p><code>LatestRestorableDateTime</code> is typically 5 minutes before the current time. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestRestorableDateTime;

/**
 <p>The current state of point in time recovery:</p><ul><li><p><code>ENABLING</code> - Point in time recovery is being enabled.</p></li><li><p><code>ENABLED</code> - Point in time recovery is enabled.</p></li><li><p><code>DISABLED</code> - Point in time recovery is disabled.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBPointInTimeRecoveryStatus pointInTimeRecoveryStatus;

@end

/**
 <p>Represents the settings used to enable point in time recovery.</p>
 Required parameters: [PointInTimeRecoveryEnabled]
 */
@interface AWSDynamoDBPointInTimeRecoverySpecification : AWSModel


/**
 <p>Indicates whether point in time recovery is enabled (true) or disabled (false) on the table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pointInTimeRecoveryEnabled;

@end

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@interface AWSDynamoDBProjection : AWSModel


/**
 <p>Represents the non-key attribute names which will be projected into the index.</p><p>For local secondary indexes, the total count of <code>NonKeyAttributes</code> summed across all of the local secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable nonKeyAttributes;

/**
 <p>The set of attributes that are projected into the index:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <code>NonKeyAttributes</code>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBProjectionType projectionType;

@end

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <code>UpdateTable</code> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 Required parameters: [ReadCapacityUnits, WriteCapacityUnits]
 */
@interface AWSDynamoDBProvisionedThroughput : AWSModel


/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set to 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException</code>. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set to 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeCapacityUnits;

@end

/**
 <p>Represents the provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.</p>
 */
@interface AWSDynamoDBProvisionedThroughputDescription : AWSModel


/**
 <p>The date and time of the last provisioned throughput decrease for this table.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDecreaseDateTime;

/**
 <p>The date and time of the last provisioned throughput increase for this table.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastIncreaseDateTime;

/**
 <p>The number of provisioned throughput decreases for this table during this UTC calendar day. For current maximums on provisioned throughput decreases, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfDecreasesToday;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>. Eventually consistent reads require less effort than strongly consistent reads, so a setting of 50 <code>ReadCapacityUnits</code> per second provides 100 eventually consistent <code>ReadCapacityUnits</code> per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeCapacityUnits;

@end

/**
 <p>Represents a request to perform a <code>PutItem</code> operation.</p>
 Required parameters: [Item, TableName]
 */
@interface AWSDynamoDBPut : AWSModel


/**
 <p>A condition that must be satisfied in order for a conditional update to succeed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>One or more substitution tokens for attribute names in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A map of attribute name to attribute values, representing the primary key of the item to be written by <code>PutItem</code>. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema. If any attributes are present in the item that are part of an index key schema for the table, their types must match the index key schema. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

/**
 <p>Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item attributes if the <code>Put</code> condition fails. For <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE and ALL_OLD.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

/**
 <p>Name of the table in which to write the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the input of a <code>PutItem</code> operation.</p>
 Required parameters: [TableName, Item]
 */
@interface AWSDynamoDBPutItemInput : AWSRequest


/**
 <p>A condition that must be satisfied in order for a conditional <code>PutItem</code> operation to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Functions: <code>attribute_exists | attribute_not_exists | attribute_type | contains | begins_with | size</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN </code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information on condition expressions, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <code>ExpressionAttributeValues</code> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item.</p><p>You must provide all of the attributes for the primary key. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide both values for both the partition key and the sort key.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p><p>For more information about primary keys, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey">Primary Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>Each element in the <code>Item</code> map is an <code>AttributeValue</code> object.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Determines whether item collection metrics are returned. If set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <code>ReturnValues</code> if you want to get the item attributes as they appeared before they were updated with the <code>PutItem</code> request. For <code>PutItem</code>, the valid values are:</p><ul><li><p><code>NONE</code> - If <code>ReturnValues</code> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <code>ReturnValues</code>.)</p></li><li><p><code>ALL_OLD</code> - If <code>PutItem</code> overwrote an attribute name-value pair, then the content of the old item is returned.</p></li></ul><note><p>The <code>ReturnValues</code> parameter is used by several DynamoDB operations; however, <code>PutItem</code> does not recognize any values other than <code>NONE</code> or <code>ALL_OLD</code>.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table to contain the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>PutItem</code> operation.</p>
 */
@interface AWSDynamoDBPutItemOutput : AWSModel


/**
 <p>The attribute values as they appeared before the <code>PutItem</code> operation, but only if <code>ReturnValues</code> is specified as <code>ALL_OLD</code> in the request. Each element consists of an attribute name and an attribute value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by the <code>PutItem</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Read/Write Capacity Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the <code>PutItem</code> operation. <code>ItemCollectionMetrics</code> is only returned if the <code>ReturnItemCollectionMetrics</code> parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.</p><p>Each <code>ItemCollectionMetrics</code> element consists of:</p><ul><li><p><code>ItemCollectionKey</code> - The partition key value of the item collection. This is the same as the partition key value of the item itself.</p></li><li><p><code>SizeEstimateRangeGB</code> - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents a request to perform a <code>PutItem</code> operation on an item.</p>
 Required parameters: [Item]
 */
@interface AWSDynamoDBPutRequest : AWSModel


/**
 <p>A map of attribute name to attribute values, representing the primary key of an item to be processed by <code>PutItem</code>. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema. If any attributes are present in the item which are part of an index key schema for the table, their types must match the index key schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

@end

/**
 <p>Represents the input of a <code>Query</code> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBQueryInput : AWSRequest


/**
 <p>This is a legacy parameter. Use <code>ProjectionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>This is a legacy parameter. Use <code>FilterExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>Determines the read consistency model: If set to <code>true</code>, then the operation uses strongly consistent reads; otherwise, the operation uses eventually consistent reads.</p><p>Strongly consistent reads are not supported on global secondary indexes. If you query a global secondary index with <code>ConsistentRead</code> set to <code>true</code>, you will receive a <code>ValidationException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>The primary key of the first item that this operation will evaluate. Use the value that was returned for <code>LastEvaluatedKey</code> in the previous operation.</p><p>The data type for <code>ExclusiveStartKey</code> must be String, Number, or Binary. No set data types are allowed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable exclusiveStartKey;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <code>ExpressionAttributeValues</code> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A string that contains conditions that DynamoDB applies after the <code>Query</code> operation, but before the data is returned to you. Items that do not satisfy the <code>FilterExpression</code> criteria are not returned.</p><p>A <code>FilterExpression</code> does not allow key attributes. You cannot define a filter expression based on a partition key or a sort key.</p><note><p>A <code>FilterExpression</code> is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.</p></note><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The name of an index to query. This index can be any local secondary index or global secondary index on the table. Note that if you use the <code>IndexName</code> parameter, you must also provide <code>TableName.</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The condition that specifies the key values for items to be retrieved by the <code>Query</code> action.</p><p>The condition must perform an equality test on a single partition key value.</p><p>The condition can optionally perform one of several comparison tests on a single sort key value. This allows <code>Query</code> to retrieve one item with a given partition key value and sort key value, or several items that have the same partition key value but different sort key values.</p><p>The partition key equality test is required, and must be specified in the following format:</p><p><code>partitionKeyName</code><i>=</i><code>:partitionkeyval</code></p><p>If you also want to provide a condition for the sort key, it must be combined using <code>AND</code> with the condition for the sort key. Following is an example, using the <b>=</b> comparison operator for the sort key:</p><p><code>partitionKeyName</code><code>=</code><code>:partitionkeyval</code><code>AND</code><code>sortKeyName</code><code>=</code><code>:sortkeyval</code></p><p>Valid comparisons for the sort key condition are as follows:</p><ul><li><p><code>sortKeyName</code><code>=</code><code>:sortkeyval</code> - true if the sort key value is equal to <code>:sortkeyval</code>.</p></li><li><p><code>sortKeyName</code><code>&lt;</code><code>:sortkeyval</code> - true if the sort key value is less than <code>:sortkeyval</code>.</p></li><li><p><code>sortKeyName</code><code>&lt;=</code><code>:sortkeyval</code> - true if the sort key value is less than or equal to <code>:sortkeyval</code>.</p></li><li><p><code>sortKeyName</code><code>&gt;</code><code>:sortkeyval</code> - true if the sort key value is greater than <code>:sortkeyval</code>.</p></li><li><p><code>sortKeyName</code><code>&gt;= </code><code>:sortkeyval</code> - true if the sort key value is greater than or equal to <code>:sortkeyval</code>.</p></li><li><p><code>sortKeyName</code><code>BETWEEN</code><code>:sortkeyval1</code><code>AND</code><code>:sortkeyval2</code> - true if the sort key value is greater than or equal to <code>:sortkeyval1</code>, and less than or equal to <code>:sortkeyval2</code>.</p></li><li><p><code>begins_with (</code><code>sortKeyName</code>, <code>:sortkeyval</code><code>)</code> - true if the sort key value begins with a particular operand. (You cannot use this function with a sort key that is of type Number.) Note that the function name <code>begins_with</code> is case-sensitive.</p></li></ul><p>Use the <code>ExpressionAttributeValues</code> parameter to replace tokens such as <code>:partitionval</code> and <code>:sortval</code> with actual values at runtime.</p><p>You can optionally use the <code>ExpressionAttributeNames</code> parameter to replace the names of the partition key and sort key with placeholder tokens. This option might be necessary if an attribute name conflicts with a DynamoDB reserved word. For example, the following <code>KeyConditionExpression</code> parameter causes an error because <i>Size</i> is a reserved word:</p><ul><li><p><code>Size = :myval</code></p></li></ul><p>To work around this, define a placeholder (such a <code>#S</code>) to represent the attribute name <i>Size</i>. <code>KeyConditionExpression</code> then is as follows:</p><ul><li><p><code>#S = :myval</code></p></li></ul><p>For a list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>For more information on <code>ExpressionAttributeNames</code> and <code>ExpressionAttributeValues</code>, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyConditionExpression;

/**
 <p>This is a legacy parameter. Use <code>KeyConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html">KeyConditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable keyConditions;

/**
 <p>The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in <code>LastEvaluatedKey</code> to apply in a subsequent operation to continue the operation. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Query and Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>This is a legacy parameter. Use <code>FilterExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html">QueryFilter</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable queryFilter;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Specifies the order for index traversal: If <code>true</code> (default), the traversal is performed in ascending order; if <code>false</code>, the traversal is performed in descending order. </p><p>Items with the same partition key value are stored in sorted order by sort key. If the sort key data type is Number, the results are stored in numeric order. For type String, the results are stored in order of UTF-8 bytes. For type Binary, DynamoDB treats each byte of the binary data as unsigned.</p><p>If <code>ScanIndexForward</code> is <code>true</code>, DynamoDB returns the results in the order in which they are stored (by sort key value). This is the default behavior. If <code>ScanIndexForward</code> is <code>false</code>, DynamoDB reads the results in reverse order by sort key value, and then returns the results to the client.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scanIndexForward;

/**
 <p>The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, the count of matching items, or in the case of an index, some or all of the attributes projected into the index.</p><ul><li><p><code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the specified table or index. If you query a local secondary index, then for each matching item in the index, DynamoDB fetches the entire item from the parent table. If the index is configured to project all item attributes, then all of the data can be obtained from the local secondary index, and no fetching is required.</p></li><li><p><code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an index. Retrieves all attributes that have been projected into the index. If the index is configured to project all attributes, this return value is equivalent to specifying <code>ALL_ATTRIBUTES</code>.</p></li><li><p><code>COUNT</code> - Returns the number of matching items, rather than the matching items themselves.</p></li><li><p><code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in <code>AttributesToGet</code>. This return value is equivalent to specifying <code>AttributesToGet</code> without specifying any value for <code>Select</code>.</p><p>If you query or scan a local secondary index and request only attributes that are projected into that index, the operation will read only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB fetches each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.</p><p>If you query or scan a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.</p></li></ul><p>If neither <code>Select</code> nor <code>AttributesToGet</code> are specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an index. You cannot use both <code>Select</code> and <code>AttributesToGet</code> together in a single request, unless the value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to specifying <code>AttributesToGet</code> without any value for <code>Select</code>.)</p><note><p>If you use the <code>ProjectionExpression</code> parameter, then the value for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any other value for <code>Select</code> will return an error.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBSelect select;

/**
 <p>The name of the table containing the requested items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <code>Query</code> operation.</p>
 */
@interface AWSDynamoDBQueryOutput : AWSModel


/**
 <p>The capacity units consumed by the <code>Query</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>The number of items in the response.</p><p>If you used a <code>QueryFilter</code> in the request, then <code>Count</code> is the number of items returned after the filter was applied, and <code>ScannedCount</code> is the number of matching items before the filter was applied.</p><p>If you did not use a filter in the request, then <code>Count</code> and <code>ScannedCount</code> are the same.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>An array of item attributes that match the query criteria. Each element in this array consists of an attribute name and the value for that attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable items;

/**
 <p>The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.</p><p>If <code>LastEvaluatedKey</code> is empty, then the "last page" of results has been processed and there is no more data to be retrieved.</p><p>If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when <code>LastEvaluatedKey</code> is empty.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable lastEvaluatedKey;

/**
 <p>The number of items evaluated, before any <code>QueryFilter</code> is applied. A high <code>ScannedCount</code> value with few, or no, <code>Count</code> results indicates an inefficient <code>Query</code> operation. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If you did not use a filter in the request, then <code>ScannedCount</code> is the same as <code>Count</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scannedCount;

@end

/**
 <p>Represents the properties of a replica.</p>
 */
@interface AWSDynamoDBReplica : AWSModel


/**
 <p>The region where the replica needs to be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p>Contains the details of the replica.</p>
 */
@interface AWSDynamoDBReplicaDescription : AWSModel


/**
 <p>The name of the region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p>Represents the properties of a global secondary index.</p>
 Required parameters: [IndexName]
 */
@interface AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription : AWSModel


/**
 <p>The name of the global secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p> The current status of the global secondary index:</p><ul><li><p><code>CREATING</code> - The global secondary index is being created.</p></li><li><p><code>UPDATING</code> - The global secondary index is being updated.</p></li><li><p><code>DELETING</code> - The global secondary index is being deleted.</p></li><li><p><code>ACTIVE</code> - The global secondary index is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBIndexStatus indexStatus;

/**
 <p>Autoscaling settings for a global secondary index replica's read capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsDescription * _Nullable provisionedReadCapacityAutoScalingSettings;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedReadCapacityUnits;

/**
 <p>AutoScaling settings for a global secondary index replica's write capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsDescription * _Nullable provisionedWriteCapacityAutoScalingSettings;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedWriteCapacityUnits;

@end

/**
 <p>Represents the settings of a global secondary index for a global table that will be modified.</p>
 Required parameters: [IndexName]
 */
@interface AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate : AWSModel


/**
 <p>The name of the global secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>Autoscaling settings for managing a global secondary index replica's read capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsUpdate * _Nullable provisionedReadCapacityAutoScalingSettingsUpdate;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedReadCapacityUnits;

@end

/**
 <p>Represents the properties of a replica.</p>
 Required parameters: [RegionName]
 */
@interface AWSDynamoDBReplicaSettingsDescription : AWSModel


/**
 <p>The region name of the replica.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

/**
 <p>The read/write capacity mode of the replica.</p>
 */
@property (nonatomic, strong) AWSDynamoDBBillingModeSummary * _Nullable replicaBillingModeSummary;

/**
 <p>Replica global secondary index settings for the global table.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription *> * _Nullable replicaGlobalSecondaryIndexSettings;

/**
 <p>Autoscaling settings for a global table replica's read capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsDescription * _Nullable replicaProvisionedReadCapacityAutoScalingSettings;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicaProvisionedReadCapacityUnits;

/**
 <p>AutoScaling settings for a global table replica's write capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsDescription * _Nullable replicaProvisionedWriteCapacityAutoScalingSettings;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException</code>. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicaProvisionedWriteCapacityUnits;

/**
 <p>The current state of the region:</p><ul><li><p><code>CREATING</code> - The region is being created.</p></li><li><p><code>UPDATING</code> - The region is being updated.</p></li><li><p><code>DELETING</code> - The region is being deleted.</p></li><li><p><code>ACTIVE</code> - The region is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReplicaStatus replicaStatus;

@end

/**
 <p>Represents the settings for a global table in a region that will be modified.</p>
 Required parameters: [RegionName]
 */
@interface AWSDynamoDBReplicaSettingsUpdate : AWSModel


/**
 <p>The region of the replica to be added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

/**
 <p>Represents the settings of a global secondary index for a global table that will be modified.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate *> * _Nullable replicaGlobalSecondaryIndexSettingsUpdate;

/**
 <p>Autoscaling settings for managing a global table replica's read capacity units.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsUpdate * _Nullable replicaProvisionedReadCapacityAutoScalingSettingsUpdate;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <code>ThrottlingException</code>. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicaProvisionedReadCapacityUnits;

@end

/**
 <p>Represents one of the following:</p><ul><li><p>A new replica to be added to an existing global table.</p></li><li><p>New parameters for an existing replica.</p></li><li><p>An existing replica to be removed from an existing global table.</p></li></ul>
 */
@interface AWSDynamoDBReplicaUpdate : AWSModel


/**
 <p>The parameters required for creating a replica on an existing global table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBCreateReplicaAction * _Nullable create;

/**
 <p>The name of the existing replica to be removed.</p>
 */
@property (nonatomic, strong) AWSDynamoDBDeleteReplicaAction * _Nullable remove;

@end

/**
 <p>Contains details for the restore.</p>
 Required parameters: [RestoreDateTime, RestoreInProgress]
 */
@interface AWSDynamoDBRestoreSummary : AWSModel


/**
 <p>Point in time or source backup time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable restoreDateTime;

/**
 <p>Indicates if a restore is in progress or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable restoreInProgress;

/**
 <p>ARN of the backup from which the table was restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceBackupArn;

/**
 <p>ARN of the source table of the backup that is being restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceTableArn;

@end

/**
 
 */
@interface AWSDynamoDBRestoreTableFromBackupInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) associated with the backup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable backupArn;

/**
 <p>The name of the new table to which the backup must be restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetTableName;

@end

/**
 
 */
@interface AWSDynamoDBRestoreTableFromBackupOutput : AWSModel


/**
 <p>The description of the table created from an existing backup.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 
 */
@interface AWSDynamoDBRestoreTableToPointInTimeInput : AWSRequest


/**
 <p>Time in the past to restore the table to.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable restoreDateTime;

/**
 <p>Name of the source table that is being restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceTableName;

/**
 <p>The name of the new table to which it must be restored to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetTableName;

/**
 <p>Restore the table to the latest possible time. <code>LatestRestorableDateTime</code> is typically 5 minutes before the current time. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableTime;

@end

/**
 
 */
@interface AWSDynamoDBRestoreTableToPointInTimeOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 <p>The description of the server-side encryption status on the specified table.</p>
 */
@interface AWSDynamoDBSSEDescription : AWSModel


/**
 <p>The KMS customer master key (CMK) ARN used for the KMS encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSMasterKeyArn;

/**
 <p>Server-side encryption type. The only supported value is:</p><ul><li><p><code>KMS</code> - Server-side encryption which uses AWS Key Management Service. Key is stored in your account and is managed by AWS KMS (KMS charges apply).</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBSSEType SSEType;

/**
 <p>Represents the current state of server-side encryption. The only supported values are:</p><ul><li><p><code>ENABLED</code> - Server-side encryption is enabled.</p></li><li><p><code>UPDATING</code> - Server-side encryption is being updated.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBSSEStatus status;

@end

/**
 <p>Represents the settings used to enable server-side encryption.</p>
 */
@interface AWSDynamoDBSSESpecification : AWSModel


/**
 <p>Indicates whether server-side encryption is done using an AWS managed CMK or an AWS owned CMK. If enabled (true), server-side encryption type is set to <code>KMS</code> and an AWS managed CMK is used (AWS KMS charges apply). If disabled (false) or not specified, server-side encryption is set to AWS owned CMK.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The KMS Customer Master Key (CMK) which should be used for the KMS encryption. To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter if the key is different from the default DynamoDB Customer Master Key alias/aws/dynamodb.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSMasterKeyId;

/**
 <p>Server-side encryption type. The only supported value is:</p><ul><li><p><code>KMS</code> - Server-side encryption which uses AWS Key Management Service. Key is stored in your account and is managed by AWS KMS (KMS charges apply).</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBSSEType SSEType;

@end

/**
 <p>Represents the input of a <code>Scan</code> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBScanInput : AWSRequest


/**
 <p>This is a legacy parameter. Use <code>ProjectionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>This is a legacy parameter. Use <code>FilterExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>A Boolean value that determines the read consistency model during the scan:</p><ul><li><p>If <code>ConsistentRead</code> is <code>false</code>, then the data returned from <code>Scan</code> might not contain the results from other recently completed write operations (<code>PutItem</code>, <code>UpdateItem</code>, or <code>DeleteItem</code>).</p></li><li><p>If <code>ConsistentRead</code> is <code>true</code>, then all of the write operations that completed before the <code>Scan</code> began are guaranteed to be contained in the <code>Scan</code> response.</p></li></ul><p>The default setting for <code>ConsistentRead</code> is <code>false</code>.</p><p>The <code>ConsistentRead</code> parameter is not supported on global secondary indexes. If you scan a global secondary index with <code>ConsistentRead</code> set to true, you will receive a <code>ValidationException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>The primary key of the first item that this operation will evaluate. Use the value that was returned for <code>LastEvaluatedKey</code> in the previous operation.</p><p>The data type for <code>ExclusiveStartKey</code> must be String, Number or Binary. No set data types are allowed.</p><p>In a parallel scan, a <code>Scan</code> request that includes <code>ExclusiveStartKey</code> must specify the same segment whose previous <code>Scan</code> returned the corresponding value of <code>LastEvaluatedKey</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable exclusiveStartKey;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <code>ProductStatus</code> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <code>ExpressionAttributeValues</code> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A string that contains conditions that DynamoDB applies after the <code>Scan</code> operation, but before the data is returned to you. Items that do not satisfy the <code>FilterExpression</code> criteria are not returned.</p><note><p>A <code>FilterExpression</code> is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.</p></note><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The name of a secondary index to scan. This index can be any local secondary index or global secondary index. Note that if you use the <code>IndexName</code> parameter, you must also provide <code>TableName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed dataset size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in <code>LastEvaluatedKey</code> to apply in a subsequent operation to continue the operation. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Working with Queries</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that identifies one or more attributes to retrieve from the specified table or index. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>This is a legacy parameter. Use <code>FilterExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html">ScanFilter</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable scanFilter;

/**
 <p>For a parallel <code>Scan</code> request, <code>Segment</code> identifies an individual segment to be scanned by an application worker.</p><p>Segment IDs are zero-based, so the first segment is always 0. For example, if you want to use four application threads to scan a table or an index, then the first thread specifies a <code>Segment</code> value of 0, the second thread specifies 1, and so on.</p><p>The value of <code>LastEvaluatedKey</code> returned from a parallel <code>Scan</code> request must be used as <code>ExclusiveStartKey</code> with the same segment ID in a subsequent <code>Scan</code> operation.</p><p>The value for <code>Segment</code> must be greater than or equal to 0, and less than the value provided for <code>TotalSegments</code>.</p><p>If you provide <code>Segment</code>, you must also provide <code>TotalSegments</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segment;

/**
 <p>The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, the count of matching items, or in the case of an index, some or all of the attributes projected into the index.</p><ul><li><p><code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the specified table or index. If you query a local secondary index, then for each matching item in the index, DynamoDB fetches the entire item from the parent table. If the index is configured to project all item attributes, then all of the data can be obtained from the local secondary index, and no fetching is required.</p></li><li><p><code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an index. Retrieves all attributes that have been projected into the index. If the index is configured to project all attributes, this return value is equivalent to specifying <code>ALL_ATTRIBUTES</code>.</p></li><li><p><code>COUNT</code> - Returns the number of matching items, rather than the matching items themselves.</p></li><li><p><code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in <code>AttributesToGet</code>. This return value is equivalent to specifying <code>AttributesToGet</code> without specifying any value for <code>Select</code>.</p><p>If you query or scan a local secondary index and request only attributes that are projected into that index, the operation reads only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB fetches each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.</p><p>If you query or scan a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.</p></li></ul><p>If neither <code>Select</code> nor <code>AttributesToGet</code> are specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an index. You cannot use both <code>Select</code> and <code>AttributesToGet</code> together in a single request, unless the value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to specifying <code>AttributesToGet</code> without any value for <code>Select</code>.)</p><note><p>If you use the <code>ProjectionExpression</code> parameter, then the value for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any other value for <code>Select</code> will return an error.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBSelect select;

/**
 <p>The name of the table containing the requested items; or, if you provide <code>IndexName</code>, the name of the table to which that index belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>For a parallel <code>Scan</code> request, <code>TotalSegments</code> represents the total number of segments into which the <code>Scan</code> operation will be divided. The value of <code>TotalSegments</code> corresponds to the number of application workers that will perform the parallel scan. For example, if you want to use four application threads to scan a table or an index, specify a <code>TotalSegments</code> value of 4.</p><p>The value for <code>TotalSegments</code> must be greater than or equal to 1, and less than or equal to 1000000. If you specify a <code>TotalSegments</code> value of 1, the <code>Scan</code> operation will be sequential rather than parallel.</p><p>If you specify <code>TotalSegments</code>, you must also specify <code>Segment</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSegments;

@end

/**
 <p>Represents the output of a <code>Scan</code> operation.</p>
 */
@interface AWSDynamoDBScanOutput : AWSModel


/**
 <p>The capacity units consumed by the <code>Scan</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>The number of items in the response.</p><p>If you set <code>ScanFilter</code> in the request, then <code>Count</code> is the number of items returned after the filter was applied, and <code>ScannedCount</code> is the number of matching items before the filter was applied.</p><p>If you did not use a filter in the request, then <code>Count</code> is the same as <code>ScannedCount</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>An array of item attributes that match the scan criteria. Each element in this array consists of an attribute name and the value for that attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable items;

/**
 <p>The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.</p><p>If <code>LastEvaluatedKey</code> is empty, then the "last page" of results has been processed and there is no more data to be retrieved.</p><p>If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when <code>LastEvaluatedKey</code> is empty.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable lastEvaluatedKey;

/**
 <p>The number of items evaluated, before any <code>ScanFilter</code> is applied. A high <code>ScannedCount</code> value with few, or no, <code>Count</code> results indicates an inefficient <code>Scan</code> operation. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If you did not use a filter in the request, then <code>ScannedCount</code> is the same as <code>Count</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scannedCount;

@end

/**
 <p>Contains the details of the table when the backup was created. </p>
 Required parameters: [TableName, TableId, KeySchema, TableCreationDateTime, ProvisionedThroughput]
 */
@interface AWSDynamoDBSourceTableDetails : AWSModel


/**
 <p>Controls how you are charged for read and write throughput and how you manage capacity. This setting can be changed later.</p><ul><li><p><code>PROVISIONED</code> - Sets the read/write capacity mode to <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for predictable workloads.</p></li><li><p><code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to <code>PAY_PER_REQUEST</code>. We recommend using <code>PAY_PER_REQUEST</code> for unpredictable workloads. </p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBillingMode billingMode;

/**
 <p>Number of items in the table. Please note this is an approximate value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>Schema of the table. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Read IOPs and Write IOPS on the table when the backup was created.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

/**
 <p>ARN of the table for which backup was created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableArn;

/**
 <p>Time when the source table was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable tableCreationDateTime;

/**
 <p>Unique identifier for the table for which the backup was created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableId;

/**
 <p>The name of the table for which the backup was created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>Size of the table in bytes. Please note this is an approximate value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tableSizeBytes;

@end

/**
 <p>Contains the details of the features enabled on the table when the backup was created. For example, LSIs, GSIs, streams, TTL. </p>
 */
@interface AWSDynamoDBSourceTableFeatureDetails : AWSModel


/**
 <p>Represents the GSI properties for the table when the backup was created. It includes the IndexName, KeySchema, Projection and ProvisionedThroughput for the GSIs on the table at the time of backup. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndexInfo *> * _Nullable globalSecondaryIndexes;

/**
 <p>Represents the LSI properties for the table when the backup was created. It includes the IndexName, KeySchema and Projection for the LSIs on the table at the time of backup. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBLocalSecondaryIndexInfo *> * _Nullable localSecondaryIndexes;

/**
 <p>The description of the server-side encryption status on the table when the backup was created.</p>
 */
@property (nonatomic, strong) AWSDynamoDBSSEDescription * _Nullable SSEDescription;

/**
 <p>Stream settings on the table when the backup was created.</p>
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamDescription;

/**
 <p>Time to Live settings on the table when the backup was created.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTimeToLiveDescription * _Nullable timeToLiveDescription;

@end

/**
 <p>Represents the DynamoDB Streams configuration for a table in DynamoDB.</p>
 */
@interface AWSDynamoDBStreamSpecification : AWSModel


/**
 <p>Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on the table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable streamEnabled;

/**
 <p> When an item in the table is modified, <code>StreamViewType</code> determines what information is written to the stream for this table. Valid values for <code>StreamViewType</code> are:</p><ul><li><p><code>KEYS_ONLY</code> - Only the key attributes of the modified item are written to the stream.</p></li><li><p><code>NEW_IMAGE</code> - The entire item, as it appears after it was modified, is written to the stream.</p></li><li><p><code>OLD_IMAGE</code> - The entire item, as it appeared before it was modified, is written to the stream.</p></li><li><p><code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of the item are written to the stream.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBStreamViewType streamViewType;

@end

/**
 <p>Represents the properties of a table.</p>
 */
@interface AWSDynamoDBTableDescription : AWSModel


/**
 <p>An array of <code>AttributeDefinition</code> objects. Each of these objects describes one attribute in the table and index key schema.</p><p>Each <code>AttributeDefinition</code> object in this array is composed of:</p><ul><li><p><code>AttributeName</code> - The name of the attribute.</p></li><li><p><code>AttributeType</code> - The data type for the attribute.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>Contains the details for the read/write capacity mode.</p>
 */
@property (nonatomic, strong) AWSDynamoDBBillingModeSummary * _Nullable billingModeSummary;

/**
 <p>The date and time when the table was created, in <a href="http://www.epochconverter.com/">UNIX epoch time</a> format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The global secondary indexes, if any, on the table. Each index is scoped to a given partition key value. Each element is composed of:</p><ul><li><p><code>Backfilling</code> - If true, then the index is currently in the backfilling phase. Backfilling occurs only when a new global secondary index is added to the table; it is the process by which DynamoDB populates the new index with data from the table. (This attribute does not appear for indexes that were created during a <code>CreateTable</code> operation.)</p></li><li><p><code>IndexName</code> - The name of the global secondary index.</p></li><li><p><code>IndexSizeBytes</code> - The total size of the global secondary index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p></li><li><p><code>IndexStatus</code> - The current status of the global secondary index:</p><ul><li><p><code>CREATING</code> - The index is being created.</p></li><li><p><code>UPDATING</code> - The index is being updated.</p></li><li><p><code>DELETING</code> - The index is being deleted.</p></li><li><p><code>ACTIVE</code> - The index is ready for use.</p></li></ul></li><li><p><code>ItemCount</code> - The number of items in the global secondary index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p></li><li><p><code>KeySchema</code> - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same partition key as the table.</p></li><li><p><code>Projection</code> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><code>ProjectionType</code> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <code>NonKeyAttributes</code>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><code>NonKeyAttributes</code> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <code>NonKeyAttributes</code>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><code>ProvisionedThroughput</code> - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units, along with data about increases and decreases. </p></li></ul><p>If the table is in the <code>DELETING</code> state, no information about indexes will be returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndexDescription *> * _Nullable globalSecondaryIndexes;

/**
 <p>The number of items in the specified table. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The primary key structure for the table. Each <code>KeySchemaElement</code> consists of:</p><ul><li><p><code>AttributeName</code> - The name of the attribute.</p></li><li><p><code>KeyType</code> - The role of the attribute:</p><ul><li><p><code>HASH</code> - partition key</p></li><li><p><code>RANGE</code> - sort key</p></li></ul><note><p>The partition key of an item is also known as its <i>hash attribute</i>. The term "hash attribute" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.</p><p>The sort key of an item is also known as its <i>range attribute</i>. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.</p></note></li></ul><p>For more information about primary keys, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>The Amazon Resource Name (ARN) that uniquely identifies the latest stream for this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestStreamArn;

/**
 <p>A timestamp, in ISO 8601 format, for this stream.</p><p>Note that <code>LatestStreamLabel</code> is not a unique identifier for the stream, because it is possible that a stream from another table might have the same timestamp. However, the combination of the following three elements is guaranteed to be unique:</p><ul><li><p>the AWS customer ID.</p></li><li><p>the table name.</p></li><li><p>the <code>StreamLabel</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable latestStreamLabel;

/**
 <p>Represents one or more local secondary indexes on the table. Each index is scoped to a given partition key value. Tables with one or more local secondary indexes are subject to an item collection size limit, where the amount of data within a given item collection cannot exceed 10 GB. Each element is composed of:</p><ul><li><p><code>IndexName</code> - The name of the local secondary index.</p></li><li><p><code>KeySchema</code> - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same partition key as the table.</p></li><li><p><code>Projection</code> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><code>ProjectionType</code> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <code>NonKeyAttributes</code>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><code>NonKeyAttributes</code> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <code>NonKeyAttributes</code>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><code>IndexSizeBytes</code> - Represents the total size of the index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p></li><li><p><code>ItemCount</code> - Represents the number of items in the index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p></li></ul><p>If the table is in the <code>DELETING</code> state, no information about indexes will be returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBLocalSecondaryIndexDescription *> * _Nullable localSecondaryIndexes;

/**
 <p>The provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughputDescription * _Nullable provisionedThroughput;

/**
 <p>Contains details for the restore.</p>
 */
@property (nonatomic, strong) AWSDynamoDBRestoreSummary * _Nullable restoreSummary;

/**
 <p>The description of the server-side encryption status on the specified table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBSSEDescription * _Nullable SSEDescription;

/**
 <p>The current DynamoDB Streams configuration for the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 <p>The Amazon Resource Name (ARN) that uniquely identifies the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableArn;

/**
 <p>Unique identifier for the table for which the backup was created. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableId;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The total size of the specified table, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tableSizeBytes;

/**
 <p>The current state of the table:</p><ul><li><p><code>CREATING</code> - The table is being created.</p></li><li><p><code>UPDATING</code> - The table is being updated.</p></li><li><p><code>DELETING</code> - The table is being deleted.</p></li><li><p><code>ACTIVE</code> - The table is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBTableStatus tableStatus;

@end

/**
 <p>Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single DynamoDB table. </p><p> AWS-assigned tag names and values are automatically assigned the <code>aws:</code> prefix, which the user cannot assign. AWS-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix <code>user:</code> in the Cost Allocation Report. You cannot backdate the application of a tag. </p><p>For an overview on tagging DynamoDB resources, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 Required parameters: [Key, Value]
 */
@interface AWSDynamoDBTag : AWSModel


/**
 <p>The key of the tag. Tag keys are case sensitive. Each DynamoDB table can only have up to one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag. Tag values are case-sensitive and can be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSDynamoDBTagResourceInput : AWSRequest


/**
 <p>Identifies the Amazon DynamoDB resource to which tags should be added. This value is an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to be assigned to the Amazon DynamoDB resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBTag *> * _Nullable tags;

@end

/**
 <p>The description of the Time to Live (TTL) status on the specified table. </p>
 */
@interface AWSDynamoDBTimeToLiveDescription : AWSModel


/**
 <p> The name of the TTL attribute for items in the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p> The TTL status for the table.</p>
 */
@property (nonatomic, assign) AWSDynamoDBTimeToLiveStatus timeToLiveStatus;

@end

/**
 <p>Represents the settings used to enable or disable Time to Live (TTL) for the specified table.</p>
 Required parameters: [Enabled, AttributeName]
 */
@interface AWSDynamoDBTimeToLiveSpecification : AWSModel


/**
 <p>The name of the TTL attribute used to store the expiration time for items in the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>Indicates whether TTL is to be enabled (true) or disabled (false) on the table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Specifies an item to be retrieved as part of the transaction.</p>
 Required parameters: [Get]
 */
@interface AWSDynamoDBTransactGetItem : AWSModel


/**
 <p>Contains the primary key that identifies the item to get, together with the name of the table that contains the item, and optionally the specific attributes of the item to retrieve.</p>
 */
@property (nonatomic, strong) AWSDynamoDBGet * _Nullable get;

@end

/**
 
 */
@interface AWSDynamoDBTransactGetItemsInput : AWSRequest


/**
 <p>A value of <code>TOTAL</code> causes consumed capacity information to be returned, and a value of <code>NONE</code> prevents that information from being returned. No other value is valid.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>An ordered array of up to 25 <code>TransactGetItem</code> objects, each of which contains a <code>Get</code> structure.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBTransactGetItem *> * _Nullable transactItems;

@end

/**
 
 */
@interface AWSDynamoDBTransactGetItemsOutput : AWSModel


/**
 <p>If the <i>ReturnConsumedCapacity</i> value was <code>TOTAL</code>, this is an array of <code>ConsumedCapacity</code> objects, one for each table addressed by <code>TransactGetItem</code> objects in the <i>TransactItems</i> parameter. These <code>ConsumedCapacity</code> objects report the read-capacity units consumed by the <code>TransactGetItems</code> call in that table.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>An ordered array of up to 25 <code>ItemResponse</code> objects, each of which corresponds to the <code>TransactGetItem</code> object in the same position in the <i>TransactItems</i> array. Each <code>ItemResponse</code> object contains a Map of the name-value pairs that are the projected attributes of the requested item.</p><p>If a requested item could not be retrieved, the corresponding <code>ItemResponse</code> object is Null, or if the requested item has no projected attributes, the corresponding <code>ItemResponse</code> object is an empty Map. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBItemResponse *> * _Nullable responses;

@end

/**
 <p>A list of requests that can perform update, put, delete, or check operations on multiple items in one or more tables atomically.</p>
 */
@interface AWSDynamoDBTransactWriteItem : AWSModel


/**
 <p>A request to perform a check item operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConditionCheck * _Nullable conditionCheck;

/**
 <p>A request to perform a <code>DeleteItem</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBRemove * _Nullable remove;

/**
 <p>A request to perform a <code>PutItem</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBPut * _Nullable put;

/**
 <p>A request to perform an <code>UpdateItem</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBUpdate * _Nullable update;

@end

/**
 
 */
@interface AWSDynamoDBTransactWriteItemsInput : AWSRequest


/**
 <p>Providing a <code>ClientRequestToken</code> makes the call to <code>TransactWriteItems</code> idempotent, meaning that multiple identical calls have the same effect as one single call.</p><p>Although multiple identical calls using the same client request token produce the same result on the server (no side effects), the responses to the calls might not be the same. If the <code>ReturnConsumedCapacity&gt;</code> parameter is set, then the initial <code>TransactWriteItems</code> call returns the amount of write capacity units consumed in making the changes. Subsequent <code>TransactWriteItems</code> calls with the same client token return the number of read capacity units consumed in reading the item.</p><p>A client request token is valid for 10 minutes after the first request that uses it is completed. After 10 minutes, any request with the same client token is treated as a new request. Do not resubmit the same request with the same client token for more than 10 minutes, or the result might not be idempotent.</p><p>If you submit a request with the same client token but a change in other parameters within the 10-minute idempotency window, DynamoDB returns an <code>IdempotentParameterMismatch</code> exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Determines whether item collection metrics are returned. If set to <code>SIZE</code>, the response includes statistics about item collections (if any), that were modified during the operation and are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned. </p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>An ordered array of up to 25 <code>TransactWriteItem</code> objects, each of which contains a <code>ConditionCheck</code>, <code>Put</code>, <code>Update</code>, or <code>Delete</code> object. These can operate on items in different tables, but the tables must reside in the same AWS account and Region, and no two of them can operate on the same item. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBTransactWriteItem *> * _Nullable transactItems;

@end

/**
 
 */
@interface AWSDynamoDBTransactWriteItemsOutput : AWSModel


/**
 <p>The capacity units consumed by the entire <code>TransactWriteItems</code> operation. The values of the list are ordered according to the ordering of the <code>TransactItems</code> request parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>A list of tables that were processed by <code>TransactWriteItems</code> and, for each table, information about any item collections that were affected by individual <code>UpdateItem</code>, <code>PutItem</code>, or <code>DeleteItem</code> operations. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBItemCollectionMetrics *> *> * _Nullable itemCollectionMetrics;

@end

/**
 
 */
@interface AWSDynamoDBUntagResourceInput : AWSRequest


/**
 <p>The DynamoDB resource that the tags will be removed from. This value is an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tag keys. Existing tags of the resource whose keys are members of this list will be removed from the DynamoDB resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>Represents a request to perform an <code>UpdateItem</code> operation.</p>
 Required parameters: [Key, UpdateExpression, TableName]
 */
@interface AWSDynamoDBUpdate : AWSModel


/**
 <p>A condition that must be satisfied in order for a conditional update to succeed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>One or more substitution tokens for attribute names in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>The primary key of the item to be updated. Each element consists of an attribute name and a value for that attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item attributes if the <code>Update</code> condition fails. For <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

/**
 <p>Name of the table for the <code>UpdateItem</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>An expression that defines one or more attributes to be updated, the action to be performed on them, and new value(s) for them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updateExpression;

@end

/**
 
 */
@interface AWSDynamoDBUpdateContinuousBackupsInput : AWSRequest


/**
 <p>Represents the settings used to enable point in time recovery.</p>
 */
@property (nonatomic, strong) AWSDynamoDBPointInTimeRecoverySpecification * _Nullable pointInTimeRecoverySpecification;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSDynamoDBUpdateContinuousBackupsOutput : AWSModel


/**
 <p>Represents the continuous backups and point in time recovery settings on the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBContinuousBackupsDescription * _Nullable continuousBackupsDescription;

@end

/**
 <p>Represents the new provisioned throughput settings to be applied to a global secondary index.</p>
 Required parameters: [IndexName, ProvisionedThroughput]
 */
@interface AWSDynamoDBUpdateGlobalSecondaryIndexAction : AWSModel


/**
 <p>The name of the global secondary index to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>Represents the provisioned throughput settings for the specified global secondary index.</p><p>For current minimum and maximum provisioned throughput values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 
 */
@interface AWSDynamoDBUpdateGlobalTableInput : AWSRequest


/**
 <p>The global table name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>A list of Regions that should be added or removed from the global table.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaUpdate *> * _Nullable replicaUpdates;

@end

/**
 
 */
@interface AWSDynamoDBUpdateGlobalTableOutput : AWSModel


/**
 <p>Contains the details of the global table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBGlobalTableDescription * _Nullable globalTableDescription;

@end

/**
 
 */
@interface AWSDynamoDBUpdateGlobalTableSettingsInput : AWSRequest


/**
 <p>The billing mode of the global table. If <code>GlobalTableBillingMode</code> is not specified, the global table defaults to <code>PROVISIONED</code> capacity billing mode.</p>
 */
@property (nonatomic, assign) AWSDynamoDBBillingMode globalTableBillingMode;

/**
 <p>Represents the settings of a global secondary index for a global table that will be modified.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate *> * _Nullable globalTableGlobalSecondaryIndexSettingsUpdate;

/**
 <p>The name of the global table</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>Auto scaling settings for managing provisioned write capacity for the global table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBAutoScalingSettingsUpdate * _Nullable globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <code>ThrottlingException.</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable globalTableProvisionedWriteCapacityUnits;

/**
 <p>Represents the settings for a global table in a Region that will be modified.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaSettingsUpdate *> * _Nullable replicaSettingsUpdate;

@end

/**
 
 */
@interface AWSDynamoDBUpdateGlobalTableSettingsOutput : AWSModel


/**
 <p>The name of the global table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable globalTableName;

/**
 <p>The Region-specific settings for the global table.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBReplicaSettingsDescription *> * _Nullable replicaSettings;

@end

/**
 <p>Represents the input of an <code>UpdateItem</code> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBUpdateItemInput : AWSRequest


/**
 <p>This is a legacy parameter. Use <code>UpdateExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html">AttributeUpdates</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValueUpdate *> * _Nullable attributeUpdates;

/**
 <p>A condition that must be satisfied in order for a conditional update to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Functions: <code>attribute_exists | attribute_not_exists | attribute_type | contains | begins_with | size</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN </code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information about condition expressions, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>This is a legacy parameter. Use <code>ConditionExpression</code> instead. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <code>ExpressionAttributeNames</code>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.) To work around this, you could specify the following for <code>ExpressionAttributeNames</code>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information about expression attribute names, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <code>ProductStatus</code> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <code>ExpressionAttributeValues</code> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>The primary key of the item to be updated. Each element consists of an attribute name and a value for that attribute.</p><p>For the primary key, you must provide all of the attributes. For example, with a simple primary key, you only need to provide a value for the partition key. For a composite primary key, you must provide values for both the partition key and the sort key.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>Determines the level of detail about provisioned throughput consumption that is returned in the response:</p><ul><li><p><code>INDEXES</code> - The response includes the aggregate <code>ConsumedCapacity</code> for the operation, together with <code>ConsumedCapacity</code> for each table and secondary index that was accessed.</p><p>Note that some operations, such as <code>GetItem</code> and <code>BatchGetItem</code>, do not access any indexes at all. In these cases, specifying <code>INDEXES</code> will only return <code>ConsumedCapacity</code> information for table(s).</p></li><li><p><code>TOTAL</code> - The response includes only the aggregate <code>ConsumedCapacity</code> for the operation.</p></li><li><p><code>NONE</code> - No <code>ConsumedCapacity</code> details are included in the response.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>Determines whether item collection metrics are returned. If set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <code>ReturnValues</code> if you want to get the item attributes as they appear before or after they are updated. For <code>UpdateItem</code>, the valid values are:</p><ul><li><p><code>NONE</code> - If <code>ReturnValues</code> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <code>ReturnValues</code>.)</p></li><li><p><code>ALL_OLD</code> - Returns all of the attributes of the item, as they appeared before the UpdateItem operation.</p></li><li><p><code>UPDATED_OLD</code> - Returns only the updated attributes, as they appeared before the UpdateItem operation.</p></li><li><p><code>ALL_NEW</code> - Returns all of the attributes of the item, as they appear after the UpdateItem operation.</p></li><li><p><code>UPDATED_NEW</code> - Returns only the updated attributes, as they appear after the UpdateItem operation.</p></li></ul><p>There is no additional cost associated with requesting a return value aside from the small network and processing overhead of receiving a larger response. No read capacity units are consumed.</p><p>The values returned are strongly consistent.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table containing the item to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>An expression that defines one or more attributes to be updated, the action to be performed on them, and new values for them.</p><p>The following action values are available for <code>UpdateExpression</code>.</p><ul><li><p><code>SET</code> - Adds one or more attributes and values to an item. If any of these attributes already exist, they are replaced by the new values. You can also use <code>SET</code> to add or subtract from an attribute that is of type Number. For example: <code>SET myNum = myNum + :val</code></p><p><code>SET</code> supports the following functions:</p><ul><li><p><code>if_not_exists (path, operand)</code> - if the item does not contain an attribute at the specified path, then <code>if_not_exists</code> evaluates to operand; otherwise, it evaluates to path. You can use this function to avoid overwriting an attribute that may already be present in the item.</p></li><li><p><code>list_append (operand, operand)</code> - evaluates to a list with a new element added to it. You can append the new element to the start or the end of the list by reversing the order of the operands.</p></li></ul><p>These function names are case-sensitive.</p></li><li><p><code>REMOVE</code> - Removes one or more attributes from an item.</p></li><li><p><code>ADD</code> - Adds the specified value to the item, if the attribute does not already exist. If the attribute does exist, then the behavior of <code>ADD</code> depends on the data type of the attribute:</p><ul><li><p>If the existing attribute is a number, and if <code>Value</code> is also a number, then <code>Value</code> is mathematically added to the existing attribute. If <code>Value</code> is a negative number, then it is subtracted from the existing attribute.</p><note><p>If you use <code>ADD</code> to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses <code>0</code> as the initial value.</p><p>Similarly, if you use <code>ADD</code> for an existing item to increment or decrement an attribute value that doesn't exist before the update, DynamoDB uses <code>0</code> as the initial value. For example, suppose that the item you want to update doesn't have an attribute named <code>itemcount</code>, but you decide to <code>ADD</code> the number <code>3</code> to this attribute anyway. DynamoDB will create the <code>itemcount</code> attribute, set its initial value to <code>0</code>, and finally add <code>3</code> to it. The result will be a new <code>itemcount</code> attribute in the item, with a value of <code>3</code>.</p></note></li><li><p>If the existing data type is a set and if <code>Value</code> is also a set, then <code>Value</code> is added to the existing set. For example, if the attribute value is the set <code>[1,2]</code>, and the <code>ADD</code> action specified <code>[3]</code>, then the final attribute value is <code>[1,2,3]</code>. An error occurs if an <code>ADD</code> action is specified for a set attribute and the attribute type specified does not match the existing set type. </p><p>Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the <code>Value</code> must also be a set of strings.</p></li></ul><important><p>The <code>ADD</code> action only supports Number and set data types. In addition, <code>ADD</code> can only be used on top-level attributes, not nested attributes.</p></important></li><li><p><code>DELETE</code> - Deletes an element from a set.</p><p>If a set of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set <code>[a,b,c]</code> and the <code>DELETE</code> action specifies <code>[a,c]</code>, then the final attribute value is <code>[b]</code>. Specifying an empty set is an error.</p><important><p>The <code>DELETE</code> action only supports set data types. In addition, <code>DELETE</code> can only be used on top-level attributes, not nested attributes.</p></important></li></ul><p>You can have many actions in a single expression, such as the following: <code>SET a=:value1, b=:value2 DELETE :value3, :value4, :value5</code></p><p>For more information on update expressions, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html">Modifying Items and Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updateExpression;

@end

/**
 <p>Represents the output of an <code>UpdateItem</code> operation.</p>
 */
@interface AWSDynamoDBUpdateItemOutput : AWSModel


/**
 <p>A map of attribute values as they appear before or after the <code>UpdateItem</code> operation, as determined by the <code>ReturnValues</code> parameter.</p><p>The <code>Attributes</code> map is only present if <code>ReturnValues</code> was specified as something other than <code>NONE</code> in the request. Each element represents one attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by the <code>UpdateItem</code> operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <code>ConsumedCapacity</code> is only returned if the <code>ReturnConsumedCapacity</code> parameter was specified. For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the <code>UpdateItem</code> operation. <code>ItemCollectionMetrics</code> is only returned if the <code>ReturnItemCollectionMetrics</code> parameter was specified. If the table does not have any local secondary indexes, this information is not returned in the response.</p><p>Each <code>ItemCollectionMetrics</code> element consists of:</p><ul><li><p><code>ItemCollectionKey</code> - The partition key value of the item collection. This is the same as the partition key value of the item itself.</p></li><li><p><code>SizeEstimateRangeGB</code> - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents the input of an <code>UpdateTable</code> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBUpdateTableInput : AWSRequest


/**
 <p>An array of attributes that describe the key schema for the table and indexes. If you are adding a new global secondary index to the table, <code>AttributeDefinitions</code> must include the key element(s) of the new index.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>Controls how you are charged for read and write throughput and how you manage capacity. When switching from pay-per-request to provisioned capacity, initial provisioned capacity values must be set. The initial provisioned capacity values are estimated based on the consumed read and write capacity of your table and global secondary indexes over the past 30 minutes.</p><ul><li><p><code>PROVISIONED</code> - Sets the billing mode to <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for predictable workloads.</p></li><li><p><code>PAY_PER_REQUEST</code> - Sets the billing mode to <code>PAY_PER_REQUEST</code>. We recommend using <code>PAY_PER_REQUEST</code> for unpredictable workloads. </p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBBillingMode billingMode;

/**
 <p>An array of one or more global secondary indexes for the table. For each index in the array, you can request one action:</p><ul><li><p><code>Create</code> - add a new global secondary index to the table.</p></li><li><p><code>Update</code> - modify the provisioned throughput settings of an existing global secondary index.</p></li><li><p><code>Delete</code> - remove a global secondary index from the table.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html">Managing Global Secondary Indexes</a> in the <i>Amazon DynamoDB Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndexUpdate *> * _Nullable globalSecondaryIndexUpdates;

/**
 <p>The new provisioned throughput settings for the specified table or index.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

/**
 <p>The new server-side encryption settings for the specified table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBSSESpecification * _Nullable SSESpecification;

/**
 <p>Represents the DynamoDB Streams configuration for the table.</p><note><p>You receive a <code>ResourceInUseException</code> if you try to enable a stream on a table that already has a stream, or if you try to disable a stream on a table that doesn't have a stream.</p></note>
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 <p>The name of the table to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of an <code>UpdateTable</code> operation.</p>
 */
@interface AWSDynamoDBUpdateTableOutput : AWSModel


/**
 <p>Represents the properties of the table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 <p>Represents the input of an <code>UpdateTimeToLive</code> operation.</p>
 Required parameters: [TableName, TimeToLiveSpecification]
 */
@interface AWSDynamoDBUpdateTimeToLiveInput : AWSRequest


/**
 <p>The name of the table to be configured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>Represents the settings used to enable or disable Time to Live for the specified table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTimeToLiveSpecification * _Nullable timeToLiveSpecification;

@end

/**
 
 */
@interface AWSDynamoDBUpdateTimeToLiveOutput : AWSModel


/**
 <p>Represents the output of an <code>UpdateTimeToLive</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTimeToLiveSpecification * _Nullable timeToLiveSpecification;

@end

/**
 <p>Represents an operation to perform - either <code>DeleteItem</code> or <code>PutItem</code>. You can only request one of these operations, not both, in a single <code>WriteRequest</code>. If you do need to perform both of these operations, you will need to provide two separate <code>WriteRequest</code> objects.</p>
 */
@interface AWSDynamoDBWriteRequest : AWSModel


/**
 <p>A request to perform a <code>DeleteItem</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBDeleteRequest * _Nullable deleteRequest;

/**
 <p>A request to perform a <code>PutItem</code> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBPutRequest * _Nullable putRequest;

@end

NS_ASSUME_NONNULL_END
