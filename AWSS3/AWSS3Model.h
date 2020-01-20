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

FOUNDATION_EXPORT NSString *const AWSS3ErrorDomain;

typedef NS_ENUM(NSInteger, AWSS3ErrorType) {
    AWSS3ErrorUnknown,
    AWSS3ErrorBucketAlreadyExists,
    AWSS3ErrorBucketAlreadyOwnedByYou,
    AWSS3ErrorNoSuchBucket,
    AWSS3ErrorNoSuchKey,
    AWSS3ErrorNoSuchUpload,
    AWSS3ErrorObjectAlreadyInActiveTier,
    AWSS3ErrorObjectNotInActiveTier,
};

typedef NS_ENUM(NSInteger, AWSS3AnalyticsS3ExportFileFormat) {
    AWSS3AnalyticsS3ExportFileFormatUnknown,
    AWSS3AnalyticsS3ExportFileFormatCsv,
};

typedef NS_ENUM(NSInteger, AWSS3BucketAccelerateStatus) {
    AWSS3BucketAccelerateStatusUnknown,
    AWSS3BucketAccelerateStatusEnabled,
    AWSS3BucketAccelerateStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSS3BucketCannedACL) {
    AWSS3BucketCannedACLUnknown,
    AWSS3BucketCannedACLPrivate,
    AWSS3BucketCannedACLPublicRead,
    AWSS3BucketCannedACLPublicReadWrite,
    AWSS3BucketCannedACLAuthenticatedRead,
};

typedef NS_ENUM(NSInteger, AWSS3BucketLocationConstraint) {
    AWSS3BucketLocationConstraintUnknown,
    AWSS3BucketLocationConstraintBlank,
    AWSS3BucketLocationConstraintEU,
    AWSS3BucketLocationConstraintEUWest1,
    AWSS3BucketLocationConstraintUSWest1,
    AWSS3BucketLocationConstraintUSWest2,
    AWSS3BucketLocationConstraintEUWest2,
    AWSS3BucketLocationConstraintEUWest3,
    AWSS3BucketLocationConstraintUSEast2,
    AWSS3BucketLocationConstraintAPSouth1,
    AWSS3BucketLocationConstraintAPSoutheast1,
    AWSS3BucketLocationConstraintAPSoutheast2,
    AWSS3BucketLocationConstraintAPNortheast1,
    AWSS3BucketLocationConstraintAPNortheast2,
    AWSS3BucketLocationConstraintSAEast1,
    AWSS3BucketLocationConstraintCNNorth1,
    AWSS3BucketLocationConstraintCNNorthwest1,
    AWSS3BucketLocationConstraintUSGovWest1,
    AWSS3BucketLocationConstraintEUCentral1,
    AWSS3BucketLocationConstraintCACentral1,
    AWSS3BucketLocationConstraintUSGovEast1,
    AWSS3BucketLocationConstraintEUNorth1,
    AWSS3BucketLocationConstraintAPEast1,
    AWSS3BucketLocationConstraintMESouth1
};

typedef NS_ENUM(NSInteger, AWSS3BucketLogsPermission) {
    AWSS3BucketLogsPermissionUnknown,
    AWSS3BucketLogsPermissionFullControl,
    AWSS3BucketLogsPermissionRead,
    AWSS3BucketLogsPermissionWrite,
};

typedef NS_ENUM(NSInteger, AWSS3BucketVersioningStatus) {
    AWSS3BucketVersioningStatusUnknown,
    AWSS3BucketVersioningStatusEnabled,
    AWSS3BucketVersioningStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSS3CompressionType) {
    AWSS3CompressionTypeUnknown,
    AWSS3CompressionTypeNone,
    AWSS3CompressionTypeGzip,
    AWSS3CompressionTypeBzip2,
};

typedef NS_ENUM(NSInteger, AWSS3DeleteMarkerReplicationStatus) {
    AWSS3DeleteMarkerReplicationStatusUnknown,
    AWSS3DeleteMarkerReplicationStatusEnabled,
    AWSS3DeleteMarkerReplicationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3EncodingType) {
    AWSS3EncodingTypeUnknown,
    AWSS3EncodingTypeURL,
};

typedef NS_ENUM(NSInteger, AWSS3Event) {
    AWSS3EventUnknown,
    AWSS3EventS3ReducedRedundancyLostObject,
    AWSS3EventS3ObjectCreated,
    AWSS3EventS3ObjectCreatedPut,
    AWSS3EventS3ObjectCreatedPost,
    AWSS3EventS3ObjectCreatedCopy,
    AWSS3EventS3ObjectCreatedCompleteMultipartUpload,
    AWSS3EventS3ObjectRemoved,
    AWSS3EventS3ObjectRemovedDelete,
    AWSS3EventS3ObjectRemovedDeleteMarkerCreated,
    AWSS3EventS3ObjectRestorePost,
    AWSS3EventS3ObjectRestoreCompleted,
};

typedef NS_ENUM(NSInteger, AWSS3ExpirationStatus) {
    AWSS3ExpirationStatusUnknown,
    AWSS3ExpirationStatusEnabled,
    AWSS3ExpirationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3ExpressionType) {
    AWSS3ExpressionTypeUnknown,
    AWSS3ExpressionTypeSql,
};

typedef NS_ENUM(NSInteger, AWSS3FileHeaderInfo) {
    AWSS3FileHeaderInfoUnknown,
    AWSS3FileHeaderInfoUse,
    AWSS3FileHeaderInfoIgnore,
    AWSS3FileHeaderInfoNone,
};

typedef NS_ENUM(NSInteger, AWSS3FilterRuleName) {
    AWSS3FilterRuleNameUnknown,
    AWSS3FilterRuleNamePrefix,
    AWSS3FilterRuleNameSuffix,
};

typedef NS_ENUM(NSInteger, AWSS3InventoryFormat) {
    AWSS3InventoryFormatUnknown,
    AWSS3InventoryFormatCsv,
    AWSS3InventoryFormatOrc,
    AWSS3InventoryFormatParquet,
};

typedef NS_ENUM(NSInteger, AWSS3InventoryFrequency) {
    AWSS3InventoryFrequencyUnknown,
    AWSS3InventoryFrequencyDaily,
    AWSS3InventoryFrequencyWeekly,
};

typedef NS_ENUM(NSInteger, AWSS3InventoryIncludedObjectVersions) {
    AWSS3InventoryIncludedObjectVersionsUnknown,
    AWSS3InventoryIncludedObjectVersionsAll,
    AWSS3InventoryIncludedObjectVersionsCurrent,
};

typedef NS_ENUM(NSInteger, AWSS3InventoryOptionalField) {
    AWSS3InventoryOptionalFieldUnknown,
    AWSS3InventoryOptionalFieldSize,
    AWSS3InventoryOptionalFieldLastModifiedDate,
    AWSS3InventoryOptionalFieldStorageClass,
    AWSS3InventoryOptionalFieldETag,
    AWSS3InventoryOptionalFieldIsMultipartUploaded,
    AWSS3InventoryOptionalFieldReplicationStatus,
    AWSS3InventoryOptionalFieldEncryptionStatus,
    AWSS3InventoryOptionalFieldObjectLockRetainUntilDate,
    AWSS3InventoryOptionalFieldObjectLockMode,
    AWSS3InventoryOptionalFieldObjectLockLegalHoldStatus,
};

typedef NS_ENUM(NSInteger, AWSS3JSONType) {
    AWSS3JSONTypeUnknown,
    AWSS3JSONTypeDocument,
    AWSS3JSONTypeLines,
};

typedef NS_ENUM(NSInteger, AWSS3MFADelete) {
    AWSS3MFADeleteUnknown,
    AWSS3MFADeleteEnabled,
    AWSS3MFADeleteDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3MFADeleteStatus) {
    AWSS3MFADeleteStatusUnknown,
    AWSS3MFADeleteStatusEnabled,
    AWSS3MFADeleteStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3MetadataDirective) {
    AWSS3MetadataDirectiveUnknown,
    AWSS3MetadataDirectiveCopy,
    AWSS3MetadataDirectiveReplace,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectCannedACL) {
    AWSS3ObjectCannedACLUnknown,
    AWSS3ObjectCannedACLPrivate,
    AWSS3ObjectCannedACLPublicRead,
    AWSS3ObjectCannedACLPublicReadWrite,
    AWSS3ObjectCannedACLAuthenticatedRead,
    AWSS3ObjectCannedACLAwsExecRead,
    AWSS3ObjectCannedACLBucketOwnerRead,
    AWSS3ObjectCannedACLBucketOwnerFullControl,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectLockEnabled) {
    AWSS3ObjectLockEnabledUnknown,
    AWSS3ObjectLockEnabledEnabled,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectLockLegalHoldStatus) {
    AWSS3ObjectLockLegalHoldStatusUnknown,
    AWSS3ObjectLockLegalHoldStatusOn,
    AWSS3ObjectLockLegalHoldStatusOff,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectLockMode) {
    AWSS3ObjectLockModeUnknown,
    AWSS3ObjectLockModeGovernance,
    AWSS3ObjectLockModeCompliance,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectLockRetentionMode) {
    AWSS3ObjectLockRetentionModeUnknown,
    AWSS3ObjectLockRetentionModeGovernance,
    AWSS3ObjectLockRetentionModeCompliance,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectStorageClass) {
    AWSS3ObjectStorageClassUnknown,
    AWSS3ObjectStorageClassStandard,
    AWSS3ObjectStorageClassReducedRedundancy,
    AWSS3ObjectStorageClassGlacier,
    AWSS3ObjectStorageClassStandardIa,
    AWSS3ObjectStorageClassOnezoneIa,
    AWSS3ObjectStorageClassIntelligentTiering,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectVersionStorageClass) {
    AWSS3ObjectVersionStorageClassUnknown,
    AWSS3ObjectVersionStorageClassStandard,
};

typedef NS_ENUM(NSInteger, AWSS3OwnerOverride) {
    AWSS3OwnerOverrideUnknown,
    AWSS3OwnerOverrideDestination,
};

typedef NS_ENUM(NSInteger, AWSS3Payer) {
    AWSS3PayerUnknown,
    AWSS3PayerRequester,
    AWSS3PayerBucketOwner,
};

typedef NS_ENUM(NSInteger, AWSS3Permission) {
    AWSS3PermissionUnknown,
    AWSS3PermissionFullControl,
    AWSS3PermissionWrite,
    AWSS3PermissionWriteAcp,
    AWSS3PermissionRead,
    AWSS3PermissionReadAcp,
};

typedef NS_ENUM(NSInteger, AWSS3Protocols) {
    AWSS3ProtocolsUnknown,
    AWSS3ProtocolsHTTP,
    AWSS3ProtocolsHTTPS,
};

typedef NS_ENUM(NSInteger, AWSS3QuoteFields) {
    AWSS3QuoteFieldsUnknown,
    AWSS3QuoteFieldsAlways,
    AWSS3QuoteFieldsAsneeded,
};

typedef NS_ENUM(NSInteger, AWSS3ReplicationRuleStatus) {
    AWSS3ReplicationRuleStatusUnknown,
    AWSS3ReplicationRuleStatusEnabled,
    AWSS3ReplicationRuleStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3ReplicationStatus) {
    AWSS3ReplicationStatusUnknown,
    AWSS3ReplicationStatusComplete,
    AWSS3ReplicationStatusPending,
    AWSS3ReplicationStatusFailed,
    AWSS3ReplicationStatusReplica,
};

typedef NS_ENUM(NSInteger, AWSS3RequestCharged) {
    AWSS3RequestChargedUnknown,
    AWSS3RequestChargedRequester,
};

typedef NS_ENUM(NSInteger, AWSS3RequestPayer) {
    AWSS3RequestPayerUnknown,
    AWSS3RequestPayerRequester,
};

