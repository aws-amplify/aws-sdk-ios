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

FOUNDATION_EXPORT NSString *const AWSQldbErrorDomain;

typedef NS_ENUM(NSInteger, AWSQldbErrorType) {
    AWSQldbErrorUnknown,
    AWSQldbErrorInvalidParameter,
    AWSQldbErrorLimitExceeded,
    AWSQldbErrorResourceAlreadyExists,
    AWSQldbErrorResourceInUse,
    AWSQldbErrorResourceNotFound,
    AWSQldbErrorResourcePreconditionNotMet,
};

typedef NS_ENUM(NSInteger, AWSQldbErrorCause) {
    AWSQldbErrorCauseUnknown,
    AWSQldbErrorCauseKinesisStreamNotFound,
    AWSQldbErrorCauseIamPermissionRevoked,
};

typedef NS_ENUM(NSInteger, AWSQldbExportStatus) {
    AWSQldbExportStatusUnknown,
    AWSQldbExportStatusInProgress,
    AWSQldbExportStatusCompleted,
    AWSQldbExportStatusCancelled,
};

typedef NS_ENUM(NSInteger, AWSQldbLedgerState) {
    AWSQldbLedgerStateUnknown,
    AWSQldbLedgerStateCreating,
    AWSQldbLedgerStateActive,
    AWSQldbLedgerStateDeleting,
    AWSQldbLedgerStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSQldbPermissionsMode) {
    AWSQldbPermissionsModeUnknown,
    AWSQldbPermissionsModeAllowAll,
};

typedef NS_ENUM(NSInteger, AWSQldbS3ObjectEncryptionType) {
    AWSQldbS3ObjectEncryptionTypeUnknown,
    AWSQldbS3ObjectEncryptionTypeSseKms,
    AWSQldbS3ObjectEncryptionTypeSseS3,
    AWSQldbS3ObjectEncryptionTypeNoEncryption,
};

typedef NS_ENUM(NSInteger, AWSQldbStreamStatus) {
    AWSQldbStreamStatusUnknown,
    AWSQldbStreamStatusActive,
    AWSQldbStreamStatusCompleted,
    AWSQldbStreamStatusCanceled,
    AWSQldbStreamStatusFailed,
    AWSQldbStreamStatusImpaired,
};

@class AWSQldbCancelJournalKinesisStreamRequest;
@class AWSQldbCancelJournalKinesisStreamResponse;
@class AWSQldbCreateLedgerRequest;
@class AWSQldbCreateLedgerResponse;
@class AWSQldbDeleteLedgerRequest;
@class AWSQldbDescribeJournalKinesisStreamRequest;
@class AWSQldbDescribeJournalKinesisStreamResponse;
@class AWSQldbDescribeJournalS3ExportRequest;
@class AWSQldbDescribeJournalS3ExportResponse;
@class AWSQldbDescribeLedgerRequest;
@class AWSQldbDescribeLedgerResponse;
@class AWSQldbExportJournalToS3Request;
@class AWSQldbExportJournalToS3Response;
@class AWSQldbGetBlockRequest;
@class AWSQldbGetBlockResponse;
@class AWSQldbGetDigestRequest;
@class AWSQldbGetDigestResponse;
@class AWSQldbGetRevisionRequest;
@class AWSQldbGetRevisionResponse;
@class AWSQldbJournalKinesisStreamDescription;
@class AWSQldbJournalS3ExportDescription;
@class AWSQldbKinesisConfiguration;
@class AWSQldbLedgerSummary;
@class AWSQldbListJournalKinesisStreamsForLedgerRequest;
@class AWSQldbListJournalKinesisStreamsForLedgerResponse;
@class AWSQldbListJournalS3ExportsForLedgerRequest;
@class AWSQldbListJournalS3ExportsForLedgerResponse;
@class AWSQldbListJournalS3ExportsRequest;
@class AWSQldbListJournalS3ExportsResponse;
@class AWSQldbListLedgersRequest;
@class AWSQldbListLedgersResponse;
@class AWSQldbListTagsForResourceRequest;
@class AWSQldbListTagsForResourceResponse;
@class AWSQldbS3EncryptionConfiguration;
@class AWSQldbS3ExportConfiguration;
@class AWSQldbStreamJournalToKinesisRequest;
@class AWSQldbStreamJournalToKinesisResponse;
@class AWSQldbTagResourceRequest;
@class AWSQldbTagResourceResponse;
@class AWSQldbUntagResourceRequest;
@class AWSQldbUntagResourceResponse;
@class AWSQldbUpdateLedgerRequest;
@class AWSQldbUpdateLedgerResponse;
@class AWSQldbValueHolder;

