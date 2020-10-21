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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSS3Model.h"

@interface AWSS3NSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSS3AbortIncompleteMultipartUpload API_AVAILABLE(ios(11));
- (void) test_AWSS3AbortMultipartUploadOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3AbortMultipartUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3AccelerateConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3AccessControlPolicy API_AVAILABLE(ios(11));
- (void) test_AWSS3AccessControlTranslation API_AVAILABLE(ios(11));
- (void) test_AWSS3AnalyticsAndOperator API_AVAILABLE(ios(11));
- (void) test_AWSS3AnalyticsConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3AnalyticsExportDestination API_AVAILABLE(ios(11));
- (void) test_AWSS3AnalyticsFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3AnalyticsS3BucketDestination API_AVAILABLE(ios(11));
- (void) test_AWSS3Bucket API_AVAILABLE(ios(11));
- (void) test_AWSS3BucketLifecycleConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3BucketLoggingStatus API_AVAILABLE(ios(11));
- (void) test_AWSS3CORSConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3CORSRule API_AVAILABLE(ios(11));
- (void) test_AWSS3CSVInput API_AVAILABLE(ios(11));
- (void) test_AWSS3CSVOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3CloudFunctionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3CommonPrefix API_AVAILABLE(ios(11));
- (void) test_AWSS3CompleteMultipartUploadOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3CompleteMultipartUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3CompletedMultipartUpload API_AVAILABLE(ios(11));
- (void) test_AWSS3CompletedPart API_AVAILABLE(ios(11));
- (void) test_AWSS3Condition API_AVAILABLE(ios(11));
- (void) test_AWSS3ContinuationEvent API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicateObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicateObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicateObjectResult API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicatePartResult API_AVAILABLE(ios(11));
- (void) test_AWSS3CreateBucketConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3CreateBucketOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3CreateBucketRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3CreateMultipartUploadOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3CreateMultipartUploadRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DefaultRetention API_AVAILABLE(ios(11));
- (void) test_AWSS3Remove API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketAnalyticsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketCorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketEncryptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketInventoryConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketLifecycleRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketMetricsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketOwnershipControlsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketReplicationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteBucketWebsiteRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteMarkerEntry API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteMarkerReplication API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectTaggingOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3DeleteObjectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeletePublicAccessBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3DeletedObject API_AVAILABLE(ios(11));
- (void) test_AWSS3Destination API_AVAILABLE(ios(11));
- (void) test_AWSS3Encryption API_AVAILABLE(ios(11));
- (void) test_AWSS3EncryptionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3EndEvent API_AVAILABLE(ios(11));
- (void) test_AWSS3Error API_AVAILABLE(ios(11));
- (void) test_AWSS3ErrorDocument API_AVAILABLE(ios(11));
- (void) test_AWSS3ExistingObjectReplication API_AVAILABLE(ios(11));
- (void) test_AWSS3FilterRule API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAccelerateConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAccelerateConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAclOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAnalyticsConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketAnalyticsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketCorsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketCorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketEncryptionOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketEncryptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketInventoryConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketInventoryConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLifecycleConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLifecycleConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLifecycleOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLifecycleRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLocationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLocationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLoggingOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketLoggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketMetricsConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketMetricsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketNotificationConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketOwnershipControlsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketOwnershipControlsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketPolicyOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketPolicyStatusOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketPolicyStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketReplicationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketReplicationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketRequestPaymentOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketRequestPaymentRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketTaggingOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketVersioningOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketVersioningRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketWebsiteOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetBucketWebsiteRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectAclOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectLegalHoldOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectLegalHoldRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectLockConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectLockConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectRetentionOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectRetentionRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectTaggingOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectTorrentOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetObjectTorrentRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GetPublicAccessBlockOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3GetPublicAccessBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3GlacierJobParameters API_AVAILABLE(ios(11));
- (void) test_AWSS3Grant API_AVAILABLE(ios(11));
- (void) test_AWSS3Grantee API_AVAILABLE(ios(11));
- (void) test_AWSS3HeadBucketRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3HeadObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3HeadObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3IndexDocument API_AVAILABLE(ios(11));
- (void) test_AWSS3Initiator API_AVAILABLE(ios(11));
- (void) test_AWSS3InputSerialization API_AVAILABLE(ios(11));
- (void) test_AWSS3InventoryConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3InventoryDestination API_AVAILABLE(ios(11));
- (void) test_AWSS3InventoryEncryption API_AVAILABLE(ios(11));
- (void) test_AWSS3InventoryFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3InventoryS3BucketDestination API_AVAILABLE(ios(11));
- (void) test_AWSS3InventorySchedule API_AVAILABLE(ios(11));
- (void) test_AWSS3JSONInput API_AVAILABLE(ios(11));
- (void) test_AWSS3JSONOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3LambdaFunctionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3LifecycleConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3LifecycleExpiration API_AVAILABLE(ios(11));
- (void) test_AWSS3LifecycleRule API_AVAILABLE(ios(11));
- (void) test_AWSS3LifecycleRuleAndOperator API_AVAILABLE(ios(11));
- (void) test_AWSS3LifecycleRuleFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketAnalyticsConfigurationsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketAnalyticsConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketInventoryConfigurationsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketInventoryConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketMetricsConfigurationsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketMetricsConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListBucketsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListMultipartUploadsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListMultipartUploadsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectVersionsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectsV2Output API_AVAILABLE(ios(11));
- (void) test_AWSS3ListObjectsV2Request API_AVAILABLE(ios(11));
- (void) test_AWSS3ListPartsOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3ListPartsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3LoggingEnabled API_AVAILABLE(ios(11));
- (void) test_AWSS3MetadataEntry API_AVAILABLE(ios(11));
- (void) test_AWSS3Metrics API_AVAILABLE(ios(11));
- (void) test_AWSS3MetricsAndOperator API_AVAILABLE(ios(11));
- (void) test_AWSS3MetricsConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3MetricsFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3MultipartUpload API_AVAILABLE(ios(11));
- (void) test_AWSS3NoncurrentVersionExpiration API_AVAILABLE(ios(11));
- (void) test_AWSS3NoncurrentVersionTransition API_AVAILABLE(ios(11));
- (void) test_AWSS3NotificationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3NotificationConfigurationDeprecated API_AVAILABLE(ios(11));
- (void) test_AWSS3NotificationConfigurationFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3Object API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectLockConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectLockLegalHold API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectLockRetention API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectLockRule API_AVAILABLE(ios(11));
- (void) test_AWSS3ObjectVersion API_AVAILABLE(ios(11));
- (void) test_AWSS3OutputLocation API_AVAILABLE(ios(11));
- (void) test_AWSS3OutputSerialization API_AVAILABLE(ios(11));
- (void) test_AWSS3Owner API_AVAILABLE(ios(11));
- (void) test_AWSS3OwnershipControls API_AVAILABLE(ios(11));
- (void) test_AWSS3OwnershipControlsRule API_AVAILABLE(ios(11));
- (void) test_AWSS3ParquetInput API_AVAILABLE(ios(11));
- (void) test_AWSS3Part API_AVAILABLE(ios(11));
- (void) test_AWSS3PolicyStatus API_AVAILABLE(ios(11));
- (void) test_AWSS3Progress API_AVAILABLE(ios(11));
- (void) test_AWSS3ProgressEvent API_AVAILABLE(ios(11));
- (void) test_AWSS3PublicAccessBlockConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketAccelerateConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketAnalyticsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketCorsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketEncryptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketInventoryConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketLifecycleConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketLifecycleRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketLoggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketMetricsConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketNotificationConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketNotificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketOwnershipControlsRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketReplicationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketRequestPaymentRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketVersioningRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutBucketWebsiteRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectAclOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectLegalHoldOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectLegalHoldRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectLockConfigurationOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectLockConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectRetentionOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectRetentionRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectTaggingOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3PutObjectTaggingRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3PutPublicAccessBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3QueueConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3QueueConfigurationDeprecated API_AVAILABLE(ios(11));
- (void) test_AWSS3RecordsEvent API_AVAILABLE(ios(11));
- (void) test_AWSS3Redirect API_AVAILABLE(ios(11));
- (void) test_AWSS3RedirectAllRequestsTo API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationRule API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationRuleAndOperator API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationRuleFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationTime API_AVAILABLE(ios(11));
- (void) test_AWSS3ReplicationTimeValue API_AVAILABLE(ios(11));
- (void) test_AWSS3RequestPaymentConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3RequestProgress API_AVAILABLE(ios(11));
- (void) test_AWSS3RestoreObjectOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3RestoreObjectRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3RestoreRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3RoutingRule API_AVAILABLE(ios(11));
- (void) test_AWSS3Rule API_AVAILABLE(ios(11));
- (void) test_AWSS3S3KeyFilter API_AVAILABLE(ios(11));
- (void) test_AWSS3S3Location API_AVAILABLE(ios(11));
- (void) test_AWSS3SSEKMS API_AVAILABLE(ios(11));
- (void) test_AWSS3SSES3 API_AVAILABLE(ios(11));
- (void) test_AWSS3ScanRange API_AVAILABLE(ios(11));
- (void) test_AWSS3SelectObjectContentEventStream API_AVAILABLE(ios(11));
- (void) test_AWSS3SelectObjectContentOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3SelectObjectContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3SelectParameters API_AVAILABLE(ios(11));
- (void) test_AWSS3ServerSideEncryptionByDefault API_AVAILABLE(ios(11));
- (void) test_AWSS3ServerSideEncryptionConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3ServerSideEncryptionRule API_AVAILABLE(ios(11));
- (void) test_AWSS3SourceSelectionCriteria API_AVAILABLE(ios(11));
- (void) test_AWSS3SseKmsEncryptedObjects API_AVAILABLE(ios(11));
- (void) test_AWSS3Stats API_AVAILABLE(ios(11));
- (void) test_AWSS3StatsEvent API_AVAILABLE(ios(11));
- (void) test_AWSS3StorageClassAnalysis API_AVAILABLE(ios(11));
- (void) test_AWSS3StorageClassAnalysisDataExport API_AVAILABLE(ios(11));
- (void) test_AWSS3Tag API_AVAILABLE(ios(11));
- (void) test_AWSS3Tagging API_AVAILABLE(ios(11));
- (void) test_AWSS3TargetGrant API_AVAILABLE(ios(11));
- (void) test_AWSS3TopicConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3TopicConfigurationDeprecated API_AVAILABLE(ios(11));
- (void) test_AWSS3Transition API_AVAILABLE(ios(11));
- (void) test_AWSS3UploadPartCopyOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3UploadPartCopyRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3UploadPartOutput API_AVAILABLE(ios(11));
- (void) test_AWSS3UploadPartRequest API_AVAILABLE(ios(11));
- (void) test_AWSS3VersioningConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSS3WebsiteConfiguration API_AVAILABLE(ios(11));