typedef NS_ENUM(NSInteger, AWSS3RestoreRequestType) {
    AWSS3RestoreRequestTypeUnknown,
    AWSS3RestoreRequestTypeSelect,
};

typedef NS_ENUM(NSInteger, AWSS3ServerSideEncryption) {
    AWSS3ServerSideEncryptionUnknown,
    AWSS3ServerSideEncryptionAES256,
    AWSS3ServerSideEncryptionAwsKms,
};

typedef NS_ENUM(NSInteger, AWSS3SseKmsEncryptedObjectsStatus) {
    AWSS3SseKmsEncryptedObjectsStatusUnknown,
    AWSS3SseKmsEncryptedObjectsStatusEnabled,
    AWSS3SseKmsEncryptedObjectsStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3StorageClass) {
    AWSS3StorageClassUnknown,
    AWSS3StorageClassStandard,
    AWSS3StorageClassReducedRedundancy,
    AWSS3StorageClassStandardIa,
    AWSS3StorageClassOnezoneIa,
    AWSS3StorageClassIntelligentTiering,
    AWSS3StorageClassGlacier,
};

typedef NS_ENUM(NSInteger, AWSS3StorageClassAnalysisSchemaVersion) {
    AWSS3StorageClassAnalysisSchemaVersionUnknown,
    AWSS3StorageClassAnalysisSchemaVersionV1,
};

typedef NS_ENUM(NSInteger, AWSS3TaggingDirective) {
    AWSS3TaggingDirectiveUnknown,
    AWSS3TaggingDirectiveCopy,
    AWSS3TaggingDirectiveReplace,
};

typedef NS_ENUM(NSInteger, AWSS3Tier) {
    AWSS3TierUnknown,
    AWSS3TierStandard,
    AWSS3TierBulk,
    AWSS3TierExpedited,
};

typedef NS_ENUM(NSInteger, AWSS3TransitionStorageClass) {
    AWSS3TransitionStorageClassUnknown,
    AWSS3TransitionStorageClassGlacier,
    AWSS3TransitionStorageClassStandardIa,
    AWSS3TransitionStorageClassOnezoneIa,
    AWSS3TransitionStorageClassIntelligentTiering,
};

typedef NS_ENUM(NSInteger, AWSS3Types) {
    AWSS3TypesUnknown,
    AWSS3TypesCanonicalUser,
    AWSS3TypesAmazonCustomerByEmail,
    AWSS3TypesGroup,
};

@class AWSS3AbortIncompleteMultipartUpload;
@class AWSS3AbortMultipartUploadOutput;
@class AWSS3AbortMultipartUploadRequest;
@class AWSS3AccelerateConfiguration;
@class AWSS3AccessControlPolicy;
@class AWSS3AccessControlTranslation;
@class AWSS3AnalyticsAndOperator;
@class AWSS3AnalyticsConfiguration;
@class AWSS3AnalyticsExportDestination;
@class AWSS3AnalyticsFilter;
@class AWSS3AnalyticsS3BucketDestination;
@class AWSS3Bucket;
@class AWSS3BucketLifecycleConfiguration;
@class AWSS3BucketLoggingStatus;
@class AWSS3CORSConfiguration;
@class AWSS3CORSRule;
@class AWSS3CSVInput;
@class AWSS3CSVOutput;
@class AWSS3CloudFunctionConfiguration;
@class AWSS3CommonPrefix;
@class AWSS3CompleteMultipartUploadOutput;
@class AWSS3CompleteMultipartUploadRequest;
@class AWSS3CompletedMultipartUpload;
@class AWSS3CompletedPart;
@class AWSS3Condition;
@class AWSS3ContinuationEvent;
@class AWSS3ReplicateObjectOutput;
@class AWSS3ReplicateObjectRequest;
@class AWSS3ReplicateObjectResult;
@class AWSS3ReplicatePartResult;
@class AWSS3CreateBucketConfiguration;
@class AWSS3CreateBucketOutput;
@class AWSS3CreateBucketRequest;
@class AWSS3CreateMultipartUploadOutput;
@class AWSS3CreateMultipartUploadRequest;
@class AWSS3DefaultRetention;
@class AWSS3Remove;
@class AWSS3DeleteBucketAnalyticsConfigurationRequest;
@class AWSS3DeleteBucketCorsRequest;
@class AWSS3DeleteBucketEncryptionRequest;
@class AWSS3DeleteBucketInventoryConfigurationRequest;
@class AWSS3DeleteBucketLifecycleRequest;
@class AWSS3DeleteBucketMetricsConfigurationRequest;
@class AWSS3DeleteBucketPolicyRequest;
@class AWSS3DeleteBucketReplicationRequest;
@class AWSS3DeleteBucketRequest;
@class AWSS3DeleteBucketTaggingRequest;
@class AWSS3DeleteBucketWebsiteRequest;
@class AWSS3DeleteMarkerEntry;
@class AWSS3DeleteMarkerReplication;
@class AWSS3DeleteObjectOutput;
@class AWSS3DeleteObjectRequest;
@class AWSS3DeleteObjectTaggingOutput;
@class AWSS3DeleteObjectTaggingRequest;
@class AWSS3DeleteObjectsOutput;
@class AWSS3DeleteObjectsRequest;
@class AWSS3DeletePublicAccessBlockRequest;
@class AWSS3DeletedObject;
@class AWSS3Destination;
@class AWSS3Encryption;
@class AWSS3EncryptionConfiguration;
@class AWSS3EndEvent;
@class AWSS3Error;
@class AWSS3ErrorDocument;
@class AWSS3FilterRule;
@class AWSS3GetBucketAccelerateConfigurationOutput;
@class AWSS3GetBucketAccelerateConfigurationRequest;
@class AWSS3GetBucketAclOutput;
@class AWSS3GetBucketAclRequest;
@class AWSS3GetBucketAnalyticsConfigurationOutput;
@class AWSS3GetBucketAnalyticsConfigurationRequest;
@class AWSS3GetBucketCorsOutput;
@class AWSS3GetBucketCorsRequest;
@class AWSS3GetBucketEncryptionOutput;
@class AWSS3GetBucketEncryptionRequest;
@class AWSS3GetBucketInventoryConfigurationOutput;
@class AWSS3GetBucketInventoryConfigurationRequest;
@class AWSS3GetBucketLifecycleConfigurationOutput;
@class AWSS3GetBucketLifecycleConfigurationRequest;
@class AWSS3GetBucketLifecycleOutput;
@class AWSS3GetBucketLifecycleRequest;
@class AWSS3GetBucketLocationOutput;
@class AWSS3GetBucketLocationRequest;
@class AWSS3GetBucketLoggingOutput;
@class AWSS3GetBucketLoggingRequest;
@class AWSS3GetBucketMetricsConfigurationOutput;
@class AWSS3GetBucketMetricsConfigurationRequest;
@class AWSS3GetBucketNotificationConfigurationRequest;
@class AWSS3GetBucketPolicyOutput;
@class AWSS3GetBucketPolicyRequest;
@class AWSS3GetBucketPolicyStatusOutput;
@class AWSS3GetBucketPolicyStatusRequest;
@class AWSS3GetBucketReplicationOutput;
@class AWSS3GetBucketReplicationRequest;
@class AWSS3GetBucketRequestPaymentOutput;
@class AWSS3GetBucketRequestPaymentRequest;
@class AWSS3GetBucketTaggingOutput;
@class AWSS3GetBucketTaggingRequest;
@class AWSS3GetBucketVersioningOutput;
@class AWSS3GetBucketVersioningRequest;
@class AWSS3GetBucketWebsiteOutput;
@class AWSS3GetBucketWebsiteRequest;
@class AWSS3GetObjectAclOutput;
@class AWSS3GetObjectAclRequest;
@class AWSS3GetObjectLegalHoldOutput;
@class AWSS3GetObjectLegalHoldRequest;
@class AWSS3GetObjectLockConfigurationOutput;
@class AWSS3GetObjectLockConfigurationRequest;
@class AWSS3GetObjectOutput;
@class AWSS3GetObjectRequest;
@class AWSS3GetObjectRetentionOutput;
@class AWSS3GetObjectRetentionRequest;
@class AWSS3GetObjectTaggingOutput;
@class AWSS3GetObjectTaggingRequest;
@class AWSS3GetObjectTorrentOutput;
@class AWSS3GetObjectTorrentRequest;
@class AWSS3GetPublicAccessBlockOutput;
@class AWSS3GetPublicAccessBlockRequest;
@class AWSS3GlacierJobParameters;
@class AWSS3Grant;
@class AWSS3Grantee;
@class AWSS3HeadBucketRequest;
@class AWSS3HeadObjectOutput;
@class AWSS3HeadObjectRequest;
@class AWSS3IndexDocument;
@class AWSS3Initiator;
@class AWSS3InputSerialization;
@class AWSS3InventoryConfiguration;
@class AWSS3InventoryDestination;
@class AWSS3InventoryEncryption;
@class AWSS3InventoryFilter;
@class AWSS3InventoryS3BucketDestination;
@class AWSS3InventorySchedule;
@class AWSS3JSONInput;
@class AWSS3JSONOutput;
@class AWSS3LambdaFunctionConfiguration;
@class AWSS3LifecycleConfiguration;
@class AWSS3LifecycleExpiration;
@class AWSS3LifecycleRule;
@class AWSS3LifecycleRuleAndOperator;
@class AWSS3LifecycleRuleFilter;
@class AWSS3ListBucketAnalyticsConfigurationsOutput;
@class AWSS3ListBucketAnalyticsConfigurationsRequest;
@class AWSS3ListBucketInventoryConfigurationsOutput;
@class AWSS3ListBucketInventoryConfigurationsRequest;
@class AWSS3ListBucketMetricsConfigurationsOutput;
@class AWSS3ListBucketMetricsConfigurationsRequest;
@class AWSS3ListBucketsOutput;
@class AWSS3ListMultipartUploadsOutput;
@class AWSS3ListMultipartUploadsRequest;
@class AWSS3ListObjectVersionsOutput;
@class AWSS3ListObjectVersionsRequest;
@class AWSS3ListObjectsOutput;
@class AWSS3ListObjectsRequest;
@class AWSS3ListObjectsV2Output;
@class AWSS3ListObjectsV2Request;
@class AWSS3ListPartsOutput;
@class AWSS3ListPartsRequest;
@class AWSS3LoggingEnabled;
@class AWSS3MetadataEntry;
@class AWSS3MetricsAndOperator;
@class AWSS3MetricsConfiguration;
@class AWSS3MetricsFilter;
@class AWSS3MultipartUpload;
@class AWSS3NoncurrentVersionExpiration;
@class AWSS3NoncurrentVersionTransition;
@class AWSS3NotificationConfiguration;
@class AWSS3NotificationConfigurationDeprecated;
@class AWSS3NotificationConfigurationFilter;
@class AWSS3Object;
@class AWSS3ObjectIdentifier;
@class AWSS3ObjectLockConfiguration;
@class AWSS3ObjectLockLegalHold;
@class AWSS3ObjectLockRetention;
@class AWSS3ObjectLockRule;
@class AWSS3ObjectVersion;
@class AWSS3OutputLocation;
@class AWSS3OutputSerialization;
@class AWSS3Owner;
@class AWSS3ParquetInput;
@class AWSS3Part;
@class AWSS3PolicyStatus;
@class AWSS3Progress;
@class AWSS3ProgressEvent;
@class AWSS3PublicAccessBlockConfiguration;
@class AWSS3PutBucketAccelerateConfigurationRequest;
@class AWSS3PutBucketAclRequest;
@class AWSS3PutBucketAnalyticsConfigurationRequest;
@class AWSS3PutBucketCorsRequest;
@class AWSS3PutBucketEncryptionRequest;
@class AWSS3PutBucketInventoryConfigurationRequest;
@class AWSS3PutBucketLifecycleConfigurationRequest;
@class AWSS3PutBucketLifecycleRequest;
@class AWSS3PutBucketLoggingRequest;
@class AWSS3PutBucketMetricsConfigurationRequest;
@class AWSS3PutBucketNotificationConfigurationRequest;
@class AWSS3PutBucketNotificationRequest;
@class AWSS3PutBucketPolicyRequest;
@class AWSS3PutBucketReplicationRequest;
@class AWSS3PutBucketRequestPaymentRequest;
@class AWSS3PutBucketTaggingRequest;
@class AWSS3PutBucketVersioningRequest;
@class AWSS3PutBucketWebsiteRequest;
@class AWSS3PutObjectAclOutput;
@class AWSS3PutObjectAclRequest;
@class AWSS3PutObjectLegalHoldOutput;
@class AWSS3PutObjectLegalHoldRequest;
@class AWSS3PutObjectLockConfigurationOutput;
@class AWSS3PutObjectLockConfigurationRequest;
@class AWSS3PutObjectOutput;
@class AWSS3PutObjectRequest;
@class AWSS3PutObjectRetentionOutput;
@class AWSS3PutObjectRetentionRequest;
@class AWSS3PutObjectTaggingOutput;
@class AWSS3PutObjectTaggingRequest;
@class AWSS3PutPublicAccessBlockRequest;
@class AWSS3QueueConfiguration;
@class AWSS3QueueConfigurationDeprecated;
@class AWSS3RecordsEvent;
@class AWSS3Redirect;
@class AWSS3RedirectAllRequestsTo;
@class AWSS3ReplicationConfiguration;
@class AWSS3ReplicationRule;
@class AWSS3ReplicationRuleAndOperator;
@class AWSS3ReplicationRuleFilter;
@class AWSS3RequestPaymentConfiguration;
@class AWSS3RequestProgress;
@class AWSS3RestoreObjectOutput;
@class AWSS3RestoreObjectRequest;
@class AWSS3RestoreRequest;
@class AWSS3RoutingRule;
@class AWSS3Rule;
@class AWSS3S3KeyFilter;
@class AWSS3S3Location;
@class AWSS3SSEKMS;
@class AWSS3SSES3;
@class AWSS3SelectObjectContentEventStream;
@class AWSS3SelectObjectContentOutput;
@class AWSS3SelectObjectContentRequest;
@class AWSS3SelectParameters;
@class AWSS3ServerSideEncryptionByDefault;
@class AWSS3ServerSideEncryptionConfiguration;
@class AWSS3ServerSideEncryptionRule;
@class AWSS3SourceSelectionCriteria;
@class AWSS3SseKmsEncryptedObjects;
@class AWSS3Stats;
@class AWSS3StatsEvent;
@class AWSS3StorageClassAnalysis;
@class AWSS3StorageClassAnalysisDataExport;
@class AWSS3Tag;
@class AWSS3Tagging;
@class AWSS3TargetGrant;
@class AWSS3TopicConfiguration;
@class AWSS3TopicConfigurationDeprecated;
@class AWSS3Transition;
@class AWSS3UploadPartCopyOutput;
@class AWSS3UploadPartCopyRequest;
@class AWSS3UploadPartOutput;
@class AWSS3UploadPartRequest;
@class AWSS3VersioningConfiguration;
@class AWSS3WebsiteConfiguration;

