//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSDynamoDBErrorAccessDenied,
    AWSDynamoDBErrorUnrecognizedClient,
    AWSDynamoDBErrorIncompleteSignature,
    AWSDynamoDBErrorInvalidClientTokenId,
    AWSDynamoDBErrorMissingAuthenticationToken,
    AWSDynamoDBErrorConditionalCheckFailed,
    AWSDynamoDBErrorInternalServer,
    AWSDynamoDBErrorItemCollectionSizeLimitExceeded,
    AWSDynamoDBErrorLimitExceeded,
    AWSDynamoDBErrorProvisionedThroughputExceeded,
    AWSDynamoDBErrorResourceInUse,
    AWSDynamoDBErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSDynamoDBAttributeAction) {
    AWSDynamoDBAttributeActionUnknown,
    AWSDynamoDBAttributeActionAdd,
    AWSDynamoDBAttributeActionPut,
    AWSDynamoDBAttributeActionDelete,
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

typedef NS_ENUM(NSInteger, AWSDynamoDBProjectionType) {
    AWSDynamoDBProjectionTypeUnknown,
    AWSDynamoDBProjectionTypeAll,
    AWSDynamoDBProjectionTypeKeysOnly,
    AWSDynamoDBProjectionTypeInclude,
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

@class AWSDynamoDBAttributeDefinition;
@class AWSDynamoDBAttributeValue;
@class AWSDynamoDBAttributeValueUpdate;
@class AWSDynamoDBBatchGetItemInput;
@class AWSDynamoDBBatchGetItemOutput;
@class AWSDynamoDBBatchWriteItemInput;
@class AWSDynamoDBBatchWriteItemOutput;
@class AWSDynamoDBCapacity;
@class AWSDynamoDBCondition;
@class AWSDynamoDBConsumedCapacity;
@class AWSDynamoDBCreateGlobalSecondaryIndexAction;
@class AWSDynamoDBCreateTableInput;
@class AWSDynamoDBCreateTableOutput;
@class AWSDynamoDBDeleteGlobalSecondaryIndexAction;
@class AWSDynamoDBDeleteItemInput;
@class AWSDynamoDBDeleteItemOutput;
@class AWSDynamoDBDeleteRequest;
@class AWSDynamoDBDeleteTableInput;
@class AWSDynamoDBDeleteTableOutput;
@class AWSDynamoDBDescribeTableInput;
@class AWSDynamoDBDescribeTableOutput;
@class AWSDynamoDBExpectedAttributeValue;
@class AWSDynamoDBGetItemInput;
@class AWSDynamoDBGetItemOutput;
@class AWSDynamoDBGlobalSecondaryIndex;
@class AWSDynamoDBGlobalSecondaryIndexDescription;
@class AWSDynamoDBGlobalSecondaryIndexUpdate;
@class AWSDynamoDBItemCollectionMetrics;
@class AWSDynamoDBKeySchemaElement;
@class AWSDynamoDBKeysAndAttributes;
@class AWSDynamoDBListTablesInput;
@class AWSDynamoDBListTablesOutput;
@class AWSDynamoDBLocalSecondaryIndex;
@class AWSDynamoDBLocalSecondaryIndexDescription;
@class AWSDynamoDBProjection;
@class AWSDynamoDBProvisionedThroughput;
@class AWSDynamoDBProvisionedThroughputDescription;
@class AWSDynamoDBPutItemInput;
@class AWSDynamoDBPutItemOutput;
@class AWSDynamoDBPutRequest;
@class AWSDynamoDBQueryInput;
@class AWSDynamoDBQueryOutput;
@class AWSDynamoDBScanInput;
@class AWSDynamoDBScanOutput;
@class AWSDynamoDBStreamSpecification;
@class AWSDynamoDBTableDescription;
@class AWSDynamoDBUpdateGlobalSecondaryIndexAction;
@class AWSDynamoDBUpdateItemInput;
@class AWSDynamoDBUpdateItemOutput;
@class AWSDynamoDBUpdateTableInput;
@class AWSDynamoDBUpdateTableOutput;
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
 <p>The data type for the attribute.</p>
 */
@property (nonatomic, assign) AWSDynamoDBScalarAttributeType attributeType;

@end

/**
 <p>Represents the data for an attribute. You can set one, and only one, of the elements.</p><p>Each attribute in an item is a name-value pair. An attribute can be single-valued or multi-valued set. For example, a book item can have title and authors attributes. Each book has one title but can have many authors. The multi-valued attribute is a set; duplicate values are not allowed. </p>
 */
@interface AWSDynamoDBAttributeValue : AWSModel


/**
 <p>A Binary data type.</p>
 */
@property (nonatomic, strong) NSData * _Nullable B;

/**
 <p>A Boolean data type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable BOOLEAN;

/**
 <p>A Binary Set data type.</p>
 */
@property (nonatomic, strong) NSArray<NSData *> * _Nullable BS;

/**
 <p>A List of attribute values.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable L;

/**
 <p>A Map of attribute values.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable M;

/**
 <p>A Number data type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable N;

/**
 <p>A Null data type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable NIL;

/**
 <p>A Number Set data type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable NS;

/**
 <p>A String data type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable S;

/**
 <p>A String Set data type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable SS;

@end

/**
 <p>For the <i>UpdateItem</i> operation, represents the attributes to be modified, the action to perform on each, and the new value for each.</p><note><p>You cannot use <i>UpdateItem</i> to update any primary key attributes. Instead, you will need to delete the item, and then use <i>PutItem</i> to create a new item with new attributes.</p></note><p>Attribute values cannot be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests with empty values will be rejected with a <i>ValidationException</i> exception.</p>
 */
@interface AWSDynamoDBAttributeValueUpdate : AWSModel


/**
 <p>Specifies how to perform the update. Valid values are <code>PUT</code> (default), <code>DELETE</code>, and <code>ADD</code>. The behavior depends on whether the specified primary key already exists in the table.</p><p><b>If an item with the specified <i>Key</i> is found in the table:</b></p><ul><li><p><code>PUT</code> - Adds the specified attribute to the item. If the attribute already exists, it is replaced by the new value. </p></li><li><p><code>DELETE</code> - If no value is specified, the attribute and its value are removed from the item. The data type of the specified value must match the existing value's data type.</p><p>If a <i>set</i> of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set <code>[a,b,c]</code> and the <i>DELETE</i> action specified <code>[a,c]</code>, then the final attribute value would be <code>[b]</code>. Specifying an empty set is an error.</p></li><li><p><code>ADD</code> - If the attribute does not already exist, then the attribute and its values are added to the item. If the attribute does exist, then the behavior of <code>ADD</code> depends on the data type of the attribute:</p><ul><li><p>If the existing attribute is a number, and if <i>Value</i> is also a number, then the <i>Value</i> is mathematically added to the existing attribute. If <i>Value</i> is a negative number, then it is subtracted from the existing attribute.</p><note><p> If you use <code>ADD</code> to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses 0 as the initial value.</p><p>In addition, if you use <code>ADD</code> to update an existing item, and intend to increment or decrement an attribute value which does not yet exist, DynamoDB uses <code>0</code> as the initial value. For example, suppose that the item you want to update does not yet have an attribute named <i>itemcount</i>, but you decide to <code>ADD</code> the number <code>3</code> to this attribute anyway, even though it currently does not exist. DynamoDB will create the <i>itemcount</i> attribute, set its initial value to <code>0</code>, and finally add <code>3</code> to it. The result will be a new <i>itemcount</i> attribute in the item, with a value of <code>3</code>.</p></note></li><li><p>If the existing data type is a set, and if the <i>Value</i> is also a set, then the <i>Value</i> is added to the existing set. (This is a <i>set</i> operation, not mathematical addition.) For example, if the attribute value was the set <code>[1,2]</code>, and the <code>ADD</code> action specified <code>[3]</code>, then the final attribute value would be <code>[1,2,3]</code>. An error occurs if an Add action is specified for a set attribute and the attribute type specified does not match the existing set type. </p><p>Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the <i>Value</i> must also be a set of strings. The same holds true for number sets and binary sets.</p></li></ul><p>This action is only valid for an existing attribute whose data type is number or is a set. Do not use <code>ADD</code> for any other data types.</p></li></ul><p><b>If no item with the specified <i>Key</i> is found:</b></p><ul><li><p><code>PUT</code> - DynamoDB creates a new item with the specified primary key, and then adds the attribute. </p></li><li><p><code>DELETE</code> - Nothing happens; there is no attribute to delete.</p></li><li><p><code>ADD</code> - DynamoDB creates an item with the supplied primary key and number (or set of numbers) for the attribute value. The only data types allowed are number and number set; no other data types can be specified.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBAttributeAction action;

/**
 <p>Represents the data for an attribute. You can set one, and only one, of the elements.</p><p>Each attribute in an item is a name-value pair. An attribute can be single-valued or multi-valued set. For example, a book item can have title and authors attributes. Each book has one title but can have many authors. The multi-valued attribute is a set; duplicate values are not allowed. </p>
 */
@property (nonatomic, strong) AWSDynamoDBAttributeValue * _Nullable value;

@end

/**
 <p>Represents the input of a <i>BatchGetItem</i> operation.</p>
 Required parameters: [RequestItems]
 */
@interface AWSDynamoDBBatchGetItemInput : AWSRequest


/**
 <p>A map of one or more table names and, for each table, a map that describes one or more items to retrieve from that table. Each table name can be used only once per <i>BatchGetItem</i> request.</p><p>Each element in the map of items to retrieve consists of the following:</p><ul><li><p><i>ConsistentRead</i> - If <code>true</code>, a strongly consistent read is used; if <code>false</code> (the default), an eventually consistent read is used.</p></li><li><p><i>ExpressionAttributeNames</i> - One or more substitution tokens for attribute names in the <i>ProjectionExpression</i> parameter. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><i>Keys</i> - An array of primary key attribute values that define specific items in the table. For each primary key, you must provide <i>all</i> of the key attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide <i>both</i> the hash attribute and the range attribute.</p></li><li><p><i>ProjectionExpression</i> - A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><i>AttributesToGet</i> - </p><important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ProjectionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p><p>This parameter allows you to retrieve attributes of type List or Map; however, it cannot retrieve individual elements within a List or a Map.</p></important><p>The names of one or more attributes to retrieve. If no attribute names are provided, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>Note that <i>AttributesToGet</i> has no effect on provisioned throughput consumption. DynamoDB determines capacity units consumed based on item size, not on the amount of data that is returned to an application.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBKeysAndAttributes *> * _Nullable requestItems;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

@end

/**
 <p>Represents the output of a <i>BatchGetItem</i> operation.</p>
 */
@interface AWSDynamoDBBatchGetItemOutput : AWSModel


/**
 <p>The read capacity units consumed by the operation.</p><p>Each element consists of:</p><ul><li><p><i>TableName</i> - The table that consumed the provisioned throughput.</p></li><li><p><i>CapacityUnits</i> - The total number of capacity units consumed.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>A map of table name to a list of items. Each object in <i>Responses</i> consists of a table name, along with a map of attribute data consisting of the data type and attribute value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> *> * _Nullable responses;

/**
 <p>A map of tables and their respective keys that were not processed with the current response. The <i>UnprocessedKeys</i> value is in the same form as <i>RequestItems</i>, so the value can be provided directly to a subsequent <i>BatchGetItem</i> operation. For more information, see <i>RequestItems</i> in the Request Parameters section.</p><p>Each element consists of:</p><ul><li><p><i>Keys</i> - An array of primary key attribute values that define specific items in the table.</p></li><li><p><i>AttributesToGet</i> - One or more attributes to be retrieved from the table or index. By default, all attributes are returned. If a requested attribute is not found, it does not appear in the result.</p></li><li><p><i>ConsistentRead</i> - The consistency of a read operation. If set to <code>true</code>, then a strongly consistent read is used; otherwise, an eventually consistent read is used.</p></li></ul><p>If there are no unprocessed keys remaining, the response contains an empty <i>UnprocessedKeys</i> map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBKeysAndAttributes *> * _Nullable unprocessedKeys;

@end

/**
 <p>Represents the input of a <i>BatchWriteItem</i> operation.</p>
 Required parameters: [RequestItems]
 */
@interface AWSDynamoDBBatchWriteItemInput : AWSRequest


/**
 <p>A map of one or more table names and, for each table, a list of operations to be performed (<i>DeleteRequest</i> or <i>PutRequest</i>). Each element in the map consists of the following:</p><ul><li><p><i>DeleteRequest</i> - Perform a <i>DeleteItem</i> operation on the specified item. The item to be deleted is identified by a <i>Key</i> subelement:</p><ul><li><p><i>Key</i> - A map of primary key attribute values that uniquely identify the ! item. Each entry in this map consists of an attribute name and an attribute value. For each primary key, you must provide <i>all</i> of the key attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide <i>both</i> the hash attribute and the range attribute.</p></li></ul></li><li><p><i>PutRequest</i> - Perform a <i>PutItem</i> operation on the specified item. The item to be put is identified by an <i>Item</i> subelement:</p><ul><li><p><i>Item</i> - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a <i>ValidationException</i> exception.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBWriteRequest *> *> * _Nullable requestItems;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>A value that if set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

@end

/**
 <p>Represents the output of a <i>BatchWriteItem</i> operation.</p>
 */
@interface AWSDynamoDBBatchWriteItemOutput : AWSModel


/**
 <p>The capacity units consumed by the operation.</p><p>Each element consists of:</p><ul><li><p><i>TableName</i> - The table that consumed the provisioned throughput.</p></li><li><p><i>CapacityUnits</i> - The total number of capacity units consumed.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBConsumedCapacity *> * _Nullable consumedCapacity;

/**
 <p>A list of tables that were processed by <i>BatchWriteItem</i> and, for each table, information about any item collections that were affected by individual <i>DeleteItem</i> or <i>PutItem</i> operations.</p><p>Each entry consists of the following subelements:</p><ul><li><p><i>ItemCollectionKey</i> - The hash key value of the item collection. This is the same as the hash key of the item.</p></li><li><p><i>SizeEstimateRange</i> - An estimate of item collection size, expressed in GB. This is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on the table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBItemCollectionMetrics *> *> * _Nullable itemCollectionMetrics;

/**
 <p>A map of tables and requests against those tables that were not processed. The <i>UnprocessedItems</i> value is in the same form as <i>RequestItems</i>, so you can provide this value directly to a subsequent <i>BatchGetItem</i> operation. For more information, see <i>RequestItems</i> in the Request Parameters section.</p><p>Each <i>UnprocessedItems</i> entry consists of a table name and, for that table, a list of operations to perform (<i>DeleteRequest</i> or <i>PutRequest</i>).</p><ul><li><p><i>DeleteRequest</i> - Perform a <i>DeleteItem</i> operation on the specified item. The item to be deleted is identified by a <i>Key</i> subelement:</p><ul><li><p><i>Key</i> - A map of primary key attribute values that uniquely identify the item. Each entry in this map consists of an attribute name and an attribute value.</p></li></ul></li><li><p><i>PutRequest</i> - Perform a <i>PutItem</i> operation on the specified item. The item to be put is identified by an <i>Item</i> subelement:</p><ul><li><p><i>Item</i> - A map of attributes and their values. Each entry in this map consists of an attribute name and an attribute value. Attribute values must not be null; string and binary type attributes must have lengths greater than zero; and set type attributes must not be empty. Requests that contain empty values will be rejected with a <i>ValidationException</i> exception.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p></li></ul></li></ul><p>If there are no unprocessed items remaining, the response contains an empty <i>UnprocessedItems</i> map.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSDynamoDBWriteRequest *> *> * _Nullable unprocessedItems;

@end

/**
 <p>Represents the amount of provisioned throughput capacity consumed on a table or an index. </p>
 */
@interface AWSDynamoDBCapacity : AWSModel


/**
 <p>The total number of capacity units consumed on a table or an index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityUnits;

@end

/**
 <p>Represents the selection criteria for a <i>Query</i> or <i>Scan</i> operation:</p><ul><li><p>For a <i>Query</i> operation, <i>Condition</i> is used for specifying the <i>KeyConditions</i> to use when querying a table or an index. For <i>KeyConditions</i>, only the following comparison operators are supported:</p><p><code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code></p><p><i>Condition</i> is also used in a <i>QueryFilter</i>, which evaluates the query results and returns only the desired values.</p></li><li><p>For a <i>Scan</i> operation, <i>Condition</i> is used in a <i>ScanFilter</i>, which evaluates the scan results and returns only the desired values.</p></li></ul>
 Required parameters: [ComparisonOperator]
 */
@interface AWSDynamoDBCondition : AWSModel


/**
 <p>One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable attributeValueList;

/**
 <p>A comparator for evaluating attributes. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <i>true</i>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <i>false</i>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements within two sets.</p><p><i>AttributeValueList</i> can contain one or more <i>AttributeValue</i> elements of type String, Number, or Binary (not a set type). These attributes are compared against an existing set type attribute of an item. If any elements of the input set are present in the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul><p>For usage examples of <i>AttributeValueList</i> and <i>ComparisonOperator</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSDynamoDBComparisonOperator comparisonOperator;

@end

/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
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
 <p>The amount of throughput consumed on the table affected by the operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBCapacity * _Nullable table;

/**
 <p>The name of the table that was affected by the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents a new global secondary index to be added to an existing table.</p>
 Required parameters: [IndexName, KeySchema, Projection, ProvisionedThroughput]
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
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 <p>Represents the input of a <i>CreateTable</i> operation.</p>
 Required parameters: [AttributeDefinitions, TableName, KeySchema, ProvisionedThroughput]
 */
@interface AWSDynamoDBCreateTableInput : AWSRequest


/**
 <p>An array of attributes that describe the key schema for the table and indexes.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>One or more global secondary indexes (the maximum is five) to be created on the table. Each global secondary index in the array includes the following:</p><ul><li><p><i>IndexName</i> - The name of the global secondary index. Must be unique only for this table.</p><p></p></li><li><p><i>KeySchema</i> - Specifies the key schema for the global secondary index.</p></li><li><p><i>Projection</i> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><i>ProjectionType</i> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <i>NonKeyAttributes</i>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><i>NonKeyAttributes</i> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <i>NonKeyAttributes</i>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><i>ProvisionedThroughput</i> - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndex *> * _Nullable globalSecondaryIndexes;

/**
 <p>Specifies the attributes that make up the primary key for a table or an index. The attributes in <i>KeySchema</i> must also be defined in the <i>AttributeDefinitions</i> array. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data Model</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>Each <i>KeySchemaElement</i> in the array is composed of:</p><ul><li><p><i>AttributeName</i> - The name of this key attribute.</p></li><li><p><i>KeyType</i> - Determines whether the key attribute is <code>HASH</code> or <code>RANGE</code>.</p></li></ul><p>For a primary key that consists of a hash attribute, you must provide exactly one element with a <i>KeyType</i> of <code>HASH</code>.</p><p>For a primary key that consists of hash and range attributes, you must provide exactly two elements, in this order: The first element must have a <i>KeyType</i> of <code>HASH</code>, and the second element must have a <i>KeyType</i> of <code>RANGE</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key">Specifying the Primary Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>One or more local secondary indexes (the maximum is five) to be created on the table. Each index is scoped to a given hash key value. There is a 10 GB size limit per hash key; otherwise, the size of a local secondary index is unconstrained.</p><p>Each local secondary index in the array includes the following:</p><ul><li><p><i>IndexName</i> - The name of the local secondary index. Must be unique only for this table.</p><p></p></li><li><p><i>KeySchema</i> - Specifies the key schema for the local secondary index. The key schema must begin with the same hash key attribute as the table.</p></li><li><p><i>Projection</i> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><i>ProjectionType</i> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <i>NonKeyAttributes</i>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><i>NonKeyAttributes</i> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <i>NonKeyAttributes</i>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBLocalSecondaryIndex *> * _Nullable localSecondaryIndexes;

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

/**
 
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 <p>The name of the table to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>CreateTable</i> operation.</p>
 */
@interface AWSDynamoDBCreateTableOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

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
 <p>Represents the input of a <i>DeleteItem</i> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBDeleteItemInput : AWSRequest


/**
 <p>A condition that must be satisfied in order for a conditional <i>DeleteItem</i> to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Boolean functions: <code>attribute_exists | attribute_not_exists | contains | begins_with</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code> = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;= | &#x3E;= | BETWEEN | IN</code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information on condition expressions, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ConditionExpression</i> replaces the legacy <i>ConditionalOperator</i> and <i>Expected</i> parameters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A logical operator to apply to the conditions in the <i>Expected</i> map:</p><ul><li><p><code>AND</code> - If all of the conditions evaluate to true, then the entire map evaluates to true.</p></li><li><p><code>OR</code> - If at least one of the conditions evaluate to true, then the entire map evaluates to true.</p></li></ul><p>If you omit <i>ConditionalOperator</i>, then <code>AND</code> is the default.</p><p>The operation will succeed only if the entire map evaluates to true.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A map of attribute/condition pairs. <i>Expected</i> provides a conditional block for the <i>DeleteItem</i> operation.</p><p>Each element of <i>Expected</i> consists of an attribute name, a comparison operator, and one or more values. DynamoDB compares the attribute with the value(s) you supplied, using the comparison operator. For each <i>Expected</i> element, the result of the evaluation is either true or false.</p><p>If you specify more than one element in the <i>Expected</i> map, then by default all of the conditions must evaluate to true. In other words, the conditions are ANDed together. (You can use the <i>ConditionalOperator</i> parameter to OR the conditions instead. If you do this, then at least one of the conditions must evaluate to true, rather than all of them.)</p><p>If the <i>Expected</i> map evaluates to true, then the conditional operation succeeds; otherwise, it fails.</p><p><i>Expected</i> contains the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters" >http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For type Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes in the <i>AttributeValueList</i>. When performing the comparison, DynamoDB uses strongly consistent reads.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <i>true</i>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <i>false</i>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements within two sets.</p><p><i>AttributeValueList</i> can contain one or more <i>AttributeValue</i> elements of type String, Number, or Binary (not a set type). These attributes are compared against an existing set type attribute of an item. If any elements of the input set are present in the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul></li></ul><p>For usage examples of <i>AttributeValueList</i> and <i>ComparisonOperator</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>For backward compatibility with previous DynamoDB releases, the following parameters can be used instead of <i>AttributeValueList</i> and <i>ComparisonOperator</i>:</p><ul><li><p><i>Value</i> - A value for DynamoDB to compare with an attribute.</p></li><li><p><i>Exists</i> - A Boolean value that causes DynamoDB to evaluate the value before attempting the conditional operation:</p><ul><li><p>If <i>Exists</i> is <code>true</code>, DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the condition evaluates to true; otherwise the condition evaluate to false.</p></li><li><p>If <i>Exists</i> is <code>false</code>, DynamoDB assumes that the attribute value does <i>not</i> exist in the table. If in fact the value does not exist, then the assumption is valid and the condition evaluates to true. If the value is found, despite the assumption that it does not exist, the condition evaluates to false.</p></li></ul><p>Note that the default value for <i>Exists</i> is <code>true</code>.</p></li></ul><p>The <i>Value</i> and <i>Exists</i> parameters are incompatible with <i>AttributeValueList</i> and <i>ComparisonOperator</i>. Note that if you use both sets of parameters at once, DynamoDB will return a <i>ValidationException</i> exception.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <i>ExpressionAttributeValues</i> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A map of attribute names to <i>AttributeValue</i> objects, representing the primary key of the item to delete.</p><p>For the primary key, you must provide all of the attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide both the hash attribute and the range attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>A value that if set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <i>ReturnValues</i> if you want to get the item attributes as they appeared before they were deleted. For <i>DeleteItem</i>, the valid values are:</p><ul><li><p><code>NONE</code> - If <i>ReturnValues</i> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <i>ReturnValues</i>.)</p></li><li><p><code>ALL_OLD</code> - The content of the old item is returned.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table from which to delete the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>DeleteItem</i> operation.</p>
 */
@interface AWSDynamoDBDeleteItemOutput : AWSModel


/**
 <p>A map of attribute names to <i>AttributeValue</i> objects, representing the item as it appeared before the <i>DeleteItem</i> operation. This map appears in the response only if <i>ReturnValues</i> was specified as <code>ALL_OLD</code> in the request.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the operation. <i>ItemCollectionMetrics</i> is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.</p><p>Each <i>ItemCollectionMetrics</i> element consists of:</p><ul><li><p><i>ItemCollectionKey</i> - The hash key value of the item collection. This is the same as the hash key of the item.</p></li><li><p><i>SizeEstimateRange</i> - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents a request to perform a <i>DeleteItem</i> operation on an item.</p>
 Required parameters: [Key]
 */
@interface AWSDynamoDBDeleteRequest : AWSModel


/**
 <p>A map of attribute name to attribute values, representing the primary key of the item to delete. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

@end

/**
 <p>Represents the input of a <i>DeleteTable</i> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBDeleteTableInput : AWSRequest


/**
 <p> The name of the table to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>DeleteTable</i> operation.</p>
 */
@interface AWSDynamoDBDeleteTableOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 <p>Represents the input of a <i>DescribeTable</i> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBDescribeTableInput : AWSRequest


/**
 <p> The name of the table to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>DescribeTable</i> operation.</p>
 */
@interface AWSDynamoDBDescribeTableOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable table;

@end

/**
 <p>Represents a condition to be compared with an attribute value. This condition can be used with <i>DeleteItem</i>, <i>PutItem</i> or <i>UpdateItem</i> operations; if the comparison evaluates to true, the operation succeeds; if not, the operation fails. You can use <i>ExpectedAttributeValue</i> in one of two different ways:</p><ul><li><p>Use <i>AttributeValueList</i> to specify one or more values to compare against an attribute. Use <i>ComparisonOperator</i> to specify how you want to perform the comparison. If the comparison evaluates to true, then the conditional operation succeeds.</p></li><li><p>Use <i>Value</i> to specify a value that DynamoDB will compare against an attribute. If the values match, then <i>ExpectedAttributeValue</i> evaluates to true and the conditional operation succeeds. Optionally, you can also set <i>Exists</i> to false, indicating that you <i>do not</i> expect to find the attribute value in the table. In this case, the conditional operation succeeds only if the comparison evaluates to false.</p></li></ul><p><i>Value</i> and <i>Exists</i> are incompatible with <i>AttributeValueList</i> and <i>ComparisonOperator</i>. Note that if you use both sets of parameters at once, DynamoDB will return a <i>ValidationException</i> exception.</p>
 */
@interface AWSDynamoDBExpectedAttributeValue : AWSModel


/**
 <p>One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p><p>For information on specifying data types in JSON, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeValue *> * _Nullable attributeValueList;

/**
 <p>A comparator for evaluating attributes in the <i>AttributeValueList</i>. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <i>true</i>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <i>false</i>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements within two sets.</p><p><i>AttributeValueList</i> can contain one or more <i>AttributeValue</i> elements of type String, Number, or Binary (not a set type). These attributes are compared against an existing set type attribute of an item. If any elements of the input set are present in the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBComparisonOperator comparisonOperator;

/**
 <p>Causes DynamoDB to evaluate the value before attempting a conditional operation:</p><ul><li><p>If <i>Exists</i> is <code>true</code>, DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the operation succeeds. If it is not found, the operation fails with a <i>ConditionalCheckFailedException</i>.</p></li><li><p>If <i>Exists</i> is <code>false</code>, DynamoDB assumes that the attribute value does not exist in the table. If in fact the value does not exist, then the assumption is valid and the operation succeeds. If the value is found, despite the assumption that it does not exist, the operation fails with a <i>ConditionalCheckFailedException</i>.</p></li></ul><p>The default setting for <i>Exists</i> is <code>true</code>. If you supply a <i>Value</i> all by itself, DynamoDB assumes the attribute exists: You don't have to set <i>Exists</i> to <code>true</code>, because it is implied.</p><p>DynamoDB returns a <i>ValidationException</i> if:</p><ul><li><p><i>Exists</i> is <code>true</code> but there is no <i>Value</i> to check. (You expect a value to exist, but don't specify what that value is.)</p></li><li><p><i>Exists</i> is <code>false</code> but you also provide a <i>Value</i>. (You cannot expect an attribute to have a value, while also expecting it not to exist.)</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable exists;

/**
 <p>Represents the data for an attribute. You can set one, and only one, of the elements.</p><p>Each attribute in an item is a name-value pair. An attribute can be single-valued or multi-valued set. For example, a book item can have title and authors attributes. Each book has one title but can have many authors. The multi-valued attribute is a set; duplicate values are not allowed. </p>
 */
@property (nonatomic, strong) AWSDynamoDBAttributeValue * _Nullable value;

@end

/**
 <p>Represents the input of a <i>GetItem</i> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBGetItemInput : AWSRequest


/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ProjectionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p><p>This parameter allows you to retrieve attributes of type List or Map; however, it cannot retrieve individual elements within a List or a Map.</p></important><p>The names of one or more attributes to retrieve. If no attribute names are provided, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>Note that <i>AttributesToGet</i> has no effect on provisioned throughput consumption. DynamoDB determines capacity units consumed based on item size, not on the amount of data that is returned to an application.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>A value that if set to <code>true</code>, then the operation uses strongly consistent reads; otherwise, eventually consistent reads are used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>A map of attribute names to <i>AttributeValue</i> objects, representing the primary key of the item to retrieve.</p><p>For the primary key, you must provide all of the attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide both the hash attribute and the range attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ProjectionExpression</i> replaces the legacy <i>AttributesToGet</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>The name of the table containing the requested item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>GetItem</i> operation.</p>
 */
@interface AWSDynamoDBGetItemOutput : AWSModel


/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>A map of attribute names to <i>AttributeValue</i> objects, as specified by <i>AttributesToGet</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

@end

/**
 <p>Represents the properties of a global secondary index.</p>
 Required parameters: [IndexName, KeySchema, Projection, ProvisionedThroughput]
 */
@interface AWSDynamoDBGlobalSecondaryIndex : AWSModel


/**
 <p>The name of the global secondary index. The name must be unique among all other indexes on this table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The complete key schema for a global secondary index, which consists of one or more pairs of attribute names and key types (<code>HASH</code> or <code>RANGE</code>).</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 <p>Represents the properties of a global secondary index.</p>
 */
@interface AWSDynamoDBGlobalSecondaryIndexDescription : AWSModel


/**
 <p>Indicates whether the index is currently backfilling. <i>Backfilling</i> is the process of reading items from the table and determining whether they can be added to the index. (Not all items will qualify: For example, a hash key attribute cannot have any duplicates.) If an item can be added to the index, DynamoDB will do so. After all items have been processed, the backfilling operation is complete and <i>Backfilling</i> is false.</p><note><p>For indexes that were created during a <i>CreateTable</i> operation, the <i>Backfilling</i> attribute does not appear in the <i>DescribeTable</i> output.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable backfilling;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name of the global secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexSizeBytes;

/**
 <p>The current state of the global secondary index:</p><ul><li><p><i>CREATING</i> - The index is being created.</p></li><li><p><i>UPDATING</i> - The index is being updated.</p></li><li><p><i>DELETING</i> - The index is being deleted.</p></li><li><p><i>ACTIVE</i> - The index is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBIndexStatus indexStatus;

/**
 <p>The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The complete key schema for the global secondary index, consisting of one or more pairs of attribute names and key types (<code>HASH</code> or <code>RANGE</code>).</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

/**
 <p>Represents the provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughputDescription * _Nullable provisionedThroughput;

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
 <p>Information about item collections, if any, that were affected by the operation. <i>ItemCollectionMetrics</i> is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.</p>
 */
@interface AWSDynamoDBItemCollectionMetrics : AWSModel


/**
 <p>The hash key value of the item collection. This value is the same as the hash key of the item.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable itemCollectionKey;

/**
 <p>An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable sizeEstimateRangeGB;

@end

/**
 <p>Represents <i>a single element</i> of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.</p><p>A <i>KeySchemaElement</i> represents exactly one attribute of the primary key. For example, a hash type primary key would be represented by one <i>KeySchemaElement</i>. A hash-and-range type primary key would require one <i>KeySchemaElement</i> for the hash attribute, and another <i>KeySchemaElement</i> for the range attribute.</p>
 Required parameters: [AttributeName, KeyType]
 */
@interface AWSDynamoDBKeySchemaElement : AWSModel


/**
 <p>The name of a key attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The attribute data, consisting of the data type and the attribute value itself.</p>
 */
@property (nonatomic, assign) AWSDynamoDBKeyType keyType;

@end

/**
 <p>Represents a set of primary keys and, for each key, the attributes to retrieve from the table.</p><p>For each primary key, you must provide <i>all</i> of the key attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide <i>both</i> the hash attribute and the range attribute.</p>
 Required parameters: [Keys]
 */
@interface AWSDynamoDBKeysAndAttributes : AWSModel


/**
 <p>One or more attributes to retrieve from the table or index. If no attribute names are specified then all attributes will be returned. If any of the specified attributes are not found, they will not appear in the result.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>The consistency of a read operation. If set to <code>true</code>, then a strongly consistent read is used; otherwise, an eventually consistent read is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>The primary key attribute values that define the items and the attributes associated with the items.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable keys;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the <i>ProjectionExpression</i> must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ProjectionExpression</i> replaces the legacy <i>AttributesToGet</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

@end

/**
 <p>Represents the input of a <i>ListTables</i> operation.</p>
 */
@interface AWSDynamoDBListTablesInput : AWSRequest


/**
 <p>The first table name that this operation will evaluate. Use the value that was returned for <i>LastEvaluatedTableName</i> in a previous operation, so that you can obtain the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartTableName;

/**
 <p> A maximum number of table names to return. If this parameter is not specified, the limit is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

@end

/**
 <p>Represents the output of a <i>ListTables</i> operation.</p>
 */
@interface AWSDynamoDBListTablesOutput : AWSModel


/**
 <p>The name of the last table in the current page of results. Use this value as the <i>ExclusiveStartTableName</i> in a new request to obtain the next page of results, until all the table names are returned.</p><p>If you do not receive a <i>LastEvaluatedTableName</i> value in the response, this means that there are no more table names to be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastEvaluatedTableName;

/**
 <p>The names of the tables associated with the current account at the current endpoint. The maximum size of this array is 100. </p><p>If <i>LastEvaluatedTableName</i> also appears in the output, you can use this value as the <i>ExclusiveStartTableName</i> parameter in a subsequent <i>ListTables</i> request and obtain the next page of results.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tableNames;

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
 <p>The complete key schema for the local secondary index, consisting of one or more pairs of attribute names and key types (<code>HASH</code> or <code>RANGE</code>).</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

@end

/**
 <p>Represents the properties of a local secondary index.</p>
 */
@interface AWSDynamoDBLocalSecondaryIndexDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>Represents the name of the local secondary index.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The total size of the specified index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable indexSizeBytes;

/**
 <p>The number of items in the specified index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The complete index key schema, which consists of one or more pairs of attribute names and key types (<code>HASH</code> or <code>RANGE</code>).</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProjection * _Nullable projection;

@end

/**
 <p>Represents attributes that are copied (projected) from the table into an index. These are in addition to the primary key attributes and index key attributes, which are automatically projected.</p>
 */
@interface AWSDynamoDBProjection : AWSModel


/**
 <p>Represents the non-key attribute names which will be projected into the index.</p><p>For local secondary indexes, the total count of <i>NonKeyAttributes</i> summed across all of the local secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable nonKeyAttributes;

/**
 <p>The set of attributes that are projected into the index:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <i>NonKeyAttributes</i>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBProjectionType projectionType;

@end

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 Required parameters: [ReadCapacityUnits, WriteCapacityUnits]
 */
@interface AWSDynamoDBProvisionedThroughput : AWSModel


/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <i>ThrottlingException</i>. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <i>ThrottlingException</i>. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
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
 <p>The number of provisioned throughput decreases for this table during this UTC calendar day. For current maximums on provisioned throughput decreases, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfDecreasesToday;

/**
 <p>The maximum number of strongly consistent reads consumed per second before DynamoDB returns a <i>ThrottlingException</i>. Eventually consistent reads require less effort than strongly consistent reads, so a setting of 50 <i>ReadCapacityUnits</i> per second provides 100 eventually consistent <i>ReadCapacityUnits</i> per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readCapacityUnits;

/**
 <p>The maximum number of writes consumed per second before DynamoDB returns a <i>ThrottlingException</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeCapacityUnits;

@end

/**
 <p>Represents the input of a <i>PutItem</i> operation.</p>
 Required parameters: [TableName, Item]
 */
@interface AWSDynamoDBPutItemInput : AWSRequest


/**
 <p>A condition that must be satisfied in order for a conditional <i>PutItem</i> operation to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Boolean functions: <code>attribute_exists | attribute_not_exists | contains | begins_with</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code> = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;= | &#x3E;= | BETWEEN | IN</code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information on condition expressions, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ConditionExpression</i> replaces the legacy <i>ConditionalOperator</i> and <i>Expected</i> parameters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A logical operator to apply to the conditions in the <i>Expected</i> map:</p><ul><li><p><code>AND</code> - If all of the conditions evaluate to true, then the entire map evaluates to true.</p></li><li><p><code>OR</code> - If at least one of the conditions evaluate to true, then the entire map evaluates to true.</p></li></ul><p>If you omit <i>ConditionalOperator</i>, then <code>AND</code> is the default.</p><p>The operation will succeed only if the entire map evaluates to true.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A map of attribute/condition pairs. <i>Expected</i> provides a conditional block for the <i>PutItem</i> operation.</p><note><p>This parameter does not support attributes of type List or Map.</p></note><p>Each element of <i>Expected</i> consists of an attribute name, a comparison operator, and one or more values. DynamoDB compares the attribute with the value(s) you supplied, using the comparison operator. For each <i>Expected</i> element, the result of the evaluation is either true or false.</p><p>If you specify more than one element in the <i>Expected</i> map, then by default all of the conditions must evaluate to true. In other words, the conditions are ANDed together. (You can use the <i>ConditionalOperator</i> parameter to OR the conditions instead. If you do this, then at least one of the conditions must evaluate to true, rather than all of them.)</p><p>If the <i>Expected</i> map evaluates to true, then the conditional operation succeeds; otherwise, it fails.</p><p><i>Expected</i> contains the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters" >http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For type Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes in the <i>AttributeValueList</i>. When performing the comparison, DynamoDB uses strongly consistent reads.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <i>true</i>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <i>false</i>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements within two sets.</p><p><i>AttributeValueList</i> can contain one or more <i>AttributeValue</i> elements of type String, Number, or Binary (not a set type). These attributes are compared against an existing set type attribute of an item. If any elements of the input set are present in the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul></li></ul><p>For usage examples of <i>AttributeValueList</i> and <i>ComparisonOperator</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>For backward compatibility with previous DynamoDB releases, the following parameters can be used instead of <i>AttributeValueList</i> and <i>ComparisonOperator</i>:</p><ul><li><p><i>Value</i> - A value for DynamoDB to compare with an attribute.</p></li><li><p><i>Exists</i> - A Boolean value that causes DynamoDB to evaluate the value before attempting the conditional operation:</p><ul><li><p>If <i>Exists</i> is <code>true</code>, DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the condition evaluates to true; otherwise the condition evaluate to false.</p></li><li><p>If <i>Exists</i> is <code>false</code>, DynamoDB assumes that the attribute value does <i>not</i> exist in the table. If in fact the value does not exist, then the assumption is valid and the condition evaluates to true. If the value is found, despite the assumption that it does not exist, the condition evaluates to false.</p></li></ul><p>Note that the default value for <i>Exists</i> is <code>true</code>.</p></li></ul><p>The <i>Value</i> and <i>Exists</i> parameters are incompatible with <i>AttributeValueList</i> and <i>ComparisonOperator</i>. Note that if you use both sets of parameters at once, DynamoDB will return a <i>ValidationException</i> exception.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <i>ExpressionAttributeValues</i> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A map of attribute name/value pairs, one for each attribute. Only the primary key attributes are required; you can optionally provide other attribute name-value pairs for the item.</p><p>You must provide all of the attributes for the primary key. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide both the hash attribute and the range attribute.</p><p>If you specify any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p><p>For more information about primary keys, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>Each element in the <i>Item</i> map is an <i>AttributeValue</i> object.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>A value that if set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <i>ReturnValues</i> if you want to get the item attributes as they appeared before they were updated with the <i>PutItem</i> request. For <i>PutItem</i>, the valid values are:</p><ul><li><p><code>NONE</code> - If <i>ReturnValues</i> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <i>ReturnValues</i>.)</p></li><li><p><code>ALL_OLD</code> - If <i>PutItem</i> overwrote an attribute name-value pair, then the content of the old item is returned.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table to contain the item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>PutItem</i> operation.</p>
 */
@interface AWSDynamoDBPutItemOutput : AWSModel


/**
 <p>The attribute values as they appeared before the <i>PutItem</i> operation, but only if <i>ReturnValues</i> is specified as <code>ALL_OLD</code> in the request. Each element consists of an attribute name and an attribute value.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the operation. <i>ItemCollectionMetrics</i> is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.</p><p>Each <i>ItemCollectionMetrics</i> element consists of:</p><ul><li><p><i>ItemCollectionKey</i> - The hash key value of the item collection. This is the same as the hash key of the item.</p></li><li><p><i>SizeEstimateRange</i> - An estimate of item collection size, in gigabytes. This value is a two-element array containing a lower bound and an upper bound for the estimate. The estimate includes the size of all the items in the table, plus the size of all attributes projected into all of the local secondary indexes on that table. Use this estimate to measure whether a local secondary index is approaching its size limit.</p><p>The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of the estimate.</p></li></ul>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents a request to perform a <i>PutItem</i> operation on an item.</p>
 Required parameters: [Item]
 */
@interface AWSDynamoDBPutRequest : AWSModel


/**
 <p>A map of attribute name to attribute values, representing the primary key of an item to be processed by <i>PutItem</i>. All of the table's primary key attributes must be specified, and their data types must match those of the table's key schema. If any attributes are present in the item which are part of an index key schema for the table, their types must match the index key schema.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable item;

@end

/**
 <p>Represents the input of a <i>Query</i> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBQueryInput : AWSRequest


/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ProjectionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p><p>This parameter allows you to retrieve attributes of type List or Map; however, it cannot retrieve individual elements within a List or a Map.</p></important><p>The names of one or more attributes to retrieve. If no attribute names are provided, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>Note that <i>AttributesToGet</i> has no effect on provisioned throughput consumption. DynamoDB determines capacity units consumed based on item size, not on the amount of data that is returned to an application.</p><p>You cannot use both <i>AttributesToGet</i> and <i>Select</i> together in a <i>Query</i> request, <i>unless</i> the value for <i>Select</i> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to specifying <i>AttributesToGet</i> without any value for <i>Select</i>.)</p><p>If you query a local secondary index and request only attributes that are projected into that index, the operation will read only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB will fetch each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.</p><p>If you query a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>FilterExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A logical operator to apply to the conditions in a <i>QueryFilter</i> map:</p><ul><li><p><code>AND</code> - If all of the conditions evaluate to true, then the entire map evaluates to true.</p></li><li><p><code>OR</code> - If at least one of the conditions evaluate to true, then the entire map evaluates to true.</p></li></ul><p>If you omit <i>ConditionalOperator</i>, then <code>AND</code> is the default.</p><p>The operation will succeed only if the entire map evaluates to true.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <p>A value that if set to <code>true</code>, then the operation uses strongly consistent reads; otherwise, eventually consistent reads are used.</p><p>Strongly consistent reads are not supported on global secondary indexes. If you query a global secondary index with <i>ConsistentRead</i> set to <code>true</code>, you will receive an error message.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>The primary key of the first item that this operation will evaluate. Use the value that was returned for <i>LastEvaluatedKey</i> in the previous operation.</p><p>The data type for <i>ExclusiveStartKey</i> must be String, Number or Binary. No set data types are allowed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable exclusiveStartKey;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <i>ExpressionAttributeValues</i> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A string that contains conditions that DynamoDB applies after the <i>Query</i> operation, but before the data is returned to you. Items that do not satisfy the <i>FilterExpression</i> criteria are not returned.</p><note><p>A <i>FilterExpression</i> is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.</p></note><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>FilterExpression</i> replaces the legacy <i>QueryFilter</i> and <i>ConditionalOperator</i> parameters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The name of an index to query. This index can be any local secondary index or global secondary index on the table. Note that if you use the <i>IndexName</i> parameter, you must also provide <i>TableName.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The condition that specifies the key value(s) for items to be retrieved by the <i>Query</i> action.</p><p>The condition must perform an equality test on a single hash key value. The condition can also test for one or more range key values. A <i>Query</i> can use <i>KeyConditionExpression</i> to retrieve a single item with a given hash and range key value, or several items that have the same hash key value but different range key values.</p><p>The hash key equality test is required, and must be specified in the following format:</p><p><code>hashAttributeName</code><i>=</i><code>:hashval</code></p><p>If you also want to provide a range key condition, it must be combined using <i>AND</i> with the hash key condition. Following is an example, using the <b>=</b> comparison operator for the range key:</p><p><code>hashAttributeName</code><i>=</i><code>:hashval</code><i>AND</i><code>rangeAttributeName</code><i>=</i><code>:rangeval</code></p><p>Valid comparisons for the range key condition are as follows:</p><ul><li><p><code>rangeAttributeName</code><i>=</i><code>:rangeval</code> - true if the range key is equal to <code>:rangeval</code>.</p></li><li><p><code>rangeAttributeName</code><i>&#x3C;</i><code>:rangeval</code> - true if the range key is less than <code>:rangeval</code>.</p></li><li><p><code>rangeAttributeName</code><i>&#x3C;=</i><code>:rangeval</code> - true if the range key is less than or equal to <code>:rangeval</code>.</p></li><li><p><code>rangeAttributeName</code><i>&#x3E;</i><code>:rangeval</code> - true if the range key is greater than <code>:rangeval</code>.</p></li><li><p><code>rangeAttributeName</code><i>&#x3E;= </i><code>:rangeval</code> - true if the range key is greater than or equal to <code>:rangeval</code>.</p></li><li><p><code>rangeAttributeName</code><i>BETWEEN</i><code>:rangeval1</code><i>AND</i><code>:rangeval2</code> - true if the range key is less than or greater than <code>:rangeval1</code>, and less than or equal to <code>:rangeval2</code>.</p></li><li><p><i>begins_with (</i><code>rangeAttributeName</code>, <code>:rangeval</code><i>)</i> - true if the range key begins with a particular operand. Note that the function name <code>begins_with</code> is case-sensitive.</p></li></ul><p>Use the <i>ExpressionAttributeValues</i> parameter to replace tokens such as <code>:hashval</code> and <code>:rangeval</code> with actual values at runtime.</p><p>You can optionally use the <i>ExpressionAttributeNames</i> parameter to replace the names of the hash and range attributes with placeholder tokens. This might be necessary if an attribute name conflicts with a DynamoDB reserved word. For example, the following <i>KeyConditionExpression</i> causes an error because <i>Size</i> is a reserved word:</p><ul><li><code>Size = :myval</code></li></ul><p>To work around this, define a placeholder (such a <code>#myval</code>) to represent the attribute name <i>Size</i>. <i>KeyConditionExpression</i> then is as follows:</p><ul><li><code>#S = :myval</code></li></ul><p>For a list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>For more information on <i>ExpressionAttributeNames</i> and <i>ExpressionAttributeValues</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>KeyConditionExpression</i> replaces the legacy <i>KeyConditions</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable keyConditionExpression;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>KeyConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>The selection criteria for the query. For a query on a table, you can have conditions only on the table primary key attributes. You must provide the hash key attribute name and value as an <code>EQ</code> condition. You can optionally provide a second condition, referring to the range key attribute.</p><note><p>If you don't provide a range key condition, all of the items that match the hash key will be retrieved. If a <i>FilterExpression</i> or <i>QueryFilter</i> is present, it will be applied after the items are retrieved.</p></note><p>For a query on an index, you can have conditions only on the index key attributes. You must provide the index hash attribute name and value as an <code>EQ</code> condition. You can optionally provide a second condition, referring to the index key range attribute.</p><p>Each <i>KeyConditions</i> element consists of an attribute name to compare, along with the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes, for example, equals, greater than, less than, and so on.</p><p>For <i>KeyConditions</i>, only the following comparison operators are supported:</p><p><code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code></p><p>The following are descriptions of these comparison operators.</p><ul><li><p><code>EQ</code> : Equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one specified in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p></p></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul></li></ul><p>For usage examples of <i>AttributeValueList</i> and <i>ComparisonOperator</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable keyConditions;

/**
 <p>The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in <i>LastEvaluatedKey</i> to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed data set size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in <i>LastEvaluatedKey</i> to apply in a subsequent operation to continue the operation. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html" >Query and Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that identifies one or more attributes to retrieve from the table. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ProjectionExpression</i> replaces the legacy <i>AttributesToGet</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>FilterExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A condition that evaluates the query results after the items are read and returns only the desired values.</p><p>This parameter does not support attributes of type List or Map.</p><note><p>A <i>QueryFilter</i> is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.</p></note><p>If you provide more than one condition in the <i>QueryFilter</i> map, then by default all of the conditions must evaluate to true. In other words, the conditions are ANDed together. (You can use the <i>ConditionalOperator</i> parameter to OR the conditions instead. If you do this, then at least one of the conditions must evaluate to true, rather than all of them.)</p><p>Note that <i>QueryFilter</i> does not allow key attributes. You cannot define a filter condition on a hash key or range key.</p><p>Each <i>QueryFilter</i> element consists of an attribute name to compare, along with the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the operator specified in <i>ComparisonOperator</i>.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For type Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p><p>For information on specifying data types in JSON, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>For complete descriptions of all comparison operators, see the <a href="http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Condition.html">Condition</a> data type.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable queryFilter;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>A value that specifies ascending (true) or descending (false) traversal of the index. DynamoDB returns results reflecting the requested order determined by the range key. If the data type is Number, the results are returned in numeric order. For type String, the results are returned in order of ASCII character code values. For type Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p><p>If <i>ScanIndexForward</i> is not specified, the results are returned in ascending order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scanIndexForward;

/**
 <p>The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, the count of matching items, or in the case of an index, some or all of the attributes projected into the index.</p><ul><li><p><code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the specified table or index. If you query a local secondary index, then for each matching item in the index DynamoDB will fetch the entire item from the parent table. If the index is configured to project all item attributes, then all of the data can be obtained from the local secondary index, and no fetching is required.</p></li><li><p><code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an index. Retrieves all attributes that have been projected into the index. If the index is configured to project all attributes, this return value is equivalent to specifying <code>ALL_ATTRIBUTES</code>.</p></li><li><p><code>COUNT</code> - Returns the number of matching items, rather than the matching items themselves.</p></li><li><p><code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in <i>AttributesToGet</i>. This return value is equivalent to specifying <i>AttributesToGet</i> without specifying any value for <i>Select</i>.</p><p>If you query a local secondary index and request only attributes that are projected into that index, the operation will read only the index and not the table. If any of the requested attributes are not projected into the local secondary index, DynamoDB will fetch each of these attributes from the parent table. This extra fetching incurs additional throughput cost and latency.</p><p>If you query a global secondary index, you can only request attributes that are projected into the index. Global secondary index queries cannot fetch attributes from the parent table.</p></li></ul><p>If neither <i>Select</i> nor <i>AttributesToGet</i> are specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an index. You cannot use both <i>Select</i> and <i>AttributesToGet</i> together in a single request, unless the value for <i>Select</i> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to specifying <i>AttributesToGet</i> without any value for <i>Select</i>.)</p><note><p>If you use the <i>ProjectionExpression</i> parameter, then the value for <i>Select</i> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any other value for <i>Select</i> will return an error.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBSelect select;

/**
 <p>The name of the table containing the requested items. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of a <i>Query</i> operation.</p>
 */
@interface AWSDynamoDBQueryOutput : AWSModel


/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>The number of items in the response.</p><p>If you used a <i>QueryFilter</i> in the request, then <i>Count</i> is the number of items returned after the filter was applied, and <i>ScannedCount</i> is the number of matching items before&gt; the filter was applied.</p><p>If you did not use a filter in the request, then <i>Count</i> and <i>ScannedCount</i> are the same.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>An array of item attributes that match the query criteria. Each element in this array consists of an attribute name and the value for that attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable items;

/**
 <p>The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.</p><p>If <i>LastEvaluatedKey</i> is empty, then the "last page" of results has been processed and there is no more data to be retrieved.</p><p>If <i>LastEvaluatedKey</i> is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when <i>LastEvaluatedKey</i> is empty.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable lastEvaluatedKey;

/**
 <p>The number of items evaluated, before any <i>QueryFilter</i> is applied. A high <i>ScannedCount</i> value with few, or no, <i>Count</i> results indicates an inefficient <i>Query</i> operation. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If you did not use a filter in the request, then <i>ScannedCount</i> is the same as <i>Count</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scannedCount;

@end

/**
 <p>Represents the input of a <i>Scan</i> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBScanInput : AWSRequest


/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ProjectionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p><p>This parameter allows you to retrieve attributes of type List or Map; however, it cannot retrieve individual elements within a List or a Map.</p></important><p>The names of one or more attributes to retrieve. If no attribute names are provided, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>Note that <i>AttributesToGet</i> has no effect on provisioned throughput consumption. DynamoDB determines capacity units consumed based on item size, not on the amount of data that is returned to an application.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>FilterExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A logical operator to apply to the conditions in a <i>ScanFilter</i> map:</p><ul><li><p><code>AND</code> - If all of the conditions evaluate to true, then the entire map evaluates to true.</p></li><li><p><code>OR</code> - If at least one of the conditions evaluate to true, then the entire map evaluates to true.</p></li></ul><p>If you omit <i>ConditionalOperator</i>, then <code>AND</code> is the default.</p><p>The operation will succeed only if the entire map evaluates to true.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable consistentRead;

/**
 <p>The primary key of the first item that this operation will evaluate. Use the value that was returned for <i>LastEvaluatedKey</i> in the previous operation.</p><p>The data type for <i>ExclusiveStartKey</i> must be String, Number or Binary. No set data types are allowed.</p><p>In a parallel scan, a <i>Scan</i> request that includes <i>ExclusiveStartKey</i> must specify the same segment whose previous <i>Scan</i> returned the corresponding value of <i>LastEvaluatedKey</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable exclusiveStartKey;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <i>ExpressionAttributeValues</i> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>A string that contains conditions that DynamoDB applies after the <i>Scan</i> operation, but before the data is returned to you. Items that do not satisfy the <i>FilterExpression</i> criteria are not returned.</p><note><p>A <i>FilterExpression</i> is applied after the items have already been read; the process of filtering does not consume any additional read capacity units.</p></note><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>FilterExpression</i> replaces the legacy <i>ScanFilter</i> and <i>ConditionalOperator</i> parameters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable filterExpression;

/**
 <p>The name of a secondary index to scan. This index can be any local secondary index or global secondary index. Note that if you use the <code>IndexName</code> parameter, you must also provide <code>TableName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB processes the number of items up to the limit while processing the results, it stops the operation and returns the matching values up to that point, and a key in <i>LastEvaluatedKey</i> to apply in a subsequent operation, so that you can pick up where you left off. Also, if the processed data set size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching values up to the limit, and a key in <i>LastEvaluatedKey</i> to apply in a subsequent operation to continue the operation. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html" >Query and Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that identifies one or more attributes to retrieve from the specified table or index. These attributes can include scalars, sets, or elements of a JSON document. The attributes in the expression must be separated by commas.</p><p>If no attribute names are specified, then all attributes will be returned. If any of the requested attributes are not found, they will not appear in the result.</p><p>For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ProjectionExpression</i> replaces the legacy <i>AttributesToGet</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable projectionExpression;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>FilterExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A condition that evaluates the scan results and returns only the desired values.</p><note><p>This parameter does not support attributes of type List or Map.</p></note><p>If you specify more than one condition in the <i>ScanFilter</i> map, then by default all of the conditions must evaluate to true. In other words, the conditions are ANDed together. (You can use the <i>ConditionalOperator</i> parameter to OR the conditions instead. If you do this, then at least one of the conditions must evaluate to true, rather than all of them.)</p><p>Each <i>ScanFilter</i> element consists of an attribute name to compare, along with the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the operator specified in <i>ComparisonOperator</i> .</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p><p>For information on specifying data types in JSON, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes. For example, equals, greater than, less than, etc.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>For complete descriptions of all comparison operators, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Condition.html">Condition</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBCondition *> * _Nullable scanFilter;

/**
 <p>For a parallel <i>Scan</i> request, <i>Segment</i> identifies an individual segment to be scanned by an application worker.</p><p>Segment IDs are zero-based, so the first segment is always 0. For example, if you want to use four application threads to scan a table or an index, then the first thread specifies a <i>Segment</i> value of 0, the second thread specifies 1, and so on.</p><p>The value of <i>LastEvaluatedKey</i> returned from a parallel <i>Scan</i> request must be used as <i>ExclusiveStartKey</i> with the same segment ID in a subsequent <i>Scan</i> operation.</p><p>The value for <i>Segment</i> must be greater than or equal to 0, and less than the value provided for <i>TotalSegments</i>.</p><p>If you provide <i>Segment</i>, you must also provide <i>TotalSegments</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable segment;

/**
 <p>The attributes to be returned in the result. You can retrieve all item attributes, specific item attributes, or the count of matching items.</p><ul><li><p><code>ALL_ATTRIBUTES</code> - Returns all of the item attributes.</p></li><li><p><code>COUNT</code> - Returns the number of matching items, rather than the matching items themselves.</p></li><li><p><code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in <i>AttributesToGet</i>. This return value is equivalent to specifying <i>AttributesToGet</i> without specifying any value for <i>Select</i>.</p></li></ul><p>If neither <i>Select</i> nor <i>AttributesToGet</i> are specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code>. You cannot use both <i>AttributesToGet</i> and <i>Select</i> together in a single request, unless the value for <i>Select</i> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to specifying <i>AttributesToGet</i> without any value for <i>Select</i>.)</p>
 */
@property (nonatomic, assign) AWSDynamoDBSelect select;

/**
 <p>The name of the table containing the requested items; or, if you provide <code>IndexName</code>, the name of the table to which that index belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>For a parallel <i>Scan</i> request, <i>TotalSegments</i> represents the total number of segments into which the <i>Scan</i> operation will be divided. The value of <i>TotalSegments</i> corresponds to the number of application workers that will perform the parallel scan. For example, if you want to use four application threads to scan a table or an index, specify a <i>TotalSegments</i> value of 4.</p><p>The value for <i>TotalSegments</i> must be greater than or equal to 1, and less than or equal to 1000000. If you specify a <i>TotalSegments</i> value of 1, the <i>Scan</i> operation will be sequential rather than parallel.</p><p>If you specify <i>TotalSegments</i>, you must also specify <i>Segment</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalSegments;

@end

/**
 <p>Represents the output of a <i>Scan</i> operation.</p>
 */
@interface AWSDynamoDBScanOutput : AWSModel


/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>The number of items in the response.</p><p>If you set <i>ScanFilter</i> in the request, then <i>Count</i> is the number of items returned after the filter was applied, and <i>ScannedCount</i> is the number of matching items before the filter was applied.</p><p>If you did not use a filter in the request, then <i>Count</i> is the same as <i>ScannedCount</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>An array of item attributes that match the scan criteria. Each element in this array consists of an attribute name and the value for that attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *> * _Nullable items;

/**
 <p>The primary key of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.</p><p>If <i>LastEvaluatedKey</i> is empty, then the "last page" of results has been processed and there is no more data to be retrieved.</p><p>If <i>LastEvaluatedKey</i> is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when <i>LastEvaluatedKey</i> is empty.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable lastEvaluatedKey;

/**
 <p>The number of items evaluated, before any <i>ScanFilter</i> is applied. A high <i>ScannedCount</i> value with few, or no, <i>Count</i> results indicates an inefficient <i>Scan</i> operation. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>If you did not use a filter in the request, then <i>ScannedCount</i> is the same as <i>Count</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scannedCount;

@end

/**
 
 */
@interface AWSDynamoDBStreamSpecification : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable streamEnabled;

/**
 
 */
@property (nonatomic, assign) AWSDynamoDBStreamViewType streamViewType;

@end

/**
 <p>Represents the properties of a table.</p>
 */
@interface AWSDynamoDBTableDescription : AWSModel


/**
 <p>An array of <i>AttributeDefinition</i> objects. Each of these objects describes one attribute in the table and index key schema.</p><p>Each <i>AttributeDefinition</i> object in this array is composed of:</p><ul><li><p><i>AttributeName</i> - The name of the attribute.</p></li><li><p><i>AttributeType</i> - The data type for the attribute.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>The date and time when the table was created, in <a href="http://www.epochconverter.com/">UNIX epoch time</a> format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The global secondary indexes, if any, on the table. Each index is scoped to a given hash key value. Each element is composed of:</p><ul><li><p><i>Backfilling</i> - If true, then the index is currently in the backfilling phase. Backfilling occurs only when a new global secondary index is added to the table; it is the process by which DynamoDB populates the new index with data from the table. (This attribute does not appear for indexes that were created during a <i>CreateTable</i> operation.)</p></li><li><p><i>IndexName</i> - The name of the global secondary index.</p></li><li><p><i>IndexSizeBytes</i> - The total size of the global secondary index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p></li><li><p><i>IndexStatus</i> - The current status of the global secondary index:</p><ul><li><p><i>CREATING</i> - The index is being created.</p></li><li><p><i>UPDATING</i> - The index is being updated.</p></li><li><p><i>DELETING</i> - The index is being deleted.</p></li><li><p><i>ACTIVE</i> - The index is ready for use.</p></li></ul></li><li><p><i>ItemCount</i> - The number of items in the global secondary index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p></li><li><p><i>KeySchema</i> - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same hash key attribute as the table.</p></li><li><p><i>Projection</i> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><i>ProjectionType</i> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <i>NonKeyAttributes</i>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><i>NonKeyAttributes</i> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <i>NonKeyAttributes</i>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><i>ProvisionedThroughput</i> - The provisioned throughput settings for the global secondary index, consisting of read and write capacity units, along with data about increases and decreases. </p></li></ul><p>If the table is in the <code>DELETING</code> state, no information about indexes will be returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndexDescription *> * _Nullable globalSecondaryIndexes;

/**
 <p>The number of items in the specified table. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable itemCount;

/**
 <p>The primary key structure for the table. Each <i>KeySchemaElement</i> consists of:</p><ul><li><p><i>AttributeName</i> - The name of the attribute.</p></li><li><p><i>KeyType</i> - The key type for the attribute. Can be either <code>HASH</code> or <code>RANGE</code>.</p></li></ul><p>For more information about primary keys, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBKeySchemaElement *> * _Nullable keySchema;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable latestStreamArn;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable latestStreamLabel;

/**
 <p>Represents one or more local secondary indexes on the table. Each index is scoped to a given hash key value. Tables with one or more local secondary indexes are subject to an item collection size limit, where the amount of data within a given item collection cannot exceed 10 GB. Each element is composed of:</p><ul><li><p><i>IndexName</i> - The name of the local secondary index.</p></li><li><p><i>KeySchema</i> - Specifies the complete index key schema. The attribute names in the key schema must be between 1 and 255 characters (inclusive). The key schema must begin with the same hash key attribute as the table.</p></li><li><p><i>Projection</i> - Specifies attributes that are copied (projected) from the table into the index. These are in addition to the primary key attributes and index key attributes, which are automatically projected. Each attribute specification is composed of:</p><ul><li><p><i>ProjectionType</i> - One of the following:</p><ul><li><p><code>KEYS_ONLY</code> - Only the index and primary keys are projected into the index.</p></li><li><p><code>INCLUDE</code> - Only the specified table attributes are projected into the index. The list of projected attributes are in <i>NonKeyAttributes</i>.</p></li><li><p><code>ALL</code> - All of the table attributes are projected into the index.</p></li></ul></li><li><p><i>NonKeyAttributes</i> - A list of one or more non-key attribute names that are projected into the secondary index. The total count of attributes provided in <i>NonKeyAttributes</i>, summed across all of the secondary indexes, must not exceed 20. If you project the same attribute into two different indexes, this counts as two distinct attributes when determining the total.</p></li></ul></li><li><p><i>IndexSizeBytes</i> - Represents the total size of the index, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p></li><li><p><i>ItemCount</i> - Represents the number of items in the index. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value.</p></li></ul><p>If the table is in the <code>DELETING</code> state, no information about indexes will be returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBLocalSecondaryIndexDescription *> * _Nullable localSecondaryIndexes;

/**
 <p>The provisioned throughput settings for the table, consisting of read and write capacity units, along with data about increases and decreases.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughputDescription * _Nullable provisionedThroughput;

/**
 
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable tableArn;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The total size of the specified table, in bytes. DynamoDB updates this value approximately every six hours. Recent changes might not be reflected in this value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tableSizeBytes;

/**
 <p>The current state of the table:</p><ul><li><p><i>CREATING</i> - The table is being created.</p></li><li><p><i>UPDATING</i> - The table is being updated.</p></li><li><p><i>DELETING</i> - The table is being deleted.</p></li><li><p><i>ACTIVE</i> - The table is ready for use.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBTableStatus tableStatus;

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
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

@end

/**
 <p>Represents the input of an <i>UpdateItem</i> operation.</p>
 Required parameters: [TableName, Key]
 */
@interface AWSDynamoDBUpdateItemInput : AWSRequest


/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>UpdateExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p><p>This parameter can be used for modifying top-level attributes; however, it does not support individual list or map elements.</p></important><p>The names of attributes to be modified, the action to perform on each, and the new value for each. If you are updating an attribute that is an index key attribute for any indexes on that table, the attribute type must match the index key type defined in the <i>AttributesDefinition</i> of the table description. You can use <i>UpdateItem</i> to update any nonkey attributes.</p><p>Attribute values cannot be null. String and Binary type attributes must have lengths greater than zero. Set type attributes must not be empty. Requests with empty values will be rejected with a <i>ValidationException</i> exception.</p><p>Each <i>AttributeUpdates</i> element consists of an attribute name to modify, along with the following:</p><ul><li><p><i>Value</i> - The new value, if applicable, for this attribute.</p></li><li><p><i>Action</i> - A value that specifies how to perform the update. This action is only valid for an existing attribute whose data type is Number or is a set; do not use <code>ADD</code> for other data types. </p><p>If an item with the specified primary key is found in the table, the following values perform the following actions:</p><ul><li><p><code>PUT</code> - Adds the specified attribute to the item. If the attribute already exists, it is replaced by the new value. </p></li><li><p><code>DELETE</code> - Removes the attribute and its value, if no value is specified for <code>DELETE</code>. The data type of the specified value must match the existing value's data type.</p><p>If a set of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set <code>[a,b,c]</code> and the <code>DELETE</code> action specifies <code>[a,c]</code>, then the final attribute value is <code>[b]</code>. Specifying an empty set is an error.</p></li><li><p><code>ADD</code> - Adds the specified value to the item, if the attribute does not already exist. If the attribute does exist, then the behavior of <code>ADD</code> depends on the data type of the attribute:</p><ul><li><p>If the existing attribute is a number, and if <i>Value</i> is also a number, then <i>Value</i> is mathematically added to the existing attribute. If <i>Value</i> is a negative number, then it is subtracted from the existing attribute.</p><note><p>If you use <code>ADD</code> to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses 0 as the initial value.</p><p>Similarly, if you use <code>ADD</code> for an existing item to increment or decrement an attribute value that doesn't exist before the update, DynamoDB uses <code>0</code> as the initial value. For example, suppose that the item you want to update doesn't have an attribute named <i>itemcount</i>, but you decide to <code>ADD</code> the number <code>3</code> to this attribute anyway. DynamoDB will create the <i>itemcount</i> attribute, set its initial value to <code>0</code>, and finally add <code>3</code> to it. The result will be a new <i>itemcount</i> attribute, with a value of <code>3</code>.</p></note></li><li><p>If the existing data type is a set, and if <i>Value</i> is also a set, then <i>Value</i> is appended to the existing set. For example, if the attribute value is the set <code>[1,2]</code>, and the <code>ADD</code> action specified <code>[3]</code>, then the final attribute value is <code>[1,2,3]</code>. An error occurs if an <code>ADD</code> action is specified for a set attribute and the attribute type specified does not match the existing set type. </p><p>Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, <i>Value</i> must also be a set of strings.</p></li></ul></li></ul><p>If no item with the specified key is found in the table, the following values perform the following actions: </p><ul><li><p><code>PUT</code> - Causes DynamoDB to create a new item with the specified primary key, and then adds the attribute. </p></li><li><p><code>DELETE</code> - Nothing happens, because attributes cannot be deleted from a nonexistent item. The operation succeeds, but DynamoDB does not create a new item.</p></li><li><p><code>ADD</code> - Causes DynamoDB to create an item with the supplied primary key and number (or set of numbers) for the attribute value. The only data types allowed are Number and Number Set.</p></li></ul></li></ul><p>If you provide any attributes that are part of an index key, then the data types for those attributes must match those of the schema in the table's attribute definition.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValueUpdate *> * _Nullable attributeUpdates;

/**
 <p>A condition that must be satisfied in order for a conditional update to succeed.</p><p>An expression can contain any of the following:</p><ul><li><p>Boolean functions: <code>attribute_exists | attribute_not_exists | contains | begins_with</code></p><p>These function names are case-sensitive.</p></li><li><p>Comparison operators: <code> = | &#x3C;&#x3E; | &#x3C; | &#x3E; | &#x3C;= | &#x3E;= | BETWEEN | IN</code></p></li><li><p> Logical operators: <code>AND | OR | NOT</code></p></li></ul><p>For more information on condition expressions, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>ConditionExpression</i> replaces the legacy <i>ConditionalOperator</i> and <i>Expected</i> parameters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable conditionExpression;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i>ConditionExpression</i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A logical operator to apply to the conditions in the <i>Expected</i> map:</p><ul><li><p><code>AND</code> - If all of the conditions evaluate to true, then the entire map evaluates to true.</p></li><li><p><code>OR</code> - If at least one of the conditions evaluate to true, then the entire map evaluates to true.</p></li></ul><p>If you omit <i>ConditionalOperator</i>, then <code>AND</code> is the default.</p><p>The operation will succeed only if the entire map evaluates to true.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, assign) AWSDynamoDBConditionalOperator conditionalOperator;

/**
 <important><p>This is a legacy parameter, for backward compatibility. New applications should use <i> ConditionExpression </i> instead. Do not combine legacy parameters and expression parameters in a single API call; otherwise, DynamoDB will return a <i>ValidationException</i> exception.</p></important><p>A map of attribute/condition pairs. <i>Expected</i> provides a conditional block for the <i>UpdateItem</i> operation.</p><p>Each element of <i>Expected</i> consists of an attribute name, a comparison operator, and one or more values. DynamoDB compares the attribute with the value(s) you supplied, using the comparison operator. For each <i>Expected</i> element, the result of the evaluation is either true or false.</p><p>If you specify more than one element in the <i>Expected</i> map, then by default all of the conditions must evaluate to true. In other words, the conditions are ANDed together. (You can use the <i>ConditionalOperator</i> parameter to OR the conditions instead. If you do this, then at least one of the conditions must evaluate to true, rather than all of them.)</p><p>If the <i>Expected</i> map evaluates to true, then the conditional operation succeeds; otherwise, it fails.</p><p><i>Expected</i> contains the following:</p><ul><li><p><i>AttributeValueList</i> - One or more values to evaluate against the supplied attribute. The number of values in the list depends on the <i>ComparisonOperator</i> being used.</p><p>For type Number, value comparisons are numeric.</p><p>String value comparisons for greater than, equals, or less than are based on ASCII character code values. For example, <code>a</code> is greater than <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a list of code values, see <a href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters" >http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p><p>For type Binary, DynamoDB treats each byte of the binary data as unsigned when it compares binary values.</p></li><li><p><i>ComparisonOperator</i> - A comparator for evaluating attributes in the <i>AttributeValueList</i>. When performing the comparison, DynamoDB uses strongly consistent reads.</p><p>The following comparison operators are available:</p><p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code></p><p>The following are descriptions of each comparison operator.</p><ul><li><p><code>EQ</code> : Equal. <code>EQ</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NE</code> : Not equal. <code>NE</code> is supported for all datatypes, including lists and maps.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item contains an <i>AttributeValue</i> of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LE</code> : Less than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>LT</code> : Less than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GE</code> : Greater than or equal. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>GT</code> : Greater than. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code>.</p><p/></li><li><p><code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the existence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NOT_NULL</code>, the result is a Boolean <i>true</i>. This result is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NOT_NULL</code> comparison operator.</p></note></li><li><p><code>NULL</code> : The attribute does not exist. <code>NULL</code> is supported for all datatypes, including lists and maps.</p><note><p>This operator tests for the nonexistence of an attribute, not its data type. If the data type of attribute "<code>a</code>" is null, and you evaluate it using <code>NULL</code>, the result is a Boolean <i>false</i>. This is because the attribute "<code>a</code>" exists; its data type is not relevant to the <code>NULL</code> comparison operator.</p></note></li><li><p><code>CONTAINS</code> : Checks for a subsequence, or value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is of type String, then the operator checks for a substring match. If the target attribute of the comparison is of type Binary, then the operator looks for a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it finds an exact match with any member of the set.</p><p>CONTAINS is supported for lists: When evaluating "<code>a CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence of a value in a set.</p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> element of type String, Number, or Binary (not a set type). If the target attribute of the comparison is a String, then the operator checks for the absence of a substring match. If the target attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of the target that matches the input. If the target attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then the operator evaluates to true if it <i>does not</i> find an exact match with any member of the set.</p><p>NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot be a set, a map, or a list.</p></li><li><p><code>BEGINS_WITH</code> : Checks for a prefix. </p><p><i>AttributeValueList</i> can contain only one <i>AttributeValue</i> of type String or Binary (not a Number or a set type). The target attribute of the comparison must be of type String or Binary (not a Number or a set type).</p><p/></li><li><p><code>IN</code> : Checks for matching elements within two sets.</p><p><i>AttributeValueList</i> can contain one or more <i>AttributeValue</i> elements of type String, Number, or Binary (not a set type). These attributes are compared against an existing set type attribute of an item. If any elements of the input set are present in the item attribute, the expression evaluates to true.</p></li><li><p><code>BETWEEN</code> : Greater than or equal to the first value, and less than or equal to the second value. </p><p><i>AttributeValueList</i> must contain two <i>AttributeValue</i> elements of the same type, either String, Number, or Binary (not a set type). A target attribute matches if the target value is greater than, or equal to, the first element and less than, or equal to, the second element. If an item contains an <i>AttributeValue</i> element of a different type than the one provided in the request, the value does not match. For example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2", "1"]}</code></p></li></ul></li></ul><p>For usage examples of <i>AttributeValueList</i> and <i>ComparisonOperator</i>, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><p>For backward compatibility with previous DynamoDB releases, the following parameters can be used instead of <i>AttributeValueList</i> and <i>ComparisonOperator</i>:</p><ul><li><p><i>Value</i> - A value for DynamoDB to compare with an attribute.</p></li><li><p><i>Exists</i> - A Boolean value that causes DynamoDB to evaluate the value before attempting the conditional operation:</p><ul><li><p>If <i>Exists</i> is <code>true</code>, DynamoDB will check to see if that attribute value already exists in the table. If it is found, then the condition evaluates to true; otherwise the condition evaluate to false.</p></li><li><p>If <i>Exists</i> is <code>false</code>, DynamoDB assumes that the attribute value does <i>not</i> exist in the table. If in fact the value does not exist, then the assumption is valid and the condition evaluates to true. If the value is found, despite the assumption that it does not exist, the condition evaluates to false.</p></li></ul><p>Note that the default value for <i>Exists</i> is <code>true</code>.</p></li></ul><p>The <i>Value</i> and <i>Exists</i> parameters are incompatible with <i>AttributeValueList</i> and <i>ComparisonOperator</i>. Note that if you use both sets of parameters at once, DynamoDB will return a <i>ValidationException</i> exception.</p><note><p>This parameter does not support attributes of type List or Map.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBExpectedAttributeValue *> * _Nullable expected;

/**
 <p>One or more substitution tokens for attribute names in an expression. The following are some use cases for using <i>ExpressionAttributeNames</i>:</p><ul><li><p>To access an attribute whose name conflicts with a DynamoDB reserved word.</p></li><li><p>To create a placeholder for repeating occurrences of an attribute name in an expression.</p></li><li><p>To prevent special characters in an attribute name from being misinterpreted in an expression.</p></li></ul><p>Use the <b>#</b> character in an expression to dereference an attribute name. For example, consider the following attribute name:</p><ul><li><p><code>Percentile</code></p></li></ul><p>The name of this attribute conflicts with a reserved word, so it cannot be used directly in an expression. (For the complete list of reserved words, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around this, you could specify the following for <i>ExpressionAttributeNames</i>:</p><ul><li><p><code>{"#P":"Percentile"}</code></p></li></ul><p>You could then use this substitution in an expression, as in this example:</p><ul><li><p><code>#P = :val</code></p></li></ul><note><p>Tokens that begin with the <b>:</b> character are <i>expression attribute values</i>, which are placeholders for the actual value at runtime.</p></note><p>For more information on expression attribute names, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable expressionAttributeNames;

/**
 <p>One or more values that can be substituted in an expression.</p><p>Use the <b>:</b> (colon) character in an expression to dereference an attribute value. For example, suppose that you wanted to check whether the value of the <i>ProductStatus</i> attribute was one of the following: </p><p><code>Available | Backordered | Discontinued</code></p><p>You would first need to specify <i>ExpressionAttributeValues</i> as follows:</p><p><code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }</code></p><p>You could then use these values in an expression, such as this:</p><p><code>ProductStatus IN (:avail, :back, :disc)</code></p><p>For more information on expression attribute values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionPlaceholders.html">Using Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable expressionAttributeValues;

/**
 <p>The primary key of the item to be updated. Each element consists of an attribute name and a value for that attribute.</p><p>For the primary key, you must provide all of the attributes. For example, with a hash type primary key, you only need to provide the hash attribute. For a hash-and-range type primary key, you must provide both the hash attribute and the range attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable key;

/**
 <p>A value that if set to <code>TOTAL</code>, the response includes <i>ConsumedCapacity</i> data for tables and indexes. If set to <code>INDEXES</code>, the response includes <i>ConsumedCapacity</i> for indexes. If set to <code>NONE</code> (the default), <i>ConsumedCapacity</i> is not included in the response.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnConsumedCapacity returnConsumedCapacity;

/**
 <p>A value that if set to <code>SIZE</code>, the response includes statistics about item collections, if any, that were modified during the operation are returned in the response. If set to <code>NONE</code> (the default), no statistics are returned.</p>
 */
@property (nonatomic, assign) AWSDynamoDBReturnItemCollectionMetrics returnItemCollectionMetrics;

/**
 <p>Use <i>ReturnValues</i> if you want to get the item attributes as they appeared either before or after they were updated. For <i>UpdateItem</i>, the valid values are:</p><ul><li><p><code>NONE</code> - If <i>ReturnValues</i> is not specified, or if its value is <code>NONE</code>, then nothing is returned. (This setting is the default for <i>ReturnValues</i>.)</p></li><li><p><code>ALL_OLD</code> - If <i>UpdateItem</i> overwrote an attribute name-value pair, then the content of the old item is returned.</p></li><li><p><code>UPDATED_OLD</code> - The old versions of only the updated attributes are returned.</p></li><li><p><code>ALL_NEW</code> - All of the attributes of the new version of the item are returned.</p></li><li><p><code>UPDATED_NEW</code> - The new versions of only the updated attributes are returned.</p></li></ul>
 */
@property (nonatomic, assign) AWSDynamoDBReturnValue returnValues;

/**
 <p>The name of the table containing the item to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>An expression that defines one or more attributes to be updated, the action to be performed on them, and new value(s) for them.</p><p>The following action values are available for <i>UpdateExpression</i>.</p><ul><li><p><code>SET</code> - Adds one or more attributes and values to an item. If any of these attribute already exist, they are replaced by the new values. You can also use <code>SET</code> to add or subtract from an attribute that is of type Number.</p><p><code>SET</code> supports the following functions:</p><ul><li><p><code>if_not_exists (path, operand)</code> - if the item does not contain an attribute at the specified path, then <code>if_not_exists</code> evaluates to operand; otherwise, it evaluates to path. You can use this function to avoid overwriting an attribute that may already be present in the item.</p></li><li><p><code>list_append (operand, operand)</code> - evaluates to a list with a new element added to it. You can append the new element to the start or the end of the list by reversing the order of the operands.</p></li></ul><p>These function names are case-sensitive.</p></li><li><p><code>REMOVE</code> - Removes one or more attributes from an item.</p></li><li><p><code>ADD</code> - Adds the specified value to the item, if the attribute does not already exist. If the attribute does exist, then the behavior of <code>ADD</code> depends on the data type of the attribute:</p><ul><li><p>If the existing attribute is a number, and if <i>Value</i> is also a number, then <i>Value</i> is mathematically added to the existing attribute. If <i>Value</i> is a negative number, then it is subtracted from the existing attribute.</p><note><p>If you use <code>ADD</code> to increment or decrement a number value for an item that doesn't exist before the update, DynamoDB uses <code>0</code> as the initial value.</p><p>Similarly, if you use <code>ADD</code> for an existing item to increment or decrement an attribute value that doesn't exist before the update, DynamoDB uses <code>0</code> as the initial value. For example, suppose that the item you want to update doesn't have an attribute named <i>itemcount</i>, but you decide to <code>ADD</code> the number <code>3</code> to this attribute anyway. DynamoDB will create the <i>itemcount</i> attribute, set its initial value to <code>0</code>, and finally add <code>3</code> to it. The result will be a new <i>itemcount</i> attribute in the item, with a value of <code>3</code>.</p></note></li><li><p>If the existing data type is a set and if <i>Value</i> is also a set, then <i>Value</i> is added to the existing set. For example, if the attribute value is the set <code>[1,2]</code>, and the <code>ADD</code> action specified <code>[3]</code>, then the final attribute value is <code>[1,2,3]</code>. An error occurs if an <code>ADD</code> action is specified for a set attribute and the attribute type specified does not match the existing set type. </p><p>Both sets must have the same primitive data type. For example, if the existing data type is a set of strings, the <i>Value</i> must also be a set of strings.</p></li></ul><important><p>The <code>ADD</code> action only supports Number and set data types. In addition, <code>ADD</code> can only be used on top-level attributes, not nested attributes.</p></important></li><li><p><code>DELETE</code> - Deletes an element from a set.</p><p>If a set of values is specified, then those values are subtracted from the old set. For example, if the attribute value was the set <code>[a,b,c]</code> and the <code>DELETE</code> action specifies <code>[a,c]</code>, then the final attribute value is <code>[b]</code>. Specifying an empty set is an error.</p><important><p>The <code>DELETE</code> action only supports Number and set data types. In addition, <code>DELETE</code> can only be used on top-level attributes, not nested attributes.</p></important></li></ul><p>You can have many actions in a single expression, such as the following: <code>SET a=:value1, b=:value2 DELETE :value3, :value4, :value5</code></p><p>For more information on update expressions, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html">Modifying Items and Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p><note><p><i>UpdateExpression</i> replaces the legacy <i>AttributeUpdates</i> parameter.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable updateExpression;

@end

/**
 <p>Represents the output of an <i>UpdateItem</i> operation.</p>
 */
@interface AWSDynamoDBUpdateItemOutput : AWSModel


/**
 <p>A map of attribute values as they appeared before the <i>UpdateItem</i> operation. This map only appears if <i>ReturnValues</i> was specified as something other than <code>NONE</code> in the request. Each element represents one attribute.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> * _Nullable attributes;

/**
 <p>The capacity units consumed by an operation. The data returned includes the total provisioned throughput consumed, along with statistics for the table and any indexes involved in the operation. <i>ConsumedCapacity</i> is only returned if the request asked for it. For more information, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBConsumedCapacity * _Nullable consumedCapacity;

/**
 <p>Information about item collections, if any, that were affected by the operation. <i>ItemCollectionMetrics</i> is only returned if the request asked for it. If the table does not have any local secondary indexes, this information is not returned in the response.</p>
 */
@property (nonatomic, strong) AWSDynamoDBItemCollectionMetrics * _Nullable itemCollectionMetrics;

@end

/**
 <p>Represents the input of an <i>UpdateTable</i> operation.</p>
 Required parameters: [TableName]
 */
@interface AWSDynamoDBUpdateTableInput : AWSRequest


/**
 <p>An array of attributes that describe the key schema for the table and indexes. If you are adding a new global secondary index to the table, <i>AttributeDefinitions</i> must include the key element(s) of the new index.</p>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBAttributeDefinition *> * _Nullable attributeDefinitions;

/**
 <p>An array of one or more global secondary indexes for the table. For each index in the array, you can request one action:</p><ul><li><p><i>Create</i> - add a new global secondary index to the table.</p></li><li><p><i>Update</i> - modify the provisioned throughput settings of an existing global secondary index.</p></li><li><p><i>Delete</i> - remove a global secondary index from the table.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSDynamoDBGlobalSecondaryIndexUpdate *> * _Nullable globalSecondaryIndexUpdates;

/**
 <p>Represents the provisioned throughput settings for a specified table or index. The settings can be modified using the <i>UpdateTable</i> operation.</p><p>For current minimum and maximum provisioned throughput values, see <a href="http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a> in the <i>Amazon DynamoDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDynamoDBProvisionedThroughput * _Nullable provisionedThroughput;

/**
 
 */
@property (nonatomic, strong) AWSDynamoDBStreamSpecification * _Nullable streamSpecification;

/**
 <p>The name of the table to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Represents the output of an <i>UpdateTable</i> operation.</p>
 */
@interface AWSDynamoDBUpdateTableOutput : AWSModel


/**
 <p>Represents the properties of a table.</p>
 */
@property (nonatomic, strong) AWSDynamoDBTableDescription * _Nullable tableDescription;

@end

/**
 <p>Represents an operation to perform - either <i>DeleteItem</i> or <i>PutItem</i>. You can only request one of these operations, not both, in a single <i>WriteRequest</i>. If you do need to perform both of these operations, you will need to provide two separate <i>WriteRequest</i> objects.</p>
 */
@interface AWSDynamoDBWriteRequest : AWSModel


/**
 <p>A request to perform a <i>DeleteItem</i> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBDeleteRequest * _Nullable deleteRequest;

/**
 <p>A request to perform a <i>PutItem</i> operation.</p>
 */
@property (nonatomic, strong) AWSDynamoDBPutRequest * _Nullable putRequest;

@end

NS_ASSUME_NONNULL_END
