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

FOUNDATION_EXPORT NSString *const AWSAWSS3ControlErrorDomain;

typedef NS_ENUM(NSInteger, AWSAWSS3ControlErrorType) {
    AWSAWSS3ControlErrorUnknown,
    AWSAWSS3ControlErrorBadRequest,
    AWSAWSS3ControlErrorIdempotency,
    AWSAWSS3ControlErrorInternalService,
    AWSAWSS3ControlErrorInvalidNextToken,
    AWSAWSS3ControlErrorInvalidRequest,
    AWSAWSS3ControlErrorJobStatus,
    AWSAWSS3ControlErrorNoSuchPublicAccessBlockConfiguration,
    AWSAWSS3ControlErrorNotFound,
    AWSAWSS3ControlErrorTooManyRequests,
    AWSAWSS3ControlErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlJobManifestFieldName) {
    AWSAWSS3ControlJobManifestFieldNameUnknown,
    AWSAWSS3ControlJobManifestFieldNameIgnore,
    AWSAWSS3ControlJobManifestFieldNameBucket,
    AWSAWSS3ControlJobManifestFieldNameKey,
    AWSAWSS3ControlJobManifestFieldNameVersionId,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlJobManifestFormat) {
    AWSAWSS3ControlJobManifestFormatUnknown,
    AWSAWSS3ControlJobManifestFormatS3BatchOperationsCSV20180820,
    AWSAWSS3ControlJobManifestFormatS3InventoryReportCSV20161130,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlJobReportFormat) {
    AWSAWSS3ControlJobReportFormatUnknown,
    AWSAWSS3ControlJobReportFormatReportCSV20180820,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlJobReportScope) {
    AWSAWSS3ControlJobReportScopeUnknown,
    AWSAWSS3ControlJobReportScopeAllTasks,
    AWSAWSS3ControlJobReportScopeFailedTasksOnly,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlJobStatus) {
    AWSAWSS3ControlJobStatusUnknown,
    AWSAWSS3ControlJobStatusActive,
    AWSAWSS3ControlJobStatusCancelled,
    AWSAWSS3ControlJobStatusCancelling,
    AWSAWSS3ControlJobStatusComplete,
    AWSAWSS3ControlJobStatusCompleting,
    AWSAWSS3ControlJobStatusFailed,
    AWSAWSS3ControlJobStatusFailing,
    AWSAWSS3ControlJobStatusNew,
    AWSAWSS3ControlJobStatusPaused,
    AWSAWSS3ControlJobStatusPausing,
    AWSAWSS3ControlJobStatusPreparing,
    AWSAWSS3ControlJobStatusReady,
    AWSAWSS3ControlJobStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlNetworkOrigin) {
    AWSAWSS3ControlNetworkOriginUnknown,
    AWSAWSS3ControlNetworkOriginInternet,
    AWSAWSS3ControlNetworkOriginVpc,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlOperationName) {
    AWSAWSS3ControlOperationNameUnknown,
    AWSAWSS3ControlOperationNameLambdaInvoke,
    AWSAWSS3ControlOperationNameS3PutObjectCopy,
    AWSAWSS3ControlOperationNameS3PutObjectAcl,
    AWSAWSS3ControlOperationNameS3PutObjectTagging,
    AWSAWSS3ControlOperationNameS3InitiateRestoreObject,
    AWSAWSS3ControlOperationNameS3PutObjectLegalHold,
    AWSAWSS3ControlOperationNameS3PutObjectRetention,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlRequestedJobStatus) {
    AWSAWSS3ControlRequestedJobStatusUnknown,
    AWSAWSS3ControlRequestedJobStatusCancelled,
    AWSAWSS3ControlRequestedJobStatusReady,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3CannedAccessControlList) {
    AWSAWSS3ControlS3CannedAccessControlListUnknown,
    AWSAWSS3ControlS3CannedAccessControlListPrivate,
    AWSAWSS3ControlS3CannedAccessControlListPublicRead,
    AWSAWSS3ControlS3CannedAccessControlListPublicReadWrite,
    AWSAWSS3ControlS3CannedAccessControlListAwsExecRead,
    AWSAWSS3ControlS3CannedAccessControlListAuthenticatedRead,
    AWSAWSS3ControlS3CannedAccessControlListBucketOwnerRead,
    AWSAWSS3ControlS3CannedAccessControlListBucketOwnerFullControl,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3GlacierJobTier) {
    AWSAWSS3ControlS3GlacierJobTierUnknown,
    AWSAWSS3ControlS3GlacierJobTierBulk,
    AWSAWSS3ControlS3GlacierJobTierStandard,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3GranteeTypeIdentifier) {
    AWSAWSS3ControlS3GranteeTypeIdentifierUnknown,
    AWSAWSS3ControlS3GranteeTypeIdentifierId,
    AWSAWSS3ControlS3GranteeTypeIdentifierEmailAddress,
    AWSAWSS3ControlS3GranteeTypeIdentifierUri,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3MetadataDirective) {
    AWSAWSS3ControlS3MetadataDirectiveUnknown,
    AWSAWSS3ControlS3MetadataDirectiveCopy,
    AWSAWSS3ControlS3MetadataDirectiveReplace,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3ObjectLockLegalHoldStatus) {
    AWSAWSS3ControlS3ObjectLockLegalHoldStatusUnknown,
    AWSAWSS3ControlS3ObjectLockLegalHoldStatusOff,
    AWSAWSS3ControlS3ObjectLockLegalHoldStatusOn,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3ObjectLockMode) {
    AWSAWSS3ControlS3ObjectLockModeUnknown,
    AWSAWSS3ControlS3ObjectLockModeCompliance,
    AWSAWSS3ControlS3ObjectLockModeGovernance,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3ObjectLockRetentionMode) {
    AWSAWSS3ControlS3ObjectLockRetentionModeUnknown,
    AWSAWSS3ControlS3ObjectLockRetentionModeCompliance,
    AWSAWSS3ControlS3ObjectLockRetentionModeGovernance,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3Permission) {
    AWSAWSS3ControlS3PermissionUnknown,
    AWSAWSS3ControlS3PermissionFullControl,
    AWSAWSS3ControlS3PermissionRead,
    AWSAWSS3ControlS3PermissionWrite,
    AWSAWSS3ControlS3PermissionReadAcp,
    AWSAWSS3ControlS3PermissionWriteAcp,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3SSEAlgorithm) {
    AWSAWSS3ControlS3SSEAlgorithmUnknown,
    AWSAWSS3ControlS3SSEAlgorithmAES256,
    AWSAWSS3ControlS3SSEAlgorithmKms,
};