/**
 <p>Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.</p>
 */
@interface AWSS3AbortIncompleteMultipartUpload : AWSModel


/**
 <p>Indicates the number of days that must pass since initiation for Lifecycle to abort an Incomplete Multipart Upload.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable daysAfterInitiation;

@end

/**
 
 */
@interface AWSS3AbortMultipartUploadOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3AbortMultipartUploadRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3AccelerateConfiguration : AWSModel


/**
 <p>The accelerate configuration of the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketAccelerateStatus status;

@end

/**
 
 */
@interface AWSS3AccessControlPolicy : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 <p>A container for information about access control for replicas.</p>
 Required parameters: [Owner]
 */
@interface AWSS3AccessControlTranslation : AWSModel


/**
 <p>The override value for the owner of the replica object.</p>
 */
@property (nonatomic, assign) AWSS3OwnerOverride owner;

@end

/**
 
 */
@interface AWSS3AnalyticsAndOperator : AWSModel


/**
 <p>The prefix to use when evaluating an AND predicate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The list of tags to use when evaluating an AND predicate.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSS3AnalyticsConfiguration : AWSModel


/**
 <p>The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsFilter * _Nullable filter;

/**
 <p>The identifier used to represent an analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>If present, it indicates that data related to access patterns will be collected and made available to analyze the tradeoffs between different storage classes.</p>
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysis * _Nullable storageClassAnalysis;

@end

/**
 
 */
@interface AWSS3AnalyticsExportDestination : AWSModel


/**
 <p>A destination signifying output to an S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsS3BucketDestination * _Nullable s3BucketDestination;

@end

/**
 
 */
@interface AWSS3AnalyticsFilter : AWSModel


/**
 <p>A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The operator must have at least two predicates.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsAndOperator * _Nullable AND;

/**
 <p>The prefix to use when evaluating an analytics filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The tag to use when evaluating an analytics filter.</p>
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3AnalyticsS3BucketDestination : AWSModel


/**
 <p>The Amazon resource name (ARN) of the bucket to which data is exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account ID that owns the destination bucket. If no account ID is provided, the owner will not be validated prior to exporting data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketAccountId;

/**
 <p>The file format used when exporting data to Amazon S3.</p>
 */
@property (nonatomic, assign) AWSS3AnalyticsS3ExportFileFormat format;

/**
 <p>The prefix to use when exporting data. The exported data begins with this prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3Bucket : AWSModel


/**
 <p>Date the bucket was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The name of the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSS3BucketLifecycleConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3LifecycleRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3BucketLoggingStatus : AWSModel


/**
 <p>Container for logging information. Presence of this element indicates that logging is enabled. Parameters TargetBucket and TargetPrefix are required in this case.</p>
 */
@property (nonatomic, strong) AWSS3LoggingEnabled * _Nullable loggingEnabled;

@end

/**
 
 */
@interface AWSS3CORSConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CORSRule *> * _Nullable CORSRules;

@end

/**
 
 */
@interface AWSS3CORSRule : AWSModel


/**
 <p>Specifies which headers are allowed in a pre-flight OPTIONS request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedHeaders;

/**
 <p>Identifies HTTP methods that the domain/origin specified in the rule is allowed to execute.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedMethods;

/**
 <p>One or more origins you want customers to be able to access the bucket from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOrigins;

/**
 <p>One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exposeHeaders;

/**
 <p>The time in seconds that your browser is to cache the preflight response for the specified resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAgeSeconds;

@end

/**
 <p>Describes how a CSV-formatted input object is formatted.</p>
 */
@interface AWSS3CSVInput : AWSModel


/**
 <p>Specifies that CSV field values may contain quoted record delimiters and such records should be allowed. Default value is FALSE. Setting this value to TRUE may lower performance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowQuotedRecordDelimiter;

/**
 <p>The single character used to indicate a row should be ignored when present at the start of a row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comments;

/**
 <p>The value used to separate individual fields in a record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldDelimiter;

/**
 <p>Describes the first line of input. Valid values: None, Ignore, Use.</p>
 */
@property (nonatomic, assign) AWSS3FileHeaderInfo fileHeaderInfo;

/**
 <p>Value used for escaping where the field delimiter is part of the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteCharacter;

/**
 <p>The single character used for escaping the quote character inside an already escaped value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteEscapeCharacter;

/**
 <p>The value used to separate individual records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 <p>Describes how CSV-formatted results are formatted.</p>
 */
@interface AWSS3CSVOutput : AWSModel


/**
 <p>The value used to separate individual fields in a record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldDelimiter;

/**
 <p>The value used for escaping where the field delimiter is part of the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteCharacter;

/**
 <p>Th single character used for escaping the quote character inside an already escaped value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteEscapeCharacter;

/**
 <p>Indicates whether or not all output fields should be quoted.</p>
 */
@property (nonatomic, assign) AWSS3QuoteFields quoteFields;

/**
 <p>The value used to separate individual records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 
 */
@interface AWSS3CloudFunctionConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable cloudFunction;

/**
 <p>The bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable invocationRole;

@end

/**
 
 */
@interface AWSS3CommonPrefix : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3CompleteMultipartUploadOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Entity tag of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3CompleteMultipartUploadRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) AWSS3CompletedMultipartUpload * _Nullable multipartUpload;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3CompletedMultipartUpload : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CompletedPart *> * _Nullable parts;

@end

/**
 
 */
@interface AWSS3CompletedPart : AWSModel


/**
 <p>Entity tag returned when the part was uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Part number that identifies the part. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

@end

/**
 
 */
@interface AWSS3Condition : AWSModel


/**
 <p>The HTTP error code when the redirect is applied. In the event of an error, if the error code equals this value, then the specified redirect is applied. Required when parent element Condition is specified and sibling KeyPrefixEquals is not specified. If both are specified, then both must be true for the redirect to be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable httpErrorCodeReturnedEquals;

/**
 <p>The object key name prefix when the redirect is applied. For example, to redirect requests for ExamplePage.html, the key prefix will be ExamplePage.html. To redirect request for all pages with the prefix docs/, the key prefix will be /docs, which identifies all objects in the docs/ folder. Required when the parent element Condition is specified and sibling HttpErrorCodeReturnedEquals is not specified. If both conditions are specified, both must be true for the redirect to be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPrefixEquals;

@end

/**
 
 */
@interface AWSS3ContinuationEvent : AWSModel


@end

/**
 
 */
@interface AWSS3ReplicateObjectOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3ReplicateObjectResult * _Nullable replicateObjectResult;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceVersionId;

/**
 <p>If the object expiration is configured, the response includes this header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Version ID of the newly created copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3ReplicateObjectRequest : AWSRequest


/**
 <p>The canned ACL to apply to the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies caching behavior along the request/reply chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSource;

/**
 <p>Copies the object if its entity tag (ETag) matches the specified tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfMatch;

/**
 <p>Copies the object if it has been modified since the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfModifiedSince;

/**
 <p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfNoneMatch;

/**
 <p>Copies the object if it hasn't been modified since the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfUnmodifiedSince;

/**
 <p>Specifies the algorithm to use when decrypting the source object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A map of metadata to store with the object in S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>Specifies whether the metadata is copied from the source object or replaced with metadata provided in the request.</p>
 */
@property (nonatomic, assign) AWSS3MetadataDirective metadataDirective;

/**
 <p>Specifies whether you want to apply a Legal Hold to the copied object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Object Lock mode that you want to apply to the copied object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>The date and time when you want the copied object's Object Lock to expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object destination object this value must be used in conjunction with the TaggingDirective. The tag-set must be encoded as URL Query parameters</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 <p>Specifies whether the object tag-set are copied from the source object or replaced with tag-set provided in the request.</p>
 */
@property (nonatomic, assign) AWSS3TaggingDirective taggingDirective;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 
 */
@interface AWSS3ReplicateObjectResult : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

@end

/**
 
 */
@interface AWSS3ReplicatePartResult : AWSModel


/**
 <p>Entity tag of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Date and time at which the object was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

@end

/**
 
 */
@interface AWSS3CreateBucketConfiguration : AWSModel


/**
 <p>Specifies the region where the bucket will be created. If you don't specify a region, the bucket will be created in US Standard.</p>
 */
@property (nonatomic, assign) AWSS3BucketLocationConstraint locationConstraint;

@end

/**
 
 */
@interface AWSS3CreateBucketOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 
 */
@interface AWSS3CreateBucketRequest : AWSRequest


/**
 <p>The canned ACL to apply to the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) AWSS3CreateBucketConfiguration * _Nullable createBucketConfiguration;

/**
 <p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to list the objects in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the bucket ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 <p>Allows grantee to write the ACL for the applicable bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 <p>Specifies whether you want S3 Object Lock to be enabled for the new bucket.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable objectLockEnabledForBucket;

@end

/**
 
 */