@end

@implementation AWSS3NSSecureCodingTests

- (void) test_AWSS3AbortIncompleteMultipartUpload {
    [self validateSecureCodingForClass:[AWSS3AbortIncompleteMultipartUpload class]];
}

- (void) test_AWSS3AbortMultipartUploadOutput {
    [self validateSecureCodingForClass:[AWSS3AbortMultipartUploadOutput class]];
}

- (void) test_AWSS3AbortMultipartUploadRequest {
    [self validateSecureCodingForClass:[AWSS3AbortMultipartUploadRequest class]];
}

- (void) test_AWSS3AccelerateConfiguration {
    [self validateSecureCodingForClass:[AWSS3AccelerateConfiguration class]];
}

- (void) test_AWSS3AccessControlPolicy {
    [self validateSecureCodingForClass:[AWSS3AccessControlPolicy class]];
}

- (void) test_AWSS3AccessControlTranslation {
    [self validateSecureCodingForClass:[AWSS3AccessControlTranslation class]];
}

- (void) test_AWSS3AnalyticsAndOperator {
    [self validateSecureCodingForClass:[AWSS3AnalyticsAndOperator class]];
}

- (void) test_AWSS3AnalyticsConfiguration {
    [self validateSecureCodingForClass:[AWSS3AnalyticsConfiguration class]];
}