typedef NS_ENUM(NSInteger, AWSAWSS3ControlS3StorageClass) {
    AWSAWSS3ControlS3StorageClassUnknown,
    AWSAWSS3ControlS3StorageClassStandard,
    AWSAWSS3ControlS3StorageClassStandardIa,
    AWSAWSS3ControlS3StorageClassOnezoneIa,
    AWSAWSS3ControlS3StorageClassGlacier,
    AWSAWSS3ControlS3StorageClassIntelligentTiering,
    AWSAWSS3ControlS3StorageClassDeepArchive,
};

@class AWSAWSS3ControlAccessPoint;
@class AWSAWSS3ControlCreateAccessPointRequest;
@class AWSAWSS3ControlCreateJobRequest;
@class AWSAWSS3ControlCreateJobResult;
@class AWSAWSS3ControlDeleteAccessPointPolicyRequest;
@class AWSAWSS3ControlDeleteAccessPointRequest;
@class AWSAWSS3ControlDeleteJobTaggingRequest;
@class AWSAWSS3ControlDeleteJobTaggingResult;
@class AWSAWSS3ControlDeletePublicAccessBlockRequest;
@class AWSAWSS3ControlDescribeJobRequest;
@class AWSAWSS3ControlDescribeJobResult;
@class AWSAWSS3ControlGetAccessPointPolicyRequest;
@class AWSAWSS3ControlGetAccessPointPolicyResult;
@class AWSAWSS3ControlGetAccessPointPolicyStatusRequest;
@class AWSAWSS3ControlGetAccessPointPolicyStatusResult;
@class AWSAWSS3ControlGetAccessPointRequest;
@class AWSAWSS3ControlGetAccessPointResult;
@class AWSAWSS3ControlGetJobTaggingRequest;
@class AWSAWSS3ControlGetJobTaggingResult;
@class AWSAWSS3ControlGetPublicAccessBlockOutput;
@class AWSAWSS3ControlGetPublicAccessBlockRequest;
@class AWSAWSS3ControlJobDescriptor;
@class AWSAWSS3ControlJobFailure;
@class AWSAWSS3ControlJobListDescriptor;
@class AWSAWSS3ControlJobManifest;
@class AWSAWSS3ControlJobManifestLocation;
@class AWSAWSS3ControlJobManifestSpec;
@class AWSAWSS3ControlJobOperation;
@class AWSAWSS3ControlJobProgressSummary;
@class AWSAWSS3ControlJobReport;
@class AWSAWSS3ControlLambdaInvokeOperation;
@class AWSAWSS3ControlListAccessPointsRequest;
@class AWSAWSS3ControlListAccessPointsResult;
@class AWSAWSS3ControlListJobsRequest;
@class AWSAWSS3ControlListJobsResult;
@class AWSAWSS3ControlPolicyStatus;
@class AWSAWSS3ControlPublicAccessBlockConfiguration;
@class AWSAWSS3ControlPutAccessPointPolicyRequest;
@class AWSAWSS3ControlPutJobTaggingRequest;
@class AWSAWSS3ControlPutJobTaggingResult;
@class AWSAWSS3ControlPutPublicAccessBlockRequest;
@class AWSAWSS3ControlS3AccessControlList;
@class AWSAWSS3ControlS3AccessControlPolicy;
@class AWSAWSS3ControlS3CopyObjectOperation;
@class AWSAWSS3ControlS3Grant;
@class AWSAWSS3ControlS3Grantee;
@class AWSAWSS3ControlS3InitiateRestoreObjectOperation;
@class AWSAWSS3ControlS3ObjectLockLegalHold;
@class AWSAWSS3ControlS3ObjectMetadata;
@class AWSAWSS3ControlS3ObjectOwner;
@class AWSAWSS3ControlS3Retention;
@class AWSAWSS3ControlS3SetObjectAclOperation;
@class AWSAWSS3ControlS3SetObjectLegalHoldOperation;
@class AWSAWSS3ControlS3SetObjectRetentionOperation;
@class AWSAWSS3ControlS3SetObjectTaggingOperation;
@class AWSAWSS3ControlS3Tag;
@class AWSAWSS3ControlUpdateJobPriorityRequest;
@class AWSAWSS3ControlUpdateJobPriorityResult;
@class AWSAWSS3ControlUpdateJobStatusRequest;
@class AWSAWSS3ControlUpdateJobStatusResult;
@class AWSAWSS3ControlVpcConfiguration;