@interface AWSS3CreateMultipartUploadOutput : AWSModel


/**
 <p>Date when multipart upload will become eligible for abort operation by lifecycle.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 <p>Id of the lifecycle rule that makes a multipart upload eligible for abort operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 <p>Name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>ID for the initiated multipart upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3CreateMultipartUploadRequest : AWSRequest


/**
 <p>The canned ACL to apply to the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies caching behavior along the request/reply chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A map of metadata to store with the object in S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>Specifies whether you want to apply a Legal Hold to the uploaded object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>Specifies the Object Lock mode that you want to apply to the uploaded object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>Specifies the date and time when you want the Object Lock to expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 <p>The container element for specifying the default Object Lock retention settings for new objects placed in the specified bucket.</p>
 */
@interface AWSS3DefaultRetention : AWSModel


/**
 <p>The number of days that you want to specify for the default retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>The default Object Lock retention mode you want to apply to new objects placed in the specified bucket.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockRetentionMode mode;

/**
 <p>The number of years that you want to specify for the default retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable years;

@end

/**
 
 */
@interface AWSS3Remove : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3ObjectIdentifier *> * _Nullable objects;

/**
 <p>Element to enable quiet mode for the request. When you add this element, you must set its value to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quiet;

@end

/**
 
 */
@interface AWSS3DeleteBucketAnalyticsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket from which an analytics configuration is deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The identifier used to represent an analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketCorsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketEncryptionRequest : AWSRequest


/**
 <p>The name of the bucket containing the server-side encryption configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketInventoryConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the inventory configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketLifecycleRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketMetricsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the metrics configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketPolicyRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketReplicationRequest : AWSRequest


/**
 <p> The bucket name. </p><note><p>It can take a while to propagate the deletion of a replication configuration to all Amazon S3 systems.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteBucketWebsiteRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeleteMarkerEntry : AWSModel


/**
 <p>Specifies whether the object is (true) or is not (false) the latest version of an object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isLatest;

/**
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Date and time the object was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>Version ID of an object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Specifies whether Amazon S3 should replicate delete makers.</p>
 */
@interface AWSS3DeleteMarkerReplication : AWSModel


/**
 <p>The status of the delete marker replication.</p><note><p> In the current implementation, Amazon S3 doesn't replicate the delete markers. The status must be <code>Disabled</code>. </p></note>
 */
@property (nonatomic, assign) AWSS3DeleteMarkerReplicationStatus status;

@end

/**
 
 */
@interface AWSS3DeleteObjectOutput : AWSModel


/**
 <p>Specifies whether the versioned object that was permanently deleted was (true) or was not (false) a delete marker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>Returns the version ID of the delete marker created as a result of the DELETE operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectTaggingOutput : AWSModel


/**
 <p>The versionId of the object the tag-set was removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The versionId of the object that the tag-set will be removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3DeletedObject *> * _Nullable deleted;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Error *> * _Nullable errors;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3DeleteObjectsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies whether you want to delete this object even if it has a Governance-type Object Lock in place. You must have sufficient permissions to perform this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 
 */
@property (nonatomic, strong) AWSS3Remove * _Nullable remove;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

@end

/**
 
 */
@interface AWSS3DeletePublicAccessBlockRequest : AWSRequest


/**
 <p>The Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3DeletedObject : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable deleteMarkerVersionId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>A container for information about the replication destination.</p>
 Required parameters: [Bucket]
 */
@interface AWSS3Destination : AWSModel


/**
 <p>A container for information about access control for replicas. </p><p>Use this element only in a cross-account scenario where source and destination bucket owners are not the same to change replica ownership to the AWS account that owns the destination bucket. If you don't add this element to the replication configuration, the replicas are owned by same AWS account that owns the source object. </p>
 */
@property (nonatomic, strong) AWSS3AccessControlTranslation * _Nullable accessControlTranslation;

/**
 <p>The account ID of the destination bucket. Currently, Amazon S3 verifies this value only if Access Control Translation is enabled. </p><p>In a cross-account scenario, if you change replica ownership to the AWS account that owns the destination bucket by adding the <code>AccessControlTranslation</code> element, this is the account ID of the owner of the destination bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p> The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store replicas of the object identified by the rule. </p><p> If there are multiple rules in your replication configuration, all rules must specify the same bucket as the destination. A replication configuration can replicate objects to only one destination bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A container that provides information about encryption. If <code>SourceSelectionCriteria</code> is specified, you must specify this element. </p>
 */
@property (nonatomic, strong) AWSS3EncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p> The class of storage used to store the object. By default Amazon S3 uses storage class of the source object when creating a replica. </p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

@end

/**
 <p>Describes the server-side encryption that will be applied to the restore results.</p>
 Required parameters: [EncryptionType]
 */
@interface AWSS3Encryption : AWSModel


/**
 <p>The server-side encryption algorithm used when storing job results in Amazon S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption encryptionType;

/**
 <p>If the encryption type is aws:kms, this optional value can be used to specify the encryption context for the restore results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSContext;

/**
 <p>If the encryption type is aws:kms, this optional value specifies the AWS KMS key ID to use for encryption of job results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

@end

/**
 <p>A container for information about the encryption-based configuration for replicas.</p>
 */
@interface AWSS3EncryptionConfiguration : AWSModel


/**
 <p>The ID of the AWS KMS key for the AWS Region where the destination bucket resides. Amazon S3 uses this key to encrypt the replica object. </p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaKmsKeyID;

@end

/**
 
 */
@interface AWSS3EndEvent : AWSModel


@end

/**
 
 */
@interface AWSS3Error : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3ErrorDocument : AWSModel


/**
 <p>The object key name to use when a 4XX class error occurs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 <p>A container for a key value pair that defines the criteria for the filter rule.</p>
 */
@interface AWSS3FilterRule : AWSModel


/**
 <p>The object key name prefix or suffix identifying one or more objects to which the filtering rule applies. The maximum prefix length is 1,024 characters. Overlapping prefixes and suffixes are not supported. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3FilterRuleName name;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSS3GetBucketAccelerateConfigurationOutput : AWSModel


/**
 <p>The accelerate configuration of the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketAccelerateStatus status;

@end

/**
 
 */
@interface AWSS3GetBucketAccelerateConfigurationRequest : AWSRequest


/**
 <p>Name of the bucket for which the accelerate configuration is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketAclOutput : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 
 */
@interface AWSS3GetBucketAclRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketAnalyticsConfigurationOutput : AWSModel


/**
 <p>The configuration and any analyses for the analytics filter.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsConfiguration * _Nullable analyticsConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketAnalyticsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket from which an analytics configuration is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The identifier used to represent an analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketCorsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CORSRule *> * _Nullable CORSRules;

@end

/**
 
 */
@interface AWSS3GetBucketCorsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketEncryptionOutput : AWSModel


/**
 <p>Container for server-side encryption configuration rules. Currently S3 supports one rule only.</p>
 */
@property (nonatomic, strong) AWSS3ServerSideEncryptionConfiguration * _Nullable serverSideEncryptionConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketEncryptionRequest : AWSRequest


/**
 <p>The name of the bucket from which the server-side encryption configuration is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketInventoryConfigurationOutput : AWSModel


/**
 <p>Specifies the inventory configuration.</p>
 */
@property (nonatomic, strong) AWSS3InventoryConfiguration * _Nullable inventoryConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketInventoryConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the inventory configuration to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleConfigurationOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3LifecycleRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Rule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketLocationOutput : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSS3BucketLocationConstraint locationConstraint;

@end

/**
 
 */
@interface AWSS3GetBucketLocationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketLoggingOutput : AWSModel


/**
 <p>Container for logging information. Presence of this element indicates that logging is enabled. Parameters TargetBucket and TargetPrefix are required in this case.</p>
 */
@property (nonatomic, strong) AWSS3LoggingEnabled * _Nullable loggingEnabled;

@end

/**
 
 */
@interface AWSS3GetBucketLoggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketMetricsConfigurationOutput : AWSModel


/**
 <p>Specifies the metrics configuration.</p>
 */
@property (nonatomic, strong) AWSS3MetricsConfiguration * _Nullable metricsConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketMetricsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the metrics configuration to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketNotificationConfigurationRequest : AWSRequest


/**
 <p>Name of the bucket to get the notification configuration for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketPolicyOutput : AWSModel


/**
 <p>The bucket policy as a JSON document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSS3GetBucketPolicyRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketPolicyStatusOutput : AWSModel


/**
 <p>The policy status for the specified bucket.</p>
 */
@property (nonatomic, strong) AWSS3PolicyStatus * _Nullable policyStatus;

@end

/**
 
 */
@interface AWSS3GetBucketPolicyStatusRequest : AWSRequest


/**
 <p>The name of the Amazon S3 bucket whose policy status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketReplicationOutput : AWSModel


/**
 <p>A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.</p>
 */
@property (nonatomic, strong) AWSS3ReplicationConfiguration * _Nullable replicationConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketReplicationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketRequestPaymentOutput : AWSModel


/**
 <p>Specifies who pays for the download and request fees.</p>
 */
@property (nonatomic, assign) AWSS3Payer payer;

@end

/**
 
 */
@interface AWSS3GetBucketRequestPaymentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketTaggingOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

@end

/**
 
 */
@interface AWSS3GetBucketTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketVersioningOutput : AWSModel


/**
 <p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.</p>
 */
@property (nonatomic, assign) AWSS3MFADeleteStatus MFADelete;

/**
 <p>The versioning state of the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketVersioningStatus status;

@end

/**
 
 */
@interface AWSS3GetBucketVersioningRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketWebsiteOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3ErrorDocument * _Nullable errorDocument;

/**
 
 */
@property (nonatomic, strong) AWSS3IndexDocument * _Nullable indexDocument;

/**
 
 */
@property (nonatomic, strong) AWSS3RedirectAllRequestsTo * _Nullable redirectAllRequestsTo;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3RoutingRule *> * _Nullable routingRules;

@end

/**
 
 */
@interface AWSS3GetBucketWebsiteRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetObjectAclOutput : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3GetObjectAclRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectLegalHoldOutput : AWSModel


/**
 <p>The current Legal Hold status for the specified object.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockLegalHold * _Nullable legalHold;

@end

/**
 
 */
@interface AWSS3GetObjectLegalHoldRequest : AWSRequest


/**
 <p>The bucket containing the object whose Legal Hold status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The key name for the object whose Legal Hold status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>The version ID of the object whose Legal Hold status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectLockConfigurationOutput : AWSModel


/**
 <p>The specified bucket's Object Lock configuration.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockConfiguration * _Nullable objectLockConfiguration;

@end

/**
 
 */
@interface AWSS3GetObjectLockConfigurationRequest : AWSRequest


/**
 <p>The bucket whose Object Lock configuration you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetObjectOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable acceptRanges;

/**
 <p>Object data.</p>
 */
@property (nonatomic, strong) id _Nullable body;

/**
 <p>Specifies caching behavior along the request/reply chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>Size of the body in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>The portion of the object returned in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentRange;

/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 <p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Last modified date of the object</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>A map of metadata to store with the object in S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 <p>Indicates whether this object has an active legal hold. This field is only returned if you have permission to view an object's legal hold status.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Object Lock mode currently in place for this object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>The date and time when this object's Object Lock will expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>The count of parts this object has.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partsCount;

/**
 
 */
@property (nonatomic, assign) AWSS3ReplicationStatus replicationStatus;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>Provides information about object restoration operation and expiration time of the restored object copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restore;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The number of tags, if any, on the object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tagCount;

/**
 <p>Version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 
 */
