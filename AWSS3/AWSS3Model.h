//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSS3BucketLocationConstraintEUWest2,
    AWSS3BucketLocationConstraintUSEast2,
    AWSS3BucketLocationConstraintUSWest1,
    AWSS3BucketLocationConstraintUSWest2,
    AWSS3BucketLocationConstraintAPSouth1,
    AWSS3BucketLocationConstraintAPSoutheast1,
    AWSS3BucketLocationConstraintAPSoutheast2,
    AWSS3BucketLocationConstraintAPNortheast1,
    AWSS3BucketLocationConstraintAPNortheast2,
    AWSS3BucketLocationConstraintSAEast1,
    AWSS3BucketLocationConstraintCNNorth1,
    AWSS3BucketLocationConstraintUSGovWest1,
    AWSS3BucketLocationConstraintEUCentral1,
    AWSS3BucketLocationConstraintCACentral1,
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
};

typedef NS_ENUM(NSInteger, AWSS3ExpirationStatus) {
    AWSS3ExpirationStatusUnknown,
    AWSS3ExpirationStatusEnabled,
    AWSS3ExpirationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSS3FilterRuleName) {
    AWSS3FilterRuleNameUnknown,
    AWSS3FilterRuleNamePrefix,
    AWSS3FilterRuleNameSuffix,
};