/**
 <p>An access point used to access a bucket.</p>
 Required parameters: [Name, NetworkOrigin, Bucket]
 */
@interface AWSAWSS3ControlAccessPoint : AWSModel


/**
 <p>The name of the bucket associated with this access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of this access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Indicates whether this access point allows access from the public internet. If <code>VpcConfiguration</code> is specified for this access point, then <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't allow access from the public internet. Otherwise, <code>NetworkOrigin</code> is <code>Internet</code>, and the access point allows access from the public internet, subject to the access point and bucket access policies.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlNetworkOrigin networkOrigin;

/**
 <p>The virtual private cloud (VPC) configuration for this access point, if one exists.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlVpcConfiguration * _Nullable vpcConfiguration;

@end

/**
 
 */
@interface AWSAWSS3ControlCreateAccessPointRequest : AWSRequest


/**
 <p>The AWS account ID for the owner of the bucket for which you want to create an access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the bucket that you want to associate this access point with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name you want to assign to this access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the Amazon Simple Storage Service Developer Guide.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlPublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

/**
 <p>If you include this field, Amazon S3 restricts access to this access point to requests from the specified virtual private cloud (VPC).</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlVpcConfiguration * _Nullable vpcConfiguration;

@end

/**
 
 */
@interface AWSAWSS3ControlCreateJobRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>An idempotency token to ensure that you don't accidentally submit the same request twice. You can use any string up to the maximum length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Indicates whether confirmation is required before Amazon S3 runs the job. Confirmation is only required for jobs created through the Amazon S3 console.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confirmationRequired;