@interface AWSS3GetObjectRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 <p>Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable ifModifiedSince;

/**
 <p>Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifNoneMatch;

/**
 <p>Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable ifUnmodifiedSince;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' GET request for the part specified. Useful for downloading just a part of an object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.</p>
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Sets the Cache-Control header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCacheControl;

/**
 <p>Sets the Content-Disposition header of the response</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentDisposition;

/**
 <p>Sets the Content-Encoding header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentEncoding;

/**
 <p>Sets the Content-Language header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentLanguage;

/**
 <p>Sets the Content-Type header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentType;

/**
 <p>Sets the Expires header of the response.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable responseExpires;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectRetentionOutput : AWSModel


/**
 <p>The container element for an object's retention settings.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockRetention * _Nullable retention;

@end

/**
 
 */
@interface AWSS3GetObjectRetentionRequest : AWSRequest


/**
 <p>The bucket containing the object whose retention settings you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The key name for the object whose retention settings you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>The version ID for the object whose retention settings you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectTaggingOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectTorrentOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) id _Nullable body;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3GetObjectTorrentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

@end

/**
 
 */
@interface AWSS3GetPublicAccessBlockOutput : AWSModel


/**
 <p>The <code>PublicAccessBlock</code> configuration currently in effect for this Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3PublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

@end

/**
 
 */
@interface AWSS3GetPublicAccessBlockRequest : AWSRequest


/**
 <p>The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GlacierJobParameters : AWSModel


/**
 <p>Glacier retrieval tier at which the restore will be processed.</p>
 */
@property (nonatomic, assign) AWSS3Tier tier;

@end

/**
 
 */
@interface AWSS3Grant : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3Grantee * _Nullable grantee;

/**
 <p>Specifies the permission given to the grantee.</p>
 */
@property (nonatomic, assign) AWSS3Permission permission;

@end

/**
 
 */
@interface AWSS3Grantee : AWSModel


/**
 <p>Screen name of the grantee.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>Email address of the grantee.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p>The canonical user ID of the grantee.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Type of grantee</p>
 */
@property (nonatomic, assign) AWSS3Types types;

/**
 <p>URI of the grantee group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable URI;

@end

/**
 
 */
@interface AWSS3HeadBucketRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3HeadObjectOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable acceptRanges;

/**
 <p>Specifies caching behavior along the request/reply chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>Size of the body in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 <p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Last modified date of the object</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>A map of metadata to store with the object in S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 <p>The Legal Hold status for the specified object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Object Lock mode currently in place for this object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>The date and time when this object's Object Lock will expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>The count of parts this object has.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partsCount;

/**
 
 */
@property (nonatomic, assign) AWSS3ReplicationStatus replicationStatus;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>Provides information about object restoration operation and expiration time of the restored object copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restore;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>Version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 
 */
@interface AWSS3HeadObjectRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 <p>Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable ifModifiedSince;

/**
 <p>Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifNoneMatch;

/**
 <p>Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable ifUnmodifiedSince;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about the size of the part and the number of parts in this object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.</p>
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3IndexDocument : AWSModel


/**
 <p>A suffix that is appended to a request that is for a directory on the website endpoint (e.g. if the suffix is index.html and you make a request to samplebucket/images/ the data that is returned will be for the object with the key name images/index.html) The suffix must not be empty and must not include a slash character.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suffix;

@end

/**
 
 */
@interface AWSS3Initiator : AWSModel


/**
 <p>Name of the Principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>If the principal is an AWS account, it provides the Canonical User ID. If the principal is an IAM User, it provides a user ARN value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Describes the serialization format of the object.</p>
 */
@interface AWSS3InputSerialization : AWSModel


/**
 <p>Describes the serialization of a CSV-encoded object.</p>
 */
@property (nonatomic, strong) AWSS3CSVInput * _Nullable CSV;

/**
 <p>Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: NONE.</p>
 */
@property (nonatomic, assign) AWSS3CompressionType compressionType;

/**
 <p>Specifies JSON as object's input serialization format.</p>
 */
@property (nonatomic, strong) AWSS3JSONInput * _Nullable JSON;

/**
 <p>Specifies Parquet as object's input serialization format.</p>
 */
@property (nonatomic, strong) AWSS3ParquetInput * _Nullable parquet;

@end

/**
 
 */
@interface AWSS3InventoryConfiguration : AWSModel


/**
 <p>Contains information about where to publish the inventory results.</p>
 */
@property (nonatomic, strong) AWSS3InventoryDestination * _Nullable destination;

/**
 <p>Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.</p>
 */
@property (nonatomic, strong) AWSS3InventoryFilter * _Nullable filter;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies which object version(s) to included in the inventory results.</p>
 */
@property (nonatomic, assign) AWSS3InventoryIncludedObjectVersions includedObjectVersions;

/**
 <p>Specifies whether the inventory is enabled or disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEnabled;

/**
 <p>Contains the optional fields that are included in the inventory results.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable optionalFields;

/**
 <p>Specifies the schedule for generating inventory results.</p>
 */
@property (nonatomic, strong) AWSS3InventorySchedule * _Nullable schedule;

@end

/**
 
 */
@interface AWSS3InventoryDestination : AWSModel


/**
 <p>Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.</p>
 */
@property (nonatomic, strong) AWSS3InventoryS3BucketDestination * _Nullable s3BucketDestination;

@end

/**
 <p>Contains the type of server-side encryption used to encrypt the inventory results.</p>
 */
@interface AWSS3InventoryEncryption : AWSModel


/**
 <p>Specifies the use of SSE-KMS to encrypt delivered Inventory reports.</p>
 */
@property (nonatomic, strong) AWSS3SSEKMS * _Nullable SSEKMS;

/**
 <p>Specifies the use of SSE-S3 to encrypt delivered Inventory reports.</p>
 */
@property (nonatomic, strong) AWSS3SSES3 * _Nullable SSES3;

@end

/**
 
 */
@interface AWSS3InventoryFilter : AWSModel


/**
 <p>The prefix that an object must have to be included in the inventory results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3InventoryS3BucketDestination : AWSModel


/**
 <p>The ID of the account that owns the destination bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon resource name (ARN) of the bucket where inventory results will be published.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Contains the type of server-side encryption used to encrypt the inventory results.</p>
 */
@property (nonatomic, strong) AWSS3InventoryEncryption * _Nullable encryption;

/**
 <p>Specifies the output format of the inventory results.</p>
 */
@property (nonatomic, assign) AWSS3InventoryFormat format;

/**
 <p>The prefix that is prepended to all inventory results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3InventorySchedule : AWSModel


/**
 <p>Specifies how frequently inventory results are produced.</p>
 */
@property (nonatomic, assign) AWSS3InventoryFrequency frequency;

@end

/**
 
 */
@interface AWSS3JSONInput : AWSModel


/**
 <p>The type of JSON. Valid values: Document, Lines.</p>
 */
@property (nonatomic, assign) AWSS3JSONType types;

@end

/**
 
 */
@interface AWSS3JSONOutput : AWSModel


/**
 <p>The value used to separate individual records in the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 <p>A container for specifying the configuration for AWS Lambda notifications.</p>
 Required parameters: [LambdaFunctionArn, Events]
 */
@interface AWSS3LambdaFunctionConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>A container for object key name filtering rules. For information about key name filtering, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Lambda cloud function that Amazon S3 can invoke when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionArn;

@end

/**
 
 */
@interface AWSS3LifecycleConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Rule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3LifecycleExpiration : AWSModel


/**
 <p>Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiredObjectDeleteMarker;

@end

/**
 
 */
@interface AWSS3LifecycleRule : AWSModel


/**
 <p>Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.</p>
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 <p>The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.</p>
 */
@property (nonatomic, strong) AWSS3LifecycleRuleFilter * _Nullable filter;

/**
 <p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.</p>
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionExpiration * _Nullable noncurrentVersionExpiration;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3NoncurrentVersionTransition *> * _Nullable noncurrentVersionTransitions;

/**
 <p>Prefix identifying one or more objects to which the rule applies. This is deprecated; use Filter instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.</p>
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Transition *> * _Nullable transitions;

@end

/**
 <p>This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.</p>
 */
@interface AWSS3LifecycleRuleAndOperator : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>All of these tags must exist in the object's tag set in order for the rule to apply.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 <p>The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.</p>
 */
@interface AWSS3LifecycleRuleFilter : AWSModel


/**
 <p>This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.</p>
 */
@property (nonatomic, strong) AWSS3LifecycleRuleAndOperator * _Nullable AND;

/**
 <p>Prefix identifying one or more objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>This tag must exist in the object's tag set in order for the rule to apply.</p>
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3ListBucketAnalyticsConfigurationsOutput : AWSModel


/**
 <p>The list of analytics configurations for a bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3AnalyticsConfiguration *> * _Nullable analyticsConfigurationList;

/**
 <p>The ContinuationToken that represents where this request began.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>Indicates whether the returned list of analytics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>NextContinuationToken is sent when isTruncated is true, which indicates that there are more analytics configurations to list. The next request must include this NextContinuationToken. The token is obfuscated and is not a usable value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketAnalyticsConfigurationsRequest : AWSRequest


/**
 <p>The name of the bucket from which analytics configurations are retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ContinuationToken that represents a placeholder from where this request should begin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketInventoryConfigurationsOutput : AWSModel


/**
 <p>If sent in the request, the marker that is used as a starting point for this inventory configuration list response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>The list of inventory configurations for a bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3InventoryConfiguration *> * _Nullable inventoryConfigurationList;

/**
 <p>Indicates whether the returned list of inventory configurations is truncated in this response. A value of true indicates that the list is truncated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The marker used to continue this inventory configuration listing. Use the NextContinuationToken from this response to continue the listing in a subsequent request. The continuation token is an opaque value that Amazon S3 understands.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketInventoryConfigurationsRequest : AWSRequest


/**
 <p>The name of the bucket containing the inventory configurations to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The marker used to continue an inventory configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketMetricsConfigurationsOutput : AWSModel


/**
 <p>The marker that is used as a starting point for this metrics configuration list response. This value is present if it was sent in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>Indicates whether the returned list of metrics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The list of metrics configurations for a bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3MetricsConfiguration *> * _Nullable metricsConfigurationList;

/**
 <p>The marker used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketMetricsConfigurationsRequest : AWSRequest


/**
 <p>The name of the bucket containing the metrics configurations to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The marker that is used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Bucket *> * _Nullable buckets;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 
 */
@interface AWSS3ListMultipartUploadsOutput : AWSModel


/**
 <p>Name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>Indicates whether the returned list of multipart uploads is truncated. A value of true indicates that the list was truncated. The list can be truncated if the number of multipart uploads exceeds the limit allowed or specified by max uploads.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The key at or after which the listing began.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Maximum number of multipart uploads that could have been included in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxUploads;

/**
 <p>When a list is truncated, this element specifies the value that should be used for the key-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextKeyMarker;

/**
 <p>When a list is truncated, this element specifies the value that should be used for the upload-id-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextUploadIdMarker;

/**
 <p>When a prefix is provided in the request, this field contains the specified prefix. The result contains only keys starting with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Upload ID after which listing began.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadIdMarker;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3MultipartUpload *> * _Nullable uploads;

@end

/**
 
 */
@interface AWSS3ListMultipartUploadsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Character you use to group keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>Together with upload-id-marker, this parameter specifies the multipart upload after which listing should begin.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body. 1,000 is the maximum number of uploads that can be returned in a response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxUploads;

/**
 <p>Lists in-progress uploads only for those keys that begin with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Together with key-marker, specifies the multipart upload after which listing should begin. If key-marker is not specified, the upload-id-marker parameter is ignored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadIdMarker;

@end

/**
 
 */
