/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSService.h"
#import "AWSS3Model.h"

@class BFTask;

/**
 * 
 */
@interface AWSS3 : AWSService

@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

+ (instancetype)defaultS3;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * <p>Aborts a multipart upload.</p><p>To verify that all parts have been removed, so you don't get charged for the part storage, you should call the List Parts operation and ensure the parts list is empty.</p>
 *
 * @param request A container for the necessary parameters to execute the AbortMultipartUpload service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchUpload.
 *
 * @see AWSS3AbortMultipartUploadRequest
 */
- (BFTask *)abortMultipartUpload:(AWSS3AbortMultipartUploadRequest *)request;

/**
 * Completes a multipart upload by assembling previously uploaded parts.
 *
 * @param request A container for the necessary parameters to execute the CompleteMultipartUpload service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3CompleteMultipartUploadOutput.
 *
 * @see AWSS3CompleteMultipartUploadRequest
 * @see AWSS3CompleteMultipartUploadOutput
 */
- (BFTask *)completeMultipartUpload:(AWSS3CompleteMultipartUploadRequest *)request;

/**
 * Creates a new bucket.
 *
 * @param request A container for the necessary parameters to execute the CreateBucket service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3CreateBucketOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorBucketAlreadyExists.
 *
 * @see AWSS3CreateBucketRequest
 * @see AWSS3CreateBucketOutput
 */
- (BFTask *)createBucket:(AWSS3CreateBucketRequest *)request;

/**
 * <p>Initiates a multipart upload and returns an upload ID.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 *
 * @param request A container for the necessary parameters to execute the CreateMultipartUpload service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3CreateMultipartUploadOutput.
 *
 * @see AWSS3CreateMultipartUploadRequest
 * @see AWSS3CreateMultipartUploadOutput
 */
- (BFTask *)createMultipartUpload:(AWSS3CreateMultipartUploadRequest *)request;

/**
 * Deletes the bucket. All objects (including all object versions and Delete Markers) in the bucket must be deleted before the bucket itself can be deleted.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucket service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketRequest
 */
- (BFTask *)deleteBucket:(AWSS3DeleteBucketRequest *)request;

/**
 * Deletes the cors configuration information set for the bucket.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucketCors service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketCorsRequest
 */
- (BFTask *)deleteBucketCors:(AWSS3DeleteBucketCorsRequest *)request;

/**
 * Deletes the lifecycle configuration from the bucket.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucketLifecycle service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketLifecycleRequest
 */
- (BFTask *)deleteBucketLifecycle:(AWSS3DeleteBucketLifecycleRequest *)request;

/**
 * Deletes the policy from the bucket.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucketPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketPolicyRequest
 */
- (BFTask *)deleteBucketPolicy:(AWSS3DeleteBucketPolicyRequest *)request;

/**
 * Deletes the tags from the bucket.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucketTagging service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketTaggingRequest
 */
- (BFTask *)deleteBucketTagging:(AWSS3DeleteBucketTaggingRequest *)request;

/**
 * This operation removes the website configuration from the bucket.
 *
 * @param request A container for the necessary parameters to execute the DeleteBucketWebsite service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3DeleteBucketWebsiteRequest
 */
- (BFTask *)deleteBucketWebsite:(AWSS3DeleteBucketWebsiteRequest *)request;

/**
 * Removes the null version (if there is one) of an object and inserts a delete marker, which becomes the latest version of the object. If there isn't a null version, Amazon S3 does not remove any objects.
 *
 * @param request A container for the necessary parameters to execute the DeleteObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3DeleteObjectOutput.
 *
 * @see AWSS3DeleteObjectRequest
 * @see AWSS3DeleteObjectOutput
 */
- (BFTask *)deleteObject:(AWSS3DeleteObjectRequest *)request;

/**
 * This operation enables you to delete multiple objects from a bucket using a single HTTP request. You may specify up to 1000 keys.
 *
 * @param request A container for the necessary parameters to execute the DeleteObjects service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3DeleteObjectsOutput.
 *
 * @see AWSS3DeleteObjectsRequest
 * @see AWSS3DeleteObjectsOutput
 */
- (BFTask *)deleteObjects:(AWSS3DeleteObjectsRequest *)request;

/**
 * Gets the access control policy for the bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketAcl service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketAclOutput.
 *
 * @see AWSS3GetBucketAclRequest
 * @see AWSS3GetBucketAclOutput
 */