- (void) test_AWSS3AnalyticsExportDestination {
    [self validateSecureCodingForClass:[AWSS3AnalyticsExportDestination class]];
}

- (void) test_AWSS3AnalyticsFilter {
    [self validateSecureCodingForClass:[AWSS3AnalyticsFilter class]];
}

- (void) test_AWSS3AnalyticsS3BucketDestination {
    [self validateSecureCodingForClass:[AWSS3AnalyticsS3BucketDestination class]];
}

- (void) test_AWSS3Bucket {
    [self validateSecureCodingForClass:[AWSS3Bucket class]];
}

- (void) test_AWSS3BucketLifecycleConfiguration {
    [self validateSecureCodingForClass:[AWSS3BucketLifecycleConfiguration class]];
}

- (void) test_AWSS3BucketLoggingStatus {
    [self validateSecureCodingForClass:[AWSS3BucketLoggingStatus class]];
}

- (void) test_AWSS3CORSConfiguration {
    [self validateSecureCodingForClass:[AWSS3CORSConfiguration class]];
}

- (void) test_AWSS3CORSRule {
    [self validateSecureCodingForClass:[AWSS3CORSRule class]];
}

- (void) test_AWSS3CSVInput {
    [self validateSecureCodingForClass:[AWSS3CSVInput class]];
}

- (void) test_AWSS3CSVOutput {
    [self validateSecureCodingForClass:[AWSS3CSVOutput class]];
}

- (void) test_AWSS3CloudFunctionConfiguration {
    [self validateSecureCodingForClass:[AWSS3CloudFunctionConfiguration class]];
}

- (void) test_AWSS3CommonPrefix {
    [self validateSecureCodingForClass:[AWSS3CommonPrefix class]];
}

- (void) test_AWSS3CompleteMultipartUploadOutput {
    [self validateSecureCodingForClass:[AWSS3CompleteMultipartUploadOutput class]];
}

- (void) test_AWSS3CompleteMultipartUploadRequest {
    [self validateSecureCodingForClass:[AWSS3CompleteMultipartUploadRequest class]];
}

- (void) test_AWSS3CompletedMultipartUpload {
    [self validateSecureCodingForClass:[AWSS3CompletedMultipartUpload class]];
}

- (void) test_AWSS3CompletedPart {
    [self validateSecureCodingForClass:[AWSS3CompletedPart class]];
}

- (void) test_AWSS3Condition {
    [self validateSecureCodingForClass:[AWSS3Condition class]];
}

- (void) test_AWSS3ContinuationEvent {
    [self validateSecureCodingForClass:[AWSS3ContinuationEvent class]];
}

- (void) test_AWSS3ReplicateObjectOutput {
    [self validateSecureCodingForClass:[AWSS3ReplicateObjectOutput class]];
}

- (void) test_AWSS3ReplicateObjectRequest {
    [self validateSecureCodingForClass:[AWSS3ReplicateObjectRequest class]];
}

- (void) test_AWSS3ReplicateObjectResult {
    [self validateSecureCodingForClass:[AWSS3ReplicateObjectResult class]];
}

- (void) test_AWSS3ReplicatePartResult {
    [self validateSecureCodingForClass:[AWSS3ReplicatePartResult class]];
}

- (void) test_AWSS3CreateBucketConfiguration {
    [self validateSecureCodingForClass:[AWSS3CreateBucketConfiguration class]];
}

- (void) test_AWSS3CreateBucketOutput {
    [self validateSecureCodingForClass:[AWSS3CreateBucketOutput class]];
}

- (void) test_AWSS3CreateBucketRequest {
    [self validateSecureCodingForClass:[AWSS3CreateBucketRequest class]];
}

- (void) test_AWSS3CreateMultipartUploadOutput {
    [self validateSecureCodingForClass:[AWSS3CreateMultipartUploadOutput class]];
}

- (void) test_AWSS3CreateMultipartUploadRequest {
    [self validateSecureCodingForClass:[AWSS3CreateMultipartUploadRequest class]];
}

- (void) test_AWSS3DefaultRetention {
    [self validateSecureCodingForClass:[AWSS3DefaultRetention class]];
}

- (void) test_AWSS3Remove {
    [self validateSecureCodingForClass:[AWSS3Remove class]];
}

- (void) test_AWSS3DeleteBucketAnalyticsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketAnalyticsConfigurationRequest class]];
}

- (void) test_AWSS3DeleteBucketCorsRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketCorsRequest class]];
}

- (void) test_AWSS3DeleteBucketEncryptionRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketEncryptionRequest class]];
}

- (void) test_AWSS3DeleteBucketInventoryConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketInventoryConfigurationRequest class]];
}

- (void) test_AWSS3DeleteBucketLifecycleRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketLifecycleRequest class]];
}

- (void) test_AWSS3DeleteBucketMetricsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketMetricsConfigurationRequest class]];
}

