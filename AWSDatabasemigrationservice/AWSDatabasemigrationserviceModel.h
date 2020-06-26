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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSDatabasemigrationserviceErrorDomain;

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceErrorType) {
    AWSDatabasemigrationserviceErrorUnknown,
    AWSDatabasemigrationserviceErrorAccessDenied,
    AWSDatabasemigrationserviceErrorInsufficientResourceCapacity,
    AWSDatabasemigrationserviceErrorInvalidCertificate,
    AWSDatabasemigrationserviceErrorInvalidResourceState,
    AWSDatabasemigrationserviceErrorInvalidSubnet,
    AWSDatabasemigrationserviceErrorKMSAccessDenied,
    AWSDatabasemigrationserviceErrorKMSDisabled,
    AWSDatabasemigrationserviceErrorKMSInvalidState,
    AWSDatabasemigrationserviceErrorKMSKeyNotAccessible,
    AWSDatabasemigrationserviceErrorKMSNotFound,
    AWSDatabasemigrationserviceErrorKMSThrottling,
    AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs,
    AWSDatabasemigrationserviceErrorResourceAlreadyExists,
    AWSDatabasemigrationserviceErrorResourceNotFound,
    AWSDatabasemigrationserviceErrorResourceQuotaExceeded,
    AWSDatabasemigrationserviceErrorSNSInvalidTopic,
    AWSDatabasemigrationserviceErrorSNSNoAuthorization,
    AWSDatabasemigrationserviceErrorStorageQuotaExceeded,
    AWSDatabasemigrationserviceErrorSubnetAlreadyInUse,
    AWSDatabasemigrationserviceErrorUpgradeDependencyFailure,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceAuthMechanismValue) {
    AWSDatabasemigrationserviceAuthMechanismValueUnknown,
    AWSDatabasemigrationserviceAuthMechanismValueDefault,
    AWSDatabasemigrationserviceAuthMechanismValueMongodbCr,
    AWSDatabasemigrationserviceAuthMechanismValueScramSha1,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceAuthTypeValue) {
    AWSDatabasemigrationserviceAuthTypeValueUnknown,
    AWSDatabasemigrationserviceAuthTypeValueNo,
    AWSDatabasemigrationserviceAuthTypeValuePassword,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceCompressionTypeValue) {
    AWSDatabasemigrationserviceCompressionTypeValueUnknown,
    AWSDatabasemigrationserviceCompressionTypeValueNone,
    AWSDatabasemigrationserviceCompressionTypeValueGzip,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceDataFormatValue) {
    AWSDatabasemigrationserviceDataFormatValueUnknown,
    AWSDatabasemigrationserviceDataFormatValueCsv,
    AWSDatabasemigrationserviceDataFormatValueParquet,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceDmsSslModeValue) {
    AWSDatabasemigrationserviceDmsSslModeValueUnknown,
    AWSDatabasemigrationserviceDmsSslModeValueNone,
    AWSDatabasemigrationserviceDmsSslModeValueRequire,
    AWSDatabasemigrationserviceDmsSslModeValueVerifyCa,
    AWSDatabasemigrationserviceDmsSslModeValueVerifyFull,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceEncodingTypeValue) {
    AWSDatabasemigrationserviceEncodingTypeValueUnknown,
    AWSDatabasemigrationserviceEncodingTypeValuePlain,
    AWSDatabasemigrationserviceEncodingTypeValuePlainDictionary,
    AWSDatabasemigrationserviceEncodingTypeValueRleDictionary,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceEncryptionModeValue) {
    AWSDatabasemigrationserviceEncryptionModeValueUnknown,
    AWSDatabasemigrationserviceEncryptionModeValueSseS3,
    AWSDatabasemigrationserviceEncryptionModeValueSseKms,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceMessageFormatValue) {
    AWSDatabasemigrationserviceMessageFormatValueUnknown,
    AWSDatabasemigrationserviceMessageFormatValueJson,
    AWSDatabasemigrationserviceMessageFormatValueJsonUnformatted,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceMigrationTypeValue) {
    AWSDatabasemigrationserviceMigrationTypeValueUnknown,
    AWSDatabasemigrationserviceMigrationTypeValueFullLoad,
    AWSDatabasemigrationserviceMigrationTypeValueCdc,
    AWSDatabasemigrationserviceMigrationTypeValueFullLoadAndCdc,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceNestingLevelValue) {
    AWSDatabasemigrationserviceNestingLevelValueUnknown,
    AWSDatabasemigrationserviceNestingLevelValueNone,
    AWSDatabasemigrationserviceNestingLevelValueOne,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceParquetVersionValue) {
    AWSDatabasemigrationserviceParquetVersionValueUnknown,
    AWSDatabasemigrationserviceParquetVersionValueParquet10,
    AWSDatabasemigrationserviceParquetVersionValueParquet20,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceRefreshSchemasStatusTypeValue) {
    AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueUnknown,
    AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueSuccessful,
    AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueFailed,
    AWSDatabasemigrationserviceRefreshSchemasStatusTypeValueRefreshing,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceReleaseStatusValues) {
    AWSDatabasemigrationserviceReleaseStatusValuesUnknown,
    AWSDatabasemigrationserviceReleaseStatusValuesBeta,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceReloadOptionValue) {
    AWSDatabasemigrationserviceReloadOptionValueUnknown,
    AWSDatabasemigrationserviceReloadOptionValueDataReload,
    AWSDatabasemigrationserviceReloadOptionValueValidateOnly,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceReplicationEndpointTypeValue) {
    AWSDatabasemigrationserviceReplicationEndpointTypeValueUnknown,
    AWSDatabasemigrationserviceReplicationEndpointTypeValueSource,
    AWSDatabasemigrationserviceReplicationEndpointTypeValueTarget,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceSourceType) {
    AWSDatabasemigrationserviceSourceTypeUnknown,
    AWSDatabasemigrationserviceSourceTypeReplicationInstance,
};

typedef NS_ENUM(NSInteger, AWSDatabasemigrationserviceStartReplicationTaskTypeValue) {
    AWSDatabasemigrationserviceStartReplicationTaskTypeValueUnknown,
    AWSDatabasemigrationserviceStartReplicationTaskTypeValueStartReplication,
    AWSDatabasemigrationserviceStartReplicationTaskTypeValueResumeProcessing,
    AWSDatabasemigrationserviceStartReplicationTaskTypeValueReloadTarget,
};

@class AWSDatabasemigrationserviceAccountQuota;
@class AWSDatabasemigrationserviceAddTagsToResourceMessage;
@class AWSDatabasemigrationserviceAddTagsToResourceResponse;
@class AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage;
@class AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse;
@class AWSDatabasemigrationserviceAvailabilityZone;
@class AWSDatabasemigrationserviceCertificate;
@class AWSDatabasemigrationserviceConnection;
@class AWSDatabasemigrationserviceCreateEndpointMessage;
@class AWSDatabasemigrationserviceCreateEndpointResponse;
@class AWSDatabasemigrationserviceCreateEventSubscriptionMessage;
@class AWSDatabasemigrationserviceCreateEventSubscriptionResponse;
@class AWSDatabasemigrationserviceCreateReplicationInstanceMessage;
@class AWSDatabasemigrationserviceCreateReplicationInstanceResponse;
@class AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage;
@class AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse;
@class AWSDatabasemigrationserviceCreateReplicationTaskMessage;
@class AWSDatabasemigrationserviceCreateReplicationTaskResponse;
@class AWSDatabasemigrationserviceDeleteCertificateMessage;
@class AWSDatabasemigrationserviceDeleteCertificateResponse;
@class AWSDatabasemigrationserviceDeleteConnectionMessage;
@class AWSDatabasemigrationserviceDeleteConnectionResponse;
@class AWSDatabasemigrationserviceDeleteEndpointMessage;
@class AWSDatabasemigrationserviceDeleteEndpointResponse;
@class AWSDatabasemigrationserviceDeleteEventSubscriptionMessage;
@class AWSDatabasemigrationserviceDeleteEventSubscriptionResponse;
@class AWSDatabasemigrationserviceDeleteReplicationInstanceMessage;
@class AWSDatabasemigrationserviceDeleteReplicationInstanceResponse;
@class AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage;
@class AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse;
@class AWSDatabasemigrationserviceDeleteReplicationTaskMessage;
@class AWSDatabasemigrationserviceDeleteReplicationTaskResponse;
@class AWSDatabasemigrationserviceDescribeAccountAttributesMessage;
@class AWSDatabasemigrationserviceDescribeAccountAttributesResponse;
@class AWSDatabasemigrationserviceDescribeCertificatesMessage;
@class AWSDatabasemigrationserviceDescribeCertificatesResponse;
@class AWSDatabasemigrationserviceDescribeConnectionsMessage;
@class AWSDatabasemigrationserviceDescribeConnectionsResponse;
@class AWSDatabasemigrationserviceDescribeEndpointTypesMessage;
@class AWSDatabasemigrationserviceDescribeEndpointTypesResponse;
@class AWSDatabasemigrationserviceDescribeEndpointsMessage;
@class AWSDatabasemigrationserviceDescribeEndpointsResponse;
@class AWSDatabasemigrationserviceDescribeEventCategoriesMessage;
@class AWSDatabasemigrationserviceDescribeEventCategoriesResponse;
@class AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage;
@class AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse;
@class AWSDatabasemigrationserviceDescribeEventsMessage;
@class AWSDatabasemigrationserviceDescribeEventsResponse;
@class AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage;
@class AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse;
@class AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage;
@class AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse;
@class AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage;
@class AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse;
@class AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage;
@class AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse;
@class AWSDatabasemigrationserviceDescribeReplicationInstancesMessage;
@class AWSDatabasemigrationserviceDescribeReplicationInstancesResponse;
@class AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage;
@class AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse;
@class AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage;
@class AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse;
@class AWSDatabasemigrationserviceDescribeReplicationTasksMessage;
@class AWSDatabasemigrationserviceDescribeReplicationTasksResponse;
@class AWSDatabasemigrationserviceDescribeSchemasMessage;
@class AWSDatabasemigrationserviceDescribeSchemasResponse;
@class AWSDatabasemigrationserviceDescribeTableStatisticsMessage;
@class AWSDatabasemigrationserviceDescribeTableStatisticsResponse;
@class AWSDatabasemigrationserviceDmsTransferSettings;
@class AWSDatabasemigrationserviceDynamoDbSettings;
@class AWSDatabasemigrationserviceElasticsearchSettings;
@class AWSDatabasemigrationserviceEndpoint;
@class AWSDatabasemigrationserviceEvent;
@class AWSDatabasemigrationserviceEventCategoryGroup;
@class AWSDatabasemigrationserviceEventSubscription;
@class AWSDatabasemigrationserviceFilter;
@class AWSDatabasemigrationserviceImportCertificateMessage;
@class AWSDatabasemigrationserviceImportCertificateResponse;
@class AWSDatabasemigrationserviceKafkaSettings;
@class AWSDatabasemigrationserviceKinesisSettings;
@class AWSDatabasemigrationserviceListTagsForResourceMessage;
@class AWSDatabasemigrationserviceListTagsForResourceResponse;
@class AWSDatabasemigrationserviceModifyEndpointMessage;
@class AWSDatabasemigrationserviceModifyEndpointResponse;
@class AWSDatabasemigrationserviceModifyEventSubscriptionMessage;
@class AWSDatabasemigrationserviceModifyEventSubscriptionResponse;
@class AWSDatabasemigrationserviceModifyReplicationInstanceMessage;
@class AWSDatabasemigrationserviceModifyReplicationInstanceResponse;
@class AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage;
@class AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse;
@class AWSDatabasemigrationserviceModifyReplicationTaskMessage;
@class AWSDatabasemigrationserviceModifyReplicationTaskResponse;
@class AWSDatabasemigrationserviceMongoDbSettings;
@class AWSDatabasemigrationserviceNeptuneSettings;
@class AWSDatabasemigrationserviceOrderableReplicationInstance;
@class AWSDatabasemigrationservicePendingMaintenanceAction;
@class AWSDatabasemigrationserviceRebootReplicationInstanceMessage;
@class AWSDatabasemigrationserviceRebootReplicationInstanceResponse;
@class AWSDatabasemigrationserviceRedshiftSettings;
@class AWSDatabasemigrationserviceRefreshSchemasMessage;
@class AWSDatabasemigrationserviceRefreshSchemasResponse;
@class AWSDatabasemigrationserviceRefreshSchemasStatus;
@class AWSDatabasemigrationserviceReloadTablesMessage;
@class AWSDatabasemigrationserviceReloadTablesResponse;
@class AWSDatabasemigrationserviceRemoveTagsFromResourceMessage;
@class AWSDatabasemigrationserviceRemoveTagsFromResourceResponse;
@class AWSDatabasemigrationserviceReplicationInstance;
@class AWSDatabasemigrationserviceReplicationInstanceTaskLog;
@class AWSDatabasemigrationserviceReplicationPendingModifiedValues;
@class AWSDatabasemigrationserviceReplicationSubnetGroup;
@class AWSDatabasemigrationserviceReplicationTask;
@class AWSDatabasemigrationserviceReplicationTaskAssessmentResult;
@class AWSDatabasemigrationserviceReplicationTaskStats;
@class AWSDatabasemigrationserviceResourcePendingMaintenanceActions;
@class AWSDatabasemigrationserviceS3Settings;
@class AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage;
@class AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse;
@class AWSDatabasemigrationserviceStartReplicationTaskMessage;
@class AWSDatabasemigrationserviceStartReplicationTaskResponse;
@class AWSDatabasemigrationserviceStopReplicationTaskMessage;
@class AWSDatabasemigrationserviceStopReplicationTaskResponse;
@class AWSDatabasemigrationserviceSubnet;
@class AWSDatabasemigrationserviceSupportedEndpointType;
@class AWSDatabasemigrationserviceTableStatistics;
@class AWSDatabasemigrationserviceTableToReload;
@class AWSDatabasemigrationserviceTag;
@class AWSDatabasemigrationserviceTestConnectionMessage;
@class AWSDatabasemigrationserviceTestConnectionResponse;
@class AWSDatabasemigrationserviceVpcSecurityGroupMembership;