/**
 <p>A description for this job. You can use any string within the permitted length. Descriptions don't need to be unique and can be used for multiple jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Configuration parameters for the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobManifest * _Nullable manifest;

/**
 <p>The operation that you want this job to perform on each object listed in the manifest. For more information about the available operations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Available Operations</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobOperation * _Nullable operation;

/**
 <p>The numerical priority for this job. Higher numbers indicate higher priority.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>Configuration parameters for the optional job-completion report.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobReport * _Nullable report;

/**
 <p>The Amazon Resource Name (ARN) for the AWS Identity and Access Management (IAM) role that Batch Operations will use to execute this job's operation on each object in the manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A set of tags to associate with the Amazon S3 Batch Operations job. This is an optional parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSS3ControlCreateJobResult : AWSModel


/**
 <p>The ID for this job. Amazon S3 generates this ID automatically and returns it after a successful <code>Create Job</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSS3ControlDeleteAccessPointPolicyRequest : AWSRequest


/**
 <p>The account ID for the account that owns the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point whose policy you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAWSS3ControlDeleteAccessPointRequest : AWSRequest


/**
 <p>The account ID for the account that owns the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAWSS3ControlDeleteJobTaggingRequest : AWSRequest


/**
 <p>The AWS account ID associated with the Amazon S3 Batch Operations job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID for the Amazon S3 Batch Operations job whose tags you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSS3ControlDeleteJobTaggingResult : AWSModel


@end

/**
 
 */
@interface AWSAWSS3ControlDeletePublicAccessBlockRequest : AWSRequest


/**
 <p>The account ID for the Amazon Web Services account whose <code>PublicAccessBlock</code> configuration you want to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 
 */
@interface AWSAWSS3ControlDescribeJobRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID for the job whose information you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSS3ControlDescribeJobResult : AWSModel


/**
 <p>Contains the configuration parameters and status for the job specified in the <code>Describe Job</code> request.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobDescriptor * _Nullable job;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointPolicyRequest : AWSRequest


/**
 <p>The account ID for the account that owns the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point whose policy you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointPolicyResult : AWSModel


/**
 <p>The access point policy associated with the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointPolicyStatusRequest : AWSRequest


/**
 <p>The account ID for the account that owns the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point whose policy status you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointPolicyStatusResult : AWSModel


/**
 <p>Indicates the current policy status of the specified access point.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlPolicyStatus * _Nullable policyStatus;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointRequest : AWSRequest


/**
 <p>The account ID for the account that owns the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point whose configuration information you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSAWSS3ControlGetAccessPointResult : AWSModel


/**
 <p>The name of the bucket associated with the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The date and time when the specified access point was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The name of the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Indicates whether this access point allows access from the public internet. If <code>VpcConfiguration</code> is specified for this access point, then <code>NetworkOrigin</code> is <code>VPC</code>, and the access point doesn't allow access from the public internet. Otherwise, <code>NetworkOrigin</code> is <code>Internet</code>, and the access point allows access from the public internet, subject to the access point and bucket access policies.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlNetworkOrigin networkOrigin;

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the Amazon Simple Storage Service Developer Guide.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlPublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

/**
 <p>Contains the virtual private cloud (VPC) configuration for the specified access point.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlVpcConfiguration * _Nullable vpcConfiguration;

@end

/**
 
 */
@interface AWSAWSS3ControlGetJobTaggingRequest : AWSRequest


/**
 <p>The AWS account ID associated with the Amazon S3 Batch Operations job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID for the Amazon S3 Batch Operations job whose tags you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSAWSS3ControlGetJobTaggingResult : AWSModel


/**
 <p>The set of tags associated with the Amazon S3 Batch Operations job.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSS3ControlGetPublicAccessBlockOutput : AWSModel


/**
 <p>The <code>PublicAccessBlock</code> configuration currently in effect for this Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlPublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

@end

/**
 
 */
@interface AWSAWSS3ControlGetPublicAccessBlockRequest : AWSRequest


/**
 <p>The account ID for the Amazon Web Services account whose <code>PublicAccessBlock</code> configuration you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 <p>A container element for the job configuration and status information returned by a <code>Describe Job</code> request.</p>
 */
@interface AWSAWSS3ControlJobDescriptor : AWSModel