- (void) test_AWSS3DeleteBucketOwnershipControlsRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketOwnershipControlsRequest class]];
}

- (void) test_AWSS3DeleteBucketPolicyRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketPolicyRequest class]];
}

- (void) test_AWSS3DeleteBucketReplicationRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketReplicationRequest class]];
}

- (void) test_AWSS3DeleteBucketRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketRequest class]];
}

- (void) test_AWSS3DeleteBucketTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketTaggingRequest class]];
}

- (void) test_AWSS3DeleteBucketWebsiteRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteBucketWebsiteRequest class]];
}

- (void) test_AWSS3DeleteMarkerEntry {
    [self validateSecureCodingForClass:[AWSS3DeleteMarkerEntry class]];
}

- (void) test_AWSS3DeleteMarkerReplication {
    [self validateSecureCodingForClass:[AWSS3DeleteMarkerReplication class]];
}

- (void) test_AWSS3DeleteObjectOutput {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectOutput class]];
}

- (void) test_AWSS3DeleteObjectRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectRequest class]];
}

- (void) test_AWSS3DeleteObjectTaggingOutput {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectTaggingOutput class]];
}

- (void) test_AWSS3DeleteObjectTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectTaggingRequest class]];
}

- (void) test_AWSS3DeleteObjectsOutput {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectsOutput class]];
}

- (void) test_AWSS3DeleteObjectsRequest {
    [self validateSecureCodingForClass:[AWSS3DeleteObjectsRequest class]];
}

- (void) test_AWSS3DeletePublicAccessBlockRequest {
    [self validateSecureCodingForClass:[AWSS3DeletePublicAccessBlockRequest class]];
}

- (void) test_AWSS3DeletedObject {
    [self validateSecureCodingForClass:[AWSS3DeletedObject class]];
}

- (void) test_AWSS3Destination {
    [self validateSecureCodingForClass:[AWSS3Destination class]];
}

- (void) test_AWSS3Encryption {
    [self validateSecureCodingForClass:[AWSS3Encryption class]];
}

- (void) test_AWSS3EncryptionConfiguration {
    [self validateSecureCodingForClass:[AWSS3EncryptionConfiguration class]];
}

- (void) test_AWSS3EndEvent {
    [self validateSecureCodingForClass:[AWSS3EndEvent class]];
}

- (void) test_AWSS3Error {
    [self validateSecureCodingForClass:[AWSS3Error class]];
}

- (void) test_AWSS3ErrorDocument {
    [self validateSecureCodingForClass:[AWSS3ErrorDocument class]];
}

- (void) test_AWSS3ExistingObjectReplication {
    [self validateSecureCodingForClass:[AWSS3ExistingObjectReplication class]];
}

- (void) test_AWSS3FilterRule {
    [self validateSecureCodingForClass:[AWSS3FilterRule class]];
}

- (void) test_AWSS3GetBucketAccelerateConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketAccelerateConfigurationOutput class]];
}

- (void) test_AWSS3GetBucketAccelerateConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketAccelerateConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketAclOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketAclOutput class]];
}

- (void) test_AWSS3GetBucketAclRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketAclRequest class]];
}

- (void) test_AWSS3GetBucketAnalyticsConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketAnalyticsConfigurationOutput class]];
}

- (void) test_AWSS3GetBucketAnalyticsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketAnalyticsConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketCorsOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketCorsOutput class]];
}

- (void) test_AWSS3GetBucketCorsRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketCorsRequest class]];
}

- (void) test_AWSS3GetBucketEncryptionOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketEncryptionOutput class]];
}

- (void) test_AWSS3GetBucketEncryptionRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketEncryptionRequest class]];
}

- (void) test_AWSS3GetBucketInventoryConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketInventoryConfigurationOutput class]];
}

- (void) test_AWSS3GetBucketInventoryConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketInventoryConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketLifecycleConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketLifecycleConfigurationOutput class]];
}

- (void) test_AWSS3GetBucketLifecycleConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketLifecycleConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketLifecycleOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketLifecycleOutput class]];
}

- (void) test_AWSS3GetBucketLifecycleRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketLifecycleRequest class]];
}

- (void) test_AWSS3GetBucketLocationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketLocationOutput class]];
}

- (void) test_AWSS3GetBucketLocationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketLocationRequest class]];
}

- (void) test_AWSS3GetBucketLoggingOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketLoggingOutput class]];
}

- (void) test_AWSS3GetBucketLoggingRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketLoggingRequest class]];
}

- (void) test_AWSS3GetBucketMetricsConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketMetricsConfigurationOutput class]];
}

- (void) test_AWSS3GetBucketMetricsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketMetricsConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketNotificationConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketNotificationConfigurationRequest class]];
}

- (void) test_AWSS3GetBucketOwnershipControlsOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketOwnershipControlsOutput class]];
}

- (void) test_AWSS3GetBucketOwnershipControlsRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketOwnershipControlsRequest class]];
}

- (void) test_AWSS3GetBucketPolicyOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketPolicyOutput class]];
}

- (void) test_AWSS3GetBucketPolicyRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketPolicyRequest class]];
}

- (void) test_AWSS3GetBucketPolicyStatusOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketPolicyStatusOutput class]];
}

- (void) test_AWSS3GetBucketPolicyStatusRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketPolicyStatusRequest class]];
}

- (void) test_AWSS3GetBucketReplicationOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketReplicationOutput class]];
}

- (void) test_AWSS3GetBucketReplicationRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketReplicationRequest class]];
}

- (void) test_AWSS3GetBucketRequestPaymentOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketRequestPaymentOutput class]];
}

- (void) test_AWSS3GetBucketRequestPaymentRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketRequestPaymentRequest class]];
}