/**
 
 */
@interface AWSQldbCancelJournalKinesisStreamRequest : AWSRequest


/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The unique ID that QLDB assigns to each QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSQldbCancelJournalKinesisStreamResponse : AWSModel


/**
 <p>The unique ID that QLDB assigns to each QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSQldbCreateLedgerRequest : AWSRequest


/**
 <p>The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (<code>true</code>) by default.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The name of the ledger that you want to create. The name must be unique among all of your ledgers in the current AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The permissions mode to assign to the ledger that you want to create.</p>
 */
@property (nonatomic, assign) AWSQldbPermissionsMode permissionsMode;

/**
 <p>The key-value pairs to add as tags to the ledger that you want to create. Tag keys are case sensitive. Tag values are case sensitive and can be null.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQldbCreateLedgerResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in epoch time format, when the ledger was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (<code>true</code>) by default.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the ledger.</p>
 */
@property (nonatomic, assign) AWSQldbLedgerState state;

@end

/**
 
 */
@interface AWSQldbDeleteLedgerRequest : AWSRequest


/**
 <p>The name of the ledger that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbDescribeJournalKinesisStreamRequest : AWSRequest


/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The unique ID that QLDB assigns to each QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSQldbDescribeJournalKinesisStreamResponse : AWSModel


/**
 <p>Information about the QLDB journal stream returned by a <code>DescribeJournalS3Export</code> request.</p>
 */
@property (nonatomic, strong) AWSQldbJournalKinesisStreamDescription * _Nullable stream;

@end

/**
 
 */
@interface AWSQldbDescribeJournalS3ExportRequest : AWSRequest


/**
 <p>The unique ID of the journal export job that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportId;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbDescribeJournalS3ExportResponse : AWSModel


/**
 <p>Information about the journal export job returned by a <code>DescribeJournalS3Export</code> request.</p>
 */
@property (nonatomic, strong) AWSQldbJournalS3ExportDescription * _Nullable exportDescription;

@end

/**
 
 */
@interface AWSQldbDescribeLedgerRequest : AWSRequest


/**
 <p>The name of the ledger that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbDescribeLedgerResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in epoch time format, when the ledger was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (<code>true</code>) by default.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the ledger.</p>
 */
@property (nonatomic, assign) AWSQldbLedgerState state;

@end

/**
 
 */
@interface AWSQldbExportJournalToS3Request : AWSRequest


/**
 <p>The exclusive end date and time for the range of journal contents that you want to export.</p><p>The <code>ExclusiveEndTime</code> must be in <code>ISO 8601</code> date and time format and in Universal Coordinated Time (UTC). For example: <code>2019-06-13T21:36:34Z</code></p><p>The <code>ExclusiveEndTime</code> must be less than or equal to the current UTC date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable exclusiveEndTime;

/**
 <p>The inclusive start date and time for the range of journal contents that you want to export.</p><p>The <code>InclusiveStartTime</code> must be in <code>ISO 8601</code> date and time format and in Universal Coordinated Time (UTC). For example: <code>2019-06-13T21:36:34Z</code></p><p>The <code>InclusiveStartTime</code> must be before <code>ExclusiveEndTime</code>.</p><p>If you provide an <code>InclusiveStartTime</code> that is before the ledger's <code>CreationDateTime</code>, Amazon QLDB defaults it to the ledger's <code>CreationDateTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable inclusiveStartTime;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal export job to do the following:</p><ul><li><p>Write objects into your Amazon Simple Storage Service (Amazon S3) bucket.</p></li><li><p>(Optional) Use your customer master key (CMK) in AWS Key Management Service (AWS KMS) for server-side encryption of your exported data.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The configuration settings of the Amazon S3 bucket destination for your export request.</p>
 */