/**
 <p>Indicates whether confirmation is required before Amazon S3 begins running the specified job. Confirmation is required only for jobs created through the Amazon S3 console.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confirmationRequired;

/**
 <p>A timestamp indicating when this job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The description for this job, if one was provided in this job's <code>Create Job</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the specified job failed, this field contains information describing the failure.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlJobFailure *> * _Nullable failureReasons;

/**
 <p>The Amazon Resource Name (ARN) for this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobArn;

/**
 <p>The ID for the specified job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The configuration information for the specified job's manifest object.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobManifest * _Nullable manifest;

/**
 <p>The operation that the specified job is configured to execute on the objects listed in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobOperation * _Nullable operation;

/**
 <p>The priority of the specified job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>Describes the total number of tasks that the specified job has executed, the number of tasks that succeeded, and the number of tasks that failed.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobProgressSummary * _Nullable progressSummary;

/**
 <p>Contains the configuration information for the job-completion report if you requested one in the <code>Create Job</code> request.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobReport * _Nullable report;

/**
 <p>The Amazon Resource Name (ARN) for the AWS Identity and Access Management (IAM) role assigned to execute the tasks for this job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The current status of the specified job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobStatus status;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable statusUpdateReason;

/**
 <p>The reason why the specified job was suspended. A job is only suspended if you create it through the Amazon S3 console. When you create the job, it enters the <code>Suspended</code> state to await confirmation before running. After you confirm the job, it automatically exits the <code>Suspended</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suspendedCause;

/**
 <p>The timestamp when this job was suspended, if it has been suspended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable suspendedDate;

/**
 <p>A timestamp indicating when this job terminated. A job's termination date is the date and time when it succeeded, failed, or was canceled.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable terminationDate;

@end

/**
 <p>If this job failed, this element indicates why the job failed.</p>
 */
@interface AWSAWSS3ControlJobFailure : AWSModel


/**
 <p>The failure code, if any, for the specified job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureCode;

/**
 <p>The failure reason, if any, for the specified job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

@end

/**
 <p>Contains the configuration and status information for a single job retrieved as part of a job list.</p>
 */
@interface AWSAWSS3ControlJobListDescriptor : AWSModel


/**
 <p>A timestamp indicating when the specified job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The user-specified description that was included in the specified job's <code>Create Job</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID for the specified job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The operation that the specified job is configured to run on each object listed in the manifest.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlOperationName operation;

/**
 <p>The current priority for the specified job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>Describes the total number of tasks that the specified job has executed, the number of tasks that succeeded, and the number of tasks that failed.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobProgressSummary * _Nullable progressSummary;

/**
 <p>The specified job's current status.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobStatus status;

/**
 <p>A timestamp indicating when the specified job terminated. A job's termination date is the date and time when it succeeded, failed, or was canceled.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable terminationDate;

@end

/**
 <p>Contains the configuration information for a job's manifest.</p>
 Required parameters: [Spec, Location]
 */
@interface AWSAWSS3ControlJobManifest : AWSModel


/**
 <p>Contains the information required to locate the specified job's manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobManifestLocation * _Nullable location;

/**
 <p>Describes the format of the specified job's manifest. If the manifest is in CSV format, also describes the columns contained within the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlJobManifestSpec * _Nullable spec;

@end

/**
 <p>Contains the information required to locate a manifest object.</p>
 Required parameters: [ObjectArn, ETag]
 */
@interface AWSAWSS3ControlJobManifestLocation : AWSModel


/**
 <p>The ETag for the specified manifest object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The Amazon Resource Name (ARN) for a manifest object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable objectArn;

/**
 <p>The optional version ID to identify a specific version of the manifest object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable objectVersionId;

@end

/**
 <p>Describes the format of a manifest. If the manifest is in CSV format, also describes the columns contained within the manifest.</p>
 Required parameters: [Format]
 */
@interface AWSAWSS3ControlJobManifestSpec : AWSModel


/**
 <p>If the specified manifest object is in the <code>S3BatchOperations_CSV_20180820</code> format, this element describes which columns contain the required data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fields;

/**
 <p>Indicates which of the available formats the specified manifest uses.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobManifestFormat format;

@end

/**
 <p>The operation that you want this job to perform on each object listed in the manifest. For more information about the available operations, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html">Available Operations</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@interface AWSAWSS3ControlJobOperation : AWSModel


/**
 <p>Directs the specified job to invoke an AWS Lambda function on each object in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlLambdaInvokeOperation * _Nullable lambdaInvoke;

/**
 <p>Directs the specified job to execute an Initiate Glacier Restore call on each object in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3InitiateRestoreObjectOperation * _Nullable s3InitiateRestoreObject;

/**
 <p>Directs the specified job to execute a PUT Object acl call on each object in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3SetObjectAclOperation * _Nullable s3PutObjectAcl;

/**
 <p>Directs the specified job to execute a PUT Copy object call on each object in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3CopyObjectOperation * _Nullable s3PutObjectCopy;

/**
 <p>Contains the configuration parameters for a Set Object Legal Hold operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object Legal Hold API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.htmll#object-lock-legal-holds">PUT Object Legal Hold</a>.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3SetObjectLegalHoldOperation * _Nullable s3PutObjectLegalHold;

/**
 <p>Contains the configuration parameters for a Set Object Retention operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object Retention API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.html#object-lock-retention-modes">PUT Object Retention</a>.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3SetObjectRetentionOperation * _Nullable s3PutObjectRetention;

/**
 <p>Directs the specified job to execute a PUT Object tagging call on each object in the manifest.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3SetObjectTaggingOperation * _Nullable s3PutObjectTagging;

@end

/**
 <p>Describes the total number of tasks that the specified job has executed, the number of tasks that succeeded, and the number of tasks that failed.</p>
 */
