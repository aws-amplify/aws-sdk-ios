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
    AWSS3BucketLocationConstraintBlank,
    AWSS3BucketLocationConstraintUnknown,
    AWSS3BucketLocationConstraintAFSouth1,
    AWSS3BucketLocationConstraintAPEast1,
    AWSS3BucketLocationConstraintAPNortheast1,
    AWSS3BucketLocationConstraintAPNortheast2,
    AWSS3BucketLocationConstraintAPNortheast3,
    AWSS3BucketLocationConstraintAPSouth1,
    AWSS3BucketLocationConstraintAPSoutheast1,
    AWSS3BucketLocationConstraintAPSoutheast2,
    AWSS3BucketLocationConstraintCACentral1,
    AWSS3BucketLocationConstraintCNNorth1,
    AWSS3BucketLocationConstraintCNNorthwest1,
    AWSS3BucketLocationConstraintEU,
    AWSS3BucketLocationConstraintEUCentral1,
    AWSS3BucketLocationConstraintEUNorth1,
    AWSS3BucketLocationConstraintEUSouth1,
    AWSS3BucketLocationConstraintEUWest1,
    AWSS3BucketLocationConstraintEUWest2,
    AWSS3BucketLocationConstraintEUWest3,
    AWSS3BucketLocationConstraintMESouth1,
    AWSS3BucketLocationConstraintSAEast1,
    AWSS3BucketLocationConstraintUSEast2,
    AWSS3BucketLocationConstraintUSGovEast1,
    AWSS3BucketLocationConstraintUSGovWest1,
    AWSS3BucketLocationConstraintUSWest1,
    AWSS3BucketLocationConstraintUSWest2,
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
    AWSS3EventS3ObjectRestore,
    AWSS3EventS3ObjectRestorePost,
    AWSS3EventS3ObjectRestoreCompleted,
    AWSS3EventS3Replication,
    AWSS3EventS3ReplicationOperationFailedReplication,
    AWSS3EventS3ReplicationOperationNotTracked,
    AWSS3EventS3ReplicationOperationMissedThreshold,
    AWSS3EventS3ReplicationOperationReplicatedAfterThreshold,
};