- (BFTask *)getBucketAcl:(AWSS3GetBucketAclRequest *)request;

/**
 * Returns the cors configuration for the bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketCors service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketCorsOutput.
 *
 * @see AWSS3GetBucketCorsRequest
 * @see AWSS3GetBucketCorsOutput
 */
- (BFTask *)getBucketCors:(AWSS3GetBucketCorsRequest *)request;

/**
 * Returns the lifecycle configuration information set on the bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketLifecycle service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketLifecycleOutput.
 *
 * @see AWSS3GetBucketLifecycleRequest
 * @see AWSS3GetBucketLifecycleOutput
 */
- (BFTask *)getBucketLifecycle:(AWSS3GetBucketLifecycleRequest *)request;

/**
 * Returns the region the bucket resides in.
 *
 * @param request A container for the necessary parameters to execute the GetBucketLocation service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketLocationOutput.
 *
 * @see AWSS3GetBucketLocationRequest
 * @see AWSS3GetBucketLocationOutput
 */
- (BFTask *)getBucketLocation:(AWSS3GetBucketLocationRequest *)request;

/**
 * Returns the logging status of a bucket and the permissions users have to view and modify that status. To use GET, you must be the bucket owner.
 *
 * @param request A container for the necessary parameters to execute the GetBucketLogging service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketLoggingOutput.
 *
 * @see AWSS3GetBucketLoggingRequest
 * @see AWSS3GetBucketLoggingOutput
 */
- (BFTask *)getBucketLogging:(AWSS3GetBucketLoggingRequest *)request;

/**
 * Return the notification configuration of a bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketNotification service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketNotificationOutput.
 *
 * @see AWSS3GetBucketNotificationRequest
 * @see AWSS3GetBucketNotificationOutput
 */
- (BFTask *)getBucketNotification:(AWSS3GetBucketNotificationRequest *)request;

/**
 * Returns the policy of a specified bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketPolicyOutput.
 *
 * @see AWSS3GetBucketPolicyRequest
 * @see AWSS3GetBucketPolicyOutput
 */
- (BFTask *)getBucketPolicy:(AWSS3GetBucketPolicyRequest *)request;

/**
 * Returns the request payment configuration of a bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketRequestPayment service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketRequestPaymentOutput.
 *
 * @see AWSS3GetBucketRequestPaymentRequest
 * @see AWSS3GetBucketRequestPaymentOutput
 */
- (BFTask *)getBucketRequestPayment:(AWSS3GetBucketRequestPaymentRequest *)request;

/**
 * Returns the tag set associated with the bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketTagging service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketTaggingOutput.
 *
 * @see AWSS3GetBucketTaggingRequest
 * @see AWSS3GetBucketTaggingOutput
 */
- (BFTask *)getBucketTagging:(AWSS3GetBucketTaggingRequest *)request;

/**
 * Returns the versioning state of a bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketVersioning service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketVersioningOutput.
 *
 * @see AWSS3GetBucketVersioningRequest
 * @see AWSS3GetBucketVersioningOutput
 */
- (BFTask *)getBucketVersioning:(AWSS3GetBucketVersioningRequest *)request;

/**
 * Returns the website configuration for a bucket.
 *
 * @param request A container for the necessary parameters to execute the GetBucketWebsite service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetBucketWebsiteOutput.
 *
 * @see AWSS3GetBucketWebsiteRequest
 * @see AWSS3GetBucketWebsiteOutput
 */
- (BFTask *)getBucketWebsite:(AWSS3GetBucketWebsiteRequest *)request;

/**
 * Retrieves objects from Amazon S3.
 *
 * @param request A container for the necessary parameters to execute the GetObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetObjectOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchKey.
 *
 * @see AWSS3GetObjectRequest
 * @see AWSS3GetObjectOutput
 */
- (BFTask *)getObject:(AWSS3GetObjectRequest *)request;

/**
 * Returns the access control list (ACL) of an object.
 *
 * @param request A container for the necessary parameters to execute the GetObjectAcl service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetObjectAclOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchKey.
 *
 * @see AWSS3GetObjectAclRequest
 * @see AWSS3GetObjectAclOutput
 */
- (BFTask *)getObjectAcl:(AWSS3GetObjectAclRequest *)request;