/**
 <p>Describes a quota for an AWS account, for example, the number of replication instances allowed.</p>
 */
@interface AWSDatabasemigrationserviceAccountQuota : AWSModel


/**
 <p>The name of the AWS DMS quota for this AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountQuotaName;

/**
 <p>The maximum allowed value for the quota.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The amount currently used toward the quota maximum.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable used;

@end

/**
 <p>Associates a set of tags with an AWS DMS resource.</p>
 Required parameters: [ResourceArn, Tags]
 */
@interface AWSDatabasemigrationserviceAddTagsToResourceMessage : AWSRequest


/**
 <p>Identifies the AWS DMS resource to which tags should be added. The value for this parameter is an Amazon Resource Name (ARN).</p><p>For AWS DMS, you can tag a replication instance, an endpoint, or a replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>One or more tags to be assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceAddTagsToResourceResponse : AWSModel


@end

/**
 <p/>
 Required parameters: [ReplicationInstanceArn, ApplyAction, OptInType]
 */
@interface AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage : AWSRequest


/**
 <p>The pending maintenance action to apply to this resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyAction;

/**
 <p>A value that specifies the type of opt-in request, or undoes an opt-in request. You can't undo an opt-in request of type <code>immediate</code>.</p><p>Valid values:</p><ul><li><p><code>immediate</code> - Apply the maintenance action immediately.</p></li><li><p><code>next-maintenance</code> - Apply the maintenance action during the next maintenance window for the resource.</p></li><li><p><code>undo-opt-in</code> - Cancel any existing <code>next-maintenance</code> opt-in requests.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable optInType;

/**
 <p>The Amazon Resource Name (ARN) of the AWS DMS resource that the pending maintenance action applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse : AWSModel


/**
 <p>The AWS DMS resource that the pending maintenance action will be applied to.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceResourcePendingMaintenanceActions * _Nullable resourcePendingMaintenanceActions;

@end

/**
 <p>The name of an Availability Zone for use during database migration.</p>
 */
@interface AWSDatabasemigrationserviceAvailabilityZone : AWSModel


/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The SSL certificate that can be used to encrypt connections between the endpoints and the replication instance.</p>
 */
@interface AWSDatabasemigrationserviceCertificate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The date that the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable certificateCreationDate;

/**
 <p>A customer-assigned name for the certificate. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateIdentifier;

/**
 <p>The owner of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateOwner;

/**
 <p>The contents of a <code>.pem</code> file, which contains an X.509 certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The location of an imported Oracle Wallet certificate for use with SSL.</p>
 */
@property (nonatomic, strong) NSData * _Nullable certificateWallet;

/**
 <p>The key length of the cryptographic algorithm being used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keyLength;

/**
 <p>The signing algorithm for the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signingAlgorithm;

/**
 <p>The beginning date that the certificate is valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validFromDate;

/**
 <p>The final date that the certificate is valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validToDate;

@end

/**
 <p>Status of the connection between an endpoint and a replication instance, including Amazon Resource Names (ARNs) and the last error message issued.</p>
 */
@interface AWSDatabasemigrationserviceConnection : AWSModel


/**
 <p>The ARN string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The identifier of the endpoint. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointIdentifier;

/**
 <p>The error message when the connection last failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastFailureMessage;

/**
 <p>The ARN of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>The replication instance identifier. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceIdentifier;

/**
 <p>The connection status. This parameter can return one of the following values:</p><ul><li><p><code>"successful"</code></p></li><li><p><code>"testing"</code></p></li><li><p><code>"failed"</code></p></li><li><p><code>"deleting"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p/>
 Required parameters: [EndpointIdentifier, EndpointType, EngineName]
 */
@interface AWSDatabasemigrationserviceCreateEndpointMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The name of the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The settings in JSON format for the DMS transfer type of source endpoint. </p><p>Possible settings include the following:</p><ul><li><p><code>ServiceAccessRoleArn</code> - The IAM role that has permission to access the Amazon S3 bucket.</p></li><li><p><code>BucketName</code> - The name of the S3 bucket to use.</p></li><li><p><code>CompressionType</code> - An optional parameter to use GZIP to compress the target files. To use GZIP, set this value to <code>NONE</code> (the default). To keep the files uncompressed, don't use this value.</p></li></ul><p>Shorthand syntax for these settings is as follows: <code>ServiceAccessRoleArn=string,BucketName=string,CompressionType=string</code></p><p>JSON syntax for these settings is as follows: <code>{ "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType": "none"|"gzip" } </code></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDmsTransferSettings * _Nullable dmsTransferSettings;

/**
 <p>Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html">Using Object Mapping to Migrate Data to DynamoDB</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDynamoDbSettings * _Nullable dynamoDbSettings;

/**
 <p>Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration">Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS</a> in the <i>AWS Database Migration Service User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceElasticsearchSettings * _Nullable elasticsearchSettings;

/**
 <p>The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointIdentifier;

/**
 <p>The type of endpoint. Valid values are <code>source</code> and <code>target</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReplicationEndpointTypeValue endpointType;

/**
 <p>The type of engine for the endpoint. Valid values, depending on the <code>EndpointType</code> value, include <code>"mysql"</code>, <code>"oracle"</code>, <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>, <code>"aurora-postgresql"</code>, <code>"redshift"</code>, <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>, <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>, <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>, <code>"documentdb"</code>, <code>"sqlserver"</code>, and <code>"neptune"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>The external table definition. </p>
 */
@property (nonatomic, strong) NSString * _Nullable externalTableDefinition;

/**
 <p>Additional attributes associated with the connection. Each attribute is specified as a name-value pair associated by an equal sign (=). Multiple attributes are separated by a semicolon (;) with no additional white space. For information on the attributes available for connecting your source or target endpoint, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.html">Working with AWS DMS Endpoints</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable extraConnectionAttributes;

/**
 <p>Settings in JSON format for the target Apache Kafka endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html">Using Apache Kafka as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKafkaSettings * _Nullable kafkaSettings;

/**
 <p>Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html">Using Amazon Kinesis Data Streams as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKinesisSettings * _Nullable kinesisSettings;

/**
 <p>An AWS KMS key identifier that is used to encrypt the connection parameters for the endpoint.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption key.</p><p>AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html#CHAP_Source.MongoDB.Configuration">Using MongoDB as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceMongoDbSettings * _Nullable mongoDbSettings;

/**
 <p>Settings in JSON format for the target Amazon Neptune endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings">Specifying Endpoint Settings for Amazon Neptune as a Target</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceNeptuneSettings * _Nullable neptuneSettings;

/**
 <p>The password to be used to log in to the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The port used by the endpoint database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>Provides information that defines an Amazon Redshift endpoint.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceRedshiftSettings * _Nullable redshiftSettings;

/**
 <p>Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring">Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceS3Settings * _Nullable s3Settings;

/**
 <p>The name of the server where the endpoint database resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p> The Amazon Resource Name (ARN) for the service access role that you want to use to create the endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>The Secure Sockets Layer (SSL) mode to use for the SSL connection. The default is <code>none</code></p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceDmsSslModeValue sslMode;

/**
 <p>One or more tags to be assigned to the endpoint.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

/**
 <p>The user name to be used to log in to the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceCreateEndpointResponse : AWSModel


/**
 <p>The endpoint that was created.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEndpoint * _Nullable endpoint;

@end

/**
 <p/>
 Required parameters: [SubscriptionName, SnsTopicArn]
 */
@interface AWSDatabasemigrationserviceCreateEventSubscriptionMessage : AWSRequest


/**
 <p> A Boolean value; set to <code>true</code> to activate the subscription, or set to <code>false</code> to create the subscription but not activate it. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A list of event categories for a source type that you want to subscribe to. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Events.html">Working with Events and Notifications</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p> The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of identifiers for which AWS DMS provides notification events.</p><p>If you don't specify a value, notifications are provided for all sources.</p><p>If you specify multiple values, they must be of the same type. For example, if you specify a database instance ID, then all of the other values must be database instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIds;

/**
 <p> The type of AWS DMS resource that generates the events. For example, if you want to be notified of events generated by a replication instance, you set this parameter to <code>replication-instance</code>. If this value isn't specified, all events are returned. </p><p>Valid values: <code>replication-instance</code> | <code>replication-task</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the AWS DMS event notification subscription. This name must be less than 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

/**
 <p>One or more tags to be assigned to the event subscription.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceCreateEventSubscriptionResponse : AWSModel


/**
 <p>The event subscription that was created.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [ReplicationInstanceIdentifier, ReplicationInstanceClass]
 */
@interface AWSDatabasemigrationserviceCreateReplicationInstanceMessage : AWSRequest


/**
 <p>The amount of storage (in gigabytes) to be initially allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>A value that indicates whether minor engine upgrades are applied automatically to the replication instance during the maintenance window. This parameter defaults to <code>true</code>.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone where the replication instance will be created. The default value is a random, system-chosen Availability Zone in the endpoint's AWS Region, for example: <code>us-east-1d</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A list of custom DNS name servers supported for the replication instance to access your on-premise source or target database. This list overrides the default name servers supported by the replication instance. You can specify a comma-separated list of internet addresses for up to four on-premise DNS name servers. For example: <code>"1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable dnsNameServers;

/**
 <p>The engine version number of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>An AWS KMS key identifier that is used to encrypt the data on the replication instance.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption key.</p><p>AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p> Specifies whether the replication instance is a Multi-AZ deployment. You can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ parameter is set to <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).</p><p> Format: <code>ddd:hh24:mi-ddd:hh24:mi</code></p><p>Default: A 30-minute window selected at random from an 8-hour block of time per AWS Region, occurring on a random day of the week.</p><p>Valid Days: Mon, Tue, Wed, Thu, Fri, Sat, Sun</p><p>Constraints: Minimum 30-minute window.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p> Specifies the accessibility options for the replication instance. A value of <code>true</code> represents an instance with a public IP address. A value of <code>false</code> represents an instance with a private IP address. The default value is <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The compute and memory capacity of the replication instance as defined for the specified replication instance class. For example to specify the instance class dms.c4.large, set this parameter to <code>"dms.c4.large"</code>.</p><p>For more information on the settings and capacities for the available replication instance classes, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth"> Selecting the right AWS DMS replication instance for your migration</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceClass;

/**
 <p>The replication instance identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain 1-63 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Can't end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>myrepinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceIdentifier;

/**
 <p>A subnet group to associate with the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupIdentifier;

/**
 <p>One or more tags to be assigned to the replication instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

/**
 <p> Specifies the VPC security group to be used with the replication instance. The VPC security group must work with the VPC containing the replication instance. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceCreateReplicationInstanceResponse : AWSModel


/**
 <p>The replication instance that was created.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationInstance * _Nullable replicationInstance;

@end

/**
 <p/>
 Required parameters: [ReplicationSubnetGroupIdentifier, ReplicationSubnetGroupDescription, SubnetIds]
 */
