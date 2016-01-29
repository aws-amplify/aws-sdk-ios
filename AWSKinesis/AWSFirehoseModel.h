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

FOUNDATION_EXPORT NSString *const AWSFirehoseErrorDomain;

typedef NS_ENUM(NSInteger, AWSFirehoseErrorType) {
    AWSFirehoseErrorUnknown,
    AWSFirehoseErrorIncompleteSignature,
    AWSFirehoseErrorInvalidClientTokenId,
    AWSFirehoseErrorMissingAuthenticationToken,
    AWSFirehoseErrorConcurrentModification,
    AWSFirehoseErrorInvalidArgument,
    AWSFirehoseErrorLimitExceeded,
    AWSFirehoseErrorResourceInUse,
    AWSFirehoseErrorResourceNotFound,
    AWSFirehoseErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWSFirehoseCompressionFormat) {
    AWSFirehoseCompressionFormatUnknown,
    AWSFirehoseCompressionFormatUncompressed,
    AWSFirehoseCompressionFormatGzip,
    AWSFirehoseCompressionFormatZip,
    AWSFirehoseCompressionFormatSnappy,
};

typedef NS_ENUM(NSInteger, AWSFirehoseDeliveryStreamStatus) {
    AWSFirehoseDeliveryStreamStatusUnknown,
    AWSFirehoseDeliveryStreamStatusCreating,
    AWSFirehoseDeliveryStreamStatusDeleting,
    AWSFirehoseDeliveryStreamStatusActive,
};

typedef NS_ENUM(NSInteger, AWSFirehoseNoEncryptionConfig) {
    AWSFirehoseNoEncryptionConfigUnknown,
    AWSFirehoseNoEncryptionConfigNoEncryption,
};

@class AWSFirehoseBufferingHints;
@class AWSFirehoseCreateDeliveryStreamInput;
@class AWSFirehoseCreateDeliveryStreamOutput;
@class AWSFirehoseDeleteDeliveryStreamInput;
@class AWSFirehoseDeleteDeliveryStreamOutput;
@class AWSFirehoseDeliveryStreamDescription;
@class AWSFirehoseDescribeDeliveryStreamInput;
@class AWSFirehoseDescribeDeliveryStreamOutput;
@class AWSFirehoseDestinationDescription;
@class AWSFirehoseEncryptionConfiguration;
@class AWSFirehoseKMSEncryptionConfig;
@class AWSFirehoseListDeliveryStreamsInput;
@class AWSFirehoseListDeliveryStreamsOutput;
@class AWSFirehosePutRecordBatchInput;
@class AWSFirehosePutRecordBatchOutput;
@class AWSFirehosePutRecordBatchResponseEntry;
@class AWSFirehosePutRecordInput;
@class AWSFirehosePutRecordOutput;
@class AWSFirehoseRecord;
@class AWSFirehoseRedshiftDestinationConfiguration;
@class AWSFirehoseRedshiftDestinationDescription;
@class AWSFirehoseRedshiftDestinationUpdate;
@class AWSFirehoseReplicateCommand;
@class AWSFirehoseS3DestinationConfiguration;
@class AWSFirehoseS3DestinationDescription;
@class AWSFirehoseS3DestinationUpdate;
@class AWSFirehoseUpdateDestinationInput;
@class AWSFirehoseUpdateDestinationOutput;

/**
 <p>Describes the buffering to perform before delivering data to the destination.</p>
 */
@interface AWSFirehoseBufferingHints : AWSModel


/**
 <p>Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable intervalInSeconds;

/**
 <p>Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5.</p><p>We recommend setting SizeInMBs to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec set SizeInMBs to be 10 MB or higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInMBs;

@end

/**
 <p>Contains the parameters for <a>CreateDeliveryStream</a>.</p>
 Required parameters: [DeliveryStreamName]
 */
@interface AWSFirehoseCreateDeliveryStreamInput : AWSRequest


/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The destination in Amazon Redshift. This value cannot be specified if Amazon S3 is the desired destination (see restrictions listed above).</p>
 */
@property (nonatomic, strong) AWSFirehoseRedshiftDestinationConfiguration * _Nullable redshiftDestinationConfiguration;

/**
 <p>The destination in Amazon S3. This value must be specified if <code>RedshiftDestinationConfiguration</code> is specified (see restrictions listed above).</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationConfiguration * _Nullable s3DestinationConfiguration;

@end

/**
 <p>Contains the output of <a>CreateDeliveryStream</a>.</p>
 */
@interface AWSFirehoseCreateDeliveryStreamOutput : AWSModel