@interface AWSAWSS3ControlJobProgressSummary : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTasksFailed;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTasksSucceeded;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalNumberOfTasks;

@end

/**
 <p>Contains the configuration parameters for a job-completion report.</p>
 Required parameters: [Enabled]
 */
@interface AWSAWSS3ControlJobReport : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the bucket where specified job-completion report will be stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Indicates whether the specified job will generate a job-completion report.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The format of the specified job-completion report.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobReportFormat format;

/**
 <p>An optional prefix to describe where in the specified bucket the job-completion report will be stored. Amazon S3 will store the job-completion report at &lt;prefix&gt;/job-&lt;job-id&gt;/report.json.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>Indicates whether the job-completion report will include details of all tasks or only failed tasks.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobReportScope reportScope;

@end

/**
 <p>Contains the configuration parameters for a <code>Lambda Invoke</code> operation.</p>
 */
@interface AWSAWSS3ControlLambdaInvokeOperation : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the AWS Lambda function that the specified job will invoke for each object in the manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

@end

/**
 
 */
@interface AWSAWSS3ControlListAccessPointsRequest : AWSRequest


/**
 <p>The AWS account ID for owner of the bucket whose access points you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the bucket whose associated access points you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The maximum number of access points that you want to include in the list. If the specified bucket has more than this number of access points, then the response will include a continuation token in the <code>NextToken</code> field that you can use to retrieve the next page of access points.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A continuation token. If a previous call to <code>ListAccessPoints</code> returned a continuation token in the <code>NextToken</code> field, then providing that value here causes Amazon S3 to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSS3ControlListAccessPointsResult : AWSModel


/**
 <p>Contains identification and configuration information for one or more access points associated with the specified bucket.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlAccessPoint *> * _Nullable accessPointList;

/**
 <p>If the specified bucket has more access points than can be returned in one call to this API, then this field contains a continuation token that you can provide in subsequent calls to this API to retrieve additional access points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSS3ControlListJobsRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The <code>List Jobs</code> request returns jobs that match the statuses listed in this element.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobStatuses;

/**
 <p>The maximum number of jobs that Amazon S3 will include in the <code>List Jobs</code> response. If there are more jobs than this number, the response will include a pagination token in the <code>NextToken</code> field to enable you to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token to request the next page of results. Use the token that Amazon S3 returned in the <code>NextToken</code> element of the <code>ListJobsResult</code> from the previous <code>List Jobs</code> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSS3ControlListJobsResult : AWSModel


/**
 <p>The list of current jobs and jobs that have ended within the last 30 days.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlJobListDescriptor *> * _Nullable jobs;

/**
 <p>If the <code>List Jobs</code> request produced more than the maximum number of results, you can pass this value into a subsequent <code>List Jobs</code> request in order to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Indicates whether this access point policy is public. For more information about how Amazon S3 evaluates policies to determine whether they are public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the <i>Amazon Simple Storage Service Developer Guide</i>. </p>
 */
@interface AWSAWSS3ControlPolicyStatus : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPublic;

@end

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status">The Meaning of "Public"</a> in the Amazon Simple Storage Service Developer Guide.</p>
 */
@interface AWSAWSS3ControlPublicAccessBlockConfiguration : AWSModel