@interface AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage : AWSRequest


/**
 <p>The description for the subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupDescription;

/**
 <p>The name for the replication subnet group. This value is stored as a lowercase string.</p><p>Constraints: Must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens. Must not be "default".</p><p>Example: <code>mySubnetgroup</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupIdentifier;

/**
 <p>One or more subnet IDs to be assigned to the subnet group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>One or more tags to be assigned to the subnet group.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse : AWSModel


/**
 <p>The replication subnet group that was created.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationSubnetGroup * _Nullable replicationSubnetGroup;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskIdentifier, SourceEndpointArn, TargetEndpointArn, ReplicationInstanceArn, MigrationType, TableMappings]
 */
@interface AWSDatabasemigrationserviceCreateReplicationTaskMessage : AWSRequest


/**
 <p>Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p> The value can be in date, checkpoint, or LSN/SCN format.</p><p>Date Example: --cdc-start-position “2018-03-08T12:12:12”</p><p>Checkpoint Example: --cdc-start-position "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"</p><p>LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”</p><note><p>When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the <code>slotName</code> extra connection attribute to the name of this logical replication slot. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStartPosition;

/**
 <p>Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p>Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cdcStartTime;

/**
 <p>Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time.</p><p>Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”</p><p>Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStopPosition;

/**
 <p>The migration type. Valid values: <code>full-load</code> | <code>cdc</code> | <code>full-load-and-cdc</code></p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceMigrationTypeValue migrationType;

/**
 <p>The Amazon Resource Name (ARN) of a replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>An identifier for the replication task.</p><p>Constraints:</p><ul><li><p>Must contain 1-255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskIdentifier;

/**
 <p>Overall settings for the task, in JSON format. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TaskSettings.html">Specifying Task Settings for AWS Database Migration Service Tasks</a> in the <i>AWS Database Migration User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskSettings;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies the source endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEndpointArn;

/**
 <p>The table mappings for the task, in JSON format. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.CustomizingTasks.TableMapping.html">Using Table Mapping to Specify Task Settings</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable tableMappings;

/**
 <p>One or more tags to be assigned to the replication task.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies the target endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetEndpointArn;

/**
 <p>Supplemental information that the task requires to migrate the data for certain source and target endpoints. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying Supplemental Data for Task Settings</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable taskData;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceCreateReplicationTaskResponse : AWSModel


/**
 <p>The replication task that was created.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDeleteCertificateMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the deleted certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDeleteCertificateResponse : AWSModel


/**
 <p>The Secure Sockets Layer (SSL) certificate.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceCertificate * _Nullable certificate;

@end

/**
 <p/>
 Required parameters: [EndpointArn, ReplicationInstanceArn]
 */
@interface AWSDatabasemigrationserviceDeleteConnectionMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteConnectionResponse : AWSModel


/**
 <p>The connection that is being deleted.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceConnection * _Nullable connection;

@end

/**
 <p/>
 Required parameters: [EndpointArn]
 */
@interface AWSDatabasemigrationserviceDeleteEndpointMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteEndpointResponse : AWSModel


/**
 <p>The endpoint that was deleted.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEndpoint * _Nullable endpoint;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSDatabasemigrationserviceDeleteEventSubscriptionMessage : AWSRequest


/**
 <p>The name of the DMS event notification subscription to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteEventSubscriptionResponse : AWSModel


/**
 <p>The event subscription that was deleted.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [ReplicationInstanceArn]
 */
@interface AWSDatabasemigrationserviceDeleteReplicationInstanceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the replication instance to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteReplicationInstanceResponse : AWSModel


/**
 <p>The replication instance that was deleted.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationInstance * _Nullable replicationInstance;

@end

/**
 <p/>
 Required parameters: [ReplicationSubnetGroupIdentifier]
 */
@interface AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage : AWSRequest


/**
 <p>The subnet group name of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupIdentifier;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse : AWSModel


@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn]
 */
@interface AWSDatabasemigrationserviceDeleteReplicationTaskMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the replication task to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDeleteReplicationTaskResponse : AWSModel


/**
 <p>The deleted replication task.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeAccountAttributesMessage : AWSRequest


@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeAccountAttributesResponse : AWSModel


/**
 <p>Account quota information.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceAccountQuota *> * _Nullable accountQuotas;

/**
 <p>A unique AWS DMS identifier for an account in a particular AWS Region. The value of this identifier has the following format: <code>c99999999999</code>. DMS uses this identifier to name artifacts. For example, DMS uses this identifier to name the default Amazon S3 bucket for storing task assessment reports in a given AWS Region. The format of this S3 bucket name is the following: <code>dms-<i>AccountNumber</i>-<i>UniqueAccountIdentifier</i>.</code> Here is an example name for this default S3 bucket: <code>dms-111122223333-c44445555666</code>.</p><note><p>AWS DMS supports the <code>UniqueAccountIdentifier</code> parameter in versions 3.1.4 and later.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable uniqueAccountIdentifier;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDescribeCertificatesMessage : AWSRequest


/**
 <p>Filters applied to the certificate described in the form of key-value pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 10</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDescribeCertificatesResponse : AWSModel


/**
 <p>The Secure Sockets Layer (SSL) certificates associated with the replication instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceCertificate *> * _Nullable certificates;

/**
 <p>The pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeConnectionsMessage : AWSRequest


/**
 <p>The filters applied to the connection.</p><p>Valid filter names: endpoint-arn | replication-instance-arn</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeConnectionsResponse : AWSModel


/**
 <p>A description of the connections.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceConnection *> * _Nullable connections;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEndpointTypesMessage : AWSRequest


/**
 <p>Filters applied to the describe action.</p><p>Valid filter names: engine-name | endpoint-type</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEndpointTypesResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The types of endpoints that are supported.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceSupportedEndpointType *> * _Nullable supportedEndpointTypes;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEndpointsMessage : AWSRequest


/**
 <p>Filters applied to the describe action.</p><p>Valid filter names: endpoint-arn | endpoint-type | endpoint-id | engine-name</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEndpointsResponse : AWSModel


/**
 <p>Endpoint description.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceEndpoint *> * _Nullable endpoints;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventCategoriesMessage : AWSRequest


/**
 <p>Filters applied to the action.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> The type of AWS DMS resource that generates events. </p><p>Valid values: replication-instance | replication-task</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventCategoriesResponse : AWSModel


/**
 <p>A list of event categories.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceEventCategoryGroup *> * _Nullable eventCategoryGroupList;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage : AWSRequest


/**
 <p>Filters applied to the action.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The name of the AWS DMS event subscription to be described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse : AWSModel


/**
 <p>A list of event subscriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceEventSubscription *> * _Nullable eventSubscriptionsList;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventsMessage : AWSRequest


/**
 <p>The duration of the events to be listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The end time for the events to be listed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>A list of event categories for the source type that you've chosen.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>Filters applied to the action.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p> The identifier of an event source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p>The type of AWS DMS resource that generates events.</p><p>Valid values: replication-instance | replication-task</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceSourceType sourceType;

/**
 <p>The start time for the events to be listed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeEventsResponse : AWSModel


/**
 <p>The events described.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceEvent *> * _Nullable events;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage : AWSRequest


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The order-able replication instances available.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceOrderableReplicationInstance *> * _Nullable orderableReplicationInstances;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The pending maintenance action.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceResourcePendingMaintenanceActions *> * _Nullable pendingMaintenanceActions;

@end

/**
 <p/>
 Required parameters: [EndpointArn]
 */
@interface AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse : AWSModel


/**
 <p>The status of the schema.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceRefreshSchemasStatus * _Nullable refreshSchemasStatus;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage : AWSRequest


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>An array of replication task log metadata. Each member of the array contains the replication task name, ARN, and task log size (in bytes). </p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceReplicationInstanceTaskLog *> * _Nullable replicationInstanceTaskLogs;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationInstancesMessage : AWSRequest


/**
 <p>Filters applied to the describe action.</p><p>Valid filter names: replication-instance-arn | replication-instance-id | replication-instance-class | engine-version</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationInstancesResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The replication instances described.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceReplicationInstance *> * _Nullable replicationInstances;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage : AWSRequest


/**
 <p>Filters applied to the describe action.</p><p>Valid filter names: replication-subnet-group-id</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A description of the replication subnet groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceReplicationSubnetGroup *> * _Nullable replicationSubnetGroups;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage : AWSRequest


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the task. When this input parameter is specified, the API returns only one result and ignore the values of the <code>MaxRecords</code> and <code>Marker</code> parameters. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse : AWSModel


/**
 <p>- The Amazon S3 bucket where the task assessment report is located. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The task assessment report. </p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceReplicationTaskAssessmentResult *> * _Nullable replicationTaskAssessmentResults;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationTasksMessage : AWSRequest


/**
 <p>Filters applied to the describe action.</p><p>Valid filter names: replication-task-arn | replication-task-id | migration-type | endpoint-arn | replication-instance-arn</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>An option to set to avoid returning information about settings. Use this to reduce overhead when setting information is too large. To use this option, choose <code>true</code>; otherwise, choose <code>false</code> (the default).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable withoutSettings;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeReplicationTasksResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A description of the replication tasks.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceReplicationTask *> * _Nullable replicationTasks;

@end

/**
 <p/>
 Required parameters: [EndpointArn]
 */
@interface AWSDatabasemigrationserviceDescribeSchemasMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeSchemasResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The described schema.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable schemas;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn]
 */
@interface AWSDatabasemigrationserviceDescribeTableStatisticsMessage : AWSRequest


/**
 <p>Filters applied to the describe table statistics action.</p><p>Valid filter names: schema-name | table-name | table-state</p><p>A combination of filters creates an AND condition where each record matches all specified filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceFilter *> * _Nullable filters;

/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The maximum number of records to include in the response. If more records exist than the specified <code>MaxRecords</code> value, a pagination token called a marker is included in the response so that the remaining results can be retrieved. </p><p>Default: 100</p><p>Constraints: Minimum 20, maximum 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The Amazon Resource Name (ARN) of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceDescribeTableStatisticsResponse : AWSModel


/**
 <p> An optional pagination token provided by a previous request. If this parameter is specified, the response includes only records beyond the marker, up to the value specified by <code>MaxRecords</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The Amazon Resource Name (ARN) of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The table statistics.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTableStatistics *> * _Nullable tableStatistics;

@end

/**
 <p> The settings in JSON format for the DMS Transfer type source endpoint. </p>
 */
@interface AWSDatabasemigrationserviceDmsTransferSettings : AWSModel


/**
 <p> The name of the S3 bucket to use. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p> The IAM role that has permission to access the Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

@end

/**
 <p>Provides the Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role used to define an Amazon DynamoDB target endpoint.</p>
 Required parameters: [ServiceAccessRoleArn]
 */
@interface AWSDatabasemigrationserviceDynamoDbSettings : AWSModel


/**
 <p> The Amazon Resource Name (ARN) used by the service access IAM role. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

@end

/**
 <p>Provides information that defines an Elasticsearch endpoint.</p>
 Required parameters: [ServiceAccessRoleArn, EndpointUri]
 */
@interface AWSDatabasemigrationserviceElasticsearchSettings : AWSModel


/**
 <p>The endpoint for the Elasticsearch cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointUri;

/**
 <p>The maximum number of seconds for which DMS retries failed API requests to the Elasticsearch cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorRetryDuration;

/**
 <p>The maximum percentage of records that can fail to be written before a full load operation stops. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadErrorPercentage;

/**
 <p>The Amazon Resource Name (ARN) used by service to access the IAM role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

@end

/**
 <p>Describes an endpoint of a database instance in response to operations such as the following:</p><ul><li><p><code>CreateEndpoint</code></p></li><li><p><code>DescribeEndpoint</code></p></li><li><p><code>DescribeEndpointTypes</code></p></li><li><p><code>ModifyEndpoint</code></p></li></ul>
 */
@interface AWSDatabasemigrationserviceEndpoint : AWSModel