- (void) test_AWSS3GetBucketTaggingOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketTaggingOutput class]];
}

- (void) test_AWSS3GetBucketTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketTaggingRequest class]];
}

- (void) test_AWSS3GetBucketVersioningOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketVersioningOutput class]];
}

- (void) test_AWSS3GetBucketVersioningRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketVersioningRequest class]];
}

- (void) test_AWSS3GetBucketWebsiteOutput {
    [self validateSecureCodingForClass:[AWSS3GetBucketWebsiteOutput class]];
}

- (void) test_AWSS3GetBucketWebsiteRequest {
    [self validateSecureCodingForClass:[AWSS3GetBucketWebsiteRequest class]];
}

- (void) test_AWSS3GetObjectAclOutput {
    [self validateSecureCodingForClass:[AWSS3GetObjectAclOutput class]];
}

- (void) test_AWSS3GetObjectAclRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectAclRequest class]];
}

- (void) test_AWSS3GetObjectLegalHoldOutput {
    [self validateSecureCodingForClass:[AWSS3GetObjectLegalHoldOutput class]];
}

- (void) test_AWSS3GetObjectLegalHoldRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectLegalHoldRequest class]];
}

- (void) test_AWSS3GetObjectLockConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3GetObjectLockConfigurationOutput class]];
}

- (void) test_AWSS3GetObjectLockConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectLockConfigurationRequest class]];
}

- (void) test_AWSS3GetObjectOutput {
    [self validateClassDoesNotSupportSecureCoding:[AWSS3GetObjectOutput class]];
}

- (void) test_AWSS3GetObjectRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectRequest class]];
}

- (void) test_AWSS3GetObjectRetentionOutput {
    [self validateSecureCodingForClass:[AWSS3GetObjectRetentionOutput class]];
}

- (void) test_AWSS3GetObjectRetentionRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectRetentionRequest class]];
}

- (void) test_AWSS3GetObjectTaggingOutput {
    [self validateSecureCodingForClass:[AWSS3GetObjectTaggingOutput class]];
}

- (void) test_AWSS3GetObjectTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectTaggingRequest class]];
}

- (void) test_AWSS3GetObjectTorrentOutput {
    [self validateClassDoesNotSupportSecureCoding:[AWSS3GetObjectTorrentOutput class]];
}

- (void) test_AWSS3GetObjectTorrentRequest {
    [self validateSecureCodingForClass:[AWSS3GetObjectTorrentRequest class]];
}

- (void) test_AWSS3GetPublicAccessBlockOutput {
    [self validateSecureCodingForClass:[AWSS3GetPublicAccessBlockOutput class]];
}

- (void) test_AWSS3GetPublicAccessBlockRequest {
    [self validateSecureCodingForClass:[AWSS3GetPublicAccessBlockRequest class]];
}

- (void) test_AWSS3GlacierJobParameters {
    [self validateSecureCodingForClass:[AWSS3GlacierJobParameters class]];
}

- (void) test_AWSS3Grant {
    [self validateSecureCodingForClass:[AWSS3Grant class]];
}

- (void) test_AWSS3Grantee {
    [self validateSecureCodingForClass:[AWSS3Grantee class]];
}

- (void) test_AWSS3HeadBucketRequest {
    [self validateSecureCodingForClass:[AWSS3HeadBucketRequest class]];
}

- (void) test_AWSS3HeadObjectOutput {
    [self validateSecureCodingForClass:[AWSS3HeadObjectOutput class]];
}

- (void) test_AWSS3HeadObjectRequest {
    [self validateSecureCodingForClass:[AWSS3HeadObjectRequest class]];
}

- (void) test_AWSS3IndexDocument {
    [self validateSecureCodingForClass:[AWSS3IndexDocument class]];
}

- (void) test_AWSS3Initiator {
    [self validateSecureCodingForClass:[AWSS3Initiator class]];
}

- (void) test_AWSS3InputSerialization {
    [self validateSecureCodingForClass:[AWSS3InputSerialization class]];
}

- (void) test_AWSS3InventoryConfiguration {
    [self validateSecureCodingForClass:[AWSS3InventoryConfiguration class]];
}

- (void) test_AWSS3InventoryDestination {
    [self validateSecureCodingForClass:[AWSS3InventoryDestination class]];
}

- (void) test_AWSS3InventoryEncryption {
    [self validateSecureCodingForClass:[AWSS3InventoryEncryption class]];
}

- (void) test_AWSS3InventoryFilter {
    [self validateSecureCodingForClass:[AWSS3InventoryFilter class]];
}

- (void) test_AWSS3InventoryS3BucketDestination {
    [self validateSecureCodingForClass:[AWSS3InventoryS3BucketDestination class]];
}

- (void) test_AWSS3InventorySchedule {
    [self validateSecureCodingForClass:[AWSS3InventorySchedule class]];
}

- (void) test_AWSS3JSONInput {
    [self validateSecureCodingForClass:[AWSS3JSONInput class]];
}

- (void) test_AWSS3JSONOutput {
    [self validateSecureCodingForClass:[AWSS3JSONOutput class]];
}

- (void) test_AWSS3LambdaFunctionConfiguration {
    [self validateSecureCodingForClass:[AWSS3LambdaFunctionConfiguration class]];
}

- (void) test_AWSS3LifecycleConfiguration {
    [self validateSecureCodingForClass:[AWSS3LifecycleConfiguration class]];
}

- (void) test_AWSS3LifecycleExpiration {
    [self validateSecureCodingForClass:[AWSS3LifecycleExpiration class]];
}

- (void) test_AWSS3LifecycleRule {
    [self validateSecureCodingForClass:[AWSS3LifecycleRule class]];
}