/**
 <p>Specifies whether Amazon S3 should block public access control lists (ACLs) for buckets in this account. Setting this element to <code>TRUE</code> causes the following behavior:</p><ul><li><p>PUT Bucket acl and PUT Object acl calls fail if the specified ACL is public.</p></li><li><p>PUT Object calls fail if the request includes a public ACL.</p></li><li><p>PUT Bucket calls fail if the request includes a public ACL.</p></li></ul><p>Enabling this setting doesn't affect existing policies or ACLs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicAcls;

/**
 <p>Specifies whether Amazon S3 should block public bucket policies for buckets in this account. Setting this element to <code>TRUE</code> causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket policy allows public access. </p><p>Enabling this setting doesn't affect existing bucket policies.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicPolicy;

/**
 <p>Specifies whether Amazon S3 should ignore public ACLs for buckets in this account. Setting this element to <code>TRUE</code> causes Amazon S3 to ignore all public ACLs on buckets in this account and any objects that they contain. </p><p>Enabling this setting doesn't affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignorePublicAcls;

/**
 <p>Specifies whether Amazon S3 should restrict public bucket policies for buckets in this account. Setting this element to <code>TRUE</code> restricts access to buckets with public policies to only AWS services and authorized users within this account.</p><p>Enabling this setting doesn't affect previously stored bucket policies, except that public and cross-account access within any public bucket policy, including non-public delegation to specific accounts, is blocked.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable restrictPublicBuckets;

@end

/**
 
 */
@interface AWSAWSS3ControlPutAccessPointPolicyRequest : AWSRequest


/**
 <p>The AWS account ID for owner of the bucket associated with the specified access point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the access point that you want to associate with the specified policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The policy that you want to apply to the specified access point. For more information about access point policies, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points.html">Managing Data Access with Amazon S3 Access Points</a> in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSAWSS3ControlPutJobTaggingRequest : AWSRequest


/**
 <p>The AWS account ID associated with the Amazon S3 Batch Operations job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID for the Amazon S3 Batch Operations job whose tags you want to replace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The set of tags to associate with the Amazon S3 Batch Operations job.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Tag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAWSS3ControlPutJobTaggingResult : AWSModel


@end

/**
 
 */
@interface AWSAWSS3ControlPutPublicAccessBlockRequest : AWSRequest


/**
 <p>The account ID for the Amazon Web Services account whose <code>PublicAccessBlock</code> configuration you want to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The <code>PublicAccessBlock</code> configuration that you want to apply to the specified Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlPublicAccessBlockConfiguration * _Nullable publicAccessBlockConfiguration;

@end

/**
 <p/>
 Required parameters: [Owner]
 */
@interface AWSAWSS3ControlS3AccessControlList : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Grant *> * _Nullable grants;

/**
 <p/>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3ObjectOwner * _Nullable owner;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3AccessControlPolicy : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3AccessControlList * _Nullable accessControlList;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3CannedAccessControlList cannedAccessControlList;

@end

/**
 <p>Contains the configuration parameters for a PUT Copy object operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Copy object API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html">PUT Object - Copy</a>.</p>
 */
@interface AWSAWSS3ControlS3CopyObjectOperation : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Grant *> * _Nullable accessControlGrants;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3CannedAccessControlList cannedAccessControlList;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3MetadataDirective metadataDirective;

/**
 <p/>
 */
@property (nonatomic, strong) NSDate * _Nullable modifiedSinceConstraint;

/**
 <p/>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3ObjectMetadata * _Nullable latestObjectMetadata;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Tag *> * _Nullable latestObjectTagging;

/**
 <p>The Legal Hold status to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3ObjectLockLegalHoldStatus objectLockLegalHoldStatus;

/**
 <p>The Retention mode to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3ObjectLockMode objectLockMode;

/**
 <p>The date when the applied Object Retention configuration will expire on all objects in the Batch Operations job.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable objectLockRetainUntilDate;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable redirectLocation;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable SSEAwsKmsKeyId;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3StorageClass storageClass;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable targetKeyPrefix;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable targetResource;

/**
 <p/>
 */
@property (nonatomic, strong) NSDate * _Nullable unModifiedSinceConstraint;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3Grant : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3Grantee * _Nullable grantee;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3Permission permission;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3Grantee : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3GranteeTypeIdentifier typeIdentifier;

@end

/**
 <p>Contains the configuration parameters for an Initiate Glacier Restore job. Amazon S3 Batch Operations passes each value through to the underlying POST Object restore API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOSTrestore.html#RESTObjectPOSTrestore-restore-request">Restoring Archives</a>.</p>
 */