/**
 <p>The Amazon Resource Name (ARN) used for SSL connection to the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The name of the database at the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The settings in JSON format for the DMS transfer type of source endpoint. </p><p>Possible settings include the following:</p><ul><li><p><code>ServiceAccessRoleArn</code> - The IAM role that has permission to access the Amazon S3 bucket.</p></li><li><p><code>BucketName</code> - The name of the S3 bucket to use.</p></li><li><p><code>CompressionType</code> - An optional parameter to use GZIP to compress the target files. To use GZIP, set this value to <code>NONE</code> (the default). To keep the files uncompressed, don't use this value.</p></li></ul><p>Shorthand syntax for these settings is as follows: <code>ServiceAccessRoleArn=string,BucketName=string,CompressionType=string</code></p><p>JSON syntax for these settings is as follows: <code>{ "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType": "none"|"gzip" } </code></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDmsTransferSettings * _Nullable dmsTransferSettings;

/**
 <p>The settings for the target DynamoDB database. For more information, see the <code>DynamoDBSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDynamoDbSettings * _Nullable dynamoDbSettings;

/**
 <p>The settings for the Elasticsearch source endpoint. For more information, see the <code>ElasticsearchSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceElasticsearchSettings * _Nullable elasticsearchSettings;

/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointIdentifier;

/**
 <p>The type of endpoint. Valid values are <code>source</code> and <code>target</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReplicationEndpointTypeValue endpointType;

/**
 <p>The expanded name for the engine name. For example, if the <code>EngineName</code> parameter is "aurora," this value would be "Amazon Aurora MySQL."</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineDisplayName;

/**
 <p>The database engine name. Valid values, depending on the EndpointType, include <code>"mysql"</code>, <code>"oracle"</code>, <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>, <code>"aurora-postgresql"</code>, <code>"redshift"</code>, <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>, <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>, <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>, <code>"documentdb"</code>, <code>"sqlserver"</code>, and <code>"neptune"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p> Value returned by a call to CreateEndpoint that can be used for cross-account validation. Use it on a subsequent call to CreateEndpoint to create the endpoint with a cross-account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The external table definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalTableDefinition;

/**
 <p>Additional connection attributes used to connect to the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extraConnectionAttributes;

/**
 <p>The settings for the Apache Kafka target endpoint. For more information, see the <code>KafkaSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKafkaSettings * _Nullable kafkaSettings;

/**
 <p>The settings for the Amazon Kinesis target endpoint. For more information, see the <code>KinesisSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKinesisSettings * _Nullable kinesisSettings;

/**
 <p>An AWS KMS key identifier that is used to encrypt the connection parameters for the endpoint.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption key.</p><p>AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The settings for the MongoDB source endpoint. For more information, see the <code>MongoDbSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceMongoDbSettings * _Nullable mongoDbSettings;

/**
 <p>The settings for the Amazon Neptune target endpoint. For more information, see the <code>NeptuneSettings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceNeptuneSettings * _Nullable neptuneSettings;

/**
 <p>The port value used to access the endpoint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>Settings for the Amazon Redshift endpoint.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceRedshiftSettings * _Nullable redshiftSettings;

/**
 <p>The settings for the S3 target endpoint. For more information, see the <code>S3Settings</code> structure.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceS3Settings * _Nullable s3Settings;

/**
 <p>The name of the server at the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>The Amazon Resource Name (ARN) used by the service access IAM role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>The SSL mode used to connect to the endpoint. The default value is <code>none</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceDmsSslModeValue sslMode;

/**
 <p>The status of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The user name used to connect to the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes an identifiable significant activity that affects a replication instance or task. This object can provide the message, the available event categories, the date and source of the event, and the AWS DMS resource type.</p>
 */
@interface AWSDatabasemigrationserviceEvent : AWSModel


/**
 <p>The date of the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>The event categories available for the specified source type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The event message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p> The identifier of an event source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceIdentifier;

/**
 <p> The type of AWS DMS resource that generates events. </p><p>Valid values: replication-instance | endpoint | replication-task</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceSourceType sourceType;

@end

/**
 <p>Lists categories of events subscribed to, and generated by, the applicable AWS DMS resource type.</p>
 */
@interface AWSDatabasemigrationserviceEventCategoryGroup : AWSModel


/**
 <p> A list of event categories from a source type that you've chosen.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p> The type of AWS DMS resource that generates events. </p><p>Valid values: replication-instance | replication-server | security-group | replication-task</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

@end

/**
 <p>Describes an event notification subscription created by the <code>CreateEventSubscription</code> operation.</p>
 */
@interface AWSDatabasemigrationserviceEventSubscription : AWSModel


/**
 <p>The AWS DMS event notification subscription Id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable custSubscriptionId;

/**
 <p>The AWS customer account associated with the AWS DMS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAwsId;

/**
 <p>Boolean value that indicates if the event subscription is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A lists of event categories.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategoriesList;

/**
 <p>The topic ARN of the AWS DMS event notification subscription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>A list of source Ids for the event subscription.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sourceIdsList;

/**
 <p> The type of AWS DMS resource that generates events. </p><p>Valid values: replication-instance | replication-server | security-group | replication-task</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The status of the AWS DMS event notification subscription.</p><p>Constraints:</p><p>Can be one of the following: creating | modifying | deleting | active | no-permission | topic-not-exist</p><p>The status "no-permission" indicates that AWS DMS no longer has permission to post to the SNS topic. The status "topic-not-exist" indicates that the topic was deleted after the subscription was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time the AWS DMS event notification subscription was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionCreationTime;

@end

/**
 <p>Identifies the name and value of a source filter object used to limit the number and type of records transferred from your source to your target.</p>
 Required parameters: [Name, Values]
 */
@interface AWSDatabasemigrationserviceFilter : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The filter value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceImportCertificateMessage : AWSRequest


/**
 <p>A customer-assigned name for the certificate. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateIdentifier;

/**
 <p>The contents of a <code>.pem</code> file, which contains an X.509 certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The location of an imported Oracle Wallet certificate for use with SSL.</p>
 */
@property (nonatomic, strong) NSData * _Nullable certificateWallet;

/**
 <p>The tags associated with the certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceImportCertificateResponse : AWSModel


/**
 <p>The certificate to be uploaded.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceCertificate * _Nullable certificate;

@end

/**
 <p>Provides information that describes an Apache Kafka endpoint. This information includes the output format of records applied to the endpoint and details of transaction and control table data information.</p>
 */
@interface AWSDatabasemigrationserviceKafkaSettings : AWSModel


/**
 <p>The broker location and port of the Kafka broker that hosts your Kafka instance. Specify the broker in the form <code><i>broker-hostname-or-ip</i>:<i>port</i></code>. For example, <code>"ec2-12-345-678-901.compute-1.amazonaws.com:2345"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable broker;

/**
 <p>The topic to which you migrate the data. If you don't specify a topic, AWS DMS specifies <code>"kafka-default-topic"</code> as the migration topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Provides information that describes an Amazon Kinesis Data Stream endpoint. This information includes the output format of records applied to the endpoint and details of transaction and control table data information.</p>
 */
@interface AWSDatabasemigrationserviceKinesisSettings : AWSModel


/**
 <p>Shows detailed control information for table definition, column definition, and table and column changes in the Kinesis message output. The default is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeControlDetails;

/**
 <p>Shows the partition value within the Kinesis message output, unless the partition type is <code>schema-table-type</code>. The default is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includePartitionValue;

/**
 <p>Includes any data definition language (DDL) operations that change the table in the control data, such as <code>rename-table</code>, <code>drop-table</code>, <code>add-column</code>, <code>drop-column</code>, and <code>rename-column</code>. The default is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeTableAlterOperations;

/**
 <p>Provides detailed transaction information from the source database. This information includes a commit timestamp, a log position, and values for <code>transaction_id</code>, previous <code>transaction_id</code>, and <code>transaction_record_id</code> (the record offset within a transaction). The default is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeTransactionDetails;

/**
 <p>The output format for the records created on the endpoint. The message format is <code>JSON</code> (default) or <code>JSON_UNFORMATTED</code> (a single line with no tab).</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceMessageFormatValue messageFormat;

/**
 <p>Prefixes schema and table names to partition values, when the partition type is <code>primary-key-type</code>. Doing this increases data distribution among Kinesis shards. For example, suppose that a SysBench schema has thousands of tables and each table has only limited range for a primary key. In this case, the same primary key is sent from thousands of tables to the same shard, which causes throttling. The default is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partitionIncludeSchemaTable;

/**
 <p>The Amazon Resource Name (ARN) for the AWS Identity and Access Management (IAM) role that AWS DMS uses to write to the Kinesis data stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>The Amazon Resource Name (ARN) for the Amazon Kinesis Data Streams endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

@end

/**
 <p/>
 Required parameters: [ResourceArn]
 */
@interface AWSDatabasemigrationserviceListTagsForResourceMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the AWS DMS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceListTagsForResourceResponse : AWSModel


/**
 <p>A list of tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTag *> * _Nullable tagList;

@end

/**
 <p/>
 Required parameters: [EndpointArn]
 */
@interface AWSDatabasemigrationserviceModifyEndpointMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the certificate used for SSL connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The name of the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The settings in JSON format for the DMS transfer type of source endpoint. </p><p>Attributes include the following:</p><ul><li><p>serviceAccessRoleArn - The AWS Identity and Access Management (IAM) role that has permission to access the Amazon S3 bucket.</p></li><li><p>BucketName - The name of the S3 bucket to use.</p></li><li><p>compressionType - An optional parameter to use GZIP to compress the target files. Either set this parameter to NONE (the default) or don't use it to leave the files uncompressed.</p></li></ul><p>Shorthand syntax for these settings is as follows: <code>ServiceAccessRoleArn=string ,BucketName=string,CompressionType=string</code></p><p>JSON syntax for these settings is as follows: <code>{ "ServiceAccessRoleArn": "string", "BucketName": "string", "CompressionType": "none"|"gzip" } </code></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDmsTransferSettings * _Nullable dmsTransferSettings;

/**
 <p>Settings in JSON format for the target Amazon DynamoDB endpoint. For information about other available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.DynamoDB.html">Using Object Mapping to Migrate Data to DynamoDB</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceDynamoDbSettings * _Nullable dynamoDbSettings;

/**
 <p>Settings in JSON format for the target Elasticsearch endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Elasticsearch.html#CHAP_Target.Elasticsearch.Configuration">Extra Connection Attributes When Using Elasticsearch as a Target for AWS DMS</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceElasticsearchSettings * _Nullable elasticsearchSettings;

/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The database endpoint identifier. Identifiers must begin with a letter and must contain only ASCII letters, digits, and hyphens. They can't end with a hyphen or contain two consecutive hyphens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointIdentifier;

/**
 <p>The type of endpoint. Valid values are <code>source</code> and <code>target</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReplicationEndpointTypeValue endpointType;

/**
 <p>The type of engine for the endpoint. Valid values, depending on the EndpointType, include <code>"mysql"</code>, <code>"oracle"</code>, <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>, <code>"aurora-postgresql"</code>, <code>"redshift"</code>, <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>, <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>, <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>, <code>"documentdb"</code>, <code>"sqlserver"</code>, and <code>"neptune"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>The external table definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalTableDefinition;

/**
 <p>Additional attributes associated with the connection. To reset this parameter, pass the empty string ("") as an argument.</p>
 */
@property (nonatomic, strong) NSString * _Nullable extraConnectionAttributes;

/**
 <p>Settings in JSON format for the target Apache Kafka endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kafka.html">Using Apache Kafka as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKafkaSettings * _Nullable kafkaSettings;

/**
 <p>Settings in JSON format for the target endpoint for Amazon Kinesis Data Streams. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Kinesis.html">Using Amazon Kinesis Data Streams as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceKinesisSettings * _Nullable kinesisSettings;

/**
 <p>Settings in JSON format for the source MongoDB endpoint. For more information about the available settings, see the configuration properties section in <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.MongoDB.html"> Using MongoDB as a Target for AWS Database Migration Service</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceMongoDbSettings * _Nullable mongoDbSettings;

/**
 <p>Settings in JSON format for the target Amazon Neptune endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.EndpointSettings">Specifying Endpoint Settings for Amazon Neptune as a Target</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceNeptuneSettings * _Nullable neptuneSettings;

/**
 <p>The password to be used to login to the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The port used by the endpoint database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>Provides information that defines an Amazon Redshift endpoint.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceRedshiftSettings * _Nullable redshiftSettings;

/**
 <p>Settings in JSON format for the target Amazon S3 endpoint. For more information about the available settings, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring">Extra Connection Attributes When Using Amazon S3 as a Target for AWS DMS</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceS3Settings * _Nullable s3Settings;

/**
 <p>The name of the server where the endpoint database resides.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p> The Amazon Resource Name (ARN) for the service access role you want to use to modify the endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>The SSL mode used to connect to the endpoint. The default value is <code>none</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceDmsSslModeValue sslMode;

/**
 <p>The user name to be used to login to the endpoint database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceModifyEndpointResponse : AWSModel


/**
 <p>The modified endpoint.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEndpoint * _Nullable endpoint;

@end

/**
 <p/>
 Required parameters: [SubscriptionName]
 */