@property (nonatomic, strong) AWSQldbS3ExportConfiguration * _Nullable s3ExportConfiguration;

@end

/**
 
 */
@interface AWSQldbExportJournalToS3Response : AWSModel


/**
 <p>The unique ID that QLDB assigns to each journal export job.</p><p>To describe your export request and check the status of the job, you can use <code>ExportId</code> to call <code>DescribeJournalS3Export</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportId;

@end

/**
 
 */
@interface AWSQldbGetBlockRequest : AWSRequest


/**
 <p>The location of the block that you want to request. An address is an Amazon Ion structure that has two fields: <code>strandId</code> and <code>sequenceNo</code>.</p><p>For example: <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code></p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable blockAddress;

/**
 <p>The latest block location covered by the digest for which to request a proof. An address is an Amazon Ion structure that has two fields: <code>strandId</code> and <code>sequenceNo</code>.</p><p>For example: <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code></p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable digestTipAddress;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbGetBlockResponse : AWSModel


/**
 <p>The block data object in Amazon Ion format.</p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable block;

/**
 <p>The proof object in Amazon Ion format returned by a <code>GetBlock</code> request. A proof contains the list of hash values required to recalculate the specified digest using a Merkle tree, starting with the specified block.</p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable proof;

@end

/**
 
 */
@interface AWSQldbGetDigestRequest : AWSRequest


/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbGetDigestResponse : AWSModel


/**
 <p>The 256-bit hash value representing the digest returned by a <code>GetDigest</code> request.</p>
 */
@property (nonatomic, strong) NSData * _Nullable digest;

/**
 <p>The latest block location covered by the digest that you requested. An address is an Amazon Ion structure that has two fields: <code>strandId</code> and <code>sequenceNo</code>.</p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable digestTipAddress;

@end

/**
 
 */
@interface AWSQldbGetRevisionRequest : AWSRequest


/**
 <p>The block location of the document revision to be verified. An address is an Amazon Ion structure that has two fields: <code>strandId</code> and <code>sequenceNo</code>.</p><p>For example: <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}</code></p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable blockAddress;

/**
 <p>The latest block location covered by the digest for which to request a proof. An address is an Amazon Ion structure that has two fields: <code>strandId</code> and <code>sequenceNo</code>.</p><p>For example: <code>{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}</code></p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable digestTipAddress;

/**
 <p>The unique ID of the document to be verified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentId;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbGetRevisionResponse : AWSModel


/**
 <p>The proof object in Amazon Ion format returned by a <code>GetRevision</code> request. A proof contains the list of hash values that are required to recalculate the specified digest using a Merkle tree, starting with the specified document revision.</p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable proof;

/**
 <p>The document revision data object in Amazon Ion format.</p>
 */
@property (nonatomic, strong) AWSQldbValueHolder * _Nullable revision;

@end

/**
 <p>The information about an Amazon QLDB journal stream, including the Amazon Resource Name (ARN), stream name, creation time, current status, and the parameters of your original stream creation request.</p>
 Required parameters: [LedgerName, RoleArn, StreamId, Status, KinesisConfiguration, StreamName]
 */
@interface AWSQldbJournalKinesisStreamDescription : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in epoch time format, when the QLDB journal stream was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The error message that describes the reason that a stream has a status of <code>IMPAIRED</code> or <code>FAILED</code>. This is not applicable to streams that have other status values.</p>
 */
@property (nonatomic, assign) AWSQldbErrorCause errorCause;

/**
 <p>The exclusive date and time that specifies when the stream ends. If this parameter is blank, the stream runs indefinitely until you cancel it.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable exclusiveEndTime;

/**
 <p>The inclusive start date and time from which to start streaming journal data.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable inclusiveStartTime;

/**
 <p>The configuration settings of the Amazon Kinesis Data Streams destination for your QLDB journal stream.</p>
 */