/**
 <p>The ARN of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamARN;

@end

/**
 <p>Contains the parameters for <a>DeleteDeliveryStream</a>.</p>
 Required parameters: [DeliveryStreamName]
 */
@interface AWSFirehoseDeleteDeliveryStreamInput : AWSRequest


/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

@end

/**
 <p>Contains the output of <a>DeleteDeliveryStream</a>.</p>
 */
@interface AWSFirehoseDeleteDeliveryStreamOutput : AWSModel


@end

/**
 <p>Contains information about a delivery stream.</p>
 Required parameters: [DeliveryStreamName, DeliveryStreamARN, DeliveryStreamStatus, VersionId, Destinations, HasMoreDestinations]
 */
@interface AWSFirehoseDeliveryStreamDescription : AWSModel


/**
 <p>The date and time that the delivery stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTimestamp;

/**
 <p>The Amazon Resource Name (ARN) of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamARN;

/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The status of the delivery stream.</p>
 */
@property (nonatomic, assign) AWSFirehoseDeliveryStreamStatus deliveryStreamStatus;

/**
 <p>The destinations.</p>
 */
@property (nonatomic, strong) NSArray<AWSFirehoseDestinationDescription *> * _Nullable destinations;

/**
 <p>Indicates whether there are more destinations available to list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasMoreDestinations;

/**
 <p>The date and time that the delivery stream was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTimestamp;

/**
 <p>Used when calling the <a>UpdateDestination</a> operation. Each time the destination is updated for the delivery stream, the VersionId is changed, and the current VersionId is required when updating the destination. This is so that the service knows it is applying the changes to the correct version of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Contains the parameters for <a>DescribeDeliveryStream</a>.</p>
 Required parameters: [DeliveryStreamName]
 */
@interface AWSFirehoseDescribeDeliveryStreamInput : AWSRequest


/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>Specifies the destination ID to start returning the destination information. Currently Amazon Kinesis Firehose supports one destination per delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartDestinationId;

/**
 <p>The limit on the number of destinations to return. Currently, you can have one destination per delivery stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

@end

/**
 <p>Contains the output of <a>DescribeDeliveryStream</a>.</p>
 Required parameters: [DeliveryStreamDescription]
 */
@interface AWSFirehoseDescribeDeliveryStreamOutput : AWSModel


/**
 <p>Information about the delivery stream.</p>
 */
@property (nonatomic, strong) AWSFirehoseDeliveryStreamDescription * _Nullable deliveryStreamDescription;

@end

/**
 <p>Describes the destination for a delivery stream.</p>
 Required parameters: [DestinationId]
 */
@interface AWSFirehoseDestinationDescription : AWSModel


/**
 <p>The ID of the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The destination in Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSFirehoseRedshiftDestinationDescription * _Nullable redshiftDestinationDescription;

/**
 <p>The Amazon S3 destination.</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationDescription * _Nullable s3DestinationDescription;

@end

/**
 <p>Describes the encryption for a destination in Amazon S3.</p>
 */
@interface AWSFirehoseEncryptionConfiguration : AWSModel


/**
 <p>The encryption key.</p>
 */
@property (nonatomic, strong) AWSFirehoseKMSEncryptionConfig * _Nullable KMSEncryptionConfig;

/**
 <p>Specifically override existing encryption information to ensure no encryption is used.</p>
 */
@property (nonatomic, assign) AWSFirehoseNoEncryptionConfig noEncryptionConfig;

@end

/**
 <p>Describes an encryption key for a destination in Amazon S3.</p>
 Required parameters: [AWSKMSKeyARN]
 */
@interface AWSFirehoseKMSEncryptionConfig : AWSModel


/**
 <p>The ARN of the encryption key. Must belong to the same region as the destination Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSKMSKeyARN;

@end

/**
 <p>Contains the parameters for <a>ListDeliveryStreams</a>.</p>
 */
@interface AWSFirehoseListDeliveryStreamsInput : AWSRequest


/**
 <p>The name of the delivery stream to start the list with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartDeliveryStreamName;

/**
 <p>The maximum number of delivery streams to list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

@end

/**
 <p>Contains the output of <a>ListDeliveryStreams</a>.</p>
 Required parameters: [DeliveryStreamNames, HasMoreDeliveryStreams]
 */
@interface AWSFirehoseListDeliveryStreamsOutput : AWSModel


/**
 <p>The names of the delivery streams.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deliveryStreamNames;

/**
 <p>Indicates whether there are more delivery streams available to list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasMoreDeliveryStreams;

@end

/**
 <p>Contains the parameters for <a>PutRecordBatch</a>.</p>
 Required parameters: [DeliveryStreamName, Records]
 */
@interface AWSFirehosePutRecordBatchInput : AWSRequest


/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>One or more records.</p>
 */