@interface AWSDatabasemigrationserviceModifyEventSubscriptionMessage : AWSRequest


/**
 <p> A Boolean value; set to <b>true</b> to activate the subscription. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> A list of event categories for a source type that you want to subscribe to. Use the <code>DescribeEventCategories</code> action to see a list of event categories. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p> The Amazon Resource Name (ARN) of the Amazon SNS topic created for event notification. The ARN is created by Amazon SNS when you create a topic and subscribe to it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p> The type of AWS DMS resource that generates the events you want to subscribe to. </p><p>Valid values: replication-instance | replication-task</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceType;

/**
 <p>The name of the AWS DMS event notification subscription to be modified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subscriptionName;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceModifyEventSubscriptionResponse : AWSModel


/**
 <p>The modified event subscription.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceEventSubscription * _Nullable eventSubscription;

@end

/**
 <p/>
 Required parameters: [ReplicationInstanceArn]
 */
@interface AWSDatabasemigrationserviceModifyReplicationInstanceMessage : AWSRequest


/**
 <p>The amount of storage (in gigabytes) to be allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage, and the change is asynchronously applied as soon as possible.</p><p>This parameter must be set to <code>true</code> when specifying a value for the <code>EngineVersion</code> parameter that is a different major version than the replication instance's current version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowMajorVersionUpgrade;

/**
 <p>Indicates whether the changes should be applied immediately or during the next maintenance window.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>A value that indicates that minor version upgrades are applied automatically to the replication instance during the maintenance window. Changing this parameter doesn't result in an outage, except in the case dsecribed following. The change is asynchronously applied as soon as possible. </p><p>An outage does result if these factors apply: </p><ul><li><p>This parameter is set to <code>true</code> during the maintenance window.</p></li><li><p>A newer minor version is available. </p></li><li><p>AWS DMS has enabled automatic patching for the given engine version. </p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The engine version number of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> Specifies whether the replication instance is a Multi-AZ deployment. You can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ parameter is set to <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The weekly time range (in UTC) during which system maintenance can occur, which might result in an outage. Changing this parameter does not result in an outage, except in the following situation, and the change is asynchronously applied as soon as possible. If moving this window to the current time, there must be at least 30 minutes between the current time and end of the window to ensure pending changes are applied.</p><p>Default: Uses existing setting</p><p>Format: ddd:hh24:mi-ddd:hh24:mi</p><p>Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun</p><p>Constraints: Must be at least 30 minutes</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>The compute and memory capacity of the replication instance as defined for the specified replication instance class. For example to specify the instance class dms.c4.large, set this parameter to <code>"dms.c4.large"</code>.</p><p>For more information on the settings and capacities for the available replication instance classes, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth"> Selecting the right AWS DMS replication instance for your migration</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceClass;

/**
 <p>The replication instance identifier. This parameter is stored as a lowercase string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceIdentifier;

/**
 <p> Specifies the VPC security group to be used with the replication instance. The VPC security group must work with the VPC containing the replication instance. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcSecurityGroupIds;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceModifyReplicationInstanceResponse : AWSModel


/**
 <p>The modified replication instance.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationInstance * _Nullable replicationInstance;

@end

/**
 <p/>
 Required parameters: [ReplicationSubnetGroupIdentifier, SubnetIds]
 */
@interface AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage : AWSRequest


/**
 <p>A description for the replication instance subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupDescription;

/**
 <p>The name of the replication instance subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupIdentifier;

/**
 <p>A list of subnet IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse : AWSModel


/**
 <p>The modified replication subnet group.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationSubnetGroup * _Nullable replicationSubnetGroup;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn]
 */
@interface AWSDatabasemigrationserviceModifyReplicationTaskMessage : AWSRequest


/**
 <p>Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p> The value can be in date, checkpoint, or LSN/SCN format.</p><p>Date Example: --cdc-start-position “2018-03-08T12:12:12”</p><p>Checkpoint Example: --cdc-start-position "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"</p><p>LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”</p><note><p>When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the <code>slotName</code> extra connection attribute to the name of this logical replication slot. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStartPosition;

/**
 <p>Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p>Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cdcStartTime;

/**
 <p>Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time.</p><p>Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”</p><p>Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStopPosition;

/**
 <p>The migration type. Valid values: <code>full-load</code> | <code>cdc</code> | <code>full-load-and-cdc</code></p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceMigrationTypeValue migrationType;

/**
 <p>The Amazon Resource Name (ARN) of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The replication task identifier.</p><p>Constraints:</p><ul><li><p>Must contain 1-255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskIdentifier;

/**
 <p>JSON file that contains settings for the task, such as task metadata settings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskSettings;

/**
 <p>When using the AWS CLI or boto3, provide the path of the JSON file that contains the table mappings. Precede the path with <code>file://</code>. When working with the DMS API, provide the JSON as the parameter value, for example: <code>--table-mappings file://mappingfile.json</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable tableMappings;

/**
 <p>Supplemental information that the task requires to migrate the data for certain source and target endpoints. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying Supplemental Data for Task Settings</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable taskData;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceModifyReplicationTaskResponse : AWSModel


/**
 <p>The replication task that was modified.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 <p>Provides information that defines a MongoDB endpoint.</p>
 */
@interface AWSDatabasemigrationserviceMongoDbSettings : AWSModel


/**
 <p> The authentication mechanism you use to access the MongoDB source endpoint.</p><p>For the default value, in MongoDB version 2.x, <code>"default"</code> is <code>"mongodb_cr"</code>. For MongoDB version 3.x or later, <code>"default"</code> is <code>"scram_sha_1"</code>. This setting isn't used when <code>AuthType</code> is set to <code>"no"</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceAuthMechanismValue authMechanism;

/**
 <p> The MongoDB database name. This setting isn't used when <code>AuthType</code> is set to <code>"no"</code>. </p><p>The default is <code>"admin"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authSource;

/**
 <p> The authentication type you use to access the MongoDB source endpoint.</p><p>When when set to <code>"no"</code>, user name and password parameters are not used and can be empty. </p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceAuthTypeValue authType;

/**
 <p> The database name on the MongoDB source endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p> Indicates the number of documents to preview to determine the document organization. Use this setting when <code>NestingLevel</code> is set to <code>"one"</code>. </p><p>Must be a positive value greater than <code>0</code>. Default value is <code>1000</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable docsToInvestigate;

/**
 <p> Specifies the document ID. Use this setting when <code>NestingLevel</code> is set to <code>"none"</code>. </p><p>Default value is <code>"false"</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable extractDocId;

/**
 <p>The AWS KMS key identifier that is used to encrypt the content on the replication instance. If you don't specify a value for the <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p> Specifies either document or table mode. </p><p>Default value is <code>"none"</code>. Specify <code>"none"</code> to use document mode. Specify <code>"one"</code> to use table mode.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceNestingLevelValue nestingLevel;

/**
 <p> The password for the user account you use to access the MongoDB source endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p> The port value for the MongoDB source endpoint. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p> The name of the server on the MongoDB source endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>The user name you use to access the MongoDB source endpoint. </p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Provides information that defines an Amazon Neptune endpoint.</p>
 Required parameters: [S3BucketName, S3BucketFolder]
 */
@interface AWSDatabasemigrationserviceNeptuneSettings : AWSModel


/**
 <p>The number of milliseconds for AWS DMS to wait to retry a bulk-load of migrated graph data to the Neptune target database before raising an error. The default is 250.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorRetryDuration;

/**
 <p>If you want AWS Identity and Access Management (IAM) authorization enabled for this endpoint, set this parameter to <code>true</code>. Then attach the appropriate IAM policy document to your service role specified by <code>ServiceAccessRoleArn</code>. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iamAuthEnabled;

/**
 <p>The maximum size in kilobytes of migrated graph data stored in a .csv file before AWS DMS bulk-loads the data to the Neptune target database. The default is 1,048,576 KB. If the bulk load is successful, AWS DMS clears the bucket, ready to store the next batch of migrated graph data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFileSize;

/**
 <p>The number of times for AWS DMS to retry a bulk load of migrated graph data to the Neptune target database before raising an error. The default is 5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRetryCount;

/**
 <p>A folder path where you want AWS DMS to store migrated graph data in the S3 bucket specified by <code>S3BucketName</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketFolder;

/**
 <p>The name of the Amazon S3 bucket where AWS DMS can temporarily store migrated graph data in .csv files before bulk-loading it to the Neptune target database. AWS DMS maps the SQL source data to graph data before storing it in these .csv files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The Amazon Resource Name (ARN) of the service role that you created for the Neptune target endpoint. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html#CHAP_Target.Neptune.ServiceRole">Creating an IAM Service Role for Accessing Amazon Neptune as a Target</a> in the <i>AWS Database Migration Service User Guide. </i></p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

@end

/**
 <p>In response to the <code>DescribeOrderableReplicationInstances</code> operation, this object describes an available replication instance. This description includes the replication instance's type, engine version, and allocated storage.</p>
 */
@interface AWSDatabasemigrationserviceOrderableReplicationInstance : AWSModel


/**
 <p>List of Availability Zones for this replication instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The default amount of storage (in gigabytes) that is allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultAllocatedStorage;

/**
 <p>The version of the replication engine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The amount of storage (in gigabytes) that is allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includedAllocatedStorage;

/**
 <p>The minimum amount of storage (in gigabytes) that can be allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAllocatedStorage;

/**
 <p>The minimum amount of storage (in gigabytes) that can be allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAllocatedStorage;

/**
 <p>The value returned when the specified <code>EngineVersion</code> of the replication instance is in Beta or test mode. This indicates some features might not work as expected.</p><note><p>AWS DMS supports the <code>ReleaseStatus</code> parameter in versions 3.1.4 and later.</p></note>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReleaseStatusValues releaseStatus;

/**
 <p>The compute and memory capacity of the replication instance as defined for the specified replication instance class. For example to specify the instance class dms.c4.large, set this parameter to <code>"dms.c4.large"</code>.</p><p>For more information on the settings and capacities for the available replication instance classes, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth"> Selecting the right AWS DMS replication instance for your migration</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceClass;

/**
 <p>The type of storage used by the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable storageType;

@end

/**
 <p>Describes a maintenance action pending for an AWS DMS resource, including when and how it will be applied. This data type is a response element to the <code>DescribePendingMaintenanceActions</code> operation.</p>
 */
@interface AWSDatabasemigrationservicePendingMaintenanceAction : AWSModel


/**
 <p>The type of pending maintenance action that is available for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>The date of the maintenance window when the action is to be applied. The maintenance action is applied to the resource during its first maintenance window after this date. If this date is specified, any <code>next-maintenance</code> opt-in requests are ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable autoAppliedAfterDate;

/**
 <p>The effective date when the pending maintenance action will be applied to the resource. This date takes into account opt-in requests received from the <code>ApplyPendingMaintenanceAction</code> API operation, and also the <code>AutoAppliedAfterDate</code> and <code>ForcedApplyDate</code> parameter values. This value is blank if an opt-in request has not been received and nothing has been specified for <code>AutoAppliedAfterDate</code> or <code>ForcedApplyDate</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable currentApplyDate;

/**
 <p>A description providing more detail about the maintenance action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date when the maintenance action will be automatically applied. The maintenance action is applied to the resource on this date regardless of the maintenance window for the resource. If this date is specified, any <code>immediate</code> opt-in requests are ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable forcedApplyDate;

/**
 <p>The type of opt-in request that has been received for the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable optInStatus;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceRebootReplicationInstanceMessage : AWSRequest


/**
 <p>If this parameter is <code>true</code>, the reboot is conducted through a Multi-AZ failover. (If the instance isn't configured for Multi-AZ, then you can't specify <code>true</code>.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceFailover;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceRebootReplicationInstanceResponse : AWSModel


/**
 <p>The replication instance that is being rebooted. </p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationInstance * _Nullable replicationInstance;

@end

/**
 <p>Provides information that defines an Amazon Redshift endpoint.</p>
 */