- (void) test_AWSS3LifecycleRuleAndOperator {
    [self validateSecureCodingForClass:[AWSS3LifecycleRuleAndOperator class]];
}

- (void) test_AWSS3LifecycleRuleFilter {
    [self validateSecureCodingForClass:[AWSS3LifecycleRuleFilter class]];
}

- (void) test_AWSS3ListBucketAnalyticsConfigurationsOutput {
    [self validateSecureCodingForClass:[AWSS3ListBucketAnalyticsConfigurationsOutput class]];
}

- (void) test_AWSS3ListBucketAnalyticsConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSS3ListBucketAnalyticsConfigurationsRequest class]];
}

- (void) test_AWSS3ListBucketInventoryConfigurationsOutput {
    [self validateSecureCodingForClass:[AWSS3ListBucketInventoryConfigurationsOutput class]];
}

- (void) test_AWSS3ListBucketInventoryConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSS3ListBucketInventoryConfigurationsRequest class]];
}

- (void) test_AWSS3ListBucketMetricsConfigurationsOutput {
    [self validateSecureCodingForClass:[AWSS3ListBucketMetricsConfigurationsOutput class]];
}

- (void) test_AWSS3ListBucketMetricsConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSS3ListBucketMetricsConfigurationsRequest class]];
}

- (void) test_AWSS3ListBucketsOutput {
    [self validateSecureCodingForClass:[AWSS3ListBucketsOutput class]];
}

- (void) test_AWSS3ListMultipartUploadsOutput {
    [self validateSecureCodingForClass:[AWSS3ListMultipartUploadsOutput class]];
}

- (void) test_AWSS3ListMultipartUploadsRequest {
    [self validateSecureCodingForClass:[AWSS3ListMultipartUploadsRequest class]];
}

- (void) test_AWSS3ListObjectVersionsOutput {
    [self validateSecureCodingForClass:[AWSS3ListObjectVersionsOutput class]];
}

- (void) test_AWSS3ListObjectVersionsRequest {
    [self validateSecureCodingForClass:[AWSS3ListObjectVersionsRequest class]];
}

- (void) test_AWSS3ListObjectsOutput {
    [self validateSecureCodingForClass:[AWSS3ListObjectsOutput class]];
}

- (void) test_AWSS3ListObjectsRequest {
    [self validateSecureCodingForClass:[AWSS3ListObjectsRequest class]];
}

- (void) test_AWSS3ListObjectsV2Output {
    [self validateSecureCodingForClass:[AWSS3ListObjectsV2Output class]];
}

- (void) test_AWSS3ListObjectsV2Request {
    [self validateSecureCodingForClass:[AWSS3ListObjectsV2Request class]];
}

- (void) test_AWSS3ListPartsOutput {
    [self validateSecureCodingForClass:[AWSS3ListPartsOutput class]];
}

- (void) test_AWSS3ListPartsRequest {
    [self validateSecureCodingForClass:[AWSS3ListPartsRequest class]];
}

- (void) test_AWSS3LoggingEnabled {
    [self validateSecureCodingForClass:[AWSS3LoggingEnabled class]];
}

- (void) test_AWSS3MetadataEntry {
    [self validateSecureCodingForClass:[AWSS3MetadataEntry class]];
}

- (void) test_AWSS3Metrics {
    [self validateSecureCodingForClass:[AWSS3Metrics class]];
}

- (void) test_AWSS3MetricsAndOperator {
    [self validateSecureCodingForClass:[AWSS3MetricsAndOperator class]];
}

- (void) test_AWSS3MetricsConfiguration {
    [self validateSecureCodingForClass:[AWSS3MetricsConfiguration class]];
}

- (void) test_AWSS3MetricsFilter {
    [self validateSecureCodingForClass:[AWSS3MetricsFilter class]];
}

- (void) test_AWSS3MultipartUpload {
    [self validateSecureCodingForClass:[AWSS3MultipartUpload class]];
}

- (void) test_AWSS3NoncurrentVersionExpiration {
    [self validateSecureCodingForClass:[AWSS3NoncurrentVersionExpiration class]];
}

- (void) test_AWSS3NoncurrentVersionTransition {
    [self validateSecureCodingForClass:[AWSS3NoncurrentVersionTransition class]];
}

- (void) test_AWSS3NotificationConfiguration {
    [self validateSecureCodingForClass:[AWSS3NotificationConfiguration class]];
}

- (void) test_AWSS3NotificationConfigurationDeprecated {
    [self validateSecureCodingForClass:[AWSS3NotificationConfigurationDeprecated class]];
}

- (void) test_AWSS3NotificationConfigurationFilter {
    [self validateSecureCodingForClass:[AWSS3NotificationConfigurationFilter class]];
}

- (void) test_AWSS3Object {
    [self validateSecureCodingForClass:[AWSS3Object class]];
}

- (void) test_AWSS3ObjectIdentifier {
    [self validateSecureCodingForClass:[AWSS3ObjectIdentifier class]];
}

- (void) test_AWSS3ObjectLockConfiguration {
    [self validateSecureCodingForClass:[AWSS3ObjectLockConfiguration class]];
}

- (void) test_AWSS3ObjectLockLegalHold {
    [self validateSecureCodingForClass:[AWSS3ObjectLockLegalHold class]];
}

- (void) test_AWSS3ObjectLockRetention {
    [self validateSecureCodingForClass:[AWSS3ObjectLockRetention class]];
}

- (void) test_AWSS3ObjectLockRule {
    [self validateSecureCodingForClass:[AWSS3ObjectLockRule class]];
}

- (void) test_AWSS3ObjectVersion {
    [self validateSecureCodingForClass:[AWSS3ObjectVersion class]];
}

- (void) test_AWSS3OutputLocation {
    [self validateSecureCodingForClass:[AWSS3OutputLocation class]];
}