@interface AWSS3ListObjectVersionsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3DeleteMarkerEntry *> * _Nullable deleteMarkers;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria. If your results were truncated, you can make a follow-up paginated request using the NextKeyMarker and NextVersionIdMarker response parameters as a starting place in another request to return the rest of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>Marks the last Key returned in a truncated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Use this value for the key marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextKeyMarker;

/**
 <p>Use this value for the next version id marker parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextVersionIdMarker;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionIdMarker;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3ObjectVersion *> * _Nullable versions;

@end

/**
 
 */
@interface AWSS3ListObjectVersionsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A delimiter is a character you use to group keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>Specifies the key to start with when listing objects in a bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>Limits the response to keys that begin with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Specifies the object version you want to start listing from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionIdMarker;

@end

/**
 
 */
@interface AWSS3ListObjectsOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Object *> * _Nullable contents;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When response is truncated (the IsTruncated element value in the response is true), you can use the key name in this field as marker in the subsequent request to get next set of objects. Amazon S3 lists objects in alphabetical order Note: This element is returned only if you have delimiter request parameter specified. If response does not include the NextMaker and it is truncated, you can use the value of the last Key in the response as the marker in the subsequent request to get the next set of object keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3ListObjectsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A delimiter is a character you use to group keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>Specifies the key to start with when listing objects in a bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>Limits the response to keys that begin with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Confirms that the requester knows that she or he will be charged for the list objects request. Bucket owners need not specify this parameter in their requests.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

@end

/**
 
 */
@interface AWSS3ListObjectsV2Output : AWSModel


/**
 <p>CommonPrefixes contains all (if there are any) keys between Prefix and the next occurrence of the string specified by delimiter</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 <p>Metadata about each object returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Object *> * _Nullable contents;

/**
 <p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>A delimiter is a character you use to group keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>KeyCount is the number of keys returned with this request. KeyCount will always be less than equals to MaxKeys field. Say you ask for 50 keys, your result will include less than equals 50 keys </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keyCount;

/**
 <p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>Name of the bucket to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>NextContinuationToken is sent when isTruncated is true which means there are more keys in the bucket that can be listed. The next list requests to Amazon S3 can be continued with this NextContinuationToken. NextContinuationToken is obfuscated and is not a real key</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

/**
 <p>Limits the response to keys that begin with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket</p>
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListObjectsV2Request : AWSRequest


/**
 <p>Name of the bucket to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>A delimiter is a character you use to group keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>The owner field is not present in listV2 by default, if you want to return owner field with each key in the result then set the fetch owner field to true</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fetchOwner;

/**
 <p>Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>Limits the response to keys that begin with the specified prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Confirms that the requester knows that she or he will be charged for the list objects request in V2 style. Bucket owners need not specify this parameter in their requests.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket</p>
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListPartsOutput : AWSModel


/**
 <p>Date when multipart upload will become eligible for abort operation by lifecycle.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 <p>Id of the lifecycle rule that makes a multipart upload eligible for abort operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 <p>Name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Identifies who initiated the multipart upload.</p>
 */
@property (nonatomic, strong) AWSS3Initiator * _Nullable initiator;

/**
 <p>Indicates whether the returned list of parts is truncated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Maximum number of parts that were allowed in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxParts;

/**
 <p>When a list is truncated, this element specifies the last part in the list, as well as the value to use for the part-number-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable nextPartNumberMarker;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>Part number after which listing begins.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumberMarker;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Part *> * _Nullable parts;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>Upload ID identifying the multipart upload whose parts are being listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3ListPartsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Sets the maximum number of parts to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxParts;

/**
 <p>Specifies the part after which listing should begin. Only parts with higher part numbers will be listed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumberMarker;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Upload ID identifying the multipart upload whose parts are being listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>Container for logging information. Presence of this element indicates that logging is enabled. Parameters TargetBucket and TargetPrefix are required in this case.</p>
 Required parameters: [TargetBucket, TargetPrefix]
 */
@interface AWSS3LoggingEnabled : AWSModel


/**
 <p>Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs delivered to any bucket that you own, including the same bucket that is being logged. You can also configure multiple buckets to deliver their logs to the same target bucket. In this case you should choose a different TargetPrefix for each source bucket so that the delivered log files can be distinguished by key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBucket;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3TargetGrant *> * _Nullable targetGrants;

/**
 <p>This element lets you specify a prefix for the keys that the log files will be stored under.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetPrefix;

@end

/**
 <p>A metadata key-value pair to store with an object.</p>
 */
@interface AWSS3MetadataEntry : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSS3MetricsAndOperator : AWSModel


/**
 <p>The prefix used when evaluating an AND predicate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The list of tags used when evaluating an AND predicate.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSS3MetricsConfiguration : AWSModel


/**
 <p>Specifies a metrics configuration filter. The metrics configuration will only include objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).</p>
 */
@property (nonatomic, strong) AWSS3MetricsFilter * _Nullable filter;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3MetricsFilter : AWSModel


/**
 <p>A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.</p>
 */
@property (nonatomic, strong) AWSS3MetricsAndOperator * _Nullable AND;

/**
 <p>The prefix used when evaluating a metrics filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The tag used when evaluating a metrics filter.</p>
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3MultipartUpload : AWSModel


/**
 <p>Date and time at which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable initiated;

/**
 <p>Identifies who initiated the multipart upload.</p>
 */
@property (nonatomic, strong) AWSS3Initiator * _Nullable initiator;

/**
 <p>Key of the object for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>Upload ID that identifies the multipart upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.</p>
 */
@interface AWSS3NoncurrentVersionExpiration : AWSModel


/**
 <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noncurrentDays;

@end

/**
 <p>Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING or GLACIER storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING or GLACIER storage class at a specific period in the object's lifetime.</p>
 */
@interface AWSS3NoncurrentVersionTransition : AWSModel


/**
 <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noncurrentDays;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3TransitionStorageClass storageClass;

@end

/**
 <p>A container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off for the bucket.</p>
 */
@interface AWSS3NotificationConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3LambdaFunctionConfiguration *> * _Nullable lambdaFunctionConfigurations;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3QueueConfiguration *> * _Nullable queueConfigurations;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3TopicConfiguration *> * _Nullable topicConfigurations;

@end

/**
 
 */
@interface AWSS3NotificationConfigurationDeprecated : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3CloudFunctionConfiguration * _Nullable cloudFunctionConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSS3QueueConfigurationDeprecated * _Nullable queueConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSS3TopicConfigurationDeprecated * _Nullable topicConfiguration;

@end

/**
 <p>A container for object key name filtering rules. For information about key name filtering, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSS3NotificationConfigurationFilter : AWSModel


/**
 <p>A container for object key name prefix and suffix filtering rules.</p>
 */
@property (nonatomic, strong) AWSS3S3KeyFilter * _Nullable key;

@end

/**
 
 */
@interface AWSS3Object : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectStorageClass storageClass;

@end

/**
 
 */
@interface AWSS3ObjectIdentifier : AWSModel


/**
 <p>Key name of the object to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>VersionId for the specific version of the object to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>The container element for Object Lock configuration parameters.</p>
 */
@interface AWSS3ObjectLockConfiguration : AWSModel


/**
 <p>Indicates whether this bucket has an Object Lock configuration enabled.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockEnabled objectLockEnabled;

/**
 <p>The Object Lock rule in place for the specified object.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockRule * _Nullable rule;

@end

/**
 <p>A Legal Hold configuration for an object.</p>
 */
@interface AWSS3ObjectLockLegalHold : AWSModel


/**
 <p>Indicates whether the specified object has a Legal Hold in place.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus status;

@end

/**
 <p>A Retention configuration for an object.</p>
 */
@interface AWSS3ObjectLockRetention : AWSModel


/**
 <p>Indicates the Retention mode for the specified object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockRetentionMode mode;

/**
 <p>The date on which this Object Lock Retention will expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable retainUntilDate;

@end

/**
 <p>The container element for an Object Lock rule.</p>
 */
@interface AWSS3ObjectLockRule : AWSModel


/**
 <p>The default retention period that you want to apply to new objects placed in the specified bucket.</p>
 */
@property (nonatomic, strong) AWSS3DefaultRetention * _Nullable defaultRetention;

@end

/**
 
 */
@interface AWSS3ObjectVersion : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Specifies whether the object is (true) or is not (false) the latest version of an object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isLatest;

/**
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Date and time the object was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>Size in bytes of the object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectVersionStorageClass storageClass;

/**
 <p>Version ID of an object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Describes the location where the restore job's output is stored.</p>
 */
@interface AWSS3OutputLocation : AWSModel


/**
 <p>Describes an S3 location that will receive the results of the restore request.</p>
 */
@property (nonatomic, strong) AWSS3S3Location * _Nullable s3;

@end

/**
 <p>Describes how results of the Select job are serialized.</p>
 */
@interface AWSS3OutputSerialization : AWSModel


/**
 <p>Describes the serialization of CSV-encoded Select results.</p>
 */
@property (nonatomic, strong) AWSS3CSVOutput * _Nullable CSV;

/**
 <p>Specifies JSON as request's output serialization format.</p>
 */
@property (nonatomic, strong) AWSS3JSONOutput * _Nullable JSON;

@end

/**
 
 */
@interface AWSS3Owner : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3ParquetInput : AWSModel


@end

/**
 
 */
@interface AWSS3Part : AWSModel


/**
 <p>Entity tag returned when the part was uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Date and time at which the part was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>Part number identifying the part. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Size in bytes of the uploaded part data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>The container element for a bucket's policy status.</p>
 */
@interface AWSS3PolicyStatus : AWSModel


/**
 <p>The policy status for this bucket. <code>TRUE</code> indicates that this bucket is public. <code>FALSE</code> indicates that the bucket is not public.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPublic;

@end

/**
 
 */
@interface AWSS3Progress : AWSModel


/**
 <p>The current number of uncompressed object bytes processed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesProcessed;

/**
 <p>The current number of bytes of records payload data returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesReturned;

/**
 <p>The current number of object bytes scanned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesScanned;

@end

/**
 
 */
@interface AWSS3ProgressEvent : AWSModel


/**
 <p>The Progress event details.</p>
 */
@property (nonatomic, strong) AWSS3Progress * _Nullable details;

@end

/**
 
 */
@interface AWSS3PublicAccessBlockConfiguration : AWSModel


/**
 <p>Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket and objects in this bucket. Setting this element to <code>TRUE</code> causes the following behavior:</p><ul><li><p>PUT Bucket acl and PUT Object acl calls fail if the specified ACL is public.</p></li><li><p>PUT Object calls fail if the request includes a public ACL.</p></li></ul><p>Enabling this setting doesn't affect existing policies or ACLs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicAcls;

/**
 <p>Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting this element to <code>TRUE</code> causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket policy allows public access. </p><p>Enabling this setting doesn't affect existing bucket policies.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicPolicy;

/**
 <p>Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this bucket. Setting this element to <code>TRUE</code> causes Amazon S3 to ignore all public ACLs on this bucket and objects in this bucket.</p><p>Enabling this setting doesn't affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignorePublicAcls;

/**
 <p>Specifies whether Amazon S3 should restrict public bucket policies for this bucket. Setting this element to <code>TRUE</code> restricts access to this bucket to only AWS services and authorized users within this account if the bucket has a public policy.</p><p>Enabling this setting doesn't affect previously stored bucket policies, except that public and cross-account access within any public bucket policy, including non-public delegation to specific accounts, is blocked.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable restrictPublicBuckets;

@end

/**
 
 */
@interface AWSS3PutBucketAccelerateConfigurationRequest : AWSRequest


/**
 <p>Specifies the Accelerate Configuration you want to set for the bucket.</p>
 */
@property (nonatomic, strong) AWSS3AccelerateConfiguration * _Nullable accelerateConfiguration;