@interface AWSDatabasemigrationserviceRedshiftSettings : AWSModel


/**
 <p>A value that indicates to allow any date format, including invalid formats such as 00/00/00 00:00:00, to be loaded without generating an error. You can choose <code>true</code> or <code>false</code> (the default).</p><p>This parameter applies only to TIMESTAMP and DATE columns. Always use ACCEPTANYDATE with the DATEFORMAT parameter. If the date format for the data doesn't match the DATEFORMAT specification, Amazon Redshift inserts a NULL value into that field. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable acceptAnyDate;

/**
 <p>Code to run after connecting. This parameter should contain the code itself, not the name of a file containing the code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterConnectScript;

/**
 <p>The location where the comma-separated value (.csv) files are stored before being uploaded to the S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketFolder;

/**
 <p>The name of the S3 bucket you want to use</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>A value that sets the amount of time to wait (in milliseconds) before timing out, beginning from when you initially establish a connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionTimeout;

/**
 <p>The name of the Amazon Redshift data warehouse (service) that you are working with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable databaseName;

/**
 <p>The date format that you are using. Valid values are <code>auto</code> (case-sensitive), your date format string enclosed in quotes, or NULL. If this parameter is left unset (NULL), it defaults to a format of 'YYYY-MM-DD'. Using <code>auto</code> recognizes most strings, even some that aren't supported when you use a date format string. </p><p>If your date and time values use formats different from each other, set this to <code>auto</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dateFormat;

/**
 <p>A value that specifies whether AWS DMS should migrate empty CHAR and VARCHAR fields as NULL. A value of <code>true</code> sets empty CHAR and VARCHAR fields to null. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable emptyAsNull;

/**
 <p>The type of server-side encryption that you want to use for your data. This encryption type is part of the endpoint settings or the extra connections attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the default) or <code>SSE_KMS</code>. To use <code>SSE_S3</code>, create an AWS Identity and Access Management (IAM) role with a policy that allows <code>"arn:aws:s3:::*"</code> to use the following actions: <code>"s3:PutObject", "s3:ListBucket"</code></p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceEncryptionModeValue encryptionMode;

/**
 <p>The number of threads used to upload a single file. This parameter accepts a value from 1 through 64. It defaults to 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fileTransferUploadStreams;

/**
 <p>The amount of time to wait (in milliseconds) before timing out, beginning from when you begin loading.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable loadTimeout;

/**
 <p>The maximum size (in KB) of any .csv file used to transfer data to Amazon Redshift. This accepts a value from 1 through 1,048,576. It defaults to 32,768 KB (32 MB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxFileSize;

/**
 <p>The password for the user named in the <code>username</code> property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The port number for Amazon Redshift. The default value is 5439.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>A value that specifies to remove surrounding quotation marks from strings in the incoming data. All characters within the quotation marks, including delimiters, are retained. Choose <code>true</code> to remove quotation marks. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeQuotes;

/**
 <p>A value that specifies to replaces the invalid characters specified in <code>ReplaceInvalidChars</code>, substituting the specified characters instead. The default is <code>"?"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceChars;

/**
 <p>A list of characters that you want to replace. Use with <code>ReplaceChars</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceInvalidChars;

/**
 <p>The name of the Amazon Redshift cluster you are using.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>The AWS KMS key ID. If you are using <code>SSE_KMS</code> for the <code>EncryptionMode</code>, provide this key ID. The key that you use needs an attached policy that enables IAM user permissions and allows use of the key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverSideEncryptionKmsKeyId;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that has access to the Amazon Redshift service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>The time format that you want to use. Valid values are <code>auto</code> (case-sensitive), <code>'timeformat_string'</code>, <code>'epochsecs'</code>, or <code>'epochmillisecs'</code>. It defaults to 10. Using <code>auto</code> recognizes most strings, even some that aren't supported when you use a time format string. </p><p>If your date and time values use formats different from each other, set this parameter to <code>auto</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable timeFormat;

/**
 <p>A value that specifies to remove the trailing white space characters from a VARCHAR string. This parameter applies only to columns with a VARCHAR data type. Choose <code>true</code> to remove unneeded white space. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trimBlanks;

/**
 <p>A value that specifies to truncate data in columns to the appropriate number of characters, so that the data fits in the column. This parameter applies only to columns with a VARCHAR or CHAR data type, and rows with a size of 4 MB or less. Choose <code>true</code> to truncate data. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable truncateColumns;

/**
 <p>An Amazon Redshift user name for a registered user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 <p>The size of the write buffer to use in rows. Valid values range from 1 through 2,048. The default is 1,024. Use this setting to tune performance. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable writeBufferSize;

@end

/**
 <p/>
 Required parameters: [EndpointArn, ReplicationInstanceArn]
 */
@interface AWSDatabasemigrationserviceRefreshSchemasMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceRefreshSchemasResponse : AWSModel


/**
 <p>The status of the refreshed schema.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceRefreshSchemasStatus * _Nullable refreshSchemasStatus;

@end

/**
 <p>Provides information that describes status of a schema at an endpoint specified by the <code>DescribeRefreshSchemaStatus</code> operation.</p>
 */
@interface AWSDatabasemigrationserviceRefreshSchemasStatus : AWSModel


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The last failure message for the schema.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastFailureMessage;

/**
 <p>The date the schema was last refreshed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRefreshDate;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>The status of the schema.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceRefreshSchemasStatusTypeValue status;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceReloadTablesMessage : AWSRequest


/**
 <p>Options for reload. Specify <code>data-reload</code> to reload the data and re-validate it if validation is enabled. Specify <code>validate-only</code> to re-validate the table. This option applies only when validation is enabled for the task. </p><p>Valid values: data-reload, validate-only</p><p>Default value is data-reload.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReloadOptionValue reloadOption;

/**
 <p>The Amazon Resource Name (ARN) of the replication task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The name and schema of the table to be reloaded. </p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceTableToReload *> * _Nullable tablesToReload;

@end

/**
 
 */
@interface AWSDatabasemigrationserviceReloadTablesResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the replication task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p>Removes one or more tags from an AWS DMS resource.</p>
 Required parameters: [ResourceArn, TagKeys]
 */
@interface AWSDatabasemigrationserviceRemoveTagsFromResourceMessage : AWSRequest


/**
 <p>An AWS DMS resource from which you want to remove tag(s). The value for this parameter is an Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag key (name) of the tag to be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceRemoveTagsFromResourceResponse : AWSModel


@end

/**
 <p>Provides information that defines a replication instance.</p>
 */
@interface AWSDatabasemigrationserviceReplicationInstance : AWSModel


/**
 <p>The amount of storage (in gigabytes) that is allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>Boolean value indicating if minor version upgrades will be automatically applied to the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoMinorVersionUpgrade;

/**
 <p>The Availability Zone for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The DNS name servers supported for the replication instance to access your on-premise source or target database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dnsNameServers;

/**
 <p>The engine version number of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> The expiration date of the free replication instance that is part of the Free DMS program. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable freeUntil;

/**
 <p>The time the replication instance was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable instanceCreateTime;

/**
 <p>An AWS KMS key identifier that is used to encrypt the data on the replication instance.</p><p>If you don't specify a value for the <code>KmsKeyId</code> parameter, then AWS DMS uses your default encryption key.</p><p>AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p> Specifies whether the replication instance is a Multi-AZ deployment. You can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ parameter is set to <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The pending modification values.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationPendingModifiedValues * _Nullable pendingModifiedValues;

/**
 <p>The maintenance window times for the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p> Specifies the accessibility options for the replication instance. A value of <code>true</code> represents an instance with a public IP address. A value of <code>false</code> represents an instance with a private IP address. The default value is <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>The compute and memory capacity of the replication instance as defined for the specified replication instance class.</p><p>For more information on the settings and capacities for the available replication instance classes, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth"> Selecting the right AWS DMS replication instance for your migration</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceClass;

/**
 <p>The replication instance identifier. This parameter is stored as a lowercase string.</p><p>Constraints:</p><ul><li><p>Must contain 1-63 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul><p>Example: <code>myrepinstance</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceIdentifier;

/**
 <p>The private IP address of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstancePrivateIpAddress;

/**
 <p>One or more private IP addresses for the replication instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicationInstancePrivateIpAddresses;

/**
 <p>The public IP address of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstancePublicIpAddress;

/**
 <p>One or more public IP addresses for the replication instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicationInstancePublicIpAddresses;

/**
 <p>The status of the replication instance. The possible return values include:</p><ul><li><p><code>"available"</code></p></li><li><p><code>"creating"</code></p></li><li><p><code>"deleted"</code></p></li><li><p><code>"deleting"</code></p></li><li><p><code>"failed"</code></p></li><li><p><code>"modifying"</code></p></li><li><p><code>"upgrading"</code></p></li><li><p><code>"rebooting"</code></p></li><li><p><code>"resetting-master-credentials"</code></p></li><li><p><code>"storage-full"</code></p></li><li><p><code>"incompatible-credentials"</code></p></li><li><p><code>"incompatible-network"</code></p></li><li><p><code>"maintenance"</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceStatus;

/**
 <p>The subnet group for the replication instance.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationSubnetGroup * _Nullable replicationSubnetGroup;

/**
 <p>The Availability Zone of the standby replication instance in a Multi-AZ deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secondaryAvailabilityZone;

/**
 <p>The VPC security group for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceVpcSecurityGroupMembership *> * _Nullable vpcSecurityGroups;

@end

/**
 <p>Contains metadata for a replication instance task log.</p>
 */
@interface AWSDatabasemigrationserviceReplicationInstanceTaskLog : AWSModel


/**
 <p>The size, in bytes, of the replication task log.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicationInstanceTaskLogSize;

/**
 <p>The Amazon Resource Name (ARN) of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The name of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskName;

@end

/**
 <p>Provides information about the values of pending modifications to a replication instance. This data type is an object of the <code>ReplicationInstance</code> user-defined data type. </p>
 */
@interface AWSDatabasemigrationserviceReplicationPendingModifiedValues : AWSModel


/**
 <p>The amount of storage (in gigabytes) that is allocated for the replication instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allocatedStorage;

/**
 <p>The engine version number of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p> Specifies whether the replication instance is a Multi-AZ deployment. You can't set the <code>AvailabilityZone</code> parameter if the Multi-AZ parameter is set to <code>true</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable multiAZ;

/**
 <p>The compute and memory capacity of the replication instance as defined for the specified replication instance class.</p><p>For more information on the settings and capacities for the available replication instance classes, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.html#CHAP_ReplicationInstance.InDepth"> Selecting the right AWS DMS replication instance for your migration</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceClass;

@end

/**
 <p>Describes a subnet group in response to a request by the <code>DescribeReplicationSubnetGroup</code> operation.</p>
 */
@interface AWSDatabasemigrationserviceReplicationSubnetGroup : AWSModel


/**
 <p>A description for the replication subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupDescription;

/**
 <p>The identifier of the replication instance subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationSubnetGroupIdentifier;

/**
 <p>The status of the subnet group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetGroupStatus;

/**
 <p>The subnets that are in the subnet group.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationserviceSubnet *> * _Nullable subnets;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Provides information that describes a replication task created by the <code>CreateReplicationTask</code> operation.</p>
 */
@interface AWSDatabasemigrationserviceReplicationTask : AWSModel