- (void) test_AWSS3OutputSerialization {
    [self validateSecureCodingForClass:[AWSS3OutputSerialization class]];
}

- (void) test_AWSS3Owner {
    [self validateSecureCodingForClass:[AWSS3Owner class]];
}

- (void) test_AWSS3OwnershipControls {
    [self validateSecureCodingForClass:[AWSS3OwnershipControls class]];
}

- (void) test_AWSS3OwnershipControlsRule {
    [self validateSecureCodingForClass:[AWSS3OwnershipControlsRule class]];
}

- (void) test_AWSS3ParquetInput {
    [self validateSecureCodingForClass:[AWSS3ParquetInput class]];
}

- (void) test_AWSS3Part {
    [self validateSecureCodingForClass:[AWSS3Part class]];
}

- (void) test_AWSS3PolicyStatus {
    [self validateSecureCodingForClass:[AWSS3PolicyStatus class]];
}

- (void) test_AWSS3Progress {
    [self validateSecureCodingForClass:[AWSS3Progress class]];
}

- (void) test_AWSS3ProgressEvent {
    [self validateSecureCodingForClass:[AWSS3ProgressEvent class]];
}

- (void) test_AWSS3PublicAccessBlockConfiguration {
    [self validateSecureCodingForClass:[AWSS3PublicAccessBlockConfiguration class]];
}

- (void) test_AWSS3PutBucketAccelerateConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketAccelerateConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketAclRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketAclRequest class]];
}

- (void) test_AWSS3PutBucketAnalyticsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketAnalyticsConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketCorsRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketCorsRequest class]];
}

- (void) test_AWSS3PutBucketEncryptionRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketEncryptionRequest class]];
}

- (void) test_AWSS3PutBucketInventoryConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketInventoryConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketLifecycleConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketLifecycleConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketLifecycleRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketLifecycleRequest class]];
}

- (void) test_AWSS3PutBucketLoggingRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketLoggingRequest class]];
}

- (void) test_AWSS3PutBucketMetricsConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketMetricsConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketNotificationConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketNotificationConfigurationRequest class]];
}

- (void) test_AWSS3PutBucketNotificationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketNotificationRequest class]];
}

- (void) test_AWSS3PutBucketOwnershipControlsRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketOwnershipControlsRequest class]];
}

- (void) test_AWSS3PutBucketPolicyRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketPolicyRequest class]];
}

- (void) test_AWSS3PutBucketReplicationRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketReplicationRequest class]];
}

- (void) test_AWSS3PutBucketRequestPaymentRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketRequestPaymentRequest class]];
}

- (void) test_AWSS3PutBucketTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketTaggingRequest class]];
}

- (void) test_AWSS3PutBucketVersioningRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketVersioningRequest class]];
}

- (void) test_AWSS3PutBucketWebsiteRequest {
    [self validateSecureCodingForClass:[AWSS3PutBucketWebsiteRequest class]];
}

- (void) test_AWSS3PutObjectAclOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectAclOutput class]];
}

- (void) test_AWSS3PutObjectAclRequest {
    [self validateSecureCodingForClass:[AWSS3PutObjectAclRequest class]];
}

- (void) test_AWSS3PutObjectLegalHoldOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectLegalHoldOutput class]];
}

- (void) test_AWSS3PutObjectLegalHoldRequest {
    [self validateSecureCodingForClass:[AWSS3PutObjectLegalHoldRequest class]];
}

- (void) test_AWSS3PutObjectLockConfigurationOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectLockConfigurationOutput class]];
}

- (void) test_AWSS3PutObjectLockConfigurationRequest {
    [self validateSecureCodingForClass:[AWSS3PutObjectLockConfigurationRequest class]];
}

- (void) test_AWSS3PutObjectOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectOutput class]];
}

- (void) test_AWSS3PutObjectRequest {
    [self validateClassDoesNotSupportSecureCoding:[AWSS3PutObjectRequest class]];
}

- (void) test_AWSS3PutObjectRetentionOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectRetentionOutput class]];
}

- (void) test_AWSS3PutObjectRetentionRequest {
    [self validateSecureCodingForClass:[AWSS3PutObjectRetentionRequest class]];
}

- (void) test_AWSS3PutObjectTaggingOutput {
    [self validateSecureCodingForClass:[AWSS3PutObjectTaggingOutput class]];
}

- (void) test_AWSS3PutObjectTaggingRequest {
    [self validateSecureCodingForClass:[AWSS3PutObjectTaggingRequest class]];
}

- (void) test_AWSS3PutPublicAccessBlockRequest {
    [self validateSecureCodingForClass:[AWSS3PutPublicAccessBlockRequest class]];
}

- (void) test_AWSS3QueueConfiguration {
    [self validateSecureCodingForClass:[AWSS3QueueConfiguration class]];
}

- (void) test_AWSS3QueueConfigurationDeprecated {
    [self validateSecureCodingForClass:[AWSS3QueueConfigurationDeprecated class]];
}

- (void) test_AWSS3RecordsEvent {
    [self validateClassDoesNotSupportSecureCoding:[AWSS3RecordsEvent class]];
}

- (void) test_AWSS3Redirect {
    [self validateSecureCodingForClass:[AWSS3Redirect class]];
}

- (void) test_AWSS3RedirectAllRequestsTo {
    [self validateSecureCodingForClass:[AWSS3RedirectAllRequestsTo class]];
}

- (void) test_AWSS3ReplicationConfiguration {
    [self validateSecureCodingForClass:[AWSS3ReplicationConfiguration class]];
}

- (void) test_AWSS3ReplicationRule {
    [self validateSecureCodingForClass:[AWSS3ReplicationRule class]];
}

- (void) test_AWSS3ReplicationRuleAndOperator {
    [self validateSecureCodingForClass:[AWSS3ReplicationRuleAndOperator class]];
}