/**
 * Return torrent files from a bucket.
 *
 * @param request A container for the necessary parameters to execute the GetObjectTorrent service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3GetObjectTorrentOutput.
 *
 * @see AWSS3GetObjectTorrentRequest
 * @see AWSS3GetObjectTorrentOutput
 */
- (BFTask *)getObjectTorrent:(AWSS3GetObjectTorrentRequest *)request;

/**
 * This operation is useful to determine if a bucket exists and you have permission to access it.
 *
 * @param request A container for the necessary parameters to execute the HeadBucket service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchBucket.
 *
 * @see AWSS3HeadBucketRequest
 */
- (BFTask *)headBucket:(AWSS3HeadBucketRequest *)request;

/**
 * The HEAD operation retrieves metadata from an object without returning the object itself. This operation is useful if you're only interested in an object's metadata. To use HEAD, you must have READ access to the object.
 *
 * @param request A container for the necessary parameters to execute the HeadObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3HeadObjectOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchKey.
 *
 * @see AWSS3HeadObjectRequest
 * @see AWSS3HeadObjectOutput
 */
- (BFTask *)headObject:(AWSS3HeadObjectRequest *)request;

/**
 * Returns a list of all buckets owned by the authenticated sender of the request.
 *
 * @param request A container for the necessary parameters to execute the ListBuckets service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ListBucketsOutput.
 *
 * @see AWSRequest
 * @see AWSS3ListBucketsOutput
 */
- (BFTask *)listBuckets:(AWSRequest *)request;

/**
 * This operation lists in-progress multipart uploads.
 *
 * @param request A container for the necessary parameters to execute the ListMultipartUploads service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ListMultipartUploadsOutput.
 *
 * @see AWSS3ListMultipartUploadsRequest
 * @see AWSS3ListMultipartUploadsOutput
 */
- (BFTask *)listMultipartUploads:(AWSS3ListMultipartUploadsRequest *)request;

/**
 * Returns metadata about all of the versions of objects in a bucket.
 *
 * @param request A container for the necessary parameters to execute the ListObjectVersions service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ListObjectVersionsOutput.
 *
 * @see AWSS3ListObjectVersionsRequest
 * @see AWSS3ListObjectVersionsOutput
 */
- (BFTask *)listObjectVersions:(AWSS3ListObjectVersionsRequest *)request;

/**
 * Returns some or all (up to 1000) of the objects in a bucket. You can use the request parameters as selection criteria to return a subset of the objects in a bucket.
 *
 * @param request A container for the necessary parameters to execute the ListObjects service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ListObjectsOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchBucket.
 *
 * @see AWSS3ListObjectsRequest
 * @see AWSS3ListObjectsOutput
 */
- (BFTask *)listObjects:(AWSS3ListObjectsRequest *)request;

/**
 * Lists the parts that have been uploaded for a specific multipart upload.
 *
 * @param request A container for the necessary parameters to execute the ListParts service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ListPartsOutput.
 *
 * @see AWSS3ListPartsRequest
 * @see AWSS3ListPartsOutput
 */
- (BFTask *)listParts:(AWSS3ListPartsRequest *)request;

/**
 * Sets the permissions on a bucket using access control lists (ACL).
 *
 * @param request A container for the necessary parameters to execute the PutBucketAcl service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketAclRequest
 */
- (BFTask *)putBucketAcl:(AWSS3PutBucketAclRequest *)request;

/**
 * Sets the cors configuration for a bucket.
 *
 * @param request A container for the necessary parameters to execute the PutBucketCors service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketCorsRequest
 */
- (BFTask *)putBucketCors:(AWSS3PutBucketCorsRequest *)request;

/**
 * Sets lifecycle configuration for your bucket. If a lifecycle configuration exists, it replaces it.
 *
 * @param request A container for the necessary parameters to execute the PutBucketLifecycle service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketLifecycleRequest
 */
- (BFTask *)putBucketLifecycle:(AWSS3PutBucketLifecycleRequest *)request;

/**
 * Set the logging parameters for a bucket and to specify permissions for who can view and modify the logging parameters. To set the logging status of a bucket, you must be the bucket owner.
 *
 * @param request A container for the necessary parameters to execute the PutBucketLogging service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketLoggingRequest
 */
- (BFTask *)putBucketLogging:(AWSS3PutBucketLoggingRequest *)request;

/**
 * Enables notifications of specified events for a bucket.
 *
 * @param request A container for the necessary parameters to execute the PutBucketNotification service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketNotificationRequest
 */