/**
 <p>Name of the bucket for which the accelerate configuration is set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3PutBucketAclRequest : AWSRequest


/**
 <p>The canned ACL to apply to the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) AWSS3AccessControlPolicy * _Nullable accessControlPolicy;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to list the objects in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the bucket ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 <p>Allows grantee to write the ACL for the applicable bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

@end

/**
 
 */
@interface AWSS3PutBucketAnalyticsConfigurationRequest : AWSRequest


/**
 <p>The configuration and any analyses for the analytics filter.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsConfiguration * _Nullable analyticsConfiguration;

/**
 <p>The name of the bucket to which an analytics configuration is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The identifier used to represent an analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3PutBucketCorsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) AWSS3CORSConfiguration * _Nullable CORSConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

@end

/**
 
 */
@interface AWSS3PutBucketEncryptionRequest : AWSRequest


/**
 <p>The name of the bucket for which the server-side encryption configuration is set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the server-side encryption configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>Container for server-side encryption configuration rules. Currently S3 supports one rule only.</p>
 */
@property (nonatomic, strong) AWSS3ServerSideEncryptionConfiguration * _Nullable serverSideEncryptionConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketInventoryConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket where the inventory configuration will be stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies the inventory configuration.</p>
 */
@property (nonatomic, strong) AWSS3InventoryConfiguration * _Nullable inventoryConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketLifecycleConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) AWSS3BucketLifecycleConfiguration * _Nullable lifecycleConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketLifecycleRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) AWSS3LifecycleConfiguration * _Nullable lifecycleConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketLoggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) AWSS3BucketLoggingStatus * _Nullable bucketLoggingStatus;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

@end

/**
 
 */
@interface AWSS3PutBucketMetricsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket for which the metrics configuration is set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies the metrics configuration.</p>
 */
@property (nonatomic, strong) AWSS3MetricsConfiguration * _Nullable metricsConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketNotificationConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off for the bucket.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfiguration * _Nullable notificationConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketNotificationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationDeprecated * _Nullable notificationConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketPolicyRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Set this parameter to true to confirm that you want to remove your permissions to change this bucket policy in the future.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confirmRemoveSelfBucketAccess;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The bucket policy as a JSON document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSS3PutBucketReplicationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.</p>
 */
@property (nonatomic, strong) AWSS3ReplicationConfiguration * _Nullable replicationConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketRequestPaymentRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) AWSS3RequestPaymentConfiguration * _Nullable requestPaymentConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) AWSS3Tagging * _Nullable tagging;

@end

/**
 
 */
@interface AWSS3PutBucketVersioningRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 
 */
@property (nonatomic, strong) AWSS3VersioningConfiguration * _Nullable versioningConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketWebsiteRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) AWSS3WebsiteConfiguration * _Nullable websiteConfiguration;

@end

/**
 
 */
@interface AWSS3PutObjectAclOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3PutObjectAclRequest : AWSRequest


/**
 <p>The canned ACL to apply to the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) AWSS3AccessControlPolicy * _Nullable accessControlPolicy;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to list the objects in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the bucket ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 <p>Allows grantee to write the ACL for the applicable bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectLegalHoldOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3PutObjectLegalHoldRequest : AWSRequest


/**
 <p>The bucket containing the object that you want to place a Legal Hold on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The key name for the object that you want to place a Legal Hold on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Container element for the Legal Hold configuration you want to apply to the specified object.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockLegalHold * _Nullable legalHold;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>The version ID of the object that you want to place a Legal Hold on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectLockConfigurationOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3PutObjectLockConfigurationRequest : AWSRequest


/**
 <p>The bucket whose Object Lock configuration you want to create or replace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The Object Lock configuration that you want to apply to the specified bucket.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockConfiguration * _Nullable objectLockConfiguration;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSS3PutObjectOutput : AWSModel


/**
 <p>Entity tag for the uploaded object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectRequest : AWSRequest


/**
 <p>The canned ACL to apply to the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 <p>Object data.</p>
 */
@property (nonatomic, strong) id _Nullable body;

/**
 <p>Name of the bucket to which the PUT operation was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies caching behavior along the request/reply chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>The base64-encoded 128-bit MD5 digest of the part data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>A standard MIME type describing the format of the object data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 <p>Object key for which the PUT operation was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A map of metadata to store with the object in S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 <p>The Legal Hold status that you want to apply to the specified object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Object Lock mode that you want to apply to this object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>The date and time when you want this object's Object Lock to expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>The type of storage to use for the object. Defaults to 'STANDARD'.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For example, "Key1=Value1")</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 
 */
@interface AWSS3PutObjectRetentionOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3PutObjectRetentionRequest : AWSRequest


/**
 <p>The bucket that contains the object you want to apply this Object Retention configuration to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Indicates whether this operation should bypass Governance-mode restrictions.j</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The key name for the object that you want to apply this Object Retention configuration to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>The container element for the Object Retention configuration.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockRetention * _Nullable retention;

/**
 <p>The version ID for the object that you want to apply this Object Retention configuration to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectTaggingOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectTaggingRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) AWSS3Tagging * _Nullable tagging;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutPublicAccessBlockRequest : AWSRequest


/**
 <p>The name of the Amazon S3 bucket whose <code>PublicAccessBlock</code> configuration you want to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash of the <code>PutPublicAccessBlock</code> request body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3PublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

@end

/**
 <p>A container for specifying the configuration for publication of messages to an Amazon Simple Queue Service (Amazon SQS) queue.when Amazon S3 detects specified events.</p>
 Required parameters: [QueueArn, Events]
 */
@interface AWSS3QueueConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>A container for object key name filtering rules. For information about key name filtering, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 will publish a message when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

@end

/**
 
 */
@interface AWSS3QueueConfigurationDeprecated : AWSModel


/**
 <p>The bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable queue;

@end

/**
 
 */
@interface AWSS3RecordsEvent : AWSModel


/**
 <p>The byte array of partial, one or more result records.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 
 */
@interface AWSS3Redirect : AWSModel


/**
 <p>The host name to use in the redirect request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostName;

/**
 <p>The HTTP redirect code to use on the response. Not required if one of the siblings is present.</p>
 */
@property (nonatomic, strong) NSString * _Nullable httpRedirectCode;

/**
 <p>Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.</p>
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

/**
 <p>The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with KeyPrefixEquals set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents. Not required if one of the siblings is present. Can be present only if ReplaceKeyWith is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyPrefixWith;

/**
 <p>The specific object key to use in the redirect request. For example, redirect request to error.html. Not required if one of the sibling is present. Can be present only if ReplaceKeyPrefixWith is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyWith;

@end

/**
 
 */
@interface AWSS3RedirectAllRequestsTo : AWSModel


/**
 <p>Name of the host where requests will be redirected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostName;

/**
 <p>Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.</p>
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

@end

/**
 <p>A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.</p>
 Required parameters: [Role, Rules]
 */
@interface AWSS3ReplicationConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that Amazon S3 can assume when replicating the objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A container for one or more replication rules. A replication configuration must have at least one rule and can contain a maximum of 1,000 rules. </p>
 */
@property (nonatomic, strong) NSArray<AWSS3ReplicationRule *> * _Nullable rules;

@end

/**
 <p>A container for information about a specific replication rule.</p>
 Required parameters: [Status, Destination]
 */
@interface AWSS3ReplicationRule : AWSModel


/**
 <p>Specifies whether Amazon S3 should replicate delete makers.</p>
 */
@property (nonatomic, strong) AWSS3DeleteMarkerReplication * _Nullable deleteMarkerReplication;

/**
 <p>A container for information about the replication destination.</p>
 */
@property (nonatomic, strong) AWSS3Destination * _Nullable destination;

/**
 <p>A filter that identifies the subset of objects to which the replication rule applies. A <code>Filter</code> must specify exactly one <code>Prefix</code>, <code>Tag</code>, or an <code>And</code> child element.</p>
 */
@property (nonatomic, strong) AWSS3ReplicationRuleFilter * _Nullable filter;

/**
 <p>A unique identifier for the rule. The maximum value is 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An object keyname prefix that identifies the object or objects to which the rule applies. The maximum prefix length is 1,024 characters. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The priority associated with the rule. If you specify multiple rules in a replication configuration, Amazon S3 prioritizes the rules to prevent conflicts when filtering. If two or more rules identify the same object based on a specified filter, the rule with higher priority takes precedence. For example:</p><ul><li><p>Same object quality prefix based filter criteria If prefixes you specified in multiple rules overlap </p></li><li><p>Same object qualify tag based filter criteria specified in multiple rules</p></li></ul><p>For more information, see <a href=" https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html">Cross-Region Replication (CRR)</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>A container that describes additional filters for identifying the source objects that you want to replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using an AWS KMS-Managed Key (SSE-KMS). </p><p> If you want Amazon S3 to replicate objects created with server-side encryption using AWS KMS-Managed Keys. </p>
 */
@property (nonatomic, strong) AWSS3SourceSelectionCriteria * _Nullable sourceSelectionCriteria;

/**
 <p>If status isn't enabled, the rule is ignored.</p>
 */
@property (nonatomic, assign) AWSS3ReplicationRuleStatus status;

@end

/**
 
 */
@interface AWSS3ReplicationRuleAndOperator : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 <p>A filter that identifies the subset of objects to which the replication rule applies. A <code>Filter</code> must specify exactly one <code>Prefix</code>, <code>Tag</code>, or an <code>And</code> child element.</p>
 */
@interface AWSS3ReplicationRuleFilter : AWSModel


/**
 <p>A container for specifying rule filters. The filters determine the subset of objects to which the rule applies. This element is required only if you specify more than one filter. For example: </p><ul><li><p>If you specify both a <code>Prefix</code> and a <code>Tag</code> filter, wrap these filters in an <code>And</code> tag.</p></li><li><p>If you specify a filter based on multiple tags, wrap the <code>Tag</code> elements in an <code>And</code> tag.</p></li></ul>
 */
@property (nonatomic, strong) AWSS3ReplicationRuleAndOperator * _Nullable AND;

/**
 <p>An object keyname prefix that identifies the subset of objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A container for specifying a tag key and value. </p><p>The rule applies only to objects that have the tag in their tag set.</p>
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3RequestPaymentConfiguration : AWSModel


/**
 <p>Specifies who pays for the download and request fees.</p>
 */
@property (nonatomic, assign) AWSS3Payer payer;

@end

/**
 
 */
@interface AWSS3RequestProgress : AWSModel


/**
 <p>Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, FALSE. Default value: FALSE.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSS3RestoreObjectOutput : AWSModel


/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>Indicates the path in the provided S3 output location where Select results will be restored to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restoreOutputPath;

@end

/**
 
 */
@interface AWSS3RestoreObjectRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Container for restore job parameters.</p>
 */
@property (nonatomic, strong) AWSS3RestoreRequest * _Nullable restoreRequest;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Container for restore job parameters.</p>
 */
@interface AWSS3RestoreRequest : AWSModel


/**
 <p>Lifetime of the active copy in days. Do not use with restores that specify OutputLocation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>The optional description for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Glacier related parameters pertaining to this job. Do not use with restores that specify OutputLocation.</p>
 */
@property (nonatomic, strong) AWSS3GlacierJobParameters * _Nullable glacierJobParameters;

/**
 <p>Describes the location where the restore job's output is stored.</p>
 */
@property (nonatomic, strong) AWSS3OutputLocation * _Nullable outputLocation;

/**
 <p>Describes the parameters for Select job types.</p>
 */
@property (nonatomic, strong) AWSS3SelectParameters * _Nullable selectParameters;

/**
 <p>Glacier retrieval tier at which the restore will be processed.</p>
 */
@property (nonatomic, assign) AWSS3Tier tier;

/**
 <p>Type of restore request.</p>
 */
@property (nonatomic, assign) AWSS3RestoreRequestType types;

@end

/**
 
 */