@property (nonatomic, strong) AWSQldbKinesisConfiguration * _Nullable kinesisConfiguration;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal stream to write data records to a Kinesis Data Streams resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The current state of the QLDB journal stream.</p>
 */
@property (nonatomic, assign) AWSQldbStreamStatus status;

/**
 <p>The unique ID that QLDB assigns to each QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

/**
 <p>The user-defined name of the QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>The information about a journal export job, including the ledger name, export ID, when it was created, current status, and its start and end time export parameters.</p>
 Required parameters: [LedgerName, ExportId, ExportCreationTime, Status, InclusiveStartTime, ExclusiveEndTime, S3ExportConfiguration, RoleArn]
 */
@interface AWSQldbJournalS3ExportDescription : AWSModel


/**
 <p>The exclusive end date and time for the range of journal contents that are specified in the original export request.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable exclusiveEndTime;

/**
 <p>The date and time, in epoch time format, when the export job was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable exportCreationTime;

/**
 <p>The unique ID of the journal export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportId;

/**
 <p>The inclusive start date and time for the range of journal contents that are specified in the original export request.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable inclusiveStartTime;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal export job to do the following:</p><ul><li><p>Write objects into your Amazon Simple Storage Service (Amazon S3) bucket.</p></li><li><p>(Optional) Use your customer master key (CMK) in AWS Key Management Service (AWS KMS) for server-side encryption of your exported data.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon Simple Storage Service (Amazon S3) bucket location in which a journal export job writes the journal contents.</p>
 */
@property (nonatomic, strong) AWSQldbS3ExportConfiguration * _Nullable s3ExportConfiguration;

/**
 <p>The current state of the journal export job.</p>
 */
@property (nonatomic, assign) AWSQldbExportStatus status;

@end

/**
 <p>The configuration settings of the Amazon Kinesis Data Streams destination for your Amazon QLDB journal stream.</p>
 Required parameters: [StreamArn]
 */
@interface AWSQldbKinesisConfiguration : AWSModel


/**
 <p>Enables QLDB to publish multiple stream records in a single Kinesis Data Streams record. To learn more, see <a href="https://docs.aws.amazon.com/streams/latest/dev/kinesis-kpl-concepts.html">KPL Key Concepts</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable aggregationEnabled;

/**
 <p>The Amazon Resource Name (ARN) of the Kinesis data stream resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamArn;

@end

/**
 <p>Information about a ledger, including its name, state, and when it was created.</p>
 */
@interface AWSQldbLedgerSummary : AWSModel


/**
 <p>The date and time, in epoch time format, when the ledger was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the ledger.</p>
 */
@property (nonatomic, assign) AWSQldbLedgerState state;

@end

/**
 
 */
@interface AWSQldbListJournalKinesisStreamsForLedgerRequest : AWSRequest