typedef NS_ENUM(NSInteger, AWSS3InventoryFormat) {
    AWSS3InventoryFormatUnknown,
    AWSS3InventoryFormatCsv,
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

typedef NS_ENUM(NSInteger, AWSS3ObjectStorageClass) {
    AWSS3ObjectStorageClassUnknown,
    AWSS3ObjectStorageClassStandard,
    AWSS3ObjectStorageClassReducedRedundancy,
    AWSS3ObjectStorageClassGlacier,
};

typedef NS_ENUM(NSInteger, AWSS3ObjectVersionStorageClass) {
    AWSS3ObjectVersionStorageClassUnknown,
    AWSS3ObjectVersionStorageClassStandard,
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

typedef NS_ENUM(NSInteger, AWSS3ServerSideEncryption) {
    AWSS3ServerSideEncryptionUnknown,
    AWSS3ServerSideEncryptionAES256,
    AWSS3ServerSideEncryptionAwsKms,
};

typedef NS_ENUM(NSInteger, AWSS3StorageClass) {
    AWSS3StorageClassUnknown,
    AWSS3StorageClassStandard,
    AWSS3StorageClassReducedRedundancy,
    AWSS3StorageClassStandardIa,
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
@class AWSS3CloudFunctionConfiguration;
@class AWSS3CommonPrefix;
@class AWSS3CompleteMultipartUploadOutput;
@class AWSS3CompleteMultipartUploadRequest;
@class AWSS3CompletedMultipartUpload;
@class AWSS3CompletedPart;
@class AWSS3Condition;
@class AWSS3ReplicateObjectOutput;
@class AWSS3ReplicateObjectRequest;
@class AWSS3ReplicateObjectResult;
@class AWSS3ReplicatePartResult;
@class AWSS3CreateBucketConfiguration;
@class AWSS3CreateBucketOutput;
@class AWSS3CreateBucketRequest;
@class AWSS3CreateMultipartUploadOutput;
@class AWSS3CreateMultipartUploadRequest;
@class AWSS3Remove;
@class AWSS3DeleteBucketAnalyticsConfigurationRequest;
@class AWSS3DeleteBucketCorsRequest;
@class AWSS3DeleteBucketInventoryConfigurationRequest;
@class AWSS3DeleteBucketLifecycleRequest;
@class AWSS3DeleteBucketMetricsConfigurationRequest;
@class AWSS3DeleteBucketPolicyRequest;
@class AWSS3DeleteBucketReplicationRequest;
@class AWSS3DeleteBucketRequest;
@class AWSS3DeleteBucketTaggingRequest;
@class AWSS3DeleteBucketWebsiteRequest;
@class AWSS3DeleteMarkerEntry;
@class AWSS3DeleteObjectOutput;
@class AWSS3DeleteObjectRequest;
@class AWSS3DeleteObjectTaggingOutput;
@class AWSS3DeleteObjectTaggingRequest;
@class AWSS3DeleteObjectsOutput;
@class AWSS3DeleteObjectsRequest;
@class AWSS3DeletedObject;
@class AWSS3Destination;
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
@class AWSS3GetObjectOutput;
@class AWSS3GetObjectRequest;
@class AWSS3GetObjectTaggingOutput;
@class AWSS3GetObjectTaggingRequest;
@class AWSS3GetObjectTorrentOutput;
@class AWSS3GetObjectTorrentRequest;
@class AWSS3GlacierJobParameters;
@class AWSS3Grant;
@class AWSS3Grantee;
@class AWSS3HeadBucketRequest;
@class AWSS3HeadObjectOutput;
@class AWSS3HeadObjectRequest;
@class AWSS3IndexDocument;
@class AWSS3Initiator;
@class AWSS3InventoryConfiguration;
@class AWSS3InventoryDestination;
@class AWSS3InventoryFilter;
@class AWSS3InventoryS3BucketDestination;
@class AWSS3InventorySchedule;
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
@class AWSS3ObjectVersion;
@class AWSS3Owner;
@class AWSS3Part;
@class AWSS3PutBucketAccelerateConfigurationRequest;
@class AWSS3PutBucketAclRequest;
@class AWSS3PutBucketAnalyticsConfigurationRequest;
@class AWSS3PutBucketCorsRequest;
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
@class AWSS3PutObjectOutput;
@class AWSS3PutObjectRequest;
@class AWSS3PutObjectTaggingOutput;
@class AWSS3PutObjectTaggingRequest;
@class AWSS3QueueConfiguration;
@class AWSS3QueueConfigurationDeprecated;
@class AWSS3Redirect;
@class AWSS3RedirectAllRequestsTo;
@class AWSS3ReplicationConfiguration;
@class AWSS3ReplicationRule;
@class AWSS3RequestPaymentConfiguration;
@class AWSS3RestoreObjectOutput;
@class AWSS3RestoreObjectRequest;
@class AWSS3RestoreRequest;
@class AWSS3RoutingRule;
@class AWSS3Rule;
@class AWSS3S3KeyFilter;
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
 Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.
 */
@interface AWSS3AbortIncompleteMultipartUpload : AWSModel


/**
 Indicates the number of days that must pass since initiation for Lifecycle to abort an Incomplete Multipart Upload.
 */
@property (nonatomic, strong) NSNumber * _Nullable daysAfterInitiation;

@end

/**
 
 */
@interface AWSS3AbortMultipartUploadOutput : AWSModel


/**
 If present, indicates that the requester was successfully charged for the request.
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
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
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
 The accelerate configuration of the bucket.
 */
@property (nonatomic, assign) AWSS3BucketAccelerateStatus status;

@end

/**
 
 */
@interface AWSS3AccessControlPolicy : AWSModel


/**
 A list of grants.
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

@end

/**
 
 */
@interface AWSS3AnalyticsAndOperator : AWSModel


/**
 The prefix to use when evaluating an AND predicate.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 The list of tags to use when evaluating an AND predicate.
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSS3AnalyticsConfiguration : AWSModel


/**
 The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.
 */
@property (nonatomic, strong) AWSS3AnalyticsFilter * _Nullable filter;

/**
 The identifier used to represent an analytics configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 If present, it indicates that data related to access patterns will be collected and made available to analyze the tradeoffs between different storage classes.
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysis * _Nullable storageClassAnalysis;

@end

/**
 
 */
@interface AWSS3AnalyticsExportDestination : AWSModel


/**
 A destination signifying output to an S3 bucket.
 */
@property (nonatomic, strong) AWSS3AnalyticsS3BucketDestination * _Nullable s3BucketDestination;

@end

/**
 
 */
@interface AWSS3AnalyticsFilter : AWSModel


/**
 A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The operator must have at least two predicates.
 */
@property (nonatomic, strong) AWSS3AnalyticsAndOperator * _Nullable AND;

/**
 The prefix to use when evaluating an analytics filter.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 The tag to use when evaluating an analytics filter.
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3AnalyticsS3BucketDestination : AWSModel


/**
 The Amazon resource name (ARN) of the bucket to which data is exported.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The account ID that owns the destination bucket. If no account ID is provided, the owner will not be validated prior to exporting data.
 */
@property (nonatomic, strong) NSString * _Nullable bucketAccountId;

/**
 The file format used when exporting data to Amazon S3.
 */
@property (nonatomic, assign) AWSS3AnalyticsS3ExportFileFormat format;

/**
 The prefix to use when exporting data. The exported data begins with this prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3Bucket : AWSModel


/**
 Date the bucket was created.
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 The name of the bucket.
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
 Specifies which headers are allowed in a pre-flight OPTIONS request.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedHeaders;

/**
 Identifies HTTP methods that the domain/origin specified in the rule is allowed to execute.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedMethods;

/**
 One or more origins you want customers to be able to access the bucket from.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOrigins;

/**
 One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exposeHeaders;

/**
 The time in seconds that your browser is to cache the preflight response for the specified resource.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAgeSeconds;

@end

/**
 
 */
@interface AWSS3CloudFunctionConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable cloudFunction;

/**
 Bucket event for which to send notifications.
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
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
 Entity tag of the object.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 Version of the object.
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
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
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
 Entity tag returned when the part was uploaded.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 Part number that identifies the part. This is a positive integer between 1 and 10,000.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

@end

/**
 
 */
@interface AWSS3Condition : AWSModel


/**
 The HTTP error code when the redirect is applied. In the event of an error, if the error code equals this value, then the specified redirect is applied. Required when parent element Condition is specified and sibling KeyPrefixEquals is not specified. If both are specified, then both must be true for the redirect to be applied.
 */
@property (nonatomic, strong) NSString * _Nullable httpErrorCodeReturnedEquals;

/**
 The object key name prefix when the redirect is applied. For example, to redirect requests for ExamplePage.html, the key prefix will be ExamplePage.html. To redirect request for all pages with the prefix docs/, the key prefix will be /docs, which identifies all objects in the docs/ folder. Required when the parent element Condition is specified and sibling HttpErrorCodeReturnedEquals is not specified. If both conditions are specified, both must be true for the redirect to be applied.
 */
@property (nonatomic, strong) NSString * _Nullable keyPrefixEquals;

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
 If the object expiration is configured, the response includes this header.
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 Version ID of the newly created copy.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3ReplicateObjectRequest : AWSRequest


/**
 The canned ACL to apply to the object.
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Specifies caching behavior along the request/reply chain.
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 Specifies presentational information for the object.
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 The language the content is in.
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 A standard MIME type describing the format of the object data.
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSource;

/**
 Copies the object if its entity tag (ETag) matches the specified tag.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfMatch;

/**
 Copies the object if it has been modified since the specified time.
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfModifiedSince;

/**
 Copies the object if its entity tag (ETag) is different than the specified ETag.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfNoneMatch;

/**
 Copies the object if it hasn't been modified since the specified time.
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfUnmodifiedSince;

/**
 Specifies the algorithm to use when decrypting the source object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 The date and time at which the object is no longer cacheable.
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to read the object data and its metadata.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the object ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to write the ACL for the applicable object.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 A map of metadata to store with the object in S3.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 Specifies whether the metadata is copied from the source object or replaced with metadata provided in the request.
 */
@property (nonatomic, assign) AWSS3MetadataDirective metadataDirective;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 The type of storage to use for the object. Defaults to 'STANDARD'.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 The tag-set for the object destination object this value must be used in conjunction with the TaggingDirective. The tag-set must be encoded as URL Query parameters
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 Specifies whether the object tag-set are copied from the source object or replaced with tag-set provided in the request.
 */
@property (nonatomic, assign) AWSS3TaggingDirective taggingDirective;

/**
 If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.
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
 Entity tag of the object.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 Date and time at which the object was uploaded.
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

@end

/**
 
 */
@interface AWSS3CreateBucketConfiguration : AWSModel


/**
 Specifies the region where the bucket will be created. If you don't specify a region, the bucket will be created in US Standard.
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
 The canned ACL to apply to the bucket.
 */
@property (nonatomic, assign) AWSS3BucketCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) AWSS3CreateBucketConfiguration * _Nullable createBucketConfiguration;

/**
 Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to list the objects in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the bucket ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to create, overwrite, and delete any object in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 Allows grantee to write the ACL for the applicable bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

@end

/**
 
 */
@interface AWSS3CreateMultipartUploadOutput : AWSModel


/**
 Date when multipart upload will become eligible for abort operation by lifecycle.
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 Id of the lifecycle rule that makes a multipart upload eligible for abort operation.
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 Name of the bucket to which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Object key for which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 ID for the initiated multipart upload.
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3CreateMultipartUploadRequest : AWSRequest


/**
 The canned ACL to apply to the object.
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Specifies caching behavior along the request/reply chain.
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 Specifies presentational information for the object.
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 The language the content is in.
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 A standard MIME type describing the format of the object data.
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 The date and time at which the object is no longer cacheable.
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to read the object data and its metadata.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the object ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to write the ACL for the applicable object.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 A map of metadata to store with the object in S3.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 The type of storage to use for the object. Defaults to 'STANDARD'.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

@end

/**
 
 */
@interface AWSS3Remove : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3ObjectIdentifier *> * _Nullable objects;

/**
 Element to enable quiet mode for the request. When you add this element, you must set its value to true.
 */
@property (nonatomic, strong) NSNumber * _Nullable quiet;

@end

/**
 
 */
@interface AWSS3DeleteBucketAnalyticsConfigurationRequest : AWSRequest


/**
 The name of the bucket from which an analytics configuration is deleted.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The identifier used to represent an analytics configuration.
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
@interface AWSS3DeleteBucketInventoryConfigurationRequest : AWSRequest


/**
 The name of the bucket containing the inventory configuration to delete.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the inventory configuration.
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
 The name of the bucket containing the metrics configuration to delete.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the metrics configuration.
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
 Specifies whether the object is (true) or is not (false) the latest version of an object.
 */
@property (nonatomic, strong) NSNumber * _Nullable isLatest;

/**
 The object key.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Date and time the object was last modified.
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 Version ID of an object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectOutput : AWSModel


/**
 Specifies whether the versioned object that was permanently deleted was (true) or was not (false) a delete marker.
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 Returns the version ID of the delete marker created as a result of the DELETE operation.
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
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 VersionId used to reference a specific version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3DeleteObjectTaggingOutput : AWSModel


/**
 The versionId of the object the tag-set was removed from.
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
 The versionId of the object that the tag-set will be removed from.
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
 If present, indicates that the requester was successfully charged for the request.
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
 
 */
@property (nonatomic, strong) AWSS3Remove * _Nullable remove;

/**
 The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.
 */
@property (nonatomic, strong) NSString * _Nullable MFA;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

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
 
 */
@interface AWSS3Destination : AWSModel


/**
 Amazon resource name (ARN) of the bucket where you want Amazon S3 to store replicas of the object identified by the rule.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

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
 The object key name to use when a 4XX class error occurs.
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 Container for key value pair that defines the criteria for the filter rule.
 */
@interface AWSS3FilterRule : AWSModel


/**
 Object key name prefix or suffix identifying one or more objects to which the filtering rule applies. Maximum prefix length can be up to 1,024 characters. Overlapping prefixes and suffixes are not supported. For more information, go to <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.
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
 The accelerate configuration of the bucket.
 */
@property (nonatomic, assign) AWSS3BucketAccelerateStatus status;

@end

/**
 
 */
@interface AWSS3GetBucketAccelerateConfigurationRequest : AWSRequest


/**
 Name of the bucket for which the accelerate configuration is retrieved.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketAclOutput : AWSModel


/**
 A list of grants.
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
 The configuration and any analyses for the analytics filter.
 */
@property (nonatomic, strong) AWSS3AnalyticsConfiguration * _Nullable analyticsConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketAnalyticsConfigurationRequest : AWSRequest


/**
 The name of the bucket from which an analytics configuration is retrieved.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The identifier used to represent an analytics configuration.
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
@interface AWSS3GetBucketInventoryConfigurationOutput : AWSModel


/**
 Specifies the inventory configuration.
 */
@property (nonatomic, strong) AWSS3InventoryConfiguration * _Nullable inventoryConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketInventoryConfigurationRequest : AWSRequest


/**
 The name of the bucket containing the inventory configuration to retrieve.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the inventory configuration.
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
 Specifies the metrics configuration.
 */
@property (nonatomic, strong) AWSS3MetricsConfiguration * _Nullable metricsConfiguration;

@end

/**
 
 */
@interface AWSS3GetBucketMetricsConfigurationRequest : AWSRequest


/**
 The name of the bucket containing the metrics configuration to retrieve.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the metrics configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3GetBucketNotificationConfigurationRequest : AWSRequest


/**
 Name of the bucket to get the notification configuration for.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3GetBucketPolicyOutput : AWSModel


/**
 The bucket policy as a JSON document.
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
@interface AWSS3GetBucketReplicationOutput : AWSModel


/**
 Container for replication rules. You can add as many as 1,000 rules. Total replication configuration size can be up to 2 MB.
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
 Specifies who pays for the download and request fees.
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
 Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.
 */
@property (nonatomic, assign) AWSS3MFADeleteStatus MFADelete;

/**
 The versioning state of the bucket.
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
 A list of grants.
 */
@property (nonatomic, strong) NSArray<AWSS3Grant *> * _Nullable grants;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 If present, indicates that the requester was successfully charged for the request.
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
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 VersionId used to reference a specific version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3GetObjectOutput : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable acceptRanges;

/**
 Object data.
 */
@property (nonatomic, strong) id _Nullable body;

/**
 Specifies caching behavior along the request/reply chain.
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 Specifies presentational information for the object.
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 The language the content is in.
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 Size of the body in bytes.
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 The portion of the object returned in the response.
 */
@property (nonatomic, strong) NSString * _Nullable contentRange;

/**
 A standard MIME type describing the format of the object data.
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 The date and time at which the object is no longer cacheable.
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 Last modified date of the object
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 A map of metadata to store with the object in S3.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 The count of parts this object has.
 */
@property (nonatomic, strong) NSNumber * _Nullable partsCount;

/**
 
 */
@property (nonatomic, assign) AWSS3ReplicationStatus replicationStatus;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 Provides information about object restoration operation and expiration time of the restored object copy.
 */
@property (nonatomic, strong) NSString * _Nullable restore;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 The number of tags, if any, on the object.
 */
@property (nonatomic, strong) NSNumber * _Nullable tagCount;

/**
 Version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.
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
 Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).
 */
@property (nonatomic, strong) NSDate * _Nullable ifModifiedSince;

/**
 Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).
 */
@property (nonatomic, strong) NSString * _Nullable ifNoneMatch;

/**
 Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).
 */
@property (nonatomic, strong) NSDate * _Nullable ifUnmodifiedSince;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' GET request for the part specified. Useful for downloading just a part of an object.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Sets the Cache-Control header of the response.
 */
@property (nonatomic, strong) NSString * _Nullable responseCacheControl;

/**
 Sets the Content-Disposition header of the response
 */
@property (nonatomic, strong) NSString * _Nullable responseContentDisposition;

/**
 Sets the Content-Encoding header of the response.
 */
@property (nonatomic, strong) NSString * _Nullable responseContentEncoding;

/**
 Sets the Content-Language header of the response.
 */
@property (nonatomic, strong) NSString * _Nullable responseContentLanguage;

/**
 Sets the Content-Type header of the response.
 */
@property (nonatomic, strong) NSString * _Nullable responseContentType;

/**
 Sets the Expires header of the response.
 */
@property (nonatomic, strong) NSDate * _Nullable responseExpires;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 VersionId used to reference a specific version of the object.
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
 If present, indicates that the requester was successfully charged for the request.
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
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

@end

/**
 
 */
@interface AWSS3GlacierJobParameters : AWSModel


/**
 Glacier retrieval tier at which the restore will be processed.
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
 Specifies the permission given to the grantee.
 */
@property (nonatomic, assign) AWSS3Permission permission;

@end

/**
 
 */
@interface AWSS3Grantee : AWSModel


/**
 Screen name of the grantee.
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 Email address of the grantee.
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 The canonical user ID of the grantee.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Type of grantee
 */
@property (nonatomic, assign) AWSS3Types types;

/**
 URI of the grantee group.
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
 Specifies caching behavior along the request/reply chain.
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 Specifies presentational information for the object.
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 The language the content is in.
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 Size of the body in bytes.
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 A standard MIME type describing the format of the object data.
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If false, this response header does not appear in the response.
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteMarker;

/**
 An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 If the object expiration is configured (see PUT Bucket lifecycle), the response includes this header. It includes the expiry-date and rule-id key value pairs providing object expiration information. The value of the rule-id is URL encoded.
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 The date and time at which the object is no longer cacheable.
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 Last modified date of the object
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 A map of metadata to store with the object in S3.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 This is set to the number of metadata entries not returned in x-amz-meta headers. This can happen if you create metadata using an API like SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you can create metadata whose values are not legal HTTP headers.
 */
@property (nonatomic, strong) NSNumber * _Nullable missingMeta;

/**
 The count of parts this object has.
 */
@property (nonatomic, strong) NSNumber * _Nullable partsCount;

/**
 
 */
@property (nonatomic, assign) AWSS3ReplicationStatus replicationStatus;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 Provides information about object restoration operation and expiration time of the restored object copy.
 */
@property (nonatomic, strong) NSString * _Nullable restore;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 Version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.
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
 Return the object only if its entity tag (ETag) is the same as the one specified, otherwise return a 412 (precondition failed).
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 Return the object only if it has been modified since the specified time, otherwise return a 304 (not modified).
 */
@property (nonatomic, strong) NSDate * _Nullable ifModifiedSince;

/**
 Return the object only if its entity tag (ETag) is different from the one specified, otherwise return a 304 (not modified).
 */
@property (nonatomic, strong) NSString * _Nullable ifNoneMatch;

/**
 Return the object only if it has not been modified since the specified time, otherwise return a 412 (precondition failed).
 */
@property (nonatomic, strong) NSDate * _Nullable ifUnmodifiedSince;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Part number of the object being read. This is a positive integer between 1 and 10,000. Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about the size of the part and the number of parts in this object.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 Downloads the specified range bytes of an object. For more information about the HTTP Range header, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.
 */
@property (nonatomic, strong) NSString * _Nullable range;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 VersionId used to reference a specific version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3IndexDocument : AWSModel


/**
 A suffix that is appended to a request that is for a directory on the website endpoint (e.g. if the suffix is index.html and you make a request to samplebucket/images/ the data that is returned will be for the object with the key name images/index.html) The suffix must not be empty and must not include a slash character.
 */
@property (nonatomic, strong) NSString * _Nullable suffix;

@end

/**
 
 */
@interface AWSS3Initiator : AWSModel


/**
 Name of the Principal.
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 If the principal is an AWS account, it provides the Canonical User ID. If the principal is an IAM User, it provides a user ARN value.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3InventoryConfiguration : AWSModel


/**
 Contains information about where to publish the inventory results.
 */
@property (nonatomic, strong) AWSS3InventoryDestination * _Nullable destination;

/**
 Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.
 */
@property (nonatomic, strong) AWSS3InventoryFilter * _Nullable filter;

/**
 The ID used to identify the inventory configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Specifies which object version(s) to included in the inventory results.
 */
@property (nonatomic, assign) AWSS3InventoryIncludedObjectVersions includedObjectVersions;

/**
 Specifies whether the inventory is enabled or disabled.
 */
@property (nonatomic, strong) NSNumber * _Nullable isEnabled;

/**
 Contains the optional fields that are included in the inventory results.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable optionalFields;

/**
 Specifies the schedule for generating inventory results.
 */
@property (nonatomic, strong) AWSS3InventorySchedule * _Nullable schedule;

@end

/**
 
 */
@interface AWSS3InventoryDestination : AWSModel


/**
 Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.
 */
@property (nonatomic, strong) AWSS3InventoryS3BucketDestination * _Nullable s3BucketDestination;

@end

/**
 
 */
@interface AWSS3InventoryFilter : AWSModel


/**
 The prefix that an object must have to be included in the inventory results.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3InventoryS3BucketDestination : AWSModel


/**
 The ID of the account that owns the destination bucket.
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 The Amazon resource name (ARN) of the bucket where inventory results will be published.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Specifies the output format of the inventory results.
 */
@property (nonatomic, assign) AWSS3InventoryFormat format;

/**
 The prefix that is prepended to all inventory results.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSS3InventorySchedule : AWSModel


/**
 Specifies how frequently inventory results are produced.
 */
@property (nonatomic, assign) AWSS3InventoryFrequency frequency;

@end

/**
 Container for specifying the AWS Lambda notification configuration.
 Required parameters: [LambdaFunctionArn, Events]
 */
@interface AWSS3LambdaFunctionConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Container for object key name filtering rules. For information about key name filtering, go to <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Lambda cloud function ARN that Amazon S3 can invoke when it detects events of the specified type.
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
 Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.
 */
@property (nonatomic, strong) NSNumber * _Nullable expiredObjectDeleteMarker;

@end

/**
 
 */
@interface AWSS3LifecycleRule : AWSModel


/**
 Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.
 */
@property (nonatomic, strong) AWSS3LifecycleRuleFilter * _Nullable filter;

/**
 Unique identifier for the rule. The value cannot be longer than 255 characters.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionExpiration * _Nullable noncurrentVersionExpiration;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3NoncurrentVersionTransition *> * _Nullable noncurrentVersionTransitions;

/**
 Prefix identifying one or more objects to which the rule applies. This is deprecated; use Filter instead.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Transition *> * _Nullable transitions;

@end

/**
 This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.
 */
@interface AWSS3LifecycleRuleAndOperator : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 All of these tags must exist in the object's tag set in order for the rule to apply.
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.
 */
@interface AWSS3LifecycleRuleFilter : AWSModel


/**
 This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.
 */
@property (nonatomic, strong) AWSS3LifecycleRuleAndOperator * _Nullable AND;

/**
 Prefix identifying one or more objects to which the rule applies.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 This tag must exist in the object's tag set in order for the rule to apply.
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3ListBucketAnalyticsConfigurationsOutput : AWSModel


/**
 The list of analytics configurations for a bucket.
 */
@property (nonatomic, strong) NSArray<AWSS3AnalyticsConfiguration *> * _Nullable analyticsConfigurationList;

/**
 The ContinuationToken that represents where this request began.
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 Indicates whether the returned list of analytics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 NextContinuationToken is sent when isTruncated is true, which indicates that there are more analytics configurations to list. The next request must include this NextContinuationToken. The token is obfuscated and is not a usable value.
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketAnalyticsConfigurationsRequest : AWSRequest


/**
 The name of the bucket from which analytics configurations are retrieved.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ContinuationToken that represents a placeholder from where this request should begin.
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketInventoryConfigurationsOutput : AWSModel


/**
 If sent in the request, the marker that is used as a starting point for this inventory configuration list response.
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 The list of inventory configurations for a bucket.
 */
@property (nonatomic, strong) NSArray<AWSS3InventoryConfiguration *> * _Nullable inventoryConfigurationList;

/**
 Indicates whether the returned list of inventory configurations is truncated in this response. A value of true indicates that the list is truncated.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 The marker used to continue this inventory configuration listing. Use the NextContinuationToken from this response to continue the listing in a subsequent request. The continuation token is an opaque value that Amazon S3 understands.
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketInventoryConfigurationsRequest : AWSRequest


/**
 The name of the bucket containing the inventory configurations to retrieve.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The marker used to continue an inventory configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketMetricsConfigurationsOutput : AWSModel


/**
 The marker that is used as a starting point for this metrics configuration list response. This value is present if it was sent in the request.
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 Indicates whether the returned list of metrics configurations is complete. A value of true indicates that the list is not complete and the NextContinuationToken will be provided for a subsequent request.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 The list of metrics configurations for a bucket.
 */
@property (nonatomic, strong) NSArray<AWSS3MetricsConfiguration *> * _Nullable metricsConfigurationList;

/**
 The marker used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

@end

/**
 
 */
@interface AWSS3ListBucketMetricsConfigurationsRequest : AWSRequest


/**
 The name of the bucket containing the metrics configurations to retrieve.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The marker that is used to continue a metrics configuration listing that has been truncated. Use the NextContinuationToken from a previously truncated list response to continue the listing. The continuation token is an opaque value that Amazon S3 understands.
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
 Name of the bucket to which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Encoding type used by Amazon S3 to encode object keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 Indicates whether the returned list of multipart uploads is truncated. A value of true indicates that the list was truncated. The list can be truncated if the number of multipart uploads exceeds the limit allowed or specified by max uploads.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 The key at or after which the listing began.
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 Maximum number of multipart uploads that could have been included in the response.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxUploads;

/**
 When a list is truncated, this element specifies the value that should be used for the key-marker request parameter in a subsequent request.
 */
@property (nonatomic, strong) NSString * _Nullable nextKeyMarker;

/**
 When a list is truncated, this element specifies the value that should be used for the upload-id-marker request parameter in a subsequent request.
 */
@property (nonatomic, strong) NSString * _Nullable nextUploadIdMarker;

/**
 When a prefix is provided in the request, this field contains the specified prefix. The result contains only keys starting with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 Upload ID after which listing began.
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
 Character you use to group keys.
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 Together with upload-id-marker, this parameter specifies the multipart upload after which listing should begin.
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response body. 1,000 is the maximum number of uploads that can be returned in a response.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxUploads;

/**
 Lists in-progress uploads only for those keys that begin with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 Together with key-marker, specifies the multipart upload after which listing should begin. If key-marker is not specified, the upload-id-marker parameter is ignored.
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
 Encoding type used by Amazon S3 to encode object keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria. If your results were truncated, you can make a follow-up paginated request using the NextKeyMarker and NextVersionIdMarker response parameters as a starting place in another request to return the rest of the results.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 Marks the last Key returned in a truncated response.
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 Use this value for the key marker request parameter in a subsequent request.
 */
@property (nonatomic, strong) NSString * _Nullable nextKeyMarker;

/**
 Use this value for the next version id marker parameter in a subsequent request.
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
 A delimiter is a character you use to group keys.
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 Specifies the key to start with when listing objects in a bucket.
 */
@property (nonatomic, strong) NSString * _Nullable keyMarker;

/**
 Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 Limits the response to keys that begin with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 Specifies the object version you want to start listing from.
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
 Encoding type used by Amazon S3 to encode object keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.
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
 When response is truncated (the IsTruncated element value in the response is true), you can use the key name in this field as marker in the subsequent request to get next set of objects. Amazon S3 lists objects in alphabetical order Note: This element is returned only if you have delimiter request parameter specified. If response does not include the NextMaker and it is truncated, you can use the value of the last Key in the response as the marker in the subsequent request to get the next set of object keys.
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
 A delimiter is a character you use to group keys.
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Requests Amazon S3 to encode the object keys in the response and specifies the encoding method to use. An object key may contain any Unicode character; however, XML 1.0 parser cannot parse some characters, such as characters with an ASCII value from 0 to 10. For characters that are not supported in XML 1.0, you can add this parameter to request that Amazon S3 encode the keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 Specifies the key to start with when listing objects in a bucket.
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 Limits the response to keys that begin with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 Confirms that the requester knows that she or he will be charged for the list objects request. Bucket owners need not specify this parameter in their requests.
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

@end

/**
 
 */
@interface AWSS3ListObjectsV2Output : AWSModel


/**
 CommonPrefixes contains all (if there are any) keys between Prefix and the next occurrence of the string specified by delimiter
 */
@property (nonatomic, strong) NSArray<AWSS3CommonPrefix *> * _Nullable commonPrefixes;

/**
 Metadata about each object returned.
 */
@property (nonatomic, strong) NSArray<AWSS3Object *> * _Nullable contents;

/**
 ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 A delimiter is a character you use to group keys.
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Encoding type used by Amazon S3 to encode object keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 A flag that indicates whether or not Amazon S3 returned all of the results that satisfied the search criteria.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 KeyCount is the number of keys returned with this request. KeyCount will always be less than equals to MaxKeys field. Say you ask for 50 keys, your result will include less than equals 50 keys
 */
@property (nonatomic, strong) NSNumber * _Nullable keyCount;

/**
 Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 Name of the bucket to list.
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 NextContinuationToken is sent when isTruncated is true which means there are more keys in the bucket that can be listed. The next list requests to Amazon S3 can be continued with this NextContinuationToken. NextContinuationToken is obfuscated and is not a real key
 */
@property (nonatomic, strong) NSString * _Nullable nextContinuationToken;

/**
 Limits the response to keys that begin with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListObjectsV2Request : AWSRequest


/**
 Name of the bucket to list.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 ContinuationToken indicates Amazon S3 that the list is being continued on this bucket with a token. ContinuationToken is obfuscated and is not a real key
 */
@property (nonatomic, strong) NSString * _Nullable continuationToken;

/**
 A delimiter is a character you use to group keys.
 */
@property (nonatomic, strong) NSString * _Nullable delimiter;

/**
 Encoding type used by Amazon S3 to encode object keys in the response.
 */
@property (nonatomic, assign) AWSS3EncodingType encodingType;

/**
 The owner field is not present in listV2 by default, if you want to return owner field with each key in the result then set the fetch owner field to true
 */
@property (nonatomic, strong) NSNumber * _Nullable fetchOwner;

/**
 Sets the maximum number of keys returned in the response. The response might contain fewer keys but will never contain more.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxKeys;

/**
 Limits the response to keys that begin with the specified prefix.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 Confirms that the requester knows that she or he will be charged for the list objects request in V2 style. Bucket owners need not specify this parameter in their requests.
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing after this specified key. StartAfter can be any key in the bucket
 */
@property (nonatomic, strong) NSString * _Nullable startAfter;

@end

/**
 
 */
@interface AWSS3ListPartsOutput : AWSModel


/**
 Date when multipart upload will become eligible for abort operation by lifecycle.
 */
@property (nonatomic, strong) NSDate * _Nullable abortDate;

/**
 Id of the lifecycle rule that makes a multipart upload eligible for abort operation.
 */
@property (nonatomic, strong) NSString * _Nullable abortRuleId;

/**
 Name of the bucket to which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Identifies who initiated the multipart upload.
 */
@property (nonatomic, strong) AWSS3Initiator * _Nullable initiator;

/**
 Indicates whether the returned list of parts is truncated.
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 Object key for which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Maximum number of parts that were allowed in the response.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxParts;

/**
 When a list is truncated, this element specifies the last part in the list, as well as the value to use for the part-number-marker request parameter in a subsequent request.
 */
@property (nonatomic, strong) NSNumber * _Nullable nextPartNumberMarker;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 Part number after which listing begins.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumberMarker;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3Part *> * _Nullable parts;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 Upload ID identifying the multipart upload whose parts are being listed.
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
 Sets the maximum number of parts to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxParts;

/**
 Specifies the part after which listing should begin. Only parts with higher part numbers will be listed.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumberMarker;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Upload ID identifying the multipart upload whose parts are being listed.
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3LoggingEnabled : AWSModel


/**
 Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs delivered to any bucket that you own, including the same bucket that is being logged. You can also configure multiple buckets to deliver their logs to the same target bucket. In this case you should choose a different TargetPrefix for each source bucket so that the delivered log files can be distinguished by key.
 */
@property (nonatomic, strong) NSString * _Nullable targetBucket;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSS3TargetGrant *> * _Nullable targetGrants;

/**
 This element lets you specify a prefix for the keys that the log files will be stored under.
 */
@property (nonatomic, strong) NSString * _Nullable targetPrefix;

@end

/**
 
 */
@interface AWSS3MetricsAndOperator : AWSModel


/**
 The prefix used when evaluating an AND predicate.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 The list of tags used when evaluating an AND predicate.
 */
@property (nonatomic, strong) NSArray<AWSS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSS3MetricsConfiguration : AWSModel


/**
 Specifies a metrics configuration filter. The metrics configuration will only include objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).
 */
@property (nonatomic, strong) AWSS3MetricsFilter * _Nullable filter;

/**
 The ID used to identify the metrics configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSS3MetricsFilter : AWSModel


/**
 A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.
 */
@property (nonatomic, strong) AWSS3MetricsAndOperator * _Nullable AND;

/**
 The prefix used when evaluating a metrics filter.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 The tag used when evaluating a metrics filter.
 */
@property (nonatomic, strong) AWSS3Tag * _Nullable tag;

@end

/**
 
 */
@interface AWSS3MultipartUpload : AWSModel


/**
 Date and time at which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSDate * _Nullable initiated;

/**
 Identifies who initiated the multipart upload.
 */
@property (nonatomic, strong) AWSS3Initiator * _Nullable initiator;

/**
 Key of the object for which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 Upload ID that identifies the multipart upload.
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
 */
@interface AWSS3NoncurrentVersionExpiration : AWSModel


/**
 Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.
 */
@property (nonatomic, strong) NSNumber * _Nullable noncurrentDays;

@end

/**
 Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA or GLACIER storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA or GLACIER storage class at a specific period in the object's lifetime.
 */
@interface AWSS3NoncurrentVersionTransition : AWSModel


/**
 Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html">How Amazon S3 Calculates When an Object Became Noncurrent</a> in the Amazon Simple Storage Service Developer Guide.
 */
@property (nonatomic, strong) NSNumber * _Nullable noncurrentDays;

/**
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3TransitionStorageClass storageClass;

@end

/**
 Container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off on the bucket.
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
 Container for object key name filtering rules. For information about key name filtering, go to <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.
 */
@interface AWSS3NotificationConfigurationFilter : AWSModel


/**
 Container for object key name prefix and suffix filtering rules.
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
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3ObjectStorageClass storageClass;

@end

/**
 
 */
@interface AWSS3ObjectIdentifier : AWSModel


/**
 Key name of the object to delete.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 VersionId for the specific version of the object to delete.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3ObjectVersion : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 Specifies whether the object is (true) or is not (false) the latest version of an object.
 */
@property (nonatomic, strong) NSNumber * _Nullable isLatest;

/**
 The object key.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Date and time the object was last modified.
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 
 */
@property (nonatomic, strong) AWSS3Owner * _Nullable owner;

/**
 Size in bytes of the object.
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 The class of storage used to store the object.
 */
@property (nonatomic, assign) AWSS3ObjectVersionStorageClass storageClass;

/**
 Version ID of an object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

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
@interface AWSS3Part : AWSModel


/**
 Entity tag returned when the part was uploaded.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 Date and time at which the part was uploaded.
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 Part number identifying the part. This is a positive integer between 1 and 10,000.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 Size of the uploaded part data.
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 
 */
@interface AWSS3PutBucketAccelerateConfigurationRequest : AWSRequest


/**
 Specifies the Accelerate Configuration you want to set for the bucket.
 */
@property (nonatomic, strong) AWSS3AccelerateConfiguration * _Nullable accelerateConfiguration;

/**
 Name of the bucket for which the accelerate configuration is set.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

@end

/**
 
 */
@interface AWSS3PutBucketAclRequest : AWSRequest


/**
 The canned ACL to apply to the bucket.
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
 Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to list the objects in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the bucket ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to create, overwrite, and delete any object in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 Allows grantee to write the ACL for the applicable bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

@end

/**
 
 */
@interface AWSS3PutBucketAnalyticsConfigurationRequest : AWSRequest


/**
 The configuration and any analyses for the analytics filter.
 */
@property (nonatomic, strong) AWSS3AnalyticsConfiguration * _Nullable analyticsConfiguration;

/**
 The name of the bucket to which an analytics configuration is stored.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The identifier used to represent an analytics configuration.
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
@interface AWSS3PutBucketInventoryConfigurationRequest : AWSRequest


/**
 The name of the bucket where the inventory configuration will be stored.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the inventory configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Specifies the inventory configuration.
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
 The name of the bucket for which the metrics configuration is set.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 The ID used to identify the metrics configuration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Specifies the metrics configuration.
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
 Container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off on the bucket.
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
 
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 The bucket policy as a JSON document.
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
 Container for replication rules. You can add as many as 1,000 rules. Total replication configuration size can be up to 2 MB.
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
 The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device.
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
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

@end

/**
 
 */
@interface AWSS3PutObjectAclRequest : AWSRequest


/**
 The canned ACL to apply to the object.
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
 Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to list the objects in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the bucket ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to create, overwrite, and delete any object in the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWrite;

/**
 Allows grantee to write the ACL for the applicable bucket.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 VersionId used to reference a specific version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectOutput : AWSModel


/**
 Entity tag for the uploaded object.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 If the object expiration is configured, this will contain the expiration date (expiry-date) and rule ID (rule-id). The value of rule-id is URL encoded.
 */
@property (nonatomic, strong) NSString * _Nullable expiration;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 Version of the object.
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3PutObjectRequest : AWSRequest


/**
 The canned ACL to apply to the object.
 */
@property (nonatomic, assign) AWSS3ObjectCannedACL ACL;

/**
 Object data.
 */
@property (nonatomic, strong) id _Nullable body;

/**
 Name of the bucket to which the PUT operation was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Specifies caching behavior along the request/reply chain.
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 Specifies presentational information for the object.
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field.
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 The language the content is in.
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 The base64-encoded 128-bit MD5 digest of the part data.
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 A standard MIME type describing the format of the object data.
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 The date and time at which the object is no longer cacheable.
 */
@property (nonatomic, strong) NSDate * _Nullable expires;

/**
 Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.
 */
@property (nonatomic, strong) NSString * _Nullable grantFullControl;

/**
 Allows grantee to read the object data and its metadata.
 */
@property (nonatomic, strong) NSString * _Nullable grantRead;

/**
 Allows grantee to read the object ACL.
 */
@property (nonatomic, strong) NSString * _Nullable grantReadACP;

/**
 Allows grantee to write the ACL for the applicable object.
 */
@property (nonatomic, strong) NSString * _Nullable grantWriteACP;

/**
 Object key for which the PUT operation was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 A map of metadata to store with the object in S3.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable metadata;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 Specifies the AWS KMS key ID to use for object encryption. All GET and PUT requests for an object protected by AWS KMS will fail if not made via SSL or using SigV4. Documentation on configuring any of the officially supported AWS SDKs and CLI can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

/**
 The type of storage to use for the object. Defaults to 'STANDARD'.
 */
@property (nonatomic, assign) AWSS3StorageClass storageClass;

/**
 The tag-set for the object. The tag-set must be encoded as URL Query parameters
 */
@property (nonatomic, strong) NSString * _Nullable tagging;

/**
 If the bucket is configured as a website, redirects requests for this object to another object in the same bucket or to an external URL. Amazon S3 stores the value of this header in the object metadata.
 */
@property (nonatomic, strong) NSString * _Nullable websiteRedirectLocation;

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
 Container for specifying an configuration when you want Amazon S3 to publish events to an Amazon Simple Queue Service (Amazon SQS) queue.
 Required parameters: [QueueArn, Events]
 */
@interface AWSS3QueueConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Container for object key name filtering rules. For information about key name filtering, go to <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Amazon SQS queue ARN to which Amazon S3 will publish a message when it detects events of specified type.
 */
@property (nonatomic, strong) NSString * _Nullable queueArn;

@end

/**
 
 */
@interface AWSS3QueueConfigurationDeprecated : AWSModel


/**
 Bucket event for which to send notifications.
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable queue;

@end

/**
 
 */
@interface AWSS3Redirect : AWSModel


/**
 The host name to use in the redirect request.
 */
@property (nonatomic, strong) NSString * _Nullable hostName;

/**
 The HTTP redirect code to use on the response. Not required if one of the siblings is present.
 */
@property (nonatomic, strong) NSString * _Nullable httpRedirectCode;

/**
 Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

/**
 The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with KeyPrefixEquals set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents. Not required if one of the siblings is present. Can be present only if ReplaceKeyWith is not provided.
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyPrefixWith;

/**
 The specific object key to use in the redirect request. For example, redirect request to error.html. Not required if one of the sibling is present. Can be present only if ReplaceKeyPrefixWith is not provided.
 */
@property (nonatomic, strong) NSString * _Nullable replaceKeyWith;

@end

/**
 
 */
@interface AWSS3RedirectAllRequestsTo : AWSModel


/**
 Name of the host where requests will be redirected.
 */
@property (nonatomic, strong) NSString * _Nullable hostName;

/**
 Protocol to use (http, https) when redirecting requests. The default is the protocol that is used in the original request.
 */
@property (nonatomic, assign) AWSS3Protocols protocols;

@end

/**
 Container for replication rules. You can add as many as 1,000 rules. Total replication configuration size can be up to 2 MB.
 Required parameters: [Role, Rules]
 */
@interface AWSS3ReplicationConfiguration : AWSModel


/**
 Amazon Resource Name (ARN) of an IAM role for Amazon S3 to assume when replicating the objects.
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 Container for information about a particular replication rule. Replication configuration must have at least one rule and can contain up to 1,000 rules.
 */
@property (nonatomic, strong) NSArray<AWSS3ReplicationRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSS3ReplicationRule : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSS3Destination * _Nullable destination;

/**
 Unique identifier for the rule. The value cannot be longer than 255 characters.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Object keyname prefix identifying one or more objects to which the rule applies. Maximum prefix length can be up to 1,024 characters. Overlapping prefixes are not supported.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 The rule is ignored if status is not Enabled.
 */
@property (nonatomic, assign) AWSS3ReplicationRuleStatus status;

@end

/**
 
 */
@interface AWSS3RequestPaymentConfiguration : AWSModel


/**
 Specifies who pays for the download and request fees.
 */
@property (nonatomic, assign) AWSS3Payer payer;

@end

/**
 
 */
@interface AWSS3RestoreObjectOutput : AWSModel


/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

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
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 
 */
@property (nonatomic, strong) AWSS3RestoreRequest * _Nullable restoreRequest;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSS3RestoreRequest : AWSModel


/**
 Lifetime of the active copy in days
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 Glacier related prameters pertaining to this job.
 */
@property (nonatomic, strong) AWSS3GlacierJobParameters * _Nullable glacierJobParameters;

@end

/**
 
 */
@interface AWSS3RoutingRule : AWSModel


/**
 A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.
 */
@property (nonatomic, strong) AWSS3Condition * _Nullable condition;

/**
 Container for redirect information. You can redirect requests to another host, to another page, or with another protocol. In the event of an error, you can can specify a different error code to return.
 */
@property (nonatomic, strong) AWSS3Redirect * _Nullable redirect;

@end

/**
 
 */
@interface AWSS3Rule : AWSModel


/**
 Specifies the days since the initiation of an Incomplete Multipart Upload that Lifecycle will wait before permanently removing all parts of the upload.
 */
@property (nonatomic, strong) AWSS3AbortIncompleteMultipartUpload * _Nullable abortIncompleteMultipartUpload;

/**
 
 */
@property (nonatomic, strong) AWSS3LifecycleExpiration * _Nullable expiration;

/**
 Unique identifier for the rule. The value cannot be longer than 255 characters.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionExpiration * _Nullable noncurrentVersionExpiration;

/**
 Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA or GLACIER storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA or GLACIER storage class at a specific period in the object's lifetime.
 */
@property (nonatomic, strong) AWSS3NoncurrentVersionTransition * _Nullable noncurrentVersionTransition;

/**
 Prefix identifying one or more objects to which the rule applies.
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.
 */
@property (nonatomic, assign) AWSS3ExpirationStatus status;

/**
 
 */
@property (nonatomic, strong) AWSS3Transition * _Nullable transition;

@end

/**
 Container for object key name prefix and suffix filtering rules.
 */
@interface AWSS3S3KeyFilter : AWSModel


/**
 A list of containers for key value pair that defines the criteria for the filter rule.
 */
@property (nonatomic, strong) NSArray<AWSS3FilterRule *> * _Nullable filterRules;

@end

/**
 
 */
@interface AWSS3StorageClassAnalysis : AWSModel


/**
 A container used to describe how data related to the storage class analysis should be exported.
 */
@property (nonatomic, strong) AWSS3StorageClassAnalysisDataExport * _Nullable dataExport;

@end

/**
 
 */
@interface AWSS3StorageClassAnalysisDataExport : AWSModel


/**
 The place to store the data for an analysis.
 */
@property (nonatomic, strong) AWSS3AnalyticsExportDestination * _Nullable destination;

/**
 The version of the output schema to use when exporting data. Must be V_1.
 */
@property (nonatomic, assign) AWSS3StorageClassAnalysisSchemaVersion outputSchemaVersion;

@end

/**
 
 */
@interface AWSS3Tag : AWSModel


/**
 Name of the tag.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Value of the tag.
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
 Logging permissions assigned to the Grantee for the bucket.
 */
@property (nonatomic, assign) AWSS3BucketLogsPermission permission;

@end

/**
 Container for specifying the configuration when you want Amazon S3 to publish events to an Amazon Simple Notification Service (Amazon SNS) topic.
 Required parameters: [TopicArn, Events]
 */
@interface AWSS3TopicConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Container for object key name filtering rules. For information about key name filtering, go to <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html">Configuring Event Notifications</a> in the Amazon Simple Storage Service Developer Guide.
 */
@property (nonatomic, strong) AWSS3NotificationConfigurationFilter * _Nullable filter;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Amazon SNS topic ARN to which Amazon S3 will publish a message when it detects events of specified type.
 */
@property (nonatomic, strong) NSString * _Nullable topicArn;

@end

/**
 
 */
@interface AWSS3TopicConfigurationDeprecated : AWSModel


/**
 Bucket event for which to send notifications.
 */
@property (nonatomic, assign) AWSS3Event event;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

/**
 Optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 Amazon SNS topic to which Amazon S3 will publish a message to report the specified events for the bucket.
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 
 */
@interface AWSS3Transition : AWSModel


/**
 Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.
 */
@property (nonatomic, strong) NSDate * _Nullable date;

/**
 Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.
 */
@property (nonatomic, strong) NSNumber * _Nullable days;

/**
 The class of storage used to store the object.
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
 The version of the source object that was copied, if you have enabled versioning on the source bucket.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceVersionId;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
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
 The name of the source bucket and key name of the source object, separated by a slash (/). Must be URL-encoded.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSource;

/**
 Copies the object if its entity tag (ETag) matches the specified tag.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfMatch;

/**
 Copies the object if it has been modified since the specified time.
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfModifiedSince;

/**
 Copies the object if its entity tag (ETag) is different than the specified ETag.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceIfNoneMatch;

/**
 Copies the object if it hasn't been modified since the specified time.
 */
@property (nonatomic, strong) NSDate * _Nullable replicateSourceIfUnmodifiedSince;

/**
 The range of bytes to copy from the source object. The range value must use the form bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example, bytes=0-9 indicates that you want to copy the first ten bytes of the source. You can copy a range only if the source object is greater than 5 GB.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceRange;

/**
 Specifies the algorithm to use when decrypting the source object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source object. The encryption key provided in this header must be one that was used when the source object was created.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable replicateSourceSSECustomerKeyMD5;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Part number of part being copied. This is a positive integer between 1 and 10,000.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 Upload ID identifying the multipart upload whose part is being copied.
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3UploadPartOutput : AWSModel


/**
 Entity tag for the uploaded object.
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 If present, indicates that the requester was successfully charged for the request.
 */
@property (nonatomic, assign) AWSS3RequestCharged requestCharged;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header confirming the encryption algorithm used.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 If server-side encryption with a customer-provided encryption key was requested, the response will include this header to provide round trip message integrity verification of the customer-provided encryption key.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 If present, specifies the ID of the AWS Key Management Service (KMS) master encryption key that was used for the object.
 */
@property (nonatomic, strong) NSString * _Nullable SSEKMSKeyId;

/**
 The Server-side encryption algorithm used when storing this object in S3 (e.g., AES256, aws:kms).
 */
@property (nonatomic, assign) AWSS3ServerSideEncryption serverSideEncryption;

@end

/**
 
 */
@interface AWSS3UploadPartRequest : AWSRequest


/**
 Object data.
 */
@property (nonatomic, strong) id _Nullable body;

/**
 Name of the bucket to which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 Size of the body in bytes. This parameter is useful when the size of the body cannot be determined automatically.
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 The base64-encoded 128-bit MD5 digest of the part data.
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 Object key for which the multipart upload was initiated.
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 Part number of part being uploaded. This is a positive integer between 1 and 10,000.
 */
@property (nonatomic, strong) NSNumber * _Nullable partNumber;

/**
 Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
 */
@property (nonatomic, assign) AWSS3RequestPayer requestPayer;

/**
 Specifies the algorithm to use to when encrypting the object (e.g., AES256).
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerAlgorithm;

/**
 Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This value is used to store the object and then it is discarded; Amazon does not store the encryption key. The key must be appropriate for use with the algorithm specified in the x-amz-server-side​-encryption​-customer-algorithm header. This must be the same encryption key specified in the initiate multipart upload request.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKey;

/**
 Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses this header for a message integrity check to ensure the encryption key was transmitted without error.
 */
@property (nonatomic, strong) NSString * _Nullable SSECustomerKeyMD5;

/**
 Upload ID identifying the multipart upload whose part is being uploaded.
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSS3VersioningConfiguration : AWSModel


/**
 Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.
 */
@property (nonatomic, assign) AWSS3MFADelete MFADelete;

/**
 The versioning state of the bucket.
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