@interface AWSS3RoutingRule : AWSModel


/**
 <p>A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.</p>
 */
@property (nonatomic, strong) AWSS3Condition * _Nullable condition;

/**
 <p>Container for redirect information. You can redirect requests to another host, to another page, or with another protocol. In the event of an error, you can specify a different error code to return.</p>
 */
@property (nonatomic, strong) AWSS3Redirect * _Nullable redirect;

@end

/**
 
 */
@interface AWSS3Rule : AWSModel


/**
 <p>Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.</p>
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 <p>Unique identifier for the rule. The value cannot be longer than 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.</p>
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionExpiration * _Nullable noncurrentVersionExpiration;

/**
 <p>Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING or GLACIER storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING or GLACIER storage class at a specific period in the object's lifetime.</p>
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionTransition * _Nullable noncurrentVersionTransition;

/**
 <p>Prefix identifying one or more objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.</p>
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 
 */
@property (nonatomic, strong) AWSS3Transition * _Nullable transition;

@end

/**
 <p>A container for object key name prefix and suffix filtering rules.</p>
 */
@interface AWSS3S3KeyFilter : AWSModel


/**
 <p>A list of containers for the key value pair that defines the criteria for the filter rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3FilterRule *> * _Nullable filterRules;

@end

/**
 <p>Describes an S3 location that will receive the results of the restore request.</p>
 Required parameters: [BucketName, Prefix]
 */
@interface AWSS3S3Location : AWSModel


/**
 <p>A list of grants that control access to the staged results.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable accessControlList;

/**
 <p>The name of the bucket where the restore results will be placed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The canned ACL to apply to the restore results.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL cannedACL;

/**
 <p>Describes the server-side encryption that will be applied to the restore results.</p>
 */
@property (nonatomic, strong) AWSS3Encryption * _Nullable encryption;

/**
 <p>The prefix that is prepended to the restore results for this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The class of storage used to store the restore results.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set that is applied to the restore results.</p>
 */
@property (nonatomic, strong) AWSS3Tagging * _Nullable tagging;

/**
 <p>A list of metadata to store with the restore results in S3.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3MetadataEntry *> * _Nullable userMetadata;

@end

/**
 <p>Specifies the use of SSE-KMS to encrypt delivered Inventory reports.</p>
 Required parameters: [KeyId]
 */
@interface AWSS3SSEKMS : AWSModel


/**
 <p>Specifies the ID of the AWS Key Management Service (KMS) master encryption key to use for encrypting Inventory reports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 <p>Specifies the use of SSE-S3 to encrypt delivered Inventory reports.</p>
 */
@interface AWSS3SSES3 : AWSModel


@end

/**
 
 */
@interface AWSS3SelectObjectContentEventStream : AWSModel


/**
 <p>The Continuation Event.</p>
 */
@property (nonatomic, strong) AWSS3ContinuationEvent * _Nullable cont;

/**
 <p>The End Event.</p>
 */
@property (nonatomic, strong) AWSS3EndEvent * _Nullable end;

/**
 <p>The Progress Event.</p>
 */
@property (nonatomic, strong) AWSS3ProgressEvent * _Nullable progress;

/**
 <p>The Records Event.</p>
 */
@property (nonatomic, strong) AWSS3RecordsEvent * _Nullable records;

/**
 <p>The Stats Event.</p>
 */
@property (nonatomic, strong) AWSS3StatsEvent * _Nullable stats;

@end

/**
 
 */
@interface AWSS3SelectObjectContentOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3SelectObjectContentEventStream * _Nullable payload;

@end

/**
 <p>Request to filter the contents of an Amazon S3 object based on a simple Structured Query Language (SQL) statement. In the request, along with the SQL expression, you must specify a data serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data into records. It returns only records that match the specified SQL expression. You must also specify the data serialization format for the response. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html">S3Select API Documentation</a>.</p>
 Required parameters: [Bucket, Key, Expression, ExpressionType, InputSerialization, OutputSerialization]
 */
@interface AWSS3SelectObjectContentRequest : AWSRequest


/**
 <p>The S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The expression that is used to query the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The type of the provided expression (for example., SQL).</p>
 */
@property (nonatomic, assign) AWSS3ExpressionType expressionType;

/**
 <p>Describes the format of the data in the object that is being queried.</p>
 */
@property (nonatomic, strong) AWSS3InputSerialization * _Nullable inputSerialization;

/**
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Describes the format of the data that you want Amazon S3 to return in response.</p>
 */
@property (nonatomic, strong) AWSS3OutputSerialization * _Nullable outputSerialization;

/**
 <p>Specifies if periodic request progress information should be enabled.</p>
 */
@property (nonatomic, strong) AWSS3RequestProgress * _Nullable requestProgress;

/**
 <p>The SSE Algorithm used to encrypt the object. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>The SSE Customer Key. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>The SSE Customer Key MD5. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html"> Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

@end

/**
 <p>Describes the parameters for Select job types.</p>
 Required parameters: [InputSerialization, ExpressionType, Expression, OutputSerialization]
 */
@interface AWSS3SelectParameters : AWSModel


/**
 <p>The expression that is used to query the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The type of the provided expression (e.g., SQL).</p>
 */
@property (nonatomic, assign) AWSS3ExpressionType expressionType;

/**
 <p>Describes the serialization format of the object.</p>
 */
@property (nonatomic, strong) AWSS3InputSerialization * _Nullable inputSerialization;

/**
 <p>Describes how the results of the Select job are serialized.</p>
 */
@property (nonatomic, strong) AWSS3OutputSerialization * _Nullable outputSerialization;

@end

/**
 <p>Describes the default server-side encryption to apply to new objects in the bucket. If Put Object request does not specify any server-side encryption, this default encryption will be applied.</p>
 Required parameters: [SSEAlgorithm]
 */
@interface AWSS3ServerSideEncryptionByDefault : AWSModel


/**
 <p>KMS master key ID to use for the default encryption. This parameter is allowed if SSEAlgorithm is aws:kms.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSMasterKeyID;

/**
 <p>Server-side encryption algorithm to use for the default encryption.</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption SSEAlgorithm;

@end

/**
 <p>Container for server-side encryption configuration rules. Currently S3 supports one rule only.</p>
 Required parameters: [Rules]
 */
@interface AWSS3ServerSideEncryptionConfiguration : AWSModel


/**
 <p>Container for information about a particular server-side encryption configuration rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3ServerSideEncryptionRule *> * _Nullable rules;

@end

/**
 <p>Container for information about a particular server-side encryption configuration rule.</p>
 */
@interface AWSS3ServerSideEncryptionRule : AWSModel


/**
 <p>Describes the default server-side encryption to apply to new objects in the bucket. If Put Object request does not specify any server-side encryption, this default encryption will be applied.</p>
 */
@property (nonatomic, strong) AWSS3ServerSideEncryptionByDefault * _Nullable applyServerSideEncryptionByDefault;

@end

/**
 <p>A container for filters that define which source objects should be replicated.</p>
 */
@interface AWSS3SourceSelectionCriteria : AWSModel


/**
 <p> A container for filter information for the selection of S3 objects encrypted with AWS KMS. If you include <code>SourceSelectionCriteria</code> in the replication configuration, this element is required. </p>
 */
@property (nonatomic, strong) AWSS3SseKmsEncryptedObjects * _Nullable sseKmsEncryptedObjects;

@end

/**
 <p>A container for filter information for the selection of S3 objects encrypted with AWS KMS.</p>
 Required parameters: [Status]
 */
@interface AWSS3SseKmsEncryptedObjects : AWSModel


/**
 <p> If the status is not <code>Enabled</code>, replication for S3 objects encrypted with AWS KMS is disabled.</p>
 */
@property (nonatomic, assign) AWSS3SseKmsEncryptedObjectsStatus status;

@end

/**
 
 */
@interface AWSS3Stats : AWSModel


/**
 <p>The total number of uncompressed object bytes processed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesProcessed;

/**
 <p>The total number of bytes of records payload data returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesReturned;

/**
 <p>The total number of object bytes scanned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesScanned;

@end

/**
 
 */
@interface AWSS3StatsEvent : AWSModel


/**
 <p>The Stats event details.</p>
 */
@property (nonatomic, strong) AWSS3Stats * _Nullable details;

@end

/**
 
 */
@interface AWSS3StorageClassAnalysis : AWSModel


/**
 <p>A container used to describe how data related to the storage class analysis should be exported.</p>
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysisDataExport * _Nullable dataExport;

@end

/**
 
 */
@interface AWSS3StorageClassAnalysisDataExport : AWSModel


/**
 <p>The place to store the data for an analysis.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsExportDestination * _Nullable destination;

/**
 <p>The version of the output schema to use when exporting data. Must be V_1.</p>
 */
@property (nonatomic, assign) AWSS3StorageClassAnalysisSchemaVersion outputSchemaVersion;

@end

/**
 
 */
@interface AWSS3Tag : AWSModel


/**
 <p>Name of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSS3Tagging : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

@end

/**
 
 */
@interface AWSS3TargetGrant : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3Grantee * _Nullable grantee;

/**
 <p>Logging permissions assigned to the Grantee for the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketLogsPermission permission;

@end

/**
 <p>A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic.when Amazon S3 detects specified events.</p>
 Required parameters: [TopicArn, Events]
 */
@interface AWSS3TopicConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>A container for object key name filtering rules. For information about key name filtering, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 will publish a message when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 
 */
@interface AWSS3TopicConfigurationDeprecated : AWSModel


/**
 <p>Bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Amazon SNS topic to which Amazon S3 will publish a message to report the specified events for the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 
 */
@interface AWSS3Transition : AWSModel


/**
 <p>Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3TransitionStorageClass storageClass;

@end

/**
 
 */
@interface AWSS3UploadPartCopyOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3ReplicatePartResult * _Nullable replicatePartResult;

/**
 <p>The version of the source object that was copied, if you have enabled versioning on the source bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceVersionId;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

@end

/**
 
 */
@interface AWSS3UploadPartCopyRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSource;

/**
 <p>Copies the object if its entity tag (ETag) matches the specified tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfMatch;

/**
 <p>Copies the object if it has been modified since the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfModifiedSince;

/**
 <p>Copies the object if its entity tag (ETag) is different than the specified ETag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfNoneMatch;

/**
 <p>Copies the object if it hasn't been modified since the specified time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfUnmodifiedSince;

/**
 <p>The range of bytes to copy from the source object. The range value must use the form bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example, bytes=0-9 indicates that you want to copy the first ten bytes of the source. You can copy a range only if the source object is greater than 5 GB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceRange;

/**
 <p>Specifies the algorithm to use when decrypting the source object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of part being copied. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Upload ID identifying the multipart upload whose part is being copied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3UploadPartOutput : AWSModel


/**
 <p>Entity tag for the uploaded object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

@end

/**
 
 */
@interface AWSS3UploadPartRequest : AWSRequest


/**
 <p>Object data.</p>
 */
@property (nonatomic, strong) id _Nullable body;

/**
 <p>Name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>The base64-encoded 128-bit MD5 digest of the part data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of part being uploaded. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (e.g., AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Upload ID identifying the multipart upload whose part is being uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3VersioningConfiguration : AWSModel


/**
 <p>Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.</p>
 */
@property (nonatomic, assign) AWSS3MFADelete MFADelete;

/**
 <p>The versioning state of the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketVersioningStatus status;

@end

/**
 
 */
@interface AWSS3WebsiteConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3ErrorDocument * _Nullable errorDocument;

/**
 
 */
@property (nonatomic, strong) AWSS3IndexDocument * _Nullable indexDocument;

/**
 
 */
@property (nonatomic, strong) AWSS3RedirectAllRequestsTo * _Nullable redirectAllRequestsTo;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3RoutingRule *> * _Nullable routingRules;

@end

NS_ASSUME_NONNULL_END