/**
 <p>Indicates when you want a change data capture (CDC) operation to start. Use either <code>CdcStartPosition</code> or <code>CdcStartTime</code> to specify when you want the CDC operation to start. Specifying both values results in an error.</p><p>The value can be in date, checkpoint, or LSN/SCN format.</p><p>Date Example: --cdc-start-position “2018-03-08T12:12:12”</p><p>Checkpoint Example: --cdc-start-position "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"</p><p>LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStartPosition;

/**
 <p>Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time.</p><p>Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”</p><p>Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStopPosition;

/**
 <p>The last error (failure) message generated for the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastFailureMessage;

/**
 <p>The type of migration.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceMigrationTypeValue migrationType;

/**
 <p>Indicates the last checkpoint that occurred during a change data capture (CDC) operation. You can provide this value to the <code>CdcStartPosition</code> parameter to start a CDC operation that begins at that checkpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recoveryCheckpoint;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

/**
 <p>The Amazon Resource Name (ARN) of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The date the replication task was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicationTaskCreationDate;

/**
 <p>The user-assigned replication task identifier or name.</p><p>Constraints:</p><ul><li><p>Must contain 1-255 alphanumeric characters or hyphens.</p></li><li><p>First character must be a letter.</p></li><li><p>Cannot end with a hyphen or contain two consecutive hyphens.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskIdentifier;

/**
 <p>The settings for the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskSettings;

/**
 <p>The date the replication task is scheduled to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicationTaskStartDate;

/**
 <p>The statistics for the task, including elapsed time, tables loaded, and table errors.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTaskStats * _Nullable replicationTaskStats;

/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceEndpointArn;

/**
 <p>The status of the replication task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The reason the replication task was stopped. This response parameter can return one of the following values:</p><ul><li><p><code>"STOP_REASON_FULL_LOAD_COMPLETED"</code> – Full-load migration completed.</p></li><li><p><code>"STOP_REASON_CACHED_CHANGES_APPLIED"</code> – Change data capture (CDC) load completed.</p></li><li><p><code>"STOP_REASON_CACHED_CHANGES_NOT_APPLIED"</code> – In a full-load and CDC migration, the full-load stopped as specified before starting the CDC migration.</p></li><li><p><code>"STOP_REASON_SERVER_TIME"</code> – The migration stopped at the specified server time.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable stopReason;

/**
 <p>Table mappings specified in the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableMappings;

/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetEndpointArn;

/**
 <p>Supplemental information that the task requires to migrate the data for certain source and target endpoints. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Tasks.TaskData.html">Specifying Supplemental Data for Task Settings</a> in the <i>AWS Database Migration Service User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable taskData;

@end

/**
 <p> The task assessment report in JSON format. </p>
 */
@interface AWSDatabasemigrationserviceReplicationTaskAssessmentResult : AWSModel


/**
 <p> The task assessment results in JSON format. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assessmentResults;

/**
 <p> The file containing the results of the task assessment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assessmentResultsFile;

/**
 <p> The status of the task assessment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable assessmentStatus;

/**
 <p>The Amazon Resource Name (ARN) of the replication task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p> The replication task identifier of the task on which the task assessment was run. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskIdentifier;

/**
 <p>The date the task assessment was completed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicationTaskLastAssessmentDate;

/**
 <p> The URL of the S3 object containing the task assessment results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectUrl;

@end

/**
 <p>In response to a request by the <code>DescribeReplicationTasks</code> operation, this object provides a collection of statistics about a replication task.</p>
 */
@interface AWSDatabasemigrationserviceReplicationTaskStats : AWSModel


/**
 <p>The elapsed time of the task, in milliseconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elapsedTimeMillis;

/**
 <p>The date the replication task was started either with a fresh start or a target reload.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable freshStartDate;

/**
 <p>The date the replication task full load was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable fullLoadFinishDate;

/**
 <p>The percent complete for the full load migration task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadProgressPercent;

/**
 <p>The date the replication task full load was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable fullLoadStartDate;

/**
 <p>The date the replication task was started either with a fresh start or a resume. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/APIReference/API_StartReplicationTask.html#DMS-StartReplicationTask-request-StartReplicationTaskType">StartReplicationTaskType</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The date the replication task was stopped.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable stopDate;

/**
 <p>The number of errors that have occurred during this task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesErrored;

/**
 <p>The number of tables loaded for this task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesLoaded;

/**
 <p>The number of tables currently loading for this task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesLoading;

/**
 <p>The number of tables queued for this task.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tablesQueued;

@end

/**
 <p>Identifies an AWS DMS resource and any pending actions for it.</p>
 */
@interface AWSDatabasemigrationserviceResourcePendingMaintenanceActions : AWSModel


/**
 <p>Detailed information about the pending maintenance action.</p>
 */
@property (nonatomic, strong) NSArray<AWSDatabasemigrationservicePendingMaintenanceAction *> * _Nullable pendingMaintenanceActionDetails;

/**
 <p>The Amazon Resource Name (ARN) of the DMS resource that the pending maintenance action applies to. For information about creating an ARN, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Introduction.AWS.ARN.html"> Constructing an Amazon Resource Name (ARN) for AWS DMS</a> in the DMS documentation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceIdentifier;

@end

/**
 <p>Settings for exporting data to Amazon S3. </p>
 */
@interface AWSDatabasemigrationserviceS3Settings : AWSModel


/**
 <p> An optional parameter to set a folder name in the S3 bucket. If provided, tables are created in the path <code><i>bucketFolder</i>/<i>schema_name</i>/<i>table_name</i>/</code>. If this parameter isn't specified, then the path used is <code><i>schema_name</i>/<i>table_name</i>/</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketFolder;

/**
 <p> The name of the S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>A value that enables a change data capture (CDC) load to write INSERT and UPDATE operations to .csv or .parquet (columnar storage) output files. The default setting is <code>false</code>, but when <code>CdcInsertsAndUpdates</code> is set to <code>true</code>or <code>y</code>, INSERTs and UPDATEs from the source database are migrated to the .csv or .parquet file. </p><p>For .csv file format only, how these INSERTs and UPDATEs are recorded depends on the value of the <code>IncludeOpForFullLoad</code> parameter. If <code>IncludeOpForFullLoad</code> is set to <code>true</code>, the first field of every CDC record is set to either <code>I</code> or <code>U</code> to indicate INSERT and UPDATE operations at the source. But if <code>IncludeOpForFullLoad</code> is set to <code>false</code>, CDC records are written without an indication of INSERT or UPDATE operations at the source. For more information about how these settings work together, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database Migration Service User Guide.</i>.</p><note><p>AWS DMS supports the use of the <code>CdcInsertsAndUpdates</code> parameter in versions 3.3.1 and later.</p><p><code>CdcInsertsOnly</code> and <code>CdcInsertsAndUpdates</code> can't both be set to <code>true</code> for the same endpoint. Set either <code>CdcInsertsOnly</code> or <code>CdcInsertsAndUpdates</code> to <code>true</code> for the same endpoint, but not both.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable cdcInsertsAndUpdates;

/**
 <p>A value that enables a change data capture (CDC) load to write only INSERT operations to .csv or columnar storage (.parquet) output files. By default (the <code>false</code> setting), the first field in a .csv or .parquet record contains the letter I (INSERT), U (UPDATE), or D (DELETE). These values indicate whether the row was inserted, updated, or deleted at the source database for a CDC load to the target.</p><p>If <code>CdcInsertsOnly</code> is set to <code>true</code> or <code>y</code>, only INSERTs from the source database are migrated to the .csv or .parquet file. For .csv format only, how these INSERTs are recorded depends on the value of <code>IncludeOpForFullLoad</code>. If <code>IncludeOpForFullLoad</code> is set to <code>true</code>, the first field of every CDC record is set to I to indicate the INSERT operation at the source. If <code>IncludeOpForFullLoad</code> is set to <code>false</code>, every CDC record is written without a first field to indicate the INSERT operation at the source. For more information about how these settings work together, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database Migration Service User Guide.</i>.</p><note><p>AWS DMS supports the interaction described preceding between the <code>CdcInsertsOnly</code> and <code>IncludeOpForFullLoad</code> parameters in versions 3.1.4 and later. </p><p><code>CdcInsertsOnly</code> and <code>CdcInsertsAndUpdates</code> can't both be set to <code>true</code> for the same endpoint. Set either <code>CdcInsertsOnly</code> or <code>CdcInsertsAndUpdates</code> to <code>true</code> for the same endpoint, but not both.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable cdcInsertsOnly;

/**
 <p>An optional parameter to use GZIP to compress the target files. Set to GZIP to compress the target files. Either set this parameter to NONE (the default) or don't use it to leave the files uncompressed. This parameter applies to both .csv and .parquet file formats. </p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceCompressionTypeValue compressionType;

/**
 <p> The delimiter used to separate columns in the source files. The default is a comma. </p>
 */
@property (nonatomic, strong) NSString * _Nullable csvDelimiter;

/**
 <p> The delimiter used to separate rows in the source files. The default is a carriage return (<code>\n</code>). </p>
 */
@property (nonatomic, strong) NSString * _Nullable csvRowDelimiter;

/**
 <p>The format of the data that you want to use for output. You can choose one of the following: </p><ul><li><p><code>csv</code> : This is a row-based file format with comma-separated values (.csv). </p></li><li><p><code>parquet</code> : Apache Parquet (.parquet) is a columnar storage file format that features efficient compression and provides faster query response. </p></li></ul>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceDataFormatValue dataFormat;

/**
 <p>The size of one data page in bytes. This parameter defaults to 1024 * 1024 bytes (1 MiB). This number is used for .parquet file format only. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataPageSize;

/**
 <p>The maximum size of an encoded dictionary page of a column. If the dictionary page exceeds this, this column is stored using an encoding type of <code>PLAIN</code>. This parameter defaults to 1024 * 1024 bytes (1 MiB), the maximum size of a dictionary page before it reverts to <code>PLAIN</code> encoding. This size is used for .parquet file format only. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dictPageSizeLimit;

/**
 <p>A value that enables statistics for Parquet pages and row groups. Choose <code>true</code> to enable statistics, <code>false</code> to disable. Statistics include <code>NULL</code>, <code>DISTINCT</code>, <code>MAX</code>, and <code>MIN</code> values. This parameter defaults to <code>true</code>. This value is used for .parquet file format only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableStatistics;

/**
 <p>The type of encoding you are using: </p><ul><li><p><code>RLE_DICTIONARY</code> uses a combination of bit-packing and run-length encoding to store repeated values more efficiently. This is the default.</p></li><li><p><code>PLAIN</code> doesn't use encoding at all. Values are stored as they are.</p></li><li><p><code>PLAIN_DICTIONARY</code> builds a dictionary of the values encountered in a given column. The dictionary is stored in a dictionary page for each column chunk.</p></li></ul>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceEncodingTypeValue encodingType;

/**
 <p>The type of server-side encryption that you want to use for your data. This encryption type is part of the endpoint settings or the extra connections attributes for Amazon S3. You can choose either <code>SSE_S3</code> (the default) or <code>SSE_KMS</code>. To use <code>SSE_S3</code>, you need an AWS Identity and Access Management (IAM) role with permission to allow <code>"arn:aws:s3:::dms-*"</code> to use the following actions:</p><ul><li><p><code>s3:CreateBucket</code></p></li><li><p><code>s3:ListBucket</code></p></li><li><p><code>s3:DeleteBucket</code></p></li><li><p><code>s3:GetBucketLocation</code></p></li><li><p><code>s3:GetObject</code></p></li><li><p><code>s3:PutObject</code></p></li><li><p><code>s3:DeleteObject</code></p></li><li><p><code>s3:GetObjectVersion</code></p></li><li><p><code>s3:GetBucketPolicy</code></p></li><li><p><code>s3:PutBucketPolicy</code></p></li><li><p><code>s3:DeleteBucketPolicy</code></p></li></ul>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceEncryptionModeValue encryptionMode;

/**
 <p> The external table definition. </p>
 */
@property (nonatomic, strong) NSString * _Nullable externalTableDefinition;