@property (nonatomic, strong) NSArray<AWSFirehoseRecord *> * _Nullable records;

@end

/**
 <p>Contains the output of <a>PutRecordBatch</a>.</p>
 Required parameters: [FailedPutCount, RequestResponses]
 */
@interface AWSFirehosePutRecordBatchOutput : AWSModel


/**
 <p>The number of unsuccessfully written records.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedPutCount;

/**
 <p>The results for the individual records. The index of each element matches the same index in which records were sent.</p>
 */
@property (nonatomic, strong) NSArray<AWSFirehosePutRecordBatchResponseEntry *> * _Nullable requestResponses;

@end

/**
 <p>Contains the result for an individual record from a <a>PutRecordBatch</a> request. If the record is successfully added to your delivery stream, it receives a record ID. If the record fails to be added to your delivery stream, the result includes an error code and an error message.</p>
 */
@interface AWSFirehosePutRecordBatchResponseEntry : AWSModel


/**
 <p>The error code for an individual record result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message for an individual record result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The ID of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordId;

@end

/**
 <p>Contains the parameters for <a>PutRecord</a>.</p>
 Required parameters: [DeliveryStreamName, Record]
 */
@interface AWSFirehosePutRecordInput : AWSRequest


/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The record.</p>
 */
@property (nonatomic, strong) AWSFirehoseRecord * _Nullable record;

@end

/**
 <p>Contains the output of <a>PutRecord</a>.</p>
 Required parameters: [RecordId]
 */
@interface AWSFirehosePutRecordOutput : AWSModel


/**
 <p>The ID of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordId;

@end

/**
 <p>The unit of data in a delivery stream.</p>
 Required parameters: [Data]
 */
@interface AWSFirehoseRecord : AWSModel


/**
 <p>The data blob, which is base64-encoded when the blob is serialized. The maximum size of the data blob, before base64-encoding, is 1,000 KB.</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

@end

/**
 <p>Describes the configuration of a destination in Amazon Redshift.</p>
 Required parameters: [RoleARN, ClusterJDBCURL, CopyCommand, Username, Password, S3Configuration]
 */
@interface AWSFirehoseRedshiftDestinationConfiguration : AWSModel


/**
 <p>The database connection string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterJDBCURL;

/**
 <p>The user password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The <code>COPY</code> command.</p>
 */
@property (nonatomic, strong) AWSFirehoseReplicateCommand * _Nullable replicateCommand;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The S3 configuration for the intermediate location from which Amazon Redshift obtains data. Restrictions are described in the topic for <a>CreateDeliveryStream</a>.</p><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationConfiguration.S3Configuration</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationConfiguration * _Nullable s3Configuration;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes a destination in Amazon Redshift.</p>
 Required parameters: [RoleARN, ClusterJDBCURL, CopyCommand, Username, S3DestinationDescription]
 */
@interface AWSFirehoseRedshiftDestinationDescription : AWSModel


/**
 <p>The database connection string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterJDBCURL;

/**
 <p>The <code>COPY</code> command.</p>
 */
@property (nonatomic, strong) AWSFirehoseReplicateCommand * _Nullable replicateCommand;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The Amazon S3 destination.</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationDescription * _Nullable s3DestinationDescription;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes an update for a destination in Amazon Redshift.</p>
 */
@interface AWSFirehoseRedshiftDestinationUpdate : AWSModel


/**
 <p>The database connection string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterJDBCURL;

/**
 <p>The user password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>The <code>COPY</code> command.</p>
 */
@property (nonatomic, strong) AWSFirehoseReplicateCommand * _Nullable replicateCommand;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The Amazon S3 destination.</p><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified in <code>RedshiftDestinationUpdate.S3Update</code> because the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket doesn't support these compression formats.</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationUpdate * _Nullable s3Update;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes a <code>COPY</code> command for Amazon Redshift.</p>
 Required parameters: [DataTableName]
 */
@interface AWSFirehoseReplicateCommand : AWSModel


/**
 <p>A comma-separated list of column names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataTableColumns;

/**
 <p>The name of the target table. The table must already exist in the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataTableName;

/**
 <p>Optional parameters to use with the Amazon Redshift <code>COPY</code> command. For more information, see the "Optional Parameters" section of <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html">Amazon Redshift COPY command</a>. Some possible examples that would apply to Amazon Kinesis Firehose are as follows.</p><p><code>delimiter '\t' lzop;</code> - fields are delimited with "\t" (TAB character) and compressed using lzop.</p><p><code>delimiter '|</code> - fields are delimited with "|" (this is the default delimiter).</p><p><code>delimiter '|' escape</code> - the delimiter should be escaped.</p><p><code>fixedwidth 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'</code> - fields are fixed width in the source, with each width specified after every column in the table.</p><p><code>JSON 's3://mybucket/jsonpaths.txt'</code> - data is in JSON format, and the path specified is the format of the data.</p><p>For more examples, see and <a href="http://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html">Amazon Redshift COPY command exmaples</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateOptions;

@end

/**
 <p>Describes the configuration of a destination in Amazon S3.</p>
 Required parameters: [RoleARN, BucketARN]
 */