- (BFTask *)putBucketNotification:(AWSS3PutBucketNotificationRequest *)request;

/**
 * Replaces a policy on a bucket. If the bucket already has a policy, the one in this request completely replaces it.
 *
 * @param request A container for the necessary parameters to execute the PutBucketPolicy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketPolicyRequest
 */
- (BFTask *)putBucketPolicy:(AWSS3PutBucketPolicyRequest *)request;

/**
 * Sets the request payment configuration for a bucket. By default, the bucket owner pays for downloads from the bucket. This configuration parameter enables the bucket owner (only) to specify that the person requesting the download will be charged for the download.
 *
 * @param request A container for the necessary parameters to execute the PutBucketRequestPayment service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketRequestPaymentRequest
 */
- (BFTask *)putBucketRequestPayment:(AWSS3PutBucketRequestPaymentRequest *)request;

/**
 * Sets the tags for a bucket.
 *
 * @param request A container for the necessary parameters to execute the PutBucketTagging service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketTaggingRequest
 */
- (BFTask *)putBucketTagging:(AWSS3PutBucketTaggingRequest *)request;

/**
 * Sets the versioning state of an existing bucket. To set the versioning state, you must be the bucket owner.
 *
 * @param request A container for the necessary parameters to execute the PutBucketVersioning service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketVersioningRequest
 */
- (BFTask *)putBucketVersioning:(AWSS3PutBucketVersioningRequest *)request;

/**
 * Set the website configuration for a bucket.
 *
 * @param request A container for the necessary parameters to execute the PutBucketWebsite service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil.
 *
 * @see AWSS3PutBucketWebsiteRequest
 */
- (BFTask *)putBucketWebsite:(AWSS3PutBucketWebsiteRequest *)request;

/**
 * Adds an object to a bucket.
 *
 * @param request A container for the necessary parameters to execute the PutObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3PutObjectOutput.
 *
 * @see AWSS3PutObjectRequest
 * @see AWSS3PutObjectOutput
 */
- (BFTask *)putObject:(AWSS3PutObjectRequest *)request;

/**
 * uses the acl subresource to set the access control list (ACL) permissions for an object that already exists in a bucket
 *
 * @param request A container for the necessary parameters to execute the PutObjectAcl service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorNoSuchKey.
 *
 * @see AWSS3PutObjectAclRequest
 */
- (BFTask *)putObjectAcl:(AWSS3PutObjectAclRequest *)request;

/**
 * Creates a copy of an object that is already stored in Amazon S3.
 *
 * @param request A container for the necessary parameters to execute the ReplicateObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3ReplicateObjectOutput. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorObjectNotInActiveTier.
 *
 * @see AWSS3ReplicateObjectRequest
 * @see AWSS3ReplicateObjectOutput
 */
- (BFTask *)replicateObject:(AWSS3ReplicateObjectRequest *)request;

/**
 * Restores an archived copy of an object back into Amazon S3
 *
 * @param request A container for the necessary parameters to execute the RestoreObject service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will be nil. On failed execution, task.error may contain an NSError with AWSS3ErrorDomain domian and the following error code: AWSS3ErrorObjectAlreadyInActiveTier.
 *
 * @see AWSS3RestoreObjectRequest
 */
- (BFTask *)restoreObject:(AWSS3RestoreObjectRequest *)request;

/**
 * <p>Uploads a part in a multipart upload.</p><p><b>Note:</b> After you initiate multipart upload and upload one or more parts, you must either complete or abort multipart upload in order to stop getting charged for storage of the uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the parts storage and stops charging you for the parts storage.</p>
 *
 * @param request A container for the necessary parameters to execute the UploadPart service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3UploadPartOutput.
 *
 * @see AWSS3UploadPartRequest
 * @see AWSS3UploadPartOutput
 */
- (BFTask *)uploadPart:(AWSS3UploadPartRequest *)request;

/**
 * Uploads a part by copying data from an existing object as data source.
 *
 * @param request A container for the necessary parameters to execute the UploadPartCopy service method.
 *
 * @return An instance of BFTask. On successful execution, task.result will contain an instance of AWSS3UploadPartCopyOutput.
 *
 * @see AWSS3UploadPartCopyRequest
 * @see AWSS3UploadPartCopyOutput
 */
- (BFTask *)uploadPartCopy:(AWSS3UploadPartCopyRequest *)request;

@end