/**
 <p>A value that enables a full load to write INSERT operations to the comma-separated value (.csv) output files only to indicate how the rows were added to the source database.</p><note><p>AWS DMS supports the <code>IncludeOpForFullLoad</code> parameter in versions 3.1.4 and later.</p></note><p>For full load, records can only be inserted. By default (the <code>false</code> setting), no information is recorded in these output files for a full load to indicate that the rows were inserted at the source database. If <code>IncludeOpForFullLoad</code> is set to <code>true</code> or <code>y</code>, the INSERT is recorded as an I annotation in the first field of the .csv file. This allows the format of your target records from a full load to be consistent with the target records from a CDC load.</p><note><p>This setting works together with the <code>CdcInsertsOnly</code> and the <code>CdcInsertsAndUpdates</code> parameters for output to .csv files only. For more information about how these settings work together, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.S3.html#CHAP_Target.S3.Configuring.InsertOps">Indicating Source DB Operations in Migrated S3 Data</a> in the <i>AWS Database Migration Service User Guide.</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeOpForFullLoad;

/**
 <p>A value that specifies the precision of any <code>TIMESTAMP</code> column values that are written to an Amazon S3 object file in .parquet format.</p><note><p>AWS DMS supports the <code>ParquetTimestampInMillisecond</code> parameter in versions 3.1.4 and later.</p></note><p>When <code>ParquetTimestampInMillisecond</code> is set to <code>true</code> or <code>y</code>, AWS DMS writes all <code>TIMESTAMP</code> columns in a .parquet formatted file with millisecond precision. Otherwise, DMS writes them with microsecond precision.</p><p>Currently, Amazon Athena and AWS Glue can handle only millisecond precision for <code>TIMESTAMP</code> values. Set this parameter to <code>true</code> for S3 endpoint object files that are .parquet formatted only if you plan to query or process the data with Athena or AWS Glue.</p><note><p>AWS DMS writes any <code>TIMESTAMP</code> column values written to an S3 file in .csv format with microsecond precision.</p><p>Setting <code>ParquetTimestampInMillisecond</code> has no effect on the string format of the timestamp column value that is inserted by setting the <code>TimestampColumnName</code> parameter.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable parquetTimestampInMillisecond;

/**
 <p>The version of the Apache Parquet format that you want to use: <code>parquet_1_0</code> (the default) or <code>parquet_2_0</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceParquetVersionValue parquetVersion;

/**
 <p>The number of rows in a row group. A smaller row group size provides faster reads. But as the number of row groups grows, the slower writes become. This parameter defaults to 10,000 rows. This number is used for .parquet file format only. </p><p>If you choose a value larger than the maximum, <code>RowGroupLength</code> is set to the max row group length in bytes (64 * 1024 * 1024). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowGroupLength;

/**
 <p>If you are using <code>SSE_KMS</code> for the <code>EncryptionMode</code>, provide the AWS KMS key ID. The key that you use needs an attached policy that enables AWS Identity and Access Management (IAM) user permissions and allows use of the key.</p><p>Here is a CLI example: <code>aws dms create-endpoint --endpoint-identifier <i>value</i> --endpoint-type target --engine-name s3 --s3-settings ServiceAccessRoleArn=<i>value</i>,BucketFolder=<i>value</i>,BucketName=<i>value</i>,EncryptionMode=SSE_KMS,ServerSideEncryptionKmsKeyId=<i>value</i></code></p>
 */
@property (nonatomic, strong) NSString * _Nullable serverSideEncryptionKmsKeyId;

/**
 <p> The Amazon Resource Name (ARN) used by the service access IAM role. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessRoleArn;

/**
 <p>A value that when nonblank causes AWS DMS to add a column with timestamp information to the endpoint data for an Amazon S3 target.</p><note><p>AWS DMS supports the <code>TimestampColumnName</code> parameter in versions 3.1.4 and later.</p></note><p>DMS includes an additional <code>STRING</code> column in the .csv or .parquet object files of your migrated data when you set <code>TimestampColumnName</code> to a nonblank value.</p><p>For a full load, each row of this timestamp column contains a timestamp for when the data was transferred from the source to the target by DMS. </p><p>For a change data capture (CDC) load, each row of the timestamp column contains the timestamp for the commit of that row in the source database.</p><p>The string format for this timestamp column value is <code>yyyy-MM-dd HH:mm:ss.SSSSSS</code>. By default, the precision of this value is in microseconds. For a CDC load, the rounding of the precision depends on the commit timestamp supported by DMS for the source database.</p><p>When the <code>AddColumnName</code> parameter is set to <code>true</code>, DMS also includes a name for the timestamp column that you set with <code>TimestampColumnName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timestampColumnName;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn]
 */
@interface AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) of the replication task. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse : AWSModel


/**
 <p> The assessed replication task. </p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn, StartReplicationTaskType]
 */
@interface AWSDatabasemigrationserviceStartReplicationTaskMessage : AWSRequest


/**
 <p>Indicates when you want a change data capture (CDC) operation to start. Use either CdcStartPosition or CdcStartTime to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p> The value can be in date, checkpoint, or LSN/SCN format.</p><p>Date Example: --cdc-start-position “2018-03-08T12:12:12”</p><p>Checkpoint Example: --cdc-start-position "checkpoint:V1#27#mysql-bin-changelog.157832:1975:-1:2002:677883278264080:mysql-bin-changelog.157832:1876#0#0#*#0#93"</p><p>LSN Example: --cdc-start-position “mysql-bin-changelog.000024:373”</p><note><p>When you use this task setting with a source PostgreSQL database, a logical replication slot should already be created and associated with the source endpoint. You can verify this by setting the <code>slotName</code> extra connection attribute to the name of this logical replication slot. For more information, see <a href="https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html#CHAP_Source.PostgreSQL.ConnectionAttrib">Extra Connection Attributes When Using PostgreSQL as a Source for AWS DMS</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStartPosition;

/**
 <p>Indicates the start time for a change data capture (CDC) operation. Use either CdcStartTime or CdcStartPosition to specify when you want a CDC operation to start. Specifying both values results in an error.</p><p>Timestamp Example: --cdc-start-time “2018-03-08T12:12:12”</p>
 */
@property (nonatomic, strong) NSDate * _Nullable cdcStartTime;

/**
 <p>Indicates when you want a change data capture (CDC) operation to stop. The value can be either server time or commit time.</p><p>Server time example: --cdc-stop-position “server_time:3018-02-09T12:12:12”</p><p>Commit time example: --cdc-stop-position “commit_time: 3018-02-09T12:12:12 “</p>
 */
@property (nonatomic, strong) NSString * _Nullable cdcStopPosition;

/**
 <p>The Amazon Resource Name (ARN) of the replication task to be started.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

/**
 <p>The type of replication task.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceStartReplicationTaskTypeValue startReplicationTaskType;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceStartReplicationTaskResponse : AWSModel


/**
 <p>The replication task started.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 <p/>
 Required parameters: [ReplicationTaskArn]
 */
@interface AWSDatabasemigrationserviceStopReplicationTaskMessage : AWSRequest


/**
 <p>The Amazon Resource Name(ARN) of the replication task to be stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationTaskArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceStopReplicationTaskResponse : AWSModel


/**
 <p>The replication task stopped.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceReplicationTask * _Nullable replicationTask;

@end

/**
 <p>In response to a request by the <code>DescribeReplicationSubnetGroup</code> operation, this object identifies a subnet by its given Availability Zone, subnet identifier, and status.</p>
 */
@interface AWSDatabasemigrationserviceSubnet : AWSModel


/**
 <p>The Availability Zone of the subnet.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceAvailabilityZone * _Nullable subnetAvailabilityZone;

/**
 <p>The subnet identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetIdentifier;

/**
 <p>The status of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetStatus;

@end

/**
 <p>Provides information about types of supported endpoints in response to a request by the <code>DescribeEndpointTypes</code> operation. This information includes the type of endpoint, the database engine name, and whether change data capture (CDC) is supported.</p>
 */
@interface AWSDatabasemigrationserviceSupportedEndpointType : AWSModel


/**
 <p>The type of endpoint. Valid values are <code>source</code> and <code>target</code>.</p>
 */
@property (nonatomic, assign) AWSDatabasemigrationserviceReplicationEndpointTypeValue endpointType;

/**
 <p>The expanded name for the engine name. For example, if the <code>EngineName</code> parameter is "aurora," this value would be "Amazon Aurora MySQL."</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineDisplayName;

/**
 <p>The database engine name. Valid values, depending on the EndpointType, include <code>"mysql"</code>, <code>"oracle"</code>, <code>"postgres"</code>, <code>"mariadb"</code>, <code>"aurora"</code>, <code>"aurora-postgresql"</code>, <code>"redshift"</code>, <code>"s3"</code>, <code>"db2"</code>, <code>"azuredb"</code>, <code>"sybase"</code>, <code>"dynamodb"</code>, <code>"mongodb"</code>, <code>"kinesis"</code>, <code>"kafka"</code>, <code>"elasticsearch"</code>, <code>"documentdb"</code>, <code>"sqlserver"</code>, and <code>"neptune"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineName;

/**
 <p>The earliest AWS DMS engine version that supports this endpoint engine. Note that endpoint engines released with AWS DMS versions earlier than 3.1.1 do not return a value for this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceEngineMinimumVersion;

/**
 <p>Indicates if Change Data Capture (CDC) is supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable supportsCDC;

@end

/**
 <p>Provides a collection of table statistics in response to a request by the <code>DescribeTableStatistics</code> operation.</p>
 */
@interface AWSDatabasemigrationserviceTableStatistics : AWSModel


/**
 <p>The data definition language (DDL) used to build and modify the structure of your tables.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ddls;

/**
 <p>The number of delete actions performed on a table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletes;

/**
 <p>The number of rows that failed conditional checks during the full load operation (valid only for migrations where DynamoDB is the target).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadCondtnlChkFailedRows;

/**
 <p>The time when the full load operation completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable fullLoadEndTime;

/**
 <p>The number of rows that failed to load during the full load operation (valid only for migrations where DynamoDB is the target).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadErrorRows;

/**
 <p>A value that indicates if the table was reloaded (<code>true</code>) or loaded as part of a new full load operation (<code>false</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadReloaded;

/**
 <p>The number of rows added during the full load operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fullLoadRows;

/**
 <p>The time when the full load operation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable fullLoadStartTime;

/**
 <p>The number of insert actions performed on a table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inserts;

/**
 <p>The last time a table was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The schema name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The name of the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

/**
 <p>The state of the tables described.</p><p>Valid states: Table does not exist | Before load | Full load | Table completed | Table cancelled | Table error | Table all | Table updates | Table is being reloaded</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableState;

/**
 <p>The number of update actions performed on a table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updates;

/**
 <p>The number of records that failed validation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable validationFailedRecords;

/**
 <p>The number of records that have yet to be validated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable validationPendingRecords;

/**
 <p>The validation state of the table.</p><p>This parameter can have the following values:</p><ul><li><p>Not enabled - Validation isn't enabled for the table in the migration task.</p></li><li><p>Pending records - Some records in the table are waiting for validation.</p></li><li><p>Mismatched records - Some records in the table don't match between the source and target.</p></li><li><p>Suspended records - Some records in the table couldn't be validated.</p></li><li><p>No primary key - The table couldn't be validated because it has no primary key.</p></li><li><p>Table error - The table wasn't validated because it's in an error state and some data wasn't migrated.</p></li><li><p>Validated - All rows in the table are validated. If the table is updated, the status can change from Validated.</p></li><li><p>Error - The table couldn't be validated because of an unexpected error.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable validationState;

/**
 <p>Additional details about the state of validation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable validationStateDetails;

/**
 <p>The number of records that couldn't be validated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable validationSuspendedRecords;

@end

/**
 <p>Provides the name of the schema and table to be reloaded.</p>
 */
@interface AWSDatabasemigrationserviceTableToReload : AWSModel


/**
 <p>The schema name of the table to be reloaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaName;

/**
 <p>The table name of the table to be reloaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>A user-defined key-value pair that describes metadata added to an AWS DMS resource and that is used by operations such as the following:</p><ul><li><p><code>AddTagsToResource</code></p></li><li><p><code>ListTagsForResource</code></p></li><li><p><code>RemoveTagsFromResource</code></p></li></ul>
 */
@interface AWSDatabasemigrationserviceTag : AWSModel


/**
 <p>A key is the required name of the tag. The string value can be 1-128 Unicode characters in length and can't be prefixed with "aws:" or "dms:". The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regular expressions: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A value is the optional value of the tag. The string value can be 1-256 Unicode characters in length and can't be prefixed with "aws:" or "dms:". The string can only contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regular expressions: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 Required parameters: [ReplicationInstanceArn, EndpointArn]
 */
@interface AWSDatabasemigrationserviceTestConnectionMessage : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) string that uniquely identifies the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointArn;

/**
 <p>The Amazon Resource Name (ARN) of the replication instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicationInstanceArn;

@end

/**
 <p/>
 */
@interface AWSDatabasemigrationserviceTestConnectionResponse : AWSModel


/**
 <p>The connection tested.</p>
 */
@property (nonatomic, strong) AWSDatabasemigrationserviceConnection * _Nullable connection;

@end

/**
 <p>Describes the status of a security group associated with the virtual private cloud (VPC) hosting your replication and DB instances.</p>
 */
@interface AWSDatabasemigrationserviceVpcSecurityGroupMembership : AWSModel


/**
 <p>The status of the VPC security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The VPC security group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcSecurityGroupId;

@end

NS_ASSUME_NONNULL_END