/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The maximum number of results to return in a single <code>ListJournalKinesisStreamsForLedger</code> request. (The actual number of results returned might be fewer.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token, indicating that you want to retrieve the next page of results. If you received a value for <code>NextToken</code> in the response from a previous <code>ListJournalKinesisStreamsForLedger</code> call, you should use that value as input here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListJournalKinesisStreamsForLedgerResponse : AWSModel


/**
 <ul><li><p>If <code>NextToken</code> is empty, the last page of results has been processed and there are no more results to be retrieved.</p></li><li><p>If <code>NextToken</code> is <i>not</i> empty, more results are available. To retrieve the next page of results, use the value of <code>NextToken</code> in a subsequent <code>ListJournalKinesisStreamsForLedger</code> call.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The array of QLDB journal stream descriptors that are associated with the given ledger.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbJournalKinesisStreamDescription *> * _Nullable streams;

@end

/**
 
 */
@interface AWSQldbListJournalS3ExportsForLedgerRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single <code>ListJournalS3ExportsForLedger</code> request. (The actual number of results returned might be fewer.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A pagination token, indicating that you want to retrieve the next page of results. If you received a value for <code>NextToken</code> in the response from a previous <code>ListJournalS3ExportsForLedger</code> call, then you should use that value as input here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListJournalS3ExportsForLedgerResponse : AWSModel


/**
 <p>The array of journal export job descriptions that are associated with the specified ledger.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbJournalS3ExportDescription *> * _Nullable journalS3Exports;

/**
 <ul><li><p>If <code>NextToken</code> is empty, then the last page of results has been processed and there are no more results to be retrieved.</p></li><li><p>If <code>NextToken</code> is <i>not</i> empty, then there are more results available. To retrieve the next page of results, use the value of <code>NextToken</code> in a subsequent <code>ListJournalS3ExportsForLedger</code> call.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListJournalS3ExportsRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single <code>ListJournalS3Exports</code> request. (The actual number of results returned might be fewer.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token, indicating that you want to retrieve the next page of results. If you received a value for <code>NextToken</code> in the response from a previous <code>ListJournalS3Exports</code> call, then you should use that value as input here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListJournalS3ExportsResponse : AWSModel


/**
 <p>The array of journal export job descriptions for all ledgers that are associated with the current AWS account and Region.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbJournalS3ExportDescription *> * _Nullable journalS3Exports;

/**
 <ul><li><p>If <code>NextToken</code> is empty, then the last page of results has been processed and there are no more results to be retrieved.</p></li><li><p>If <code>NextToken</code> is <i>not</i> empty, then there are more results available. To retrieve the next page of results, use the value of <code>NextToken</code> in a subsequent <code>ListJournalS3Exports</code> call.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListLedgersRequest : AWSRequest


/**
 <p>The maximum number of results to return in a single <code>ListLedgers</code> request. (The actual number of results returned might be fewer.)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token, indicating that you want to retrieve the next page of results. If you received a value for <code>NextToken</code> in the response from a previous <code>ListLedgers</code> call, then you should use that value as input here.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListLedgersResponse : AWSModel


/**
 <p>The array of ledger summaries that are associated with the current AWS account and Region.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbLedgerSummary *> * _Nullable ledgers;

/**
 <p>A pagination token, indicating whether there are more results available:</p><ul><li><p>If <code>NextToken</code> is empty, then the last page of results has been processed and there are no more results to be retrieved.</p></li><li><p>If <code>NextToken</code> is <i>not</i> empty, then there are more results available. To retrieve the next page of results, use the value of <code>NextToken</code> in a subsequent <code>ListLedgers</code> call.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSQldbListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for which you want to list the tags. For example:</p><p><code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSQldbListTagsForResourceResponse : AWSModel


/**
 <p>The tags that are currently associated with the specified Amazon QLDB resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>The encryption settings that are used by a journal export job to write data in an Amazon Simple Storage Service (Amazon S3) bucket.</p>
 Required parameters: [ObjectEncryptionType]
 */
@interface AWSQldbS3EncryptionConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for a symmetric customer master key (CMK) in AWS Key Management Service (AWS KMS). Amazon QLDB does not support asymmetric CMKs.</p><p>You must provide a <code>KmsKeyArn</code> if you specify <code>SSE_KMS</code> as the <code>ObjectEncryptionType</code>.</p><p><code>KmsKeyArn</code> is not required if you specify <code>SSE_S3</code> as the <code>ObjectEncryptionType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The Amazon S3 object encryption type.</p><p>To learn more about server-side encryption options in Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">Protecting Data Using Server-Side Encryption</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSQldbS3ObjectEncryptionType objectEncryptionType;

@end

/**
 <p>The Amazon Simple Storage Service (Amazon S3) bucket location in which a journal export job writes the journal contents.</p>
 Required parameters: [Bucket, Prefix, EncryptionConfiguration]
 */
@interface AWSQldbS3ExportConfiguration : AWSModel


/**
 <p>The Amazon S3 bucket name in which a journal export job writes the journal contents.</p><p>The bucket name must comply with the Amazon S3 bucket naming conventions. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html">Bucket Restrictions and Limitations</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The encryption settings that are used by a journal export job to write data in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSQldbS3EncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p>The prefix for the Amazon S3 bucket in which a journal export job writes the journal contents.</p><p>The prefix must comply with Amazon S3 key naming rules and restrictions. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html">Object Key and Metadata</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>The following are examples of valid <code>Prefix</code> values:</p><ul><li><p><code>JournalExports-ForMyLedger/Testing/</code></p></li><li><p><code>JournalExports</code></p></li><li><p><code>My:Tests/</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSQldbStreamJournalToKinesisRequest : AWSRequest


/**
 <p>The exclusive date and time that specifies when the stream ends. If you keep this parameter blank, the stream runs indefinitely until you cancel it.</p><p>The <code>ExclusiveEndTime</code> must be in <code>ISO 8601</code> date and time format and in Universal Coordinated Time (UTC). For example: <code>2019-06-13T21:36:34Z</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable exclusiveEndTime;

/**
 <p>The inclusive start date and time from which to start streaming journal data. This parameter must be in <code>ISO 8601</code> date and time format and in Universal Coordinated Time (UTC). For example: <code>2019-06-13T21:36:34Z</code></p><p>The <code>InclusiveStartTime</code> cannot be in the future and must be before <code>ExclusiveEndTime</code>.</p><p>If you provide an <code>InclusiveStartTime</code> that is before the ledger's <code>CreationDateTime</code>, QLDB effectively defaults it to the ledger's <code>CreationDateTime</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable inclusiveStartTime;

/**
 <p>The configuration settings of the Kinesis Data Streams destination for your stream request.</p>
 */
@property (nonatomic, strong) AWSQldbKinesisConfiguration * _Nullable kinesisConfiguration;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal stream to write data records to a Kinesis Data Streams resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name that you want to assign to the QLDB journal stream. User-defined names can help identify and indicate the purpose of a stream.</p><p>Your stream name must be unique among other <i>active</i> streams for a given ledger. If you try to create a stream with the same name and configuration of an active, existing stream for the same ledger, QLDB simply returns the existing stream. Stream names have the same naming constraints as ledger names, as defined in <a href="https://docs.aws.amazon.com/qldb/latest/developerguide/limits.html#limits.naming">Quotas in Amazon QLDB</a> in the <i>Amazon QLDB Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The key-value pairs to add as tags to the stream that you want to create. Tag keys are case sensitive. Tag values are case sensitive and can be null.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQldbStreamJournalToKinesisResponse : AWSModel


/**
 <p>The unique ID that QLDB assigns to each QLDB journal stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamId;

@end

/**
 
 */
@interface AWSQldbTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) to which you want to add the tags. For example:</p><p><code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The key-value pairs to add as tags to the specified QLDB resource. Tag keys are case sensitive. If you specify a key that already exists for the resource, your request fails and returns an error. Tag values are case sensitive and can be null.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSQldbTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSQldbUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) from which you want to remove the tags. For example:</p><p><code>arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys that you want to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSQldbUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSQldbUpdateLedgerRequest : AWSRequest


/**
 <p>The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (<code>true</code>) by default.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSQldbUpdateLedgerResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in epoch time format, when the ledger was created. (Epoch time format is the number of seconds elapsed since 12:00:00 AM January 1, 1970 UTC.)</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (<code>true</code>) by default.</p><p>If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the <code>UpdateLedger</code> operation to set the flag to <code>false</code>. The QLDB console disables deletion protection for you when you use it to delete a ledger.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deletionProtection;

/**
 <p>The name of the ledger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current status of the ledger.</p>
 */
@property (nonatomic, assign) AWSQldbLedgerState state;

@end

/**
 <p>A structure that can contain an Amazon Ion value in multiple encoding formats.</p>
 */
@interface AWSQldbValueHolder : AWSModel


/**
 <p>An Amazon Ion plaintext value contained in a <code>ValueHolder</code> structure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ionText;

@end

NS_ASSUME_NONNULL_END