@interface AWSFirehoseS3DestinationConfiguration : AWSModel


/**
 <p>The ARN of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketARN;

/**
 <p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>
 */
@property (nonatomic, strong) AWSFirehoseBufferingHints * _Nullable bufferingHints;

/**
 <p>The compression format. If no value is specified, the default is <code>UNCOMPRESSED</code>.</p><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket.</p>
 */
@property (nonatomic, assign) AWSFirehoseCompressionFormat compressionFormat;

/**
 <p>The encryption configuration. If no value is specified, the default is no encryption.</p>
 */
@property (nonatomic, strong) AWSFirehoseEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. Note that if the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html">Amazon S3 Object Name Format</a> in the <a href="http://docs.aws.amazon.com/firehose/latest/dev/">guide-fh-dev</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Describes a destination in Amazon S3.</p>
 Required parameters: [RoleARN, BucketARN, BufferingHints, CompressionFormat, EncryptionConfiguration]
 */
@interface AWSFirehoseS3DestinationDescription : AWSModel


/**
 <p>The ARN of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketARN;

/**
 <p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>
 */
@property (nonatomic, strong) AWSFirehoseBufferingHints * _Nullable bufferingHints;

/**
 <p>The compression format. If no value is specified, the default is <code>NOCOMPRESSION</code>.</p>
 */
@property (nonatomic, assign) AWSFirehoseCompressionFormat compressionFormat;

/**
 <p>The encryption configuration. If no value is specified, the default is no encryption.</p>
 */
@property (nonatomic, strong) AWSFirehoseEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. Note that if the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html">Amazon S3 Object Name Format</a> in the <a href="http://docs.aws.amazon.com/firehose/latest/dev/">guide-fh-dev</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Describes an update for a destination in Amazon S3.</p>
 */
@interface AWSFirehoseS3DestinationUpdate : AWSModel


/**
 <p>The ARN of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketARN;

/**
 <p>The buffering option. If no value is specified, <code>BufferingHints</code> object default values are used.</p>
 */
@property (nonatomic, strong) AWSFirehoseBufferingHints * _Nullable bufferingHints;

/**
 <p>The compression format. If no value is specified, the default is <code>NOCOMPRESSION</code>.</p><p>The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be specified for Amazon Redshift destinations because they are not supported by the Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket.</p>
 */
@property (nonatomic, assign) AWSFirehoseCompressionFormat compressionFormat;

/**
 <p>The encryption configuration. If no value is specified, the default is no encryption.</p>
 */
@property (nonatomic, strong) AWSFirehoseEncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix. Note that if the prefix ends with a slash, it appears as a folder in the S3 bucket. For more information, see <a href="http://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html">Amazon S3 Object Name Format</a> in the <a href="http://docs.aws.amazon.com/firehose/latest/dev/">guide-fh-dev</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The ARN of the AWS credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Contains the parameters for <a>UpdateDestination</a>.</p>
 Required parameters: [DeliveryStreamName, CurrentDeliveryStreamVersionId, DestinationId]
 */
@interface AWSFirehoseUpdateDestinationInput : AWSRequest


/**
 <p>Obtain this value from the <code>VersionId</code> result of the <a>DeliveryStreamDescription</a> operation. This value is required, and helps the service to perform conditional operations. For example, if there is a interleaving update and this value is null, then the update destination fails. After the update is successful, the <code>VersionId</code> value is updated. The service then performs a merge of the old configuration with the new configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentDeliveryStreamVersionId;

/**
 <p>The name of the delivery stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The ID of the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>Describes an update for a destination in Amazon Redshift.</p>
 */
@property (nonatomic, strong) AWSFirehoseRedshiftDestinationUpdate * _Nullable redshiftDestinationUpdate;

/**
 <p>Describes an update for a destination in Amazon S3.</p>
 */
@property (nonatomic, strong) AWSFirehoseS3DestinationUpdate * _Nullable s3DestinationUpdate;

@end

/**
 <p>Contains the output of <a>UpdateDestination</a>.</p>
 */
@interface AWSFirehoseUpdateDestinationOutput : AWSModel


@end

NS_ASSUME_NONNULL_END