- (void) test_AWSS3ReplicationRuleFilter {
    [self validateSecureCodingForClass:[AWSS3ReplicationRuleFilter class]];
}

- (void) test_AWSS3ReplicationTime {
    [self validateSecureCodingForClass:[AWSS3ReplicationTime class]];
}

- (void) test_AWSS3ReplicationTimeValue {
    [self validateSecureCodingForClass:[AWSS3ReplicationTimeValue class]];
}

- (void) test_AWSS3RequestPaymentConfiguration {
    [self validateSecureCodingForClass:[AWSS3RequestPaymentConfiguration class]];
}

- (void) test_AWSS3RequestProgress {
    [self validateSecureCodingForClass:[AWSS3RequestProgress class]];
}

- (void) test_AWSS3RestoreObjectOutput {
    [self validateSecureCodingForClass:[AWSS3RestoreObjectOutput class]];
}

- (void) test_AWSS3RestoreObjectRequest {
    [self validateSecureCodingForClass:[AWSS3RestoreObjectRequest class]];
}

- (void) test_AWSS3RestoreRequest {
    [self validateSecureCodingForClass:[AWSS3RestoreRequest class]];
}

- (void) test_AWSS3RoutingRule {
    [self validateSecureCodingForClass:[AWSS3RoutingRule class]];
}

- (void) test_AWSS3Rule {
    [self validateSecureCodingForClass:[AWSS3Rule class]];
}

- (void) test_AWSS3S3KeyFilter {
    [self validateSecureCodingForClass:[AWSS3S3KeyFilter class]];
}

- (void) test_AWSS3S3Location {
    [self validateSecureCodingForClass:[AWSS3S3Location class]];
}

- (void) test_AWSS3SSEKMS {
    [self validateSecureCodingForClass:[AWSS3SSEKMS class]];
}

- (void) test_AWSS3SSES3 {
    [self validateSecureCodingForClass:[AWSS3SSES3 class]];
}

- (void) test_AWSS3ScanRange {
    [self validateSecureCodingForClass:[AWSS3ScanRange class]];
}

- (void) test_AWSS3SelectObjectContentEventStream {
    [self validateSecureCodingForClass:[AWSS3SelectObjectContentEventStream class]];
}

- (void) test_AWSS3SelectObjectContentOutput {
    [self validateSecureCodingForClass:[AWSS3SelectObjectContentOutput class]];
}

- (void) test_AWSS3SelectObjectContentRequest {
    [self validateSecureCodingForClass:[AWSS3SelectObjectContentRequest class]];
}

- (void) test_AWSS3SelectParameters {
    [self validateSecureCodingForClass:[AWSS3SelectParameters class]];
}

- (void) test_AWSS3ServerSideEncryptionByDefault {
    [self validateSecureCodingForClass:[AWSS3ServerSideEncryptionByDefault class]];
}

- (void) test_AWSS3ServerSideEncryptionConfiguration {
    [self validateSecureCodingForClass:[AWSS3ServerSideEncryptionConfiguration class]];
}

- (void) test_AWSS3ServerSideEncryptionRule {
    [self validateSecureCodingForClass:[AWSS3ServerSideEncryptionRule class]];
}

- (void) test_AWSS3SourceSelectionCriteria {
    [self validateSecureCodingForClass:[AWSS3SourceSelectionCriteria class]];
}

- (void) test_AWSS3SseKmsEncryptedObjects {
    [self validateSecureCodingForClass:[AWSS3SseKmsEncryptedObjects class]];
}

- (void) test_AWSS3Stats {
    [self validateSecureCodingForClass:[AWSS3Stats class]];
}

- (void) test_AWSS3StatsEvent {
    [self validateSecureCodingForClass:[AWSS3StatsEvent class]];
}

- (void) test_AWSS3StorageClassAnalysis {
    [self validateSecureCodingForClass:[AWSS3StorageClassAnalysis class]];
}

- (void) test_AWSS3StorageClassAnalysisDataExport {
    [self validateSecureCodingForClass:[AWSS3StorageClassAnalysisDataExport class]];
}

- (void) test_AWSS3Tag {
    [self validateSecureCodingForClass:[AWSS3Tag class]];
}

- (void) test_AWSS3Tagging {
    [self validateSecureCodingForClass:[AWSS3Tagging class]];
}

- (void) test_AWSS3TargetGrant {
    [self validateSecureCodingForClass:[AWSS3TargetGrant class]];
}

- (void) test_AWSS3TopicConfiguration {
    [self validateSecureCodingForClass:[AWSS3TopicConfiguration class]];
}

- (void) test_AWSS3TopicConfigurationDeprecated {
    [self validateSecureCodingForClass:[AWSS3TopicConfigurationDeprecated class]];
}

- (void) test_AWSS3Transition {
    [self validateSecureCodingForClass:[AWSS3Transition class]];
}

- (void) test_AWSS3UploadPartCopyOutput {
    [self validateSecureCodingForClass:[AWSS3UploadPartCopyOutput class]];
}

- (void) test_AWSS3UploadPartCopyRequest {
    [self validateSecureCodingForClass:[AWSS3UploadPartCopyRequest class]];
}

- (void) test_AWSS3UploadPartOutput {
    [self validateSecureCodingForClass:[AWSS3UploadPartOutput class]];
}

- (void) test_AWSS3UploadPartRequest {
    [self validateClassDoesNotSupportSecureCoding:[AWSS3UploadPartRequest class]];
}

- (void) test_AWSS3VersioningConfiguration {
    [self validateSecureCodingForClass:[AWSS3VersioningConfiguration class]];
}

- (void) test_AWSS3WebsiteConfiguration {
    [self validateSecureCodingForClass:[AWSS3WebsiteConfiguration class]];
}

@end