typedef NS_ENUM(NSInteger, AWSS3ExistingObjectReplicationStatus) {
    AWSS3ExistingObjectReplicationStatusUnknown,
    AWSS3ExistingObjectReplicationStatusEnabled,
    AWSS3ExistingObjectReplicationStatusDisabled,
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
    AWSS3InventoryOptionalFieldIntelligentTieringAccessTier,
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

typedef NS_ENUM(NSInteger, AWSS3MetricsStatus) {
    AWSS3MetricsStatusUnknown,
    AWSS3MetricsStatusEnabled,
    AWSS3MetricsStatusDisabled,
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

typedef NS_ENUM(NSInteger, AWSS3ObjectOwnership) {
    AWSS3ObjectOwnershipUnknown,
    AWSS3ObjectOwnershipBucketOwnerPreferred,
    AWSS3ObjectOwnershipObjectWriter,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectStorageClass) {
    AWSS3ObjectStorageClassUnknown,
    AWSS3ObjectStorageClassStandard,
    AWSS3ObjectStorageClassReducedRedundancy,
    AWSS3ObjectStorageClassGlacier,
    AWSS3ObjectStorageClassStandardIa,
    AWSS3ObjectStorageClassOnezoneIa,
    AWSS3ObjectStorageClassIntelligentTiering,
    AWSS3ObjectStorageClassDeepArchive,
    AWSS3ObjectStorageClassOutposts,
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

typedef NS_ENUM(NSInteger, AWSS3ReplicationTimeStatus) {
    AWSS3ReplicationTimeStatusUnknown,
    AWSS3ReplicationTimeStatusEnabled,
    AWSS3ReplicationTimeStatusDisabled,
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
    AWSS3StorageClassDeepArchive,
    AWSS3StorageClassOutposts,
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
    AWSS3TransitionStorageClassDeepArchive,
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
@class AWSS3DeleteBucketOwnershipControlsRequest;
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
@class AWSS3ExistingObjectReplication;
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
@class AWSS3GetBucketOwnershipControlsOutput;
@class AWSS3GetBucketOwnershipControlsRequest;
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
@class AWSS3Metrics;
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
@class AWSS3OwnershipControls;
@class AWSS3OwnershipControlsRule;
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
@class AWSS3PutBucketOwnershipControlsRequest;
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
@class AWSS3ReplicationTime;
@class AWSS3ReplicationTimeValue;
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
@class AWSS3ScanRange;
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
 <p>Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config"> Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSS3AbortIncompleteMultipartUpload : AWSModel


/**
 <p>Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload.</p>
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
 <p>The bucket name to which the upload was taking place. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Key of the object for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Upload ID that identifies the multipart upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>Configures the transfer acceleration state for an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html">Amazon S3 Transfer Acceleration</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSS3AccelerateConfiguration : AWSModel


/**
 <p>Specifies the transfer acceleration status of the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketAccelerateStatus status;

@end

/**
 <p>Contains the elements that set the ACL permissions for an object per grantee.</p>
 */
@interface AWSS3AccessControlPolicy : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 <p>Container for the bucket owner's display name and ID.</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 <p>A container for information about access control for replicas.</p>
 Required parameters: [Owner]
 */
@interface AWSS3AccessControlTranslation : AWSModel


/**
 <p>Specifies the replica ownership. For default and valid values, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT bucket replication</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 */
@property (nonatomic, assign) AWSS3OwnerOverride owner;

@end

/**
 <p>A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates in any combination, and an object must match all of the predicates for the filter to apply.</p>
 */
@interface AWSS3AnalyticsAndOperator : AWSModel


/**
 <p>The prefix to use when evaluating an AND predicate: The prefix that an object must have to be included in the metrics results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The list of tags to use when evaluating an AND predicate.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 <p> Specifies the configuration and any analyses for the analytics filter of an Amazon S3 bucket.</p>
 Required parameters: [Id, StorageClassAnalysis]
 */
@interface AWSS3AnalyticsConfiguration : AWSModel


/**
 <p>The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsFilter * _Nullable filter;

/**
 <p>The ID that identifies the analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p> Contains data related to access patterns to be collected and made available to analyze the tradeoffs between different storage classes. </p>
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysis * _Nullable storageClassAnalysis;

@end

/**
 <p>Where to publish the analytics results.</p>
 Required parameters: [S3BucketDestination]
 */
@interface AWSS3AnalyticsExportDestination : AWSModel


/**
 <p>A destination signifying output to an S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsS3BucketDestination * _Nullable s3BucketDestination;

@end

/**
 <p>The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.</p>
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
 <p>Contains information about where to publish the analytics results.</p>
 Required parameters: [Format, Bucket]
 */
@interface AWSS3AnalyticsS3BucketDestination : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the bucket to which data is exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is not validated before exporting data.</p><note><p> Although this value is optional, we strongly recommend that you set it to help prevent problems if the destination bucket ownership changes. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable bucketAccountId;

/**
 <p>Specifies the file format used when exporting data to Amazon S3.</p>
 */
@property (nonatomic, assign) AWSS3AnalyticsS3ExportFileFormat format;

/**
 <p>The prefix to use when exporting data. The prefix is prepended to all results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p> In terms of implementation, a Bucket is a resource. An Amazon S3 bucket name is globally unique, and the namespace is shared by all AWS accounts. </p>
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
 <p>Specifies the lifecycle configuration for objects in an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html">Object Lifecycle Management</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 Required parameters: [Rules]
 */
@interface AWSS3BucketLifecycleConfiguration : AWSModel


/**
 <p>A lifecycle rule for individual objects in an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3LifecycleRule *> * _Nullable rules;

@end

/**
 <p>Container for logging status information.</p>
 */
@interface AWSS3BucketLoggingStatus : AWSModel


/**
 <p>Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html">PUT Bucket logging</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 */
@property (nonatomic, strong) AWSS3LoggingEnabled * _Nullable loggingEnabled;

@end

/**
 <p>Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 Required parameters: [CORSRules]
 */
@interface AWSS3CORSConfiguration : AWSModel


/**
 <p>A set of origins and methods (cross-origin access that you want to allow). You can add up to 100 rules to the configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CORSRule *> * _Nullable CORSRules;

@end

/**
 <p>Specifies a cross-origin access rule for an Amazon S3 bucket.</p>
 Required parameters: [AllowedMethods, AllowedOrigins]
 */
@interface AWSS3CORSRule : AWSModel


/**
 <p>Headers that are specified in the <code>Access-Control-Request-Headers</code> header. These headers are allowed in a preflight OPTIONS request. In response to any preflight OPTIONS request, Amazon S3 returns any requested headers that are allowed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedHeaders;

/**
 <p>An HTTP method that you allow the origin to execute. Valid values are <code>GET</code>, <code>PUT</code>, <code>HEAD</code>, <code>POST</code>, and <code>DELETE</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedMethods;

/**
 <p>One or more origins you want customers to be able to access the bucket from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOrigins;

/**
 <p>One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript <code>XMLHttpRequest</code> object).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exposeHeaders;

/**
 <p>The time in seconds that your browser is to cache the preflight response for the specified resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAgeSeconds;

@end

/**
 <p>Describes how an uncompressed comma-separated values (CSV)-formatted input object is formatted.</p>
 */
@interface AWSS3CSVInput : AWSModel


/**
 <p>Specifies that CSV field values may contain quoted record delimiters and such records should be allowed. Default value is FALSE. Setting this value to TRUE may lower performance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowQuotedRecordDelimiter;

/**
 <p>A single character used to indicate that a row should be ignored when the character is present at the start of that row. You can specify any character to indicate a comment line.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comments;

/**
 <p>A single character used to separate individual fields in a record. You can specify an arbitrary delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldDelimiter;

/**
 <p>Describes the first line of input. Valid values are:</p><ul><li><p><code>NONE</code>: First line is not a header.</p></li><li><p><code>IGNORE</code>: First line is a header, but you can't use the header values to indicate the column in an expression. You can use column position (such as _1, _2, …) to indicate the column (<code>SELECT s._1 FROM OBJECT s</code>).</p></li><li><p><code>Use</code>: First line is a header, and you can use the header value to identify a column in an expression (<code>SELECT "name" FROM OBJECT</code>). </p></li></ul>
 */
@property (nonatomic, assign) AWSS3FileHeaderInfo fileHeaderInfo;

/**
 <p>A single character used for escaping when the field delimiter is part of the value. For example, if the value is <code>a, b</code>, Amazon S3 wraps this field value in quotation marks, as follows: <code>" a , b "</code>.</p><p>Type: String</p><p>Default: <code>"</code></p><p>Ancestors: <code>CSV</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteCharacter;

/**
 <p>A single character used for escaping the quotation mark character inside an already escaped value. For example, the value """ a , b """ is parsed as " a , b ".</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteEscapeCharacter;

/**
 <p>A single character used to separate individual records in the input. Instead of the default value, you can specify an arbitrary delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 <p>Describes how uncompressed comma-separated values (CSV)-formatted results are formatted.</p>
 */
@interface AWSS3CSVOutput : AWSModel


/**
 <p>The value used to separate individual fields in a record. You can specify an arbitrary delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldDelimiter;

/**
 <p>A single character used for escaping when the field delimiter is part of the value. For example, if the value is <code>a, b</code>, Amazon S3 wraps this field value in quotation marks, as follows: <code>" a , b "</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteCharacter;

/**
 <p>The single character used for escaping the quote character inside an already escaped value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable quoteEscapeCharacter;

/**
 <p>Indicates whether to use quotation marks around output fields. </p><ul><li><p><code>ALWAYS</code>: Always use quotation marks for output fields.</p></li><li><p><code>ASNEEDED</code>: Use quotation marks for output fields when needed.</p></li></ul>
 */
@property (nonatomic, assign) AWSS3QuoteFields quoteFields;

/**
 <p>A single character used to separate individual records in the output. Instead of the default value, you can specify an arbitrary delimiter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 <p>Container for specifying the AWS Lambda notification configuration.</p>
 */
@interface AWSS3CloudFunctionConfiguration : AWSModel


/**
 <p>Lambda cloud function ARN that Amazon S3 can invoke when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFunction;

/**
 <p>The bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 <p>Bucket events for which to send notifications.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The role supporting the invocation of the Lambda function</p>
 */
@property (nonatomic, strong) NSString * _Nullable invocationRole;

@end

/**
 <p>Container for all (if there are any) keys between Prefix and the next occurrence of the string specified by a delimiter. CommonPrefixes lists keys that act like subdirectories in the directory specified by Prefix. For example, if the prefix is notes/ and the delimiter is a slash (/) as in notes/summer/july, the common prefix is notes/summer/. </p>
 */
@interface AWSS3CommonPrefix : AWSModel


/**
 <p>Container for the specified common prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3CompleteMultipartUploadOutput : AWSModel


/**
 <p>The name of the bucket that contains the newly created object.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Entity tag that identifies the newly created object's data. Objects with different object data will have different entity tags. The entity tag is an opaque string. The entity tag may or may not be an MD5 digest of the object data. If the entity tag is not an MD5 digest of the object data, it will contain one or more nonhexadecimal characters and/or will consist of less than 32 or more than 32 hexadecimal digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 <p>The object key of the newly created object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The URI that identifies the newly created object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>If you specified server-side encryption either with an Amazon S3-managed encryption key or an AWS KMS customer master key (CMK) in your initiate multipart upload request, the response includes this header. It confirms the encryption algorithm that Amazon S3 used to encrypt the object.</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Version ID of the newly created object, in case the bucket has versioning turned on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3CompleteMultipartUploadRequest : AWSRequest


/**
 <p>Name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The container for the multipart upload request information.</p>
 */
@property (nonatomic, strong) AWSS3CompletedMultipartUpload * _Nullable multipartUpload;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>ID for the initiated multipart upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>The container for the completed multipart upload details.</p>
 */
@interface AWSS3CompletedMultipartUpload : AWSModel


/**
 <p>Array of CompletedPart data types.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CompletedPart *> * _Nullable parts;

@end

/**
 <p>Details of the parts that were uploaded.</p>
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
 <p>A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the <code>/docs</code> folder, redirect to the <code>/documents</code> folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.</p>
 */
@interface AWSS3Condition : AWSModel


/**
 <p>The HTTP error code when the redirect is applied. In the event of an error, if the error code equals this value, then the specified redirect is applied. Required when parent element <code>Condition</code> is specified and sibling <code>KeyPrefixEquals</code> is not specified. If both are specified, then both must be true for the redirect to be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable httpErrorCodeReturnedEquals;

/**
 <p>The object key name prefix when the redirect is applied. For example, to redirect requests for <code>ExamplePage.html</code>, the key prefix will be <code>ExamplePage.html</code>. To redirect request for all pages with the prefix <code>docs/</code>, the key prefix will be <code>/docs</code>, which identifies all objects in the <code>docs/</code> folder. Required when the parent element <code>Condition</code> is specified and sibling <code>HttpErrorCodeReturnedEquals</code> is not specified. If both conditions are specified, both must be true for the redirect to be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPrefixEquals;

@end

/**
 <p/>
 */
@interface AWSS3ContinuationEvent : AWSModel


@end

/**
 
 */
@interface AWSS3ReplicateObjectOutput : AWSModel


/**
 <p>Container for all response elements.</p>
 */
@property (nonatomic, strong) AWSS3ReplicateObjectResult * _Nullable replicateObjectResult;

/**
 <p>Version of the copied object in the destination bucket.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
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
 <p>The canned ACL to apply to the object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 <p>The name of the destination bucket.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
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
 <p>Specifies the source object for the copy operation. You specify the value in one of two formats, depending on whether you want to access the source object through an <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access point</a>:</p><ul><li><p>For objects not accessed through an access point, specify the name of the source bucket and the key of the source object, separated by a slash (/). For example, to copy the object <code>reports/january.pdf</code> from the bucket <code>awsexamplebucket</code>, use <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL encoded.</p></li><li><p>For objects accessed through access points, specify the Amazon Resource Name (ARN) of the object as accessed through the access point, in the format <code>arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;</code>. For example, to copy the object <code>reports/january.pdf</code> through access point <code>my-access-point</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>. The value must be URL encoded.</p><note><p>Amazon S3 supports copy operations using access points only when the source and destination buckets are in the same AWS Region.</p></note><p>Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object as accessed in the format <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;</code>. For example, to copy the object <code>reports/january.pdf</code> through outpost <code>my-outpost</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>. The value must be URL encoded. </p></li></ul><p>To copy a specific version of an object, append <code>?versionId=&lt;version-id&gt;</code> to the value (for example, <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>). If you don't specify a version ID, Amazon S3 copies the latest version of the source object.</p>
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
 <p>Specifies the algorithm to use when decrypting the source object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 <p>The account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedSourceBucketOwner;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 <p>The key of the destination object.</p>
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
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. For information about configuring using any of the officially supported AWS SDKs and AWS CLI, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying the Signature Version in Request Authentication</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The STANDARD storage class provides high durability and high availability. Depending on performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object destination object this value must be used in conjunction with the <code>TaggingDirective</code>. The tag-set must be encoded as URL Query parameters.</p>
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
 <p>Container for all response elements.</p>
 */
@interface AWSS3ReplicateObjectResult : AWSModel


/**
 <p>Returns the ETag of the new object. The ETag reflects only changes to the contents of an object, not its metadata. The source and destination ETag is identical for a successfully copied object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Returns the date that the object was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

@end

/**
 <p>Container for all response elements.</p>
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
 <p>The configuration information for the bucket.</p>
 */
@interface AWSS3CreateBucketConfiguration : AWSModel


/**
 <p>Specifies the Region where the bucket will be created. If you don't specify a Region, the bucket is created in the US East (N. Virginia) Region (us-east-1).</p>
 */
@property (nonatomic, assign) AWSS3BucketLocationConstraint locationConstraint;

@end

/**
 
 */
@interface AWSS3CreateBucketOutput : AWSModel


/**
 <p>Specifies the Region where the bucket will be created. If you are creating a bucket on the US East (N. Virginia) Region (us-east-1), you do not need to specify the location.</p>
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
 <p>The name of the bucket to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The configuration information for the bucket.</p>
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
 <p>If the bucket has a lifecycle rule configured with an action to abort incomplete multipart uploads and the prefix in the lifecycle rule matches the object name in the request, the response includes this header. The header indicates when the initiated multipart upload becomes eligible for an abort operation. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config"> Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.</p><p>The response also includes the <code>x-amz-abort-rule-id</code> header that provides the ID of the lifecycle configuration rule that defines this action.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 <p>This header is returned along with the <code>x-amz-abort-date</code> header. It identifies the applicable lifecycle configuration rule that defines the action to abort incomplete multipart uploads.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 <p>The name of the bucket to which the multipart upload was initiated. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
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
 <p>The canned ACL to apply to the object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 <p>The name of the bucket to which to initiate the upload</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The date and time at which the object is no longer cacheable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 <p>Object key for which the multipart upload is to be initiated.</p>
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
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>Specifies the ID of the symmetric customer managed AWS KMS CMK to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. For information about configuring using any of the officially supported AWS SDKs and AWS CLI, see <a href="https://docs.aws.amazon.com/http:/docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version">Specifying the Signature Version in Request Authentication</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The STANDARD storage class provides high durability and high availability. Depending on performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters.</p>
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
 <p>Container for the objects to delete.</p>
 Required parameters: [Objects]
 */
@interface AWSS3Remove : AWSModel


/**
 <p>The objects to delete.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID that identifies the analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketCorsRequest : AWSRequest


/**
 <p>Specifies the bucket whose <code>cors</code> configuration is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketEncryptionRequest : AWSRequest


/**
 <p>The name of the bucket containing the server-side encryption configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketInventoryConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the inventory configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketLifecycleRequest : AWSRequest


/**
 <p>The bucket name of the lifecycle to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketMetricsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket containing the metrics configuration to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3DeleteBucketOwnershipControlsRequest : AWSRequest


/**
 <p>The Amazon S3 bucket whose <code>OwnershipControls</code> you want to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketPolicyRequest : AWSRequest


/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketReplicationRequest : AWSRequest


/**
 <p> The bucket name. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketRequest : AWSRequest


/**
 <p>Specifies the bucket being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketTaggingRequest : AWSRequest


/**
 <p>The bucket that has the tag set to be removed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3DeleteBucketWebsiteRequest : AWSRequest


/**
 <p>The bucket name for which you want to remove the website configuration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 <p>Information about the delete marker.</p>
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
 <p>The account that created the delete marker.&gt;</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>Version ID of an object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Specifies whether Amazon S3 replicates the delete markers. If you specify a <code>Filter</code>, you must specify this element. However, in the latest version of replication configuration (when <code>Filter</code> is specified), Amazon S3 doesn't replicate delete markers. Therefore, the <code>DeleteMarkerReplication</code> element can contain only &lt;Status&gt;Disabled&lt;/Status&gt;. For an example configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-config-min-rule-config">Basic Rule Configuration</a>. </p><note><p> If you don't specify the <code>Filter</code> element, Amazon S3 assumes that the replication configuration is the earlier version, V1. In the earlier version, Amazon S3 handled replication of delete markers differently. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations">Backward Compatibility</a>.</p></note>
 */
@interface AWSS3DeleteMarkerReplication : AWSModel


/**
 <p>Indicates whether to replicate delete markers.</p><note><p> In the current implementation, Amazon S3 doesn't replicate the delete markers. The status must be <code>Disabled</code>. </p></note>
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
 <p>The bucket name of the bucket containing the object. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Key name of the object to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. Required to permanently delete a versioned object if versioning is configured with MFA delete enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The bucket name containing the objects from which to remove the tags. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Name of the object key.</p>
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
 <p>Container element for a successful delete. It identifies the object that was successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3DeletedObject *> * _Nullable deleted;

/**
 <p>Container for a failed delete operation that describes the object that Amazon S3 attempted to delete and the error it encountered.</p>
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
 <p>The bucket name containing the objects to delete. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies whether you want to delete this object even if it has a Governance-type Object Lock in place. You must have sufficient permissions to perform this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 <p>Container for the request.</p>
 */
@property (nonatomic, strong) AWSS3Remove * _Nullable remove;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. Required to permanently delete a versioned object if versioning is configured with MFA delete enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 <p>Information about the deleted object.</p>
 */
@interface AWSS3DeletedObject : AWSModel


/**
 <p>Specifies whether the versioned object that was permanently deleted was (true) or was not (false) a delete marker. In a simple DELETE, this header indicates whether (true) or not (false) a delete marker was created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 <p>The version ID of the delete marker created as a result of the DELETE operation. If you delete a specific object version, the value returned by this header is the version ID of the object version deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deleteMarkerVersionId;

/**
 <p>The name of the deleted object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The version ID of the deleted object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Specifies information about where to publish analysis or configuration results for an Amazon S3 bucket and S3 Replication Time Control (S3 RTC).</p>
 Required parameters: [Bucket]
 */
@interface AWSS3Destination : AWSModel


/**
 <p>Specify this only in a cross-account scenario (where source and destination bucket owners are not the same), and you want to change replica ownership to the AWS account that owns the destination bucket. If this is not specified in the replication configuration, the replicas are owned by same AWS account that owns the source object.</p>
 */
@property (nonatomic, strong) AWSS3AccessControlTranslation * _Nullable accessControlTranslation;

/**
 <p>Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 to change replica ownership to the AWS account that owns the destination bucket by specifying the <code>AccessControlTranslation</code> property, this is the account ID of the destination bucket owner. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-change-owner.html">Replication Additional Configuration: Changing the Replica Owner</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p> The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A container that provides information about encryption. If <code>SourceSelectionCriteria</code> is specified, you must specify this element.</p>
 */
@property (nonatomic, strong) AWSS3EncryptionConfiguration * _Nullable encryptionConfiguration;

/**
 <p> A container specifying replication metrics-related settings enabling metrics and Amazon S3 events for S3 Replication Time Control (S3 RTC). Must be specified together with a <code>ReplicationTime</code> block. </p>
 */
@property (nonatomic, strong) AWSS3Metrics * _Nullable metrics;

/**
 <p> A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled and the time when all objects and operations on objects must be replicated. Must be specified together with a <code>Metrics</code> block. </p>
 */
@property (nonatomic, strong) AWSS3ReplicationTime * _Nullable replicationTime;

/**
 <p> The storage class to use when replicating objects, such as S3 Standard or reduced redundancy. By default, Amazon S3 uses the storage class of the source object to create the object replica. </p><p>For valid values, see the <code>StorageClass</code> element of the <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html">PUT Bucket replication</a> action in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

@end

/**
 <p>Contains the type of server-side encryption used.</p>
 Required parameters: [EncryptionType]
 */
@interface AWSS3Encryption : AWSModel


/**
 <p>The server-side encryption algorithm used when storing job results in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption encryptionType;

/**
 <p>If the encryption type is <code>aws:kms</code>, this optional value can be used to specify the encryption context for the restore results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSContext;

/**
 <p>If the encryption type is <code>aws:kms</code>, this optional value specifies the ID of the symmetric customer managed AWS KMS CMK to use for encryption of job results. Amazon S3 only supports symmetric CMKs. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

@end

/**
 <p>Specifies encryption-related information for an Amazon S3 bucket that is a destination for replicated objects.</p>
 */
@interface AWSS3EncryptionConfiguration : AWSModel


/**
 <p>Specifies the ID (Key ARN or Alias ARN) of the customer managed customer master key (CMK) stored in AWS Key Management Service (KMS) for the destination bucket. Amazon S3 uses this key to encrypt replica objects. Amazon S3 only supports symmetric customer managed CMKs. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicaKmsKeyID;

@end

/**
 <p>A message that indicates the request is complete and no more messages will be sent. You should not assume that the request is complete until the client receives an <code>EndEvent</code>.</p>
 */
@interface AWSS3EndEvent : AWSModel


@end

/**
 <p>Container for all error elements.</p>
 */
@interface AWSS3Error : AWSModel


/**
 <p>The error code is a string that uniquely identifies an error condition. It is meant to be read and understood by programs that detect and handle errors by type. </p><p class="title"><b>Amazon S3 error codes</b></p><ul><li><ul><li><p><i>Code:</i> AccessDenied </p></li><li><p><i>Description:</i> Access Denied</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> AccountProblem</p></li><li><p><i>Description:</i> There is a problem with your AWS account that prevents the operation from completing successfully. Contact AWS Support for further assistance.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> AllAccessDisabled</p></li><li><p><i>Description:</i> All access to this Amazon S3 resource has been disabled. Contact AWS Support for further assistance.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> AmbiguousGrantByEmailAddress</p></li><li><p><i>Description:</i> The email address you provided is associated with more than one account.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> AuthorizationHeaderMalformed</p></li><li><p><i>Description:</i> The authorization header you provided is invalid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>HTTP Status Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> BadDigest</p></li><li><p><i>Description:</i> The Content-MD5 you specified did not match what we received.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> BucketAlreadyExists</p></li><li><p><i>Description:</i> The requested bucket name is not available. The bucket namespace is shared by all users of the system. Please select a different name and try again.</p></li><li><p><i>HTTP Status Code:</i> 409 Conflict</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> BucketAlreadyOwnedByYou</p></li><li><p><i>Description:</i> The bucket you tried to create already exists, and you own it. Amazon S3 returns this error in all AWS Regions except in the North Virginia Region. For legacy compatibility, if you re-create an existing bucket that you already own in the North Virginia Region, Amazon S3 returns 200 OK and resets the bucket access control lists (ACLs).</p></li><li><p><i>Code:</i> 409 Conflict (in all Regions except the North Virginia Region) </p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> BucketNotEmpty</p></li><li><p><i>Description:</i> The bucket you tried to delete is not empty.</p></li><li><p><i>HTTP Status Code:</i> 409 Conflict</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> CredentialsNotSupported</p></li><li><p><i>Description:</i> This request does not support credentials.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> CrossLocationLoggingProhibited</p></li><li><p><i>Description:</i> Cross-location logging not allowed. Buckets in one geographic location cannot log information to a bucket in another location.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> EntityTooSmall</p></li><li><p><i>Description:</i> Your proposed upload is smaller than the minimum allowed object size.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> EntityTooLarge</p></li><li><p><i>Description:</i> Your proposed upload exceeds the maximum allowed object size.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> ExpiredToken</p></li><li><p><i>Description:</i> The provided token has expired.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> IllegalVersioningConfigurationException </p></li><li><p><i>Description:</i> Indicates that the versioning configuration specified in the request is invalid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> IncompleteBody</p></li><li><p><i>Description:</i> You did not provide the number of bytes specified by the Content-Length HTTP header</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> IncorrectNumberOfFilesInPostRequest</p></li><li><p><i>Description:</i> POST requires exactly one file upload per request.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InlineDataTooLarge</p></li><li><p><i>Description:</i> Inline data exceeds the maximum allowed size.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InternalError</p></li><li><p><i>Description:</i> We encountered an internal error. Please try again.</p></li><li><p><i>HTTP Status Code:</i> 500 Internal Server Error</p></li><li><p><i>SOAP Fault Code Prefix:</i> Server</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidAccessKeyId</p></li><li><p><i>Description:</i> The AWS access key ID you provided does not exist in our records.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidAddressingHeader</p></li><li><p><i>Description:</i> You must specify the Anonymous role.</p></li><li><p><i>HTTP Status Code:</i> N/A</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidArgument</p></li><li><p><i>Description:</i> Invalid Argument</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidBucketName</p></li><li><p><i>Description:</i> The specified bucket is not valid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidBucketState</p></li><li><p><i>Description:</i> The request is not valid with the current state of the bucket.</p></li><li><p><i>HTTP Status Code:</i> 409 Conflict</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidDigest</p></li><li><p><i>Description:</i> The Content-MD5 you specified is not valid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidEncryptionAlgorithmError</p></li><li><p><i>Description:</i> The encryption request you specified is not valid. The valid value is AES256.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidLocationConstraint</p></li><li><p><i>Description:</i> The specified location constraint is not valid. For more information about Regions, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro">How to Select a Region for Your Buckets</a>. </p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidObjectState</p></li><li><p><i>Description:</i> The operation is not valid for the current state of the object.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidPart</p></li><li><p><i>Description:</i> One or more of the specified parts could not be found. The part might not have been uploaded, or the specified entity tag might not have matched the part's entity tag.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidPartOrder</p></li><li><p><i>Description:</i> The list of parts was not in ascending order. Parts list must be specified in order by part number.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidPayer</p></li><li><p><i>Description:</i> All access to this object has been disabled. Please contact AWS Support for further assistance.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidPolicyDocument</p></li><li><p><i>Description:</i> The content of the form does not meet the conditions specified in the policy document.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRange</p></li><li><p><i>Description:</i> The requested range cannot be satisfied.</p></li><li><p><i>HTTP Status Code:</i> 416 Requested Range Not Satisfiable</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Please use AWS4-HMAC-SHA256.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> SOAP requests must be made over an HTTPS connection.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Acceleration is not supported for buckets with non-DNS compliant names.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Acceleration is not supported for buckets with periods (.) in their names.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Accelerate endpoint only supports virtual style requests.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Accelerate is not configured on this bucket.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Accelerate is disabled on this bucket.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Acceleration is not supported on this bucket. Contact AWS Support for more information.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidRequest</p></li><li><p><i>Description:</i> Amazon S3 Transfer Acceleration cannot be enabled on this bucket. Contact AWS Support for more information.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>Code:</i> N/A</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidSecurity</p></li><li><p><i>Description:</i> The provided security credentials are not valid.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidSOAPRequest</p></li><li><p><i>Description:</i> The SOAP request body is invalid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidStorageClass</p></li><li><p><i>Description:</i> The storage class you specified is not valid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidTargetBucketForLogging</p></li><li><p><i>Description:</i> The target bucket for logging does not exist, is not owned by you, or does not have the appropriate grants for the log-delivery group. </p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidToken</p></li><li><p><i>Description:</i> The provided token is malformed or otherwise invalid.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> InvalidURI</p></li><li><p><i>Description:</i> Couldn't parse the specified URI.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> KeyTooLongError</p></li><li><p><i>Description:</i> Your key is too long.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MalformedACLError</p></li><li><p><i>Description:</i> The XML you provided was not well-formed or did not validate against our published schema.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MalformedPOSTRequest </p></li><li><p><i>Description:</i> The body of your POST request is not well-formed multipart/form-data.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MalformedXML</p></li><li><p><i>Description:</i> This happens when the user sends malformed XML (XML that doesn't conform to the published XSD) for the configuration. The error message is, "The XML you provided was not well-formed or did not validate against our published schema." </p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MaxMessageLengthExceeded</p></li><li><p><i>Description:</i> Your request was too big.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MaxPostPreDataLengthExceededError</p></li><li><p><i>Description:</i> Your POST request fields preceding the upload file were too large.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MetadataTooLarge</p></li><li><p><i>Description:</i> Your metadata headers exceed the maximum allowed metadata size.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MethodNotAllowed</p></li><li><p><i>Description:</i> The specified method is not allowed against this resource.</p></li><li><p><i>HTTP Status Code:</i> 405 Method Not Allowed</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MissingAttachment</p></li><li><p><i>Description:</i> A SOAP attachment was expected, but none were found.</p></li><li><p><i>HTTP Status Code:</i> N/A</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MissingContentLength</p></li><li><p><i>Description:</i> You must provide the Content-Length HTTP header.</p></li><li><p><i>HTTP Status Code:</i> 411 Length Required</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MissingRequestBodyError</p></li><li><p><i>Description:</i> This happens when the user sends an empty XML document as a request. The error message is, "Request body is empty." </p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MissingSecurityElement</p></li><li><p><i>Description:</i> The SOAP 1.1 request is missing a security element.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> MissingSecurityHeader</p></li><li><p><i>Description:</i> Your request is missing a required header.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoLoggingStatusForKey</p></li><li><p><i>Description:</i> There is no such thing as a logging status subresource for a key.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchBucket</p></li><li><p><i>Description:</i> The specified bucket does not exist.</p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchBucketPolicy</p></li><li><p><i>Description:</i> The specified bucket does not have a bucket policy.</p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchKey</p></li><li><p><i>Description:</i> The specified key does not exist.</p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchLifecycleConfiguration</p></li><li><p><i>Description:</i> The lifecycle configuration does not exist. </p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchUpload</p></li><li><p><i>Description:</i> The specified multipart upload does not exist. The upload ID might be invalid, or the multipart upload might have been aborted or completed.</p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NoSuchVersion </p></li><li><p><i>Description:</i> Indicates that the version ID specified in the request does not match an existing version.</p></li><li><p><i>HTTP Status Code:</i> 404 Not Found</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> NotImplemented</p></li><li><p><i>Description:</i> A header you provided implies functionality that is not implemented.</p></li><li><p><i>HTTP Status Code:</i> 501 Not Implemented</p></li><li><p><i>SOAP Fault Code Prefix:</i> Server</p></li></ul></li><li><ul><li><p><i>Code:</i> NotSignedUp</p></li><li><p><i>Description:</i> Your account is not signed up for the Amazon S3 service. You must sign up before you can use Amazon S3. You can sign up at the following URL: https://aws.amazon.com/s3</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> OperationAborted</p></li><li><p><i>Description:</i> A conflicting conditional operation is currently in progress against this resource. Try again.</p></li><li><p><i>HTTP Status Code:</i> 409 Conflict</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> PermanentRedirect</p></li><li><p><i>Description:</i> The bucket you are attempting to access must be addressed using the specified endpoint. Send all future requests to this endpoint.</p></li><li><p><i>HTTP Status Code:</i> 301 Moved Permanently</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> PreconditionFailed</p></li><li><p><i>Description:</i> At least one of the preconditions you specified did not hold.</p></li><li><p><i>HTTP Status Code:</i> 412 Precondition Failed</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> Redirect</p></li><li><p><i>Description:</i> Temporary redirect.</p></li><li><p><i>HTTP Status Code:</i> 307 Moved Temporarily</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> RestoreAlreadyInProgress</p></li><li><p><i>Description:</i> Object restore is already in progress.</p></li><li><p><i>HTTP Status Code:</i> 409 Conflict</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> RequestIsNotMultiPartContent</p></li><li><p><i>Description:</i> Bucket POST must be of the enclosure-type multipart/form-data.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> RequestTimeout</p></li><li><p><i>Description:</i> Your socket connection to the server was not read from or written to within the timeout period.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> RequestTimeTooSkewed</p></li><li><p><i>Description:</i> The difference between the request time and the server's time is too large.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> RequestTorrentOfBucketError</p></li><li><p><i>Description:</i> Requesting the torrent file of a bucket is not permitted.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> SignatureDoesNotMatch</p></li><li><p><i>Description:</i> The request signature we calculated does not match the signature you provided. Check your AWS secret access key and signing method. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST Authentication</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/SOAPAuthentication.html">SOAP Authentication</a> for details.</p></li><li><p><i>HTTP Status Code:</i> 403 Forbidden</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> ServiceUnavailable</p></li><li><p><i>Description:</i> Reduce your request rate.</p></li><li><p><i>HTTP Status Code:</i> 503 Service Unavailable</p></li><li><p><i>SOAP Fault Code Prefix:</i> Server</p></li></ul></li><li><ul><li><p><i>Code:</i> SlowDown</p></li><li><p><i>Description:</i> Reduce your request rate.</p></li><li><p><i>HTTP Status Code:</i> 503 Slow Down</p></li><li><p><i>SOAP Fault Code Prefix:</i> Server</p></li></ul></li><li><ul><li><p><i>Code:</i> TemporaryRedirect</p></li><li><p><i>Description:</i> You are being redirected to the bucket while DNS updates.</p></li><li><p><i>HTTP Status Code:</i> 307 Moved Temporarily</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> TokenRefreshRequired</p></li><li><p><i>Description:</i> The provided token must be refreshed.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> TooManyBuckets</p></li><li><p><i>Description:</i> You have attempted to create more buckets than allowed.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> UnexpectedContent</p></li><li><p><i>Description:</i> This request does not support content.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> UnresolvableGrantByEmailAddress</p></li><li><p><i>Description:</i> The email address you provided does not match any account on record.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li><li><ul><li><p><i>Code:</i> UserKeyMustBeSpecified</p></li><li><p><i>Description:</i> The bucket POST must contain the specified field name. If it is specified, check the order of the fields.</p></li><li><p><i>HTTP Status Code:</i> 400 Bad Request</p></li><li><p><i>SOAP Fault Code Prefix:</i> Client</p></li></ul></li></ul><p/>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The error key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The error message contains a generic description of the error condition in English. It is intended for a human audience. Simple programs display the message directly to the end user if they encounter an error condition they don't know how or don't care to handle. Sophisticated programs with more exhaustive error handling and proper internationalization are more likely to ignore the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The version ID of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>The error information.</p>
 Required parameters: [Key]
 */
@interface AWSS3ErrorDocument : AWSModel


/**
 <p>The object key name to use when a 4XX class error occurs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 <p>Optional configuration to replicate existing source bucket objects. For more information, see <a href=" https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-what-is-isnot-replicated.html#existing-object-replication">Replicating Existing Objects</a> in the <i>Amazon S3 Developer Guide</i>. </p>
 Required parameters: [Status]
 */
@interface AWSS3ExistingObjectReplication : AWSModel


/**
 <p/>
 */
@property (nonatomic, assign) AWSS3ExistingObjectReplicationStatus status;

@end

/**
 <p>Specifies the Amazon S3 object key name to filter on and whether to filter on the suffix or prefix of the key name.</p>
 */
@interface AWSS3FilterRule : AWSModel


/**
 <p>The object key name prefix or suffix identifying one or more objects to which the filtering rule applies. The maximum length is 1,024 characters. Overlapping prefixes and suffixes are not supported. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3FilterRuleName name;

/**
 <p>The value that the filter searches for in object key names.</p>
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
 <p>The name of the bucket for which the accelerate configuration is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketAclOutput : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 <p>Container for the bucket owner's display name and ID.</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 
 */
@interface AWSS3GetBucketAclRequest : AWSRequest


/**
 <p>Specifies the S3 bucket whose ACL is being requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID that identifies the analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketCorsOutput : AWSModel


/**
 <p>A set of origins and methods (cross-origin access that you want to allow). You can add up to 100 rules to the configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CORSRule *> * _Nullable CORSRules;

@end

/**
 
 */
@interface AWSS3GetBucketCorsRequest : AWSRequest


/**
 <p>The bucket name for which to get the cors configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketEncryptionOutput : AWSModel


/**
 <p>Specifies the default server-side-encryption configuration.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID used to identify the inventory configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleConfigurationOutput : AWSModel


/**
 <p>Container for a lifecycle rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3LifecycleRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket for which to get the lifecycle information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleOutput : AWSModel


/**
 <p>Container for a lifecycle rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Rule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3GetBucketLifecycleRequest : AWSRequest


/**
 <p>The name of the bucket for which to get the lifecycle information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketLocationOutput : AWSModel


/**
 <p>Specifies the Region where the bucket resides. For a list of all the Amazon S3 supported location constraints by Region, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a>. Buckets in Region <code>us-east-1</code> have a LocationConstraint of <code>null</code>.</p>
 */
@property (nonatomic, assign) AWSS3BucketLocationConstraint locationConstraint;

@end

/**
 
 */
@interface AWSS3GetBucketLocationRequest : AWSRequest


/**
 <p>The name of the bucket for which to get the location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketLoggingOutput : AWSModel


/**
 <p>Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html">PUT Bucket logging</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 */
@property (nonatomic, strong) AWSS3LoggingEnabled * _Nullable loggingEnabled;

@end

/**
 
 */
@interface AWSS3GetBucketLoggingRequest : AWSRequest


/**
 <p>The bucket name for which to get the logging information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID used to identify the metrics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketNotificationConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket for which to get the notification configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketOwnershipControlsOutput : AWSModel


/**
 <p>The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter) currently in effect for this Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3OwnershipControls * _Nullable ownershipControls;

@end

/**
 
 */
@interface AWSS3GetBucketOwnershipControlsRequest : AWSRequest


/**
 <p>The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you want to retrieve. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The bucket name for which to get the bucket policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The bucket name for which to get the replication information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The name of the bucket for which to get the payment request configuration</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketTaggingOutput : AWSModel


/**
 <p>Contains the tag set.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

@end

/**
 
 */
@interface AWSS3GetBucketTaggingRequest : AWSRequest


/**
 <p>The name of the bucket for which to get the tagging information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The name of the bucket for which to get the versioning information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetBucketWebsiteOutput : AWSModel


/**
 <p>The object key name of the website error document to use for 4XX class errors.</p>
 */
@property (nonatomic, strong) AWSS3ErrorDocument * _Nullable errorDocument;

/**
 <p>The name of the index document for the website (for example <code>index.html</code>).</p>
 */
@property (nonatomic, strong) AWSS3IndexDocument * _Nullable indexDocument;

/**
 <p>Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3RedirectAllRequestsTo * _Nullable redirectAllRequestsTo;

/**
 <p>Rules that define when a redirect is applied and the redirect behavior.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3RoutingRule *> * _Nullable routingRules;

@end

/**
 
 */
@interface AWSS3GetBucketWebsiteRequest : AWSRequest


/**
 <p>The bucket name for which to get the website configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetObjectAclOutput : AWSModel


/**
 <p>A list of grants.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 <p> Container for the bucket owner's display name and ID.</p>
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
 <p>The bucket name that contains the object for which to get the ACL information. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The key of the object for which to get the ACL information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The bucket name containing the object whose Legal Hold status you want to retrieve. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The key name for the object whose Legal Hold status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The bucket whose Object Lock configuration you want to retrieve.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3GetObjectOutput : AWSModel


/**
 <p>Indicates that a range of bytes was specified.</p>
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
 <p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key-value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>
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
 <p>This is set to the number of metadata entries not returned in <code>x-amz-meta</code> headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 <p>Indicates whether this object has an active legal hold. This field is only returned if you have permission to view an object's legal hold status. </p>
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
 <p>Amazon S3 can return this if your request involves a bucket that is either a source or destination in a replication rule.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Provides storage class information of the object. Amazon S3 returns this header for all objects except for S3 Standard storage class objects.</p>
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
 <p>The bucket name containing the object. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>Key of the object to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' GET request for the part specified. Useful for downloading just a part of an object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, see <a href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.</p><note><p>Amazon S3 doesn't support retrieving multiple ranges of data per <code>GET</code> request.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Sets the <code>Cache-Control</code> header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCacheControl;

/**
 <p>Sets the <code>Content-Disposition</code> header of the response</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentDisposition;

/**
 <p>Sets the <code>Content-Encoding</code> header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentEncoding;

/**
 <p>Sets the <code>Content-Language</code> header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentLanguage;

/**
 <p>Sets the <code>Content-Type</code> header of the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseContentType;

/**
 <p>Sets the <code>Expires</code> header of the response.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable responseExpires;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
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
 <p>The bucket name containing the object whose retention settings you want to retrieve. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The key name for the object whose retention settings you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>Contains the tag set.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

/**
 <p>The versionId of the object for which you got the tagging information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectTaggingRequest : AWSRequest


/**
 <p>The bucket name containing the object for which to get the tagging information. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Object key for which to get the tagging information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The versionId of the object for which to get the tagging information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectTorrentOutput : AWSModel


/**
 <p>A Bencoded dictionary as defined by the BitTorrent specification</p>
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
 <p>The name of the bucket containing the object for which to get the torrent files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The object key for which to get the information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 <p>Container for S3 Glacier job parameters.</p>
 Required parameters: [Tier]
 */
@interface AWSS3GlacierJobParameters : AWSModel


/**
 <p>S3 Glacier retrieval tier at which the restore will be processed.</p>
 */
@property (nonatomic, assign) AWSS3Tier tier;

@end

/**
 <p>Container for grant information.</p>
 */
@interface AWSS3Grant : AWSModel


/**
 <p>The person being granted permissions.</p>
 */
@property (nonatomic, strong) AWSS3Grantee * _Nullable grantee;

/**
 <p>Specifies the permission given to the grantee.</p>
 */
@property (nonatomic, assign) AWSS3Permission permission;

@end

/**
 <p>Container for the person being granted permissions.</p>
 Required parameters: [Type]
 */
@interface AWSS3Grantee : AWSModel


/**
 <p>Screen name of the grantee.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>Email address of the grantee.</p><note><p>Using email addresses to specify a grantee is only supported in the following AWS Regions: </p><ul><li><p>US East (N. Virginia)</p></li><li><p>US West (N. California)</p></li><li><p> US West (Oregon)</p></li><li><p> Asia Pacific (Singapore)</p></li><li><p>Asia Pacific (Sydney)</p></li><li><p>Asia Pacific (Tokyo)</p></li><li><p>Europe (Ireland)</p></li><li><p>South America (São Paulo)</p></li></ul><p>For a list of all the Amazon S3 supported Regions and endpoints, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region">Regions and Endpoints</a> in the AWS General Reference.</p></note>
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
 <p>The bucket name.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3HeadObjectOutput : AWSModel


/**
 <p>Indicates that a range of bytes was specified.</p>
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
 <p>An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key-value pairs providing object expiration information. The value of the rule-id is URL encoded.</p>
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
 <p>This is set to the number of metadata entries not returned in <code>x-amz-meta</code> headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 <p>Specifies whether a legal hold is in effect for this object. This header is only returned if the requester has the <code>s3:GetObjectLegalHold</code> permission. This header is not returned if the specified version of this object has never had a legal hold applied. For more information about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object Lock</a>.</p>
 */
@property (nonatomic, assign) AWSS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Object Lock mode, if any, that's in effect for this object. This header is only returned if the requester has the <code>s3:GetObjectRetention</code> permission. For more information about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object Lock</a>. </p>
 */
@property (nonatomic, assign) AWSS3ObjectLockMode objectLockMode;

/**
 <p>The date and time when the Object Lock retention period expires. This header is only returned if the requester has the <code>s3:GetObjectRetention</code> permission.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p>The count of parts this object has.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partsCount;

/**
 <p>Amazon S3 can return this header if your request involves a bucket that is either a source or destination in a replication rule.</p><p>In replication, you have a source bucket on which you configure replication and destination bucket where Amazon S3 stores object replicas. When you request an object (<code>GetObject</code>) or object metadata (<code>HeadObject</code>) from these buckets, Amazon S3 will return the <code>x-amz-replication-status</code> header in the response as follows:</p><ul><li><p>If requesting an object from the source bucket — Amazon S3 will return the <code>x-amz-replication-status</code> header if the object in your request is eligible for replication.</p><p> For example, suppose that in your replication configuration, you specify object prefix <code>TaxDocs</code> requesting Amazon S3 to replicate objects with key prefix <code>TaxDocs</code>. Any objects you upload with this key name prefix, for example <code>TaxDocs/document1.pdf</code>, are eligible for replication. For any object request with this key name prefix, Amazon S3 will return the <code>x-amz-replication-status</code> header with value PENDING, COMPLETED or FAILED indicating object replication status.</p></li><li><p>If requesting an object from the destination bucket — Amazon S3 will return the <code>x-amz-replication-status</code> header with value REPLICA if the object in your request is a replica that Amazon S3 created.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Replication</a>.</p>
 */
@property (nonatomic, assign) AWSS3ReplicationStatus replicationStatus;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>If the object is an archived object (an object whose storage class is GLACIER), the response includes this header if either the archive restoration is in progress (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html">RestoreObject</a> or an archive copy is already restored.</p><p> If an archive copy is already restored, the header value indicates when Amazon S3 is scheduled to delete the object copy. For example:</p><p><code>x-amz-restore: ongoing-request="false", expiry-date="Fri, 23 Dec 2012 00:00:00 GMT"</code></p><p>If the object restoration is in progress, the header returns the value <code>ongoing-request="true"</code>.</p><p>For more information about archiving objects, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-transition-general-considerations">Transitioning Objects: General Considerations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable restore;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>If the object is stored using server-side encryption either with an AWS KMS customer master key (CMK) or an Amazon S3-managed encryption key, the response includes this header with the value of the server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>Provides storage class information of the object. Amazon S3 returns this header for all objects except for S3 Standard storage class objects.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a>.</p>
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
 <p>The name of the bucket containing the object.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about the size of the part and the number of parts in this object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Downloads the specified range bytes of an object. For more information about the HTTP Range header, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.</p><note><p>Amazon S3 doesn't support retrieving multiple ranges of data per <code>GET</code> request.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Container for the <code>Suffix</code> element.</p>
 Required parameters: [Suffix]
 */
@interface AWSS3IndexDocument : AWSModel


/**
 <p>A suffix that is appended to a request that is for a directory on the website endpoint (for example,if the suffix is index.html and you make a request to samplebucket/images/ the data that is returned will be for the object with the key name images/index.html) The suffix must not be empty and must not include a slash character.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suffix;

@end

/**
 <p>Container element that identifies who initiated the multipart upload. </p>
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
 <p>Specifies the inventory configuration for an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETInventoryConfig.html">GET Bucket inventory</a> in the <i>Amazon Simple Storage Service API Reference</i>. </p>
 Required parameters: [Destination, IsEnabled, Id, IncludedObjectVersions, Schedule]
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
 <p>Object versions to include in the inventory list. If set to <code>All</code>, the list includes all the object versions, which adds the version-related fields <code>VersionId</code>, <code>IsLatest</code>, and <code>DeleteMarker</code> to the list. If set to <code>Current</code>, the list does not contain these version-related fields.</p>
 */
@property (nonatomic, assign) AWSS3InventoryIncludedObjectVersions includedObjectVersions;

/**
 <p>Specifies whether the inventory is enabled or disabled. If set to <code>True</code>, an inventory list is generated. If set to <code>False</code>, no inventory list is generated.</p>
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
 <p>Specifies the inventory configuration for an Amazon S3 bucket.</p>
 Required parameters: [S3BucketDestination]
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
 <p>Specifies the use of SSE-KMS to encrypt delivered inventory reports.</p>
 */
@property (nonatomic, strong) AWSS3SSEKMS * _Nullable SSEKMS;

/**
 <p>Specifies the use of SSE-S3 to encrypt delivered inventory reports.</p>
 */
@property (nonatomic, strong) AWSS3SSES3 * _Nullable SSES3;

@end

/**
 <p>Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.</p>
 Required parameters: [Prefix]
 */
@interface AWSS3InventoryFilter : AWSModel


/**
 <p>The prefix that an object must have to be included in the inventory results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.</p>
 Required parameters: [Bucket, Format]
 */
@interface AWSS3InventoryS3BucketDestination : AWSModel


/**
 <p>The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is not validated before exporting data. </p><note><p> Although this value is optional, we strongly recommend that you set it to help prevent problems if the destination bucket ownership changes. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The Amazon Resource Name (ARN) of the bucket where inventory results will be published.</p>
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
 <p>Specifies the schedule for generating inventory results.</p>
 Required parameters: [Frequency]
 */
@interface AWSS3InventorySchedule : AWSModel


/**
 <p>Specifies how frequently inventory results are produced.</p>
 */
@property (nonatomic, assign) AWSS3InventoryFrequency frequency;

@end

/**
 <p>Specifies JSON as object's input serialization format.</p>
 */
@interface AWSS3JSONInput : AWSModel


/**
 <p>The type of JSON. Valid values: Document, Lines.</p>
 */
@property (nonatomic, assign) AWSS3JSONType types;

@end

/**
 <p>Specifies JSON as request's output serialization format.</p>
 */
@interface AWSS3JSONOutput : AWSModel


/**
 <p>The value used to separate individual records in the output. If no value is specified, Amazon S3 uses a newline character ('\n').</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordDelimiter;

@end

/**
 <p>A container for specifying the configuration for AWS Lambda notifications.</p>
 Required parameters: [LambdaFunctionArn, Events]
 */
@interface AWSS3LambdaFunctionConfiguration : AWSModel


/**
 <p>The Amazon S3 bucket event for which to invoke the AWS Lambda function. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>Specifies object key name filtering rules. For information about key name filtering, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Lambda function that Amazon S3 invokes when the specified event type occurs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionArn;

@end

/**
 <p>Container for lifecycle rules. You can add as many as 1000 rules.</p>
 Required parameters: [Rules]
 */
@interface AWSS3LifecycleConfiguration : AWSModel


/**
 <p>Specifies lifecycle configuration rules for an Amazon S3 bucket. </p>
 */
@property (nonatomic, strong) NSArray<AWSS3Rule *> * _Nullable rules;

@end

/**
 <p>Container for the expiration for the lifecycle of the object.</p>
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
 <p>A lifecycle rule for individual objects in an Amazon S3 bucket.</p>
 Required parameters: [Status]
 */
@interface AWSS3LifecycleRule : AWSModel


/**
 <p>Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config"> Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 <p>Specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker.</p>
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 <p>The <code>Filter</code> is used to identify objects that a Lifecycle Rule applies to. A <code>Filter</code> must have exactly one of <code>Prefix</code>, <code>Tag</code>, or <code>And</code> specified.</p>
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
 <p> Specifies the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to a specific storage class at a set period in the object's lifetime. </p>
 */
@property (nonatomic, strong) NSArray<AWSS3NoncurrentVersionTransition *> * _Nullable noncurrentVersionTransitions;

/**
 <p>Prefix identifying one or more objects to which the rule applies. This is No longer used; use <code>Filter</code> instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.</p>
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 <p>Specifies when an Amazon S3 object transitions to a specified storage class.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Transition *> * _Nullable transitions;

@end

/**
 <p>This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.</p>
 */
@interface AWSS3LifecycleRuleAndOperator : AWSModel


/**
 <p>Prefix identifying one or more objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>All of these tags must exist in the object's tag set in order for the rule to apply.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 <p>The <code>Filter</code> is used to identify objects that a Lifecycle Rule applies to. A <code>Filter</code> must have exactly one of <code>Prefix</code>, <code>Tag</code>, or <code>And</code> specified.</p>
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
 <p>The marker that is used as a starting point for this analytics configuration list response. This value is present if it was sent in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>Indicates whether the returned list of analytics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p><code>NextContinuationToken</code> is sent when <code>isTruncated</code> is true, which indicates that there are more analytics configurations to list. The next request must include this <code>NextContinuationToken</code>. The token is obfuscated and is not a usable value.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>Tells whether the returned list of inventory configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken is provided for a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The marker used to continue this inventory configuration listing. Use the <code>NextContinuationToken</code> from this response to continue the listing in a subsequent request. The continuation token is an opaque value that Amazon S3 understands.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The marker used to continue a metrics configuration listing that has been truncated. Use the <code>NextContinuationToken</code> from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.</p>
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

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3ListBucketsOutput : AWSModel


/**
 <p>The list of buckets owned by the requestor.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Bucket *> * _Nullable buckets;

/**
 <p>The owner of the buckets listed.</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 
 */
@interface AWSS3ListMultipartUploadsOutput : AWSModel


/**
 <p>The name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>If you specify a delimiter in the request, then the result returns each distinct key prefix containing the delimiter in a <code>CommonPrefixes</code> element. The distinct key prefixes are returned in the <code>Prefix</code> child element.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 <p>Contains the delimiter you specified in the request. If you don't specify a delimiter in your request, this element is absent from the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p><p>If you specify <code>encoding-type</code> request parameter, Amazon S3 includes this element in the response, and returns encoded key name values in the following response elements:</p><p><code>Delimiter</code>, <code>KeyMarker</code>, <code>Prefix</code>, <code>NextKeyMarker</code>, <code>Key</code>.</p>
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
 <p>When a list is truncated, this element specifies the value that should be used for the <code>upload-id-marker</code> request parameter in a subsequent request.</p>
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
 <p>Container for elements related to a particular multipart upload. A response can contain zero or more <code>Upload</code> elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3MultipartUpload *> * _Nullable uploads;

@end

/**
 
 */
@interface AWSS3ListMultipartUploadsRequest : AWSRequest


/**
 <p>The name of the bucket to which the multipart upload was initiated. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Character you use to group keys.</p><p>All keys that contain the same string between the prefix, if specified, and the first occurrence of the delimiter after the prefix are grouped under a single result element, <code>CommonPrefixes</code>. If you don't specify the prefix parameter, then the substring starts at the beginning of the key. The keys that are grouped under <code>CommonPrefixes</code> result element are not returned elsewhere in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Together with upload-id-marker, this parameter specifies the multipart upload after which listing should begin.</p><p>If <code>upload-id-marker</code> is not specified, only the keys lexicographically greater than the specified <code>key-marker</code> will be included in the list.</p><p>If <code>upload-id-marker</code> is specified, any multipart uploads for a key equal to the <code>key-marker</code> might also be included, provided those multipart uploads have upload IDs lexicographically greater than the specified <code>upload-id-marker</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body. 1,000 is the maximum number of uploads that can be returned in a response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxUploads;

/**
 <p>Lists in-progress uploads only for those keys that begin with the specified prefix. You can use prefixes to separate a bucket into different grouping of keys. (You can think of using prefix to make groups in the same way you'd use a folder in a file system.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Together with key-marker, specifies the multipart upload after which listing should begin. If key-marker is not specified, the upload-id-marker parameter is ignored. Otherwise, any multipart uploads for a key equal to the key-marker might be included in the list only if they have an upload ID lexicographically greater than the specified <code>upload-id-marker</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadIdMarker;

@end

/**
 
 */
@interface AWSS3ListObjectVersionsOutput : AWSModel


/**
 <p>All of the keys rolled up into a common prefix count as a single return when calculating the number of returns.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 <p>Container for an object that is a delete marker.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3DeleteMarkerEntry *> * _Nullable deleteMarkers;

/**
 <p>The delimiter grouping the included keys. A delimiter is a character that you specify to group keys. All keys that contain the same string between the prefix and the first occurrence of the delimiter are grouped under a single result element in <code>CommonPrefixes</code>. These groups are counted as one result against the max-keys limitation. These keys are not returned elsewhere in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p> Encoding type used by Amazon S3 to encode object key names in the XML response.</p><p>If you specify encoding-type request parameter, Amazon S3 includes this element in the response, and returns encoded key name values in the following response elements:</p><p><code>KeyMarker, NextKeyMarker, Prefix, Key</code>, and <code>Delimiter</code>.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>A flag that indicates whether Amazon S3 returned all of the results that satisfied the search criteria. If your results were truncated, you can make a follow-up paginated request using the NextKeyMarker and NextVersionIdMarker response parameters as a starting place in another request to return the rest of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>Marks the last key returned in a truncated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Specifies the maximum number of objects to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When the number of responses exceeds the value of <code>MaxKeys</code>, <code>NextKeyMarker</code> specifies the first key not returned that satisfies the search criteria. Use this value for the key-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextKeyMarker;

/**
 <p>When the number of responses exceeds the value of <code>MaxKeys</code>, <code>NextVersionIdMarker</code> specifies the first object version not returned that satisfies the search criteria. Use this value for the version-id-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextVersionIdMarker;

/**
 <p>Selects objects that start with the value supplied by this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Marks the last version of the key returned in a truncated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionIdMarker;

/**
 <p>Container for version information.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3ObjectVersion *> * _Nullable versions;

@end

/**
 
 */
@interface AWSS3ListObjectVersionsRequest : AWSRequest


/**
 <p>The bucket name that contains the objects. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>A delimiter is a character that you specify to group keys. All keys that contain the same string between the <code>prefix</code> and the first occurrence of the delimiter are grouped under a single result element in CommonPrefixes. These groups are counted as one result against the max-keys limitation. These keys are not returned elsewhere in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Specifies the key to start with when listing objects in a bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 <p>Sets the maximum number of keys returned in the response. By default the API returns up to 1,000 key names. The response might contain fewer keys but will never contain more. If additional keys satisfy the search criteria, but were not returned because max-keys was exceeded, the response contains &lt;isTruncated&gt;true&lt;/isTruncated&gt;. To return the additional keys, see key-marker and version-id-marker.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>Use this parameter to select only those keys that begin with the specified prefix. You can use prefixes to separate a bucket into different groupings of keys. (You can think of using prefix to make groups in the same way you'd use a folder in a file system.) You can use prefix with delimiter to roll up numerous objects into a single result under CommonPrefixes. </p>
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
 <p>All of the keys rolled up in a common prefix count as a single return when calculating the number of returns. </p><p>A response can contain CommonPrefixes only if you specify a delimiter.</p><p>CommonPrefixes contains all (if there are any) keys between Prefix and the next occurrence of the string specified by the delimiter.</p><p> CommonPrefixes lists keys that act like subdirectories in the directory specified by Prefix.</p><p>For example, if the prefix is notes/ and the delimiter is a slash (/) as in notes/summer/july, the common prefix is notes/summer/. All of the keys that roll up into a common prefix count as a single return when calculating the number of returns.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 <p>Metadata about each object returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Object *> * _Nullable contents;

/**
 <p>Causes keys that contain the same string between the prefix and the first occurrence of the delimiter to be rolled up into a single result element in the <code>CommonPrefixes</code> collection. These rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only one return against the <code>MaxKeys</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object keys in the response.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>A flag that indicates whether Amazon S3 returned all of the results that satisfied the search criteria.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>Indicates where in the bucket listing begins. Marker is included in the response if it was sent with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of keys returned in the response body.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>When response is truncated (the IsTruncated element value in the response is true), you can use the key name in this field as marker in the subsequent request to get next set of objects. Amazon S3 lists objects in alphabetical order Note: This element is returned only if you have delimiter request parameter specified. If response does not include the NextMarker and it is truncated, you can use the value of the last Key in the response as the marker in the subsequent request to get the next set of object keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>Keys that begin with the indicated prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3ListObjectsRequest : AWSRequest


/**
 <p>The name of the bucket containing the objects.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Specifies the key to start with when listing objects in a bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Sets the maximum number of keys returned in the response. By default the API returns up to 1,000 key names. The response might contain fewer keys but will never contain more. </p>
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
 <p>All of the keys rolled up into a common prefix count as a single return when calculating the number of returns.</p><p>A response can contain <code>CommonPrefixes</code> only if you specify a delimiter.</p><p><code>CommonPrefixes</code> contains all (if there are any) keys between <code>Prefix</code> and the next occurrence of the string specified by a delimiter.</p><p><code>CommonPrefixes</code> lists keys that act like subdirectories in the directory specified by <code>Prefix</code>.</p><p>For example, if the prefix is <code>notes/</code> and the delimiter is a slash (<code>/</code>) as in <code>notes/summer/july</code>, the common prefix is <code>notes/summer/</code>. All of the keys that roll up into a common prefix count as a single return when calculating the number of returns. </p>
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 <p>Metadata about each object returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Object *> * _Nullable contents;

/**
 <p> If ContinuationToken was sent with the request, it is included in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 <p>Causes keys that contain the same string between the prefix and the first occurrence of the delimiter to be rolled up into a single result element in the CommonPrefixes collection. These rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only one return against the <code>MaxKeys</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 <p>Encoding type used by Amazon S3 to encode object key names in the XML response.</p><p>If you specify the encoding-type request parameter, Amazon S3 includes this element in the response, and returns encoded key name values in the following response elements:</p><p><code>Delimiter, Prefix, Key,</code> and <code>StartAfter</code>.</p>
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 <p>Set to false if all of the results were returned. Set to true if more keys are available to return. If the number of results exceeds that specified by MaxKeys, all of the results might not be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>KeyCount is the number of keys returned with this request. KeyCount will always be less than equals to MaxKeys field. Say you ask for 50 keys, your result will include less than equals 50 keys </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keyCount;

/**
 <p>Sets the maximum number of keys returned in the response. By default the API returns up to 1,000 key names. The response might contain fewer keys but will never contain more.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 <p>The bucket name.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p><code>NextContinuationToken</code> is sent when <code>isTruncated</code> is true, which means there are more keys in the bucket that can be listed. The next list requests to Amazon S3 can be continued with this <code>NextContinuationToken</code>. <code>NextContinuationToken</code> is obfuscated and is not a real key</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

/**
 <p> Keys that begin with the indicated prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>If StartAfter was sent with the request, it is included in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListObjectsV2Request : AWSRequest


/**
 <p>Bucket name to list. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The owner field is not present in listV2 by default, if you want to return owner field with each key in the result then set the fetch owner field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fetchOwner;

/**
 <p>Sets the maximum number of keys returned in the response. By default the API returns up to 1,000 key names. The response might contain fewer keys but will never contain more.</p>
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
 <p>StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListPartsOutput : AWSModel


/**
 <p>If the bucket has a lifecycle rule configured with an action to abort incomplete multipart uploads and the prefix in the lifecycle rule matches the object name in the request, then the response includes this header indicating when the initiated multipart upload will become eligible for abort operation. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config">Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a>.</p><p>The response will also include the <code>x-amz-abort-rule-id</code> header that will provide the ID of the lifecycle configuration rule that defines this action.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 <p>This header is returned along with the <code>x-amz-abort-date</code> header. It identifies applicable lifecycle configuration rule that defines the action to abort incomplete multipart uploads.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 <p>The name of the bucket to which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Container element that identifies who initiated the multipart upload. If the initiator is an AWS account, this element provides the same information as the <code>Owner</code> element. If the initiator is an IAM User, this element provides the user ARN and display name.</p>
 */
@property (nonatomic, strong) AWSS3Initiator * _Nullable initiator;

/**
 <p> Indicates whether the returned list of parts is truncated. A true value indicates that the list was truncated. A list can be truncated if the number of parts exceeds the limit returned in the MaxParts element.</p>
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
 <p> Container element that identifies the object owner, after the object is created. If multipart upload is initiated by an IAM user, this element provides the parent account ID and display name.</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>When a list is truncated, this element specifies the last part in the list, as well as the value to use for the part-number-marker request parameter in a subsequent request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumberMarker;

/**
 <p> Container for elements related to a particular part. A response can contain zero or more <code>Part</code> elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Part *> * _Nullable parts;

/**
 <p>If present, indicates that the requester was successfully charged for the request.</p>
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 <p>Class of storage (STANDARD or REDUCED_REDUNDANCY) used to store the uploaded object.</p>
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
 <p>The name of the bucket to which the parts are being uploaded. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Object key for which the multipart upload was initiated.</p>
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
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Upload ID identifying the multipart upload whose parts are being listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html">PUT Bucket logging</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 Required parameters: [TargetBucket, TargetPrefix]
 */
@interface AWSS3LoggingEnabled : AWSModel


/**
 <p>Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs delivered to any bucket that you own, including the same bucket that is being logged. You can also configure multiple buckets to deliver their logs to the same target bucket. In this case, you should choose a different <code>TargetPrefix</code> for each source bucket so that the delivered log files can be distinguished by key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetBucket;

/**
 <p>Container for granting information.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3TargetGrant *> * _Nullable targetGrants;

/**
 <p>A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets in a single bucket, you can use a prefix to distinguish which log files came from which bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetPrefix;

@end

/**
 <p>A metadata key-value pair to store with an object.</p>
 */
@interface AWSS3MetadataEntry : AWSModel


/**
 <p>Name of the Object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Value of the Object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> A container specifying replication metrics-related settings enabling metrics and Amazon S3 events for S3 Replication Time Control (S3 RTC). Must be specified together with a <code>ReplicationTime</code> block. </p>
 Required parameters: [Status, EventThreshold]
 */
@interface AWSS3Metrics : AWSModel


/**
 <p> A container specifying the time threshold for emitting the <code>s3:Replication:OperationMissedThreshold</code> event. </p>
 */
@property (nonatomic, strong) AWSS3ReplicationTimeValue * _Nullable eventThreshold;

/**
 <p> Specifies whether the replication metrics are enabled. </p>
 */
@property (nonatomic, assign) AWSS3MetricsStatus status;

@end

/**
 <p>A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.</p>
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
 <p>Specifies a metrics configuration for the CloudWatch request metrics (specified by the metrics configuration ID) from an Amazon S3 bucket. If you're updating an existing metrics configuration, note that this is a full replacement of the existing metrics configuration. If you don't include the elements you want to keep, they are erased. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTMetricConfiguration.html"> PUT Bucket metrics</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 Required parameters: [Id]
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
 <p>Specifies a metrics configuration filter. The metrics configuration only includes objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).</p>
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
 <p>Container for the <code>MultipartUpload</code> for the Amazon S3 object.</p>
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
 <p>Specifies the owner of the object that is part of the multipart upload. </p>
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
 <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noncurrentDays;

@end

/**
 <p>Container for the transition rule that describes when noncurrent objects transition to the <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>, <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or <code>DEEP_ARCHIVE</code> storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>, <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or <code>DEEP_ARCHIVE</code> storage class at a specific period in the object's lifetime.</p>
 */
@interface AWSS3NoncurrentVersionTransition : AWSModel


/**
 <p>Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations">How Amazon S3 Calculates How Long an Object Has Been Noncurrent</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
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
 <p>Describes the AWS Lambda functions to invoke and the events for which to invoke them.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3LambdaFunctionConfiguration *> * _Nullable lambdaFunctionConfigurations;

/**
 <p>The Amazon Simple Queue Service queues to publish messages to and the events for which to publish messages.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3QueueConfiguration *> * _Nullable queueConfigurations;

/**
 <p>The topic to which notifications are sent and the events for which notifications are generated.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3TopicConfiguration *> * _Nullable topicConfigurations;

@end

/**
 
 */
@interface AWSS3NotificationConfigurationDeprecated : AWSModel


/**
 <p>Container for specifying the AWS Lambda notification configuration.</p>
 */
@property (nonatomic, strong) AWSS3CloudFunctionConfiguration * _Nullable cloudFunctionConfiguration;

/**
 <p>This data type is deprecated. This data type specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events. </p>
 */
@property (nonatomic, strong) AWSS3QueueConfigurationDeprecated * _Nullable queueConfiguration;

/**
 <p>This data type is deprecated. A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events. </p>
 */
@property (nonatomic, strong) AWSS3TopicConfigurationDeprecated * _Nullable topicConfiguration;

@end

/**
 <p>Specifies object key name filtering rules. For information about key name filtering, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSS3NotificationConfigurationFilter : AWSModel


/**
 <p>A container for object key name prefix and suffix filtering rules.</p>
 */
@property (nonatomic, strong) AWSS3S3KeyFilter * _Nullable key;

@end

/**
 <p>An object consists of data and its descriptive metadata.</p>
 */
@interface AWSS3Object : AWSModel


/**
 <p>The entity tag is a hash of the object. The ETag reflects changes only to the contents of an object, not its metadata. The ETag may or may not be an MD5 digest of the object data. Whether or not it is depends on how the object was created and how it is encrypted as described below:</p><ul><li><p>Objects created by the PUT Object, POST Object, or Copy operation, or through the AWS Management Console, and are encrypted by SSE-S3 or plaintext, have ETags that are an MD5 digest of their object data.</p></li><li><p>Objects created by the PUT Object, POST Object, or Copy operation, or through the AWS Management Console, and are encrypted by SSE-C or SSE-KMS, have ETags that are not an MD5 digest of their object data.</p></li><li><p>If an object is created by either the Multipart Upload or Part Copy operation, the ETag is not an MD5 digest, regardless of the method of encryption.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The name that you assign to an object. You use the object key to retrieve the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The date the Object was Last Modified</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>The owner of the object</p>
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 <p>Size in bytes of the object</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The class of storage used to store the object.</p>
 */
@property (nonatomic, assign) AWSS3ObjectStorageClass storageClass;

@end

/**
 <p>Object Identifier is unique value to identify objects.</p>
 Required parameters: [Key]
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
 <p>The version of an object.</p>
 */
@interface AWSS3ObjectVersion : AWSModel


/**
 <p>The entity tag is an MD5 hash of that version of the object.</p>
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
 <p>Specifies the owner of the object.</p>
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
 <p>Container for the owner's display name and ID.</p>
 */
@interface AWSS3Owner : AWSModel


/**
 <p>Container for the display name of the owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>Container for the ID of the owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The container element for a bucket's ownership controls.</p>
 Required parameters: [Rules]
 */
@interface AWSS3OwnershipControls : AWSModel


/**
 <p>The container element for an ownership control rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3OwnershipControlsRule *> * _Nullable rules;

@end

/**
 <p>The container element for an ownership control rule.</p>
 Required parameters: [ObjectOwnership]
 */
@interface AWSS3OwnershipControlsRule : AWSModel


/**
 <p>The container element for object ownership for a bucket's ownership controls.</p><p>BucketOwnerPreferred - Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the <code>bucket-owner-full-control</code> canned ACL.</p><p>ObjectWriter - The uploading account will own the object if the object is uploaded with the <code>bucket-owner-full-control</code> canned ACL.</p>
 */
@property (nonatomic, assign) AWSS3ObjectOwnership objectOwnership;

@end

/**
 <p>Container for Parquet.</p>
 */
@interface AWSS3ParquetInput : AWSModel


@end

/**
 <p>Container for elements related to a part.</p>
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
 <p>This data type contains information about progress of an operation.</p>
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
 <p>This data type contains information about the progress event of an operation.</p>
 */
@interface AWSS3ProgressEvent : AWSModel


/**
 <p>The Progress event details.</p>
 */
@property (nonatomic, strong) AWSS3Progress * _Nullable details;

@end

/**
 <p>The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
 */
@interface AWSS3PublicAccessBlockConfiguration : AWSModel


/**
 <p>Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket and objects in this bucket. Setting this element to <code>TRUE</code> causes the following behavior:</p><ul><li><p>PUT Bucket acl and PUT Object acl calls fail if the specified ACL is public.</p></li><li><p>PUT Object calls fail if the request includes a public ACL.</p></li><li><p>PUT Bucket calls fail if the request includes a public ACL.</p></li></ul><p>Enabling this setting doesn't affect existing policies or ACLs.</p>
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
 <p>Container for setting the transfer acceleration state.</p>
 */
@property (nonatomic, strong) AWSS3AccelerateConfiguration * _Nullable accelerateConfiguration;

/**
 <p>The name of the bucket for which the accelerate configuration is set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3PutBucketAclRequest : AWSRequest


/**
 <p>The canned ACL to apply to the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketCannedACL ACL;

/**
 <p>Contains the elements that set the ACL permissions for an object per grantee.</p>
 */
@property (nonatomic, strong) AWSS3AccessControlPolicy * _Nullable accessControlPolicy;

/**
 <p>The bucket to which to apply the ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message integrity check to verify that the request body was not corrupted in transit. For more information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The ID that identifies the analytics configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3PutBucketCorsRequest : AWSRequest


/**
 <p>Specifies the bucket impacted by the <code>cors</code>configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html">Enabling Cross-Origin Resource Sharing</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3CORSConfiguration * _Nullable CORSConfiguration;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message integrity check to verify that the request body was not corrupted in transit. For more information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3PutBucketEncryptionRequest : AWSRequest


/**
 <p>Specifies default encryption for a bucket using server-side encryption with Amazon S3-managed keys (SSE-S3) or customer master keys stored in AWS KMS (SSE-KMS). For information about the Amazon S3 default encryption feature, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html">Amazon S3 Default Bucket Encryption</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the server-side encryption configuration. This parameter is auto-populated when using the command from the CLI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Specifies the default server-side-encryption configuration.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The name of the bucket for which to set the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Container for lifecycle rules. You can add as many as 1,000 rules.</p>
 */
@property (nonatomic, strong) AWSS3BucketLifecycleConfiguration * _Nullable lifecycleConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketLifecycleRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p/>
 */
@property (nonatomic, strong) AWSS3LifecycleConfiguration * _Nullable lifecycleConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketLoggingRequest : AWSRequest


/**
 <p>The name of the bucket for which to set the logging parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Container for logging status information.</p>
 */
@property (nonatomic, strong) AWSS3BucketLoggingStatus * _Nullable bucketLoggingStatus;

/**
 <p>The MD5 hash of the <code>PutBucketLogging</code> request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

@end

/**
 
 */
@interface AWSS3PutBucketMetricsConfigurationRequest : AWSRequest


/**
 <p>The name of the bucket for which the metrics configuration is set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

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
 <p>The name of the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>A container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off for the bucket.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfiguration * _Nullable notificationConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketNotificationRequest : AWSRequest


/**
 <p>The name of the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash of the <code>PutPublicAccessBlock</code> request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The container for the configuration.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationDeprecated * _Nullable notificationConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketOwnershipControlsRequest : AWSRequest


/**
 <p>The name of the Amazon S3 bucket whose <code>OwnershipControls</code> you want to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash of the <code>OwnershipControls</code> request body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The <code>OwnershipControls</code> (BucketOwnerPreferred or ObjectWriter) that you want to apply to this Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSS3OwnershipControls * _Nullable ownershipControls;

@end

/**
 
 */
@interface AWSS3PutBucketPolicyRequest : AWSRequest


/**
 <p>The name of the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Set this parameter to true to confirm that you want to remove your permissions to change this bucket policy in the future.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confirmRemoveSelfBucketAccess;

/**
 <p>The MD5 hash of the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The bucket policy as a JSON document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSS3PutBucketReplicationRequest : AWSRequest


/**
 <p>The name of the bucket</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message integrity check to verify that the request body was not corrupted in transit. For more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.</p>
 */
@property (nonatomic, strong) AWSS3ReplicationConfiguration * _Nullable replicationConfiguration;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSS3PutBucketRequestPaymentRequest : AWSRequest


/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>&gt;The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message integrity check to verify that the request body was not corrupted in transit. For more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Container for Payer.</p>
 */
@property (nonatomic, strong) AWSS3RequestPaymentConfiguration * _Nullable requestPaymentConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketTaggingRequest : AWSRequest


/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message integrity check to verify that the request body was not corrupted in transit. For more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Container for the <code>TagSet</code> and <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) AWSS3Tagging * _Nullable tagging;

@end

/**
 
 */
@interface AWSS3PutBucketVersioningRequest : AWSRequest


/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>&gt;The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message integrity check to verify that the request body was not corrupted in transit. For more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 <p>Container for setting the versioning state.</p>
 */
@property (nonatomic, strong) AWSS3VersioningConfiguration * _Nullable versioningConfiguration;

@end

/**
 
 */
@interface AWSS3PutBucketWebsiteRequest : AWSRequest


/**
 <p>The bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. You must use this header as a message integrity check to verify that the request body was not corrupted in transit. For more information, see <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Container for the request.</p>
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
 <p>The canned ACL to apply to the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 <p>Contains the elements that set the ACL permissions for an object per grantee.</p>
 */
@property (nonatomic, strong) AWSS3AccessControlPolicy * _Nullable accessControlPolicy;

/**
 <p>The bucket name that contains the object to which you want to attach the ACL. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The base64-encoded 128-bit MD5 digest of the data. This header must be used as a message integrity check to verify that the request body was not corrupted in transit. For more information, go to <a href="http://www.ietf.org/rfc/rfc1864.txt">RFC 1864.&gt;</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to list the objects in the bucket.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the bucket ACL.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to create, overwrite, and delete any object in the bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 <p>Allows grantee to write the ACL for the applicable bucket.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 <p>Key for which the PUT operation was initiated.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The bucket name containing the object that you want to place a Legal Hold on. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The key name for the object that you want to place a Legal Hold on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Container element for the Legal Hold configuration you want to apply to the specified object.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockLegalHold * _Nullable legalHold;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The Object Lock configuration that you want to apply to the specified bucket.</p>
 */
@property (nonatomic, strong) AWSS3ObjectLockConfiguration * _Nullable objectLockConfiguration;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>A token to allow Object Lock to be enabled for an existing bucket.</p>
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
 <p> If the expiration is configured for the object (see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html">PutBucketLifecycleConfiguration</a>), the response includes this header. It includes the expiry-date and rule-id key-value pairs that provide information about object expiration. The value of the rule-id is URL encoded.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>If <code>x-amz-server-side-encryption</code> is present and has the value of <code>aws:kms</code>, this header specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>If you specified server-side encryption either with an AWS KMS customer master key (CMK) or Amazon S3-managed encryption key in your PUT request, the response includes this header. It confirms the encryption algorithm that Amazon S3 used to encrypt the object.</p>
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
 <p>The canned ACL to apply to the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL">Canned ACL</a>.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 <p>Object data.</p>
 */
@property (nonatomic, strong) id _Nullable body;

/**
 <p>The bucket name to which the PUT operation was initiated. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p> Can be used to specify caching behavior along the request/reply chain. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p>Specifies presentational information for the object. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1">http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p>Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p>The language the content is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.13</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>The base64-encoded 128-bit MD5 digest of the message (without the headers) according to RFC 1864. This header can be used as a message integrity check to verify that the data is the same data that was originally sent. Although it is optional, we recommend using the Content-MD5 mechanism as an end-to-end integrity check. For more information about REST request authentication, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">REST Authentication</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>A standard MIME type describing the format of the contents. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The date and time at which the object is no longer cacheable. For more information, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.21</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 <p>Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 <p>Allows grantee to read the object data and its metadata.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 <p>Allows grantee to read the object ACL.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 <p>Allows grantee to write the ACL for the applicable object.</p><p>This action is not supported by Amazon S3 on Outposts.</p>
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
 <p>Specifies whether a legal hold will be applied to this object. For more information about S3 Object Lock, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html">Object Lock</a>.</p>
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
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the AWS KMS Encryption Context to use for object encryption. The value of this header is a base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSEncryptionContext;

/**
 <p>If <code>x-amz-server-side-encryption</code> is present and has the value of <code>aws:kms</code>, this header specifies the ID of the AWS Key Management Service (AWS KMS) symmetrical customer managed customer master key (CMK) that was used for the object.</p><p> If the value of <code>x-amz-server-side-encryption</code> is <code>aws:kms</code>, this header specifies the ID of the symmetric customer managed AWS KMS CMK that will be used for the object. If you specify <code>x-amz-server-side-encryption:aws:kms</code>, but do not provide<code> x-amz-server-side-encryption-aws-kms-key-id</code>, Amazon S3 uses the AWS managed CMK in AWS to protect the data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 <p>By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The STANDARD storage class provides high durability and high availability. Depending on performance needs, you can specify a different Storage Class. Amazon S3 on Outposts only uses the OUTPOSTS Storage Class. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html">Storage Classes</a> in the <i>Amazon S3 Service Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 <p>The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For example, "Key1=Value1")</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 <p>If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata. For information about object metadata, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html">Object Key and Metadata</a>.</p><p>In the following example, the request header sets the redirect to an object (anotherPage.html) in the same bucket:</p><p><code>x-amz-website-redirect-location: /anotherPage.html</code></p><p>In the following example, the request header sets the object redirect to another website:</p><p><code>x-amz-website-redirect-location: http://www.example.com/</code></p><p>For more information about website hosting in Amazon S3, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">Hosting Websites on Amazon S3</a> and <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html">How to Configure Website Page Redirects</a>. </p>
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
 <p>The bucket name that contains the object you want to apply this Object Retention configuration to. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Indicates whether this operation should bypass Governance-mode restrictions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The key name for the object that you want to apply this Object Retention configuration to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
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
 <p>The versionId of the object the tag-set was added to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectTaggingRequest : AWSRequest


/**
 <p>The bucket name containing the object. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The MD5 hash for the request body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Name of the object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Container for the <code>TagSet</code> and <code>Tag</code> elements</p>
 */
@property (nonatomic, strong) AWSS3Tagging * _Nullable tagging;

/**
 <p>The versionId of the object that the tag-set will be added to.</p>
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
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3PublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

@end

/**
 <p>Specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.</p>
 Required parameters: [QueueArn, Events]
 */
@interface AWSS3QueueConfiguration : AWSModel


/**
 <p>A collection of bucket events for which to send notifications</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>Specifies object key name filtering rules. For information about key name filtering, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

@end

/**
 <p>This data type is deprecated. Use <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_QueueConfiguration.html">QueueConfiguration</a> for the same purposes. This data type specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events. </p>
 */
@interface AWSS3QueueConfigurationDeprecated : AWSModel


/**
 <p>The bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 <p>A collection of bucket events for which to send notifications</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when it detects events of the specified type. </p>
 */
@property (nonatomic, strong) NSString * _Nullable queue;

@end

/**
 <p>The container for the records event.</p>
 */
@interface AWSS3RecordsEvent : AWSModel


/**
 <p>The byte array of partial, one or more result records.</p>
 */
@property (nonatomic, strong) id _Nullable payload;

@end

/**
 <p>Specifies how requests are redirected. In the event of an error, you can specify a different error code to return.</p>
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
 <p>Protocol to use when redirecting requests. The default is the protocol that is used in the original request.</p>
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

/**
 <p>The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix <code>docs/</code> (objects in the <code>docs/</code> folder) to <code>documents/</code>, you can set a condition block with <code>KeyPrefixEquals</code> set to <code>docs/</code> and in the Redirect set <code>ReplaceKeyPrefixWith</code> to <code>/documents</code>. Not required if one of the siblings is present. Can be present only if <code>ReplaceKeyWith</code> is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyPrefixWith;

/**
 <p>The specific object key to use in the redirect request. For example, redirect request to <code>error.html</code>. Not required if one of the siblings is present. Can be present only if <code>ReplaceKeyPrefixWith</code> is not provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyWith;

@end

/**
 <p>Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.</p>
 Required parameters: [HostName]
 */
@interface AWSS3RedirectAllRequestsTo : AWSModel


/**
 <p>Name of the host where requests are redirected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostName;

/**
 <p>Protocol to use when redirecting requests. The default is the protocol that is used in the original request.</p>
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

@end

/**
 <p>A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.</p>
 Required parameters: [Role, Rules]
 */
@interface AWSS3ReplicationConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that Amazon S3 assumes when replicating objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-how-setup.html">How to Set Up Replication</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A container for one or more replication rules. A replication configuration must have at least one rule and can contain a maximum of 1,000 rules. </p>
 */
@property (nonatomic, strong) NSArray<AWSS3ReplicationRule *> * _Nullable rules;

@end

/**
 <p>Specifies which Amazon S3 objects to replicate and where to store the replicas.</p>
 Required parameters: [Status, Destination]
 */
@interface AWSS3ReplicationRule : AWSModel


/**
 <p>Specifies whether Amazon S3 replicates the delete markers. If you specify a <code>Filter</code>, you must specify this element. However, in the latest version of replication configuration (when <code>Filter</code> is specified), Amazon S3 doesn't replicate delete markers. Therefore, the <code>DeleteMarkerReplication</code> element can contain only &lt;Status&gt;Disabled&lt;/Status&gt;. For an example configuration, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-config-min-rule-config">Basic Rule Configuration</a>. </p><note><p> If you don't specify the <code>Filter</code> element, Amazon S3 assumes that the replication configuration is the earlier version, V1. In the earlier version, Amazon S3 handled replication of delete markers differently. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations">Backward Compatibility</a>.</p></note>
 */
@property (nonatomic, strong) AWSS3DeleteMarkerReplication * _Nullable deleteMarkerReplication;

/**
 <p>A container for information about the replication destination and its configurations including enabling the S3 Replication Time Control (S3 RTC).</p>
 */
@property (nonatomic, strong) AWSS3Destination * _Nullable destination;

/**
 <p/>
 */
@property (nonatomic, strong) AWSS3ExistingObjectReplication * _Nullable existingObjectReplication;

/**
 <p>A filter that identifies the subset of objects to which the replication rule applies. A <code>Filter</code> must specify exactly one <code>Prefix</code>, <code>Tag</code>, or an <code>And</code> child element.</p>
 */
@property (nonatomic, strong) AWSS3ReplicationRuleFilter * _Nullable filter;

/**
 <p>A unique identifier for the rule. The maximum value is 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An object key name prefix that identifies the object or objects to which the rule applies. The maximum prefix length is 1,024 characters. To include all objects in a bucket, specify an empty string. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The priority associated with the rule. If you specify multiple rules in a replication configuration, Amazon S3 prioritizes the rules to prevent conflicts when filtering. If two or more rules identify the same object based on a specified filter, the rule with higher priority takes precedence. For example:</p><ul><li><p>Same object quality prefix-based filter criteria if prefixes you specified in multiple rules overlap </p></li><li><p>Same object qualify tag-based filter criteria specified in multiple rules</p></li></ul><p>For more information, see <a href=" https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html">Replication</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>A container that describes additional filters for identifying the source objects that you want to replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).</p>
 */
@property (nonatomic, strong) AWSS3SourceSelectionCriteria * _Nullable sourceSelectionCriteria;

/**
 <p>Specifies whether the rule is enabled.</p>
 */
@property (nonatomic, assign) AWSS3ReplicationRuleStatus status;

@end

/**
 <p>A container for specifying rule filters. The filters determine the subset of objects to which the rule applies. This element is required only if you specify more than one filter. </p><p>For example:</p><ul><li><p>If you specify both a <code>Prefix</code> and a <code>Tag</code> filter, wrap these filters in an <code>And</code> tag. </p></li><li><p>If you specify a filter based on multiple tags, wrap the <code>Tag</code> elements in an <code>And</code> tag</p></li></ul>
 */
@interface AWSS3ReplicationRuleAndOperator : AWSModel


/**
 <p>An object key name prefix that identifies the subset of objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>An array of tags containing key and value pairs.</p>
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
 <p>An object key name prefix that identifies the subset of objects to which the rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A container for specifying a tag key and value. </p><p>The rule applies only to objects that have the tag in their tag set.</p>
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 <p> A container specifying S3 Replication Time Control (S3 RTC) related information, including whether S3 RTC is enabled and the time when all objects and operations on objects must be replicated. Must be specified together with a <code>Metrics</code> block. </p>
 Required parameters: [Status, Time]
 */
@interface AWSS3ReplicationTime : AWSModel


/**
 <p> Specifies whether the replication time is enabled. </p>
 */
@property (nonatomic, assign) AWSS3ReplicationTimeStatus status;

/**
 <p> A container specifying the time by which replication should be complete for all objects and operations on objects. </p>
 */
@property (nonatomic, strong) AWSS3ReplicationTimeValue * _Nullable time;

@end

/**
 <p> A container specifying the time value for S3 Replication Time Control (S3 RTC) and replication metrics <code>EventThreshold</code>. </p>
 */
@interface AWSS3ReplicationTimeValue : AWSModel


/**
 <p> Contains an integer specifying time in minutes. </p><p> Valid values: 15 minutes. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minutes;

@end

/**
 <p>Container for Payer.</p>
 Required parameters: [Payer]
 */
@interface AWSS3RequestPaymentConfiguration : AWSModel


/**
 <p>Specifies who pays for the download and request fees.</p>
 */
@property (nonatomic, assign) AWSS3Payer payer;

@end

/**
 <p>Container for specifying if periodic <code>QueryProgress</code> messages should be sent.</p>
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
 <p>The bucket name or containing the object to restore. </p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Object key for which the operation was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Container for restore job parameters.</p>
 */
@property (nonatomic, strong) AWSS3RestoreRequest * _Nullable restoreRequest;

/**
 <p>VersionId used to reference a specific version of the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Container for restore job parameters.</p>
 */
@interface AWSS3RestoreRequest : AWSModel


/**
 <p>Lifetime of the active copy in days. Do not use with restores that specify <code>OutputLocation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>The optional description for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>S3 Glacier related parameters pertaining to this job. Do not use with restores that specify <code>OutputLocation</code>.</p>
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
 <p>S3 Glacier retrieval tier at which the restore will be processed.</p>
 */
@property (nonatomic, assign) AWSS3Tier tier;

/**
 <p>Type of restore request.</p>
 */
@property (nonatomic, assign) AWSS3RestoreRequestType types;

@end

/**
 <p>Specifies the redirect behavior and when a redirect is applied. For more information about routing rules, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html#advanced-conditional-redirects">Configuring advanced conditional redirects</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 Required parameters: [Redirect]
 */
@interface AWSS3RoutingRule : AWSModel


/**
 <p>A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the <code>/docs</code> folder, redirect to the <code>/documents</code> folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.</p>
 */
@property (nonatomic, strong) AWSS3Condition * _Nullable condition;

/**
 <p>Container for redirect information. You can redirect requests to another host, to another page, or with another protocol. In the event of an error, you can specify a different error code to return.</p>
 */
@property (nonatomic, strong) AWSS3Redirect * _Nullable redirect;

@end

/**
 <p>Specifies lifecycle rules for an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlifecycle.html">Put Bucket Lifecycle Configuration</a> in the <i>Amazon Simple Storage Service API Reference</i>. For examples, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html#API_PutBucketLifecycleConfiguration_Examples">Put Bucket Lifecycle Configuration Examples</a></p>
 Required parameters: [Prefix, Status]
 */
@interface AWSS3Rule : AWSModel


/**
 <p>Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config"> Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 <p>Specifies the expiration for the lifecycle of the object.</p>
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 <p>Unique identifier for the rule. The value can't be longer than 255 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.</p>
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionExpiration * _Nullable noncurrentVersionExpiration;

/**
 <p>Container for the transition rule that describes when noncurrent objects transition to the <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>, <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or <code>DEEP_ARCHIVE</code> storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the <code>STANDARD_IA</code>, <code>ONEZONE_IA</code>, <code>INTELLIGENT_TIERING</code>, <code>GLACIER</code>, or <code>DEEP_ARCHIVE</code> storage class at a specific period in the object's lifetime.</p>
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionTransition * _Nullable noncurrentVersionTransition;

/**
 <p>Object key prefix that identifies one or more objects to which this rule applies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>If <code>Enabled</code>, the rule is currently being applied. If <code>Disabled</code>, the rule is not currently being applied.</p>
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 <p>Specifies when an object transitions to a specified storage class. For more information about Amazon S3 lifecycle configuration rules, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">Transitioning Objects Using Amazon S3 Lifecycle</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3Transition * _Nullable transition;

@end

/**
 <p>A container for object key name prefix and suffix filtering rules.</p>
 */
@interface AWSS3S3KeyFilter : AWSModel


/**
 <p>A list of containers for the key-value pair that defines the criteria for the filter rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3FilterRule *> * _Nullable filterRules;

@end

/**
 <p>Describes an Amazon S3 location that will receive the results of the restore request.</p>
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
 <p>Contains the type of server-side encryption used.</p>
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
 <p>Specifies the use of SSE-KMS to encrypt delivered inventory reports.</p>
 Required parameters: [KeyId]
 */
@interface AWSS3SSEKMS : AWSModel


/**
 <p>Specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) to use for encrypting inventory reports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

@end

/**
 <p>Specifies the use of SSE-S3 to encrypt delivered inventory reports.</p>
 */
@interface AWSS3SSES3 : AWSModel


@end

/**
 <p>Specifies the byte range of the object to get the records from. A record is processed when its first byte is contained by the range. This parameter is optional, but when specified, it must not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.</p>
 */
@interface AWSS3ScanRange : AWSModel


/**
 <p>Specifies the end of the byte range. This parameter is optional. Valid values: non-negative integers. The default value is one less than the size of the object being queried. If only the End parameter is supplied, it is interpreted to mean scan the last N bytes of the file. For example, <code>&lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt;</code> means scan the last 50 bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable end;

/**
 <p>Specifies the start of the byte range. This parameter is optional. Valid values: non-negative integers. The default value is 0. If only start is supplied, it means scan from that point to the end of the file.For example; <code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt;</code> means scan from byte 50 until the end of the file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable start;

@end

/**
 <p>The container for selecting objects from a content event stream.</p>
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
 <p>The array of results.</p>
 */
@property (nonatomic, strong) AWSS3SelectObjectContentEventStream * _Nullable payload;

@end

/**
 <p>Request to filter the contents of an Amazon S3 object based on a simple Structured Query Language (SQL) statement. In the request, along with the SQL expression, you must specify a data serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data into records. It returns only records that match the specified SQL expression. You must also specify the data serialization format for the response. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html">S3Select API Documentation</a>.</p>
 Required parameters: [Bucket, Key, Expression, ExpressionType, InputSerialization, OutputSerialization]
 */
@interface AWSS3SelectObjectContentRequest : AWSRequest


/**
 <p>The S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The expression that is used to query the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>The type of the provided expression (for example, SQL).</p>
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
 <p>The SSE Algorithm used to encrypt the object. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>The SSE Customer Key. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>The SSE Customer Key MD5. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html">Server-Side Encryption (Using Customer-Provided Encryption Keys</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Specifies the byte range of the object to get the records from. A record is processed when its first byte is contained by the range. This parameter is optional, but when specified, it must not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.</p><p><code>ScanRange</code>may be used in the following ways:</p><ul><li><p><code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;end&gt;100&lt;/end&gt;&lt;/scanrange&gt;</code> - process only the records starting between the bytes 50 and 100 (inclusive, counting from zero)</p></li><li><p><code>&lt;scanrange&gt;&lt;start&gt;50&lt;/start&gt;&lt;/scanrange&gt;</code> - process only the records starting after the byte 50</p></li><li><p><code>&lt;scanrange&gt;&lt;end&gt;50&lt;/end&gt;&lt;/scanrange&gt;</code> - process only the records within the last 50 bytes of the file.</p></li></ul>
 */
@property (nonatomic, strong) AWSS3ScanRange * _Nullable scanRange;

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
 <p>The type of the provided expression (for example, SQL).</p>
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
 <p>Describes the default server-side encryption to apply to new objects in the bucket. If a PUT Object request doesn't specify any server-side encryption, this default encryption will be applied. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTencryption.html">PUT Bucket encryption</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
 Required parameters: [SSEAlgorithm]
 */
@interface AWSS3ServerSideEncryptionByDefault : AWSModel


/**
 <p>AWS Key Management Service (KMS) customer master key ID to use for the default encryption. This parameter is allowed if and only if <code>SSEAlgorithm</code> is set to <code>aws:kms</code>.</p><p>You can specify the key ID or the Amazon Resource Name (ARN) of the CMK. However, if you are using encryption with cross-account operations, you must use a fully qualified CMK ARN. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html#bucket-encryption-update-bucket-policy">Using encryption for cross-account operations</a>. </p><p><b>For example:</b></p><ul><li><p>Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li><li><p>Key ARN: <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code></p></li></ul><important><p>Amazon S3 only supports symmetric CMKs and not asymmetric CMKs. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable KMSMasterKeyID;

/**
 <p>Server-side encryption algorithm to use for the default encryption.</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption SSEAlgorithm;

@end

/**
 <p>Specifies the default server-side-encryption configuration.</p>
 Required parameters: [Rules]
 */
@interface AWSS3ServerSideEncryptionConfiguration : AWSModel


/**
 <p>Container for information about a particular server-side encryption configuration rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3ServerSideEncryptionRule *> * _Nullable rules;

@end

/**
 <p>Specifies the default server-side encryption configuration.</p>
 */
@interface AWSS3ServerSideEncryptionRule : AWSModel


/**
 <p>Specifies the default server-side encryption to apply to new objects in the bucket. If a PUT Object request doesn't specify any server-side encryption, this default encryption will be applied.</p>
 */
@property (nonatomic, strong) AWSS3ServerSideEncryptionByDefault * _Nullable applyServerSideEncryptionByDefault;

@end

/**
 <p>A container that describes additional filters for identifying the source objects that you want to replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).</p>
 */
@interface AWSS3SourceSelectionCriteria : AWSModel


/**
 <p> A container for filter information for the selection of Amazon S3 objects encrypted with AWS KMS. If you include <code>SourceSelectionCriteria</code> in the replication configuration, this element is required. </p>
 */
@property (nonatomic, strong) AWSS3SseKmsEncryptedObjects * _Nullable sseKmsEncryptedObjects;

@end

/**
 <p>A container for filter information for the selection of S3 objects encrypted with AWS KMS.</p>
 Required parameters: [Status]
 */
@interface AWSS3SseKmsEncryptedObjects : AWSModel


/**
 <p>Specifies whether Amazon S3 replicates objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service.</p>
 */
@property (nonatomic, assign) AWSS3SseKmsEncryptedObjectsStatus status;

@end

/**
 <p>Container for the stats details.</p>
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
 <p>Container for the Stats Event.</p>
 */
@interface AWSS3StatsEvent : AWSModel


/**
 <p>The Stats event details.</p>
 */
@property (nonatomic, strong) AWSS3Stats * _Nullable details;

@end

/**
 <p>Specifies data related to access patterns to be collected and made available to analyze the tradeoffs between different storage classes for an Amazon S3 bucket.</p>
 */
@interface AWSS3StorageClassAnalysis : AWSModel


/**
 <p>Specifies how data related to the storage class analysis for an Amazon S3 bucket should be exported.</p>
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysisDataExport * _Nullable dataExport;

@end

/**
 <p>Container for data related to the storage class analysis for an Amazon S3 bucket for export.</p>
 Required parameters: [OutputSchemaVersion, Destination]
 */
@interface AWSS3StorageClassAnalysisDataExport : AWSModel


/**
 <p>The place to store the data for an analysis.</p>
 */
@property (nonatomic, strong) AWSS3AnalyticsExportDestination * _Nullable destination;

/**
 <p>The version of the output schema to use when exporting data. Must be <code>V_1</code>.</p>
 */
@property (nonatomic, assign) AWSS3StorageClassAnalysisSchemaVersion outputSchemaVersion;

@end

/**
 <p>A container of a key value name pair.</p>
 Required parameters: [Key, Value]
 */
@interface AWSS3Tag : AWSModel


/**
 <p>Name of the object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Value of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Container for <code>TagSet</code> elements.</p>
 Required parameters: [TagSet]
 */
@interface AWSS3Tagging : AWSModel


/**
 <p>A collection for a set of tags</p>
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tagSet;

@end

/**
 <p>Container for granting information.</p>
 */
@interface AWSS3TargetGrant : AWSModel


/**
 <p>Container for the person being granted permissions.</p>
 */
@property (nonatomic, strong) AWSS3Grantee * _Nullable grantee;

/**
 <p>Logging permissions assigned to the grantee for the bucket.</p>
 */
@property (nonatomic, assign) AWSS3BucketLogsPermission permission;

@end

/**
 <p>A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events.</p>
 Required parameters: [TopicArn, Events]
 */
@interface AWSS3TopicConfiguration : AWSModel


/**
 <p>The Amazon S3 bucket event about which to send notifications. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Supported Event Types</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 <p>Specifies object key name filtering rules. For information about key name filtering, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 <p>An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 publishes a message when it detects events of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 <p>A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events. This data type is deprecated. Use <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_TopicConfiguration.html">TopicConfiguration</a> instead.</p>
 */
@interface AWSS3TopicConfigurationDeprecated : AWSModel


/**
 <p>Bucket event for which to send notifications.</p>
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 <p>A collection of events related to objects</p>
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
 <p>Specifies when an object transitions to a specified storage class. For more information about Amazon S3 lifecycle configuration rules, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html">Transitioning Objects Using Amazon S3 Lifecycle</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSS3Transition : AWSModel


/**
 <p>Indicates when objects are transitioned to the specified storage class. The date value must be in ISO 8601 format. The time is always midnight UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 <p>Indicates the number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 <p>The storage class to which you want the object to transition.</p>
 */
@property (nonatomic, assign) AWSS3TransitionStorageClass storageClass;

@end

/**
 
 */
@interface AWSS3UploadPartCopyOutput : AWSModel


/**
 <p>Container for all response elements.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) that was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

@end

/**
 
 */
@interface AWSS3UploadPartCopyRequest : AWSRequest


/**
 <p>The bucket name.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies the source object for the copy operation. You specify the value in one of two formats, depending on whether you want to access the source object through an <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">access point</a>:</p><ul><li><p>For objects not accessed through an access point, specify the name of the source bucket and key of the source object, separated by a slash (/). For example, to copy the object <code>reports/january.pdf</code> from the bucket <code>awsexamplebucket</code>, use <code>awsexamplebucket/reports/january.pdf</code>. The value must be URL encoded.</p></li><li><p>For objects accessed through access points, specify the Amazon Resource Name (ARN) of the object as accessed through the access point, in the format <code>arn:aws:s3:&lt;Region&gt;:&lt;account-id&gt;:accesspoint/&lt;access-point-name&gt;/object/&lt;key&gt;</code>. For example, to copy the object <code>reports/january.pdf</code> through access point <code>my-access-point</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf</code>. The value must be URL encoded.</p><note><p>Amazon S3 supports copy operations using access points only when the source and destination buckets are in the same AWS Region.</p></note><p>Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object as accessed in the format <code>arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/object/&lt;key&gt;</code>. For example, to copy the object <code>reports/january.pdf</code> through outpost <code>my-outpost</code> owned by account <code>123456789012</code> in Region <code>us-west-2</code>, use the URL encoding of <code>arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf</code>. The value must be URL encoded. </p></li></ul><p>To copy a specific version of an object, append <code>?versionId=&lt;version-id&gt;</code> to the value (for example, <code>awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893</code>). If you don't specify a version ID, Amazon S3 copies the latest version of the source object.</p>
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
 <p>The range of bytes to copy from the source object. The range value must use the form bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example, bytes=0-9 indicates that you want to copy the first 10 bytes of the source. You can copy a range only if the source object is greater than 5 MB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceRange;

/**
 <p>Specifies the algorithm to use when decrypting the source object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 <p>The account id of the expected destination bucket owner. If the destination bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>The account id of the expected source bucket owner. If the source bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedSourceBucketOwner;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of part being copied. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm</code> header. This must be the same encryption key specified in the initiate multipart upload request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
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
 <p>If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round-trip message integrity verification of the customer-provided encryption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>If present, specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) was used for the object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 <p>The server-side encryption algorithm used when storing this object in Amazon S3 (for example, AES256, aws:kms).</p>
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
 <p>The name of the bucket to which the multipart upload was initiated.</p><p>When using this API with an access point, you must direct requests to the access point hostname. The access point hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.s3-accesspoint.<i>Region</i>.amazonaws.com. When using this operation with an access point through the AWS SDKs, you provide the access point ARN in place of the bucket name. For more information about access point ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/using-access-points.html">Using Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>When using this API with Amazon S3 on Outposts, you must direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form <i>AccessPointName</i>-<i>AccountId</i>.<i>outpostID</i>.s3-outposts.<i>Region</i>.amazonaws.com. When using this operation using S3 on Outposts through the AWS SDKs, you provide the Outposts bucket ARN in place of the bucket name. For more information about S3 on Outposts ARNs, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/S3onOutposts.html">Using S3 on Outposts</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p>The base64-encoded 128-bit MD5 digest of the part data. This parameter is auto-populated when using the command from the CLI. This parameter is required if object lock parameters are specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p>The account id of the expected bucket owner. If the bucket is owned by a different account, the request will fail with an HTTP <code>403 (Access Denied)</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedBucketOwner;

/**
 <p>Object key for which the multipart upload was initiated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Part number of part being uploaded. This is a positive integer between 1 and 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 <p>Confirms that the requester knows that they will be charged for the request. Bucket owners need not specify this parameter in their requests. For information about downloading objects from requester pays buckets, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html">Downloading Objects in Requestor Pays Buckets</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 <p>Specifies the algorithm to use to when encrypting the object (for example, AES256).</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 <p>Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon S3 does not store the encryption key. The key must be appropriate for use with the algorithm specified in the <code>x-amz-server-side-encryption-customer-algorithm header</code>. This must be the same encryption key specified in the initiate multipart upload request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 <p>Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure that the encryption key was transmitted without error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 <p>Upload ID identifying the multipart upload whose part is being uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>Describes the versioning state of an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTVersioningStatus.html">PUT Bucket versioning</a> in the <i>Amazon Simple Storage Service API Reference</i>.</p>
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
 <p>Specifies website configuration parameters for an Amazon S3 bucket.</p>
 */
@interface AWSS3WebsiteConfiguration : AWSModel


/**
 <p>The name of the error document for the website.</p>
 */
@property (nonatomic, strong) AWSS3ErrorDocument * _Nullable errorDocument;

/**
 <p>The name of the index document for the website.</p>
 */
@property (nonatomic, strong) AWSS3IndexDocument * _Nullable indexDocument;

/**
 <p>The redirect behavior for every request to this bucket's website endpoint.</p><important><p>If you specify this property, you can't specify any other property.</p></important>
 */
@property (nonatomic, strong) AWSS3RedirectAllRequestsTo * _Nullable redirectAllRequestsTo;

/**
 <p>Rules that define when a redirect is applied and the redirect behavior.</p>
 */
@property (nonatomic, strong) NSArray<AWSS3RoutingRule *> * _Nullable routingRules;

@end

NS_ASSUME_NONNULL_END