@interface AWSAWSS3ControlS3InitiateRestoreObjectOperation : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable expirationInDays;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3GlacierJobTier glacierJobTier;

@end

/**
 <p/>
 Required parameters: [Status]
 */
@interface AWSAWSS3ControlS3ObjectLockLegalHold : AWSModel


/**
 <p>The Legal Hold status to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3ObjectLockLegalHoldStatus status;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3ObjectMetadata : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable cacheControl;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentDisposition;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentEncoding;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentLanguage;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable contentLength;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentMD5;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p/>
 */
@property (nonatomic, strong) NSDate * _Nullable httpExpiresDate;

/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterCharged;

/**
 <p/>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3SSEAlgorithm SSEAlgorithm;

/**
 <p/>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userMetadata;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3ObjectOwner : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p/>
 */
@interface AWSAWSS3ControlS3Retention : AWSModel


/**
 <p>The Retention mode to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlS3ObjectLockRetentionMode mode;

/**
 <p>The date when the applied Object Retention will expire on all objects in the Batch Operations job.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable retainUntilDate;

@end

/**
 <p>Contains the configuration parameters for a Set Object ACL operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object acl API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html">PUT Object acl</a>.</p>
 */
@interface AWSAWSS3ControlS3SetObjectAclOperation : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3AccessControlPolicy * _Nullable accessControlPolicy;

@end

/**
 <p>Contains the configuration parameters for a Set Object Legal Hold operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object Legal Hold API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.htmll#object-lock-legal-holds">PUT Object Legal Hold</a>.</p>
 Required parameters: [LegalHold]
 */
@interface AWSAWSS3ControlS3SetObjectLegalHoldOperation : AWSModel


/**
 <p>The Legal Hold contains the status to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3ObjectLockLegalHold * _Nullable legalHold;

@end

/**
 <p>Contains the configuration parameters for a Set Object Retention operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object Retention API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock-overview.html#object-lock-retention-modes">PUT Object Retention</a>.</p>
 Required parameters: [Retention]
 */
@interface AWSAWSS3ControlS3SetObjectRetentionOperation : AWSModel


/**
 <p>Indicates if the operation should be applied to objects in the Batch Operations job even if they have Governance-type Object Lock in place.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bypassGovernanceRetention;

/**
 <p>Amazon S3 object lock Retention contains the retention mode to be applied to all objects in the Batch Operations job.</p>
 */
@property (nonatomic, strong) AWSAWSS3ControlS3Retention * _Nullable retention;

@end

/**
 <p>Contains the configuration parameters for a Set Object Tagging operation. Amazon S3 Batch Operations passes each value through to the underlying PUT Object tagging API. For more information about the parameters for this operation, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTtagging.html">PUT Object tagging</a>.</p>
 */
@interface AWSAWSS3ControlS3SetObjectTaggingOperation : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSAWSS3ControlS3Tag *> * _Nullable tagSet;

@end

/**
 <p/>
 Required parameters: [Key, Value]
 */
@interface AWSAWSS3ControlS3Tag : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSAWSS3ControlUpdateJobPriorityRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID for the job whose priority you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The priority you want to assign to this job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

@end

/**
 
 */
@interface AWSAWSS3ControlUpdateJobPriorityResult : AWSModel


/**
 <p>The ID for the job whose priority Amazon S3 updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The new priority assigned to the specified job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

@end

/**
 
 */
@interface AWSAWSS3ControlUpdateJobStatusRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID of the job whose status you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status that you want to move the specified job to.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlRequestedJobStatus requestedJobStatus;

/**
 <p>A description of the reason why you want to change the specified job's status. This field can be any string up to the maximum length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusUpdateReason;

@end

/**
 
 */
@interface AWSAWSS3ControlUpdateJobStatusResult : AWSModel


/**
 <p>The ID for the job whose status was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The current status for the specified job.</p>
 */
@property (nonatomic, assign) AWSAWSS3ControlJobStatus status;

/**
 <p>The reason that the specified job's status was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusUpdateReason;

@end

/**
 <p>The virtual private cloud (VPC) configuration for an access point.</p>
 Required parameters: [VpcId]
 */
@interface AWSAWSS3ControlVpcConfiguration : AWSModel


/**
 <p>If this field is specified, this access point will only allow connections from the specified VPC ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

NS_ASSUME_NONNULL_END
