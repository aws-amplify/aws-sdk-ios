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

FOUNDATION_EXPORT NSString *const AWSDataexchangeErrorDomain;

typedef NS_ENUM(NSInteger, AWSDataexchangeErrorType) {
    AWSDataexchangeErrorUnknown,
    AWSDataexchangeErrorAccessDenied,
    AWSDataexchangeErrorConflict,
    AWSDataexchangeErrorInternalServer,
    AWSDataexchangeErrorResourceNotFound,
    AWSDataexchangeErrorServiceLimitExceeded,
    AWSDataexchangeErrorThrottling,
    AWSDataexchangeErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeAssetType) {
    AWSDataexchangeAssetTypeUnknown,
    AWSDataexchangeAssetTypeS3Snapshot,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeCode) {
    AWSDataexchangeCodeUnknown,
    AWSDataexchangeCodeAccessDeniedException,
    AWSDataexchangeCodeInternalServerException,
    AWSDataexchangeCodeMalwareDetected,
    AWSDataexchangeCodeResourceNotFoundException,
    AWSDataexchangeCodeServiceQuotaExceededException,
    AWSDataexchangeCodeValidationException,
    AWSDataexchangeCodeMalwareScanEncryptedFile,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeJobErrorLimitName) {
    AWSDataexchangeJobErrorLimitNameUnknown,
    AWSDataexchangeJobErrorLimitNameAssetsPerRevision,
    AWSDataexchangeJobErrorLimitNameAssetSizeInGB,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeJobErrorResourceTypes) {
    AWSDataexchangeJobErrorResourceTypesUnknown,
    AWSDataexchangeJobErrorResourceTypesRevision,
    AWSDataexchangeJobErrorResourceTypesAsset,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeLimitName) {
    AWSDataexchangeLimitNameUnknown,
    AWSDataexchangeLimitNameProductsPerAccount,
    AWSDataexchangeLimitNameDataSetsPerAccount,
    AWSDataexchangeLimitNameDataSetsPerProduct,
    AWSDataexchangeLimitNameRevisionsPerDataSet,
    AWSDataexchangeLimitNameAssetsPerRevision,
    AWSDataexchangeLimitNameAssetsPerImportJobFromAmazonS3,
    AWSDataexchangeLimitNameAssetPerExportJobFromAmazonS3,
    AWSDataexchangeLimitNameAssetSizeInGB,
    AWSDataexchangeLimitNameConcurrentInProgressJobsToImportAssetsFromAmazonS3,
    AWSDataexchangeLimitNameConcurrentInProgressJobsToImportAssetsFromASignedURL,
    AWSDataexchangeLimitNameConcurrentInProgressJobsToExportAssetsToAmazonS3,
    AWSDataexchangeLimitNameConcurrentInProgressJobsToExportAssetsToASignedURL,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeOrigin) {
    AWSDataexchangeOriginUnknown,
    AWSDataexchangeOriginOwned,
    AWSDataexchangeOriginEntitled,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeResourceType) {
    AWSDataexchangeResourceTypeUnknown,
    AWSDataexchangeResourceTypeDataSet,
    AWSDataexchangeResourceTypeRevision,
    AWSDataexchangeResourceTypeAsset,
    AWSDataexchangeResourceTypeJob,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeServerSideEncryptionTypes) {
    AWSDataexchangeServerSideEncryptionTypesUnknown,
    AWSDataexchangeServerSideEncryptionTypesAwsKms,
    AWSDataexchangeServerSideEncryptionTypesAES256,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeState) {
    AWSDataexchangeStateUnknown,
    AWSDataexchangeStateWaiting,
    AWSDataexchangeStateInProgress,
    AWSDataexchangeStateError,
    AWSDataexchangeStateCompleted,
    AWSDataexchangeStateCancelled,
    AWSDataexchangeStateTimedOut,
};

typedef NS_ENUM(NSInteger, AWSDataexchangeTypes) {
    AWSDataexchangeTypesUnknown,
    AWSDataexchangeTypesImportAssetsFromS3,
    AWSDataexchangeTypesImportAssetFromSignedUrl,
    AWSDataexchangeTypesExportAssetsToS3,
    AWSDataexchangeTypesExportAssetToSignedUrl,
};

@class AWSDataexchangeAssetDestinationEntry;
@class AWSDataexchangeAssetDetails;
@class AWSDataexchangeAssetEntry;
@class AWSDataexchangeAssetSourceEntry;
@class AWSDataexchangeCancelJobRequest;
@class AWSDataexchangeCreateDataSetRequest;
@class AWSDataexchangeCreateDataSetResponse;
@class AWSDataexchangeCreateJobRequest;
@class AWSDataexchangeCreateJobResponse;
@class AWSDataexchangeCreateRevisionRequest;
@class AWSDataexchangeCreateRevisionResponse;
@class AWSDataexchangeDataSetEntry;
@class AWSDataexchangeDeleteAssetRequest;
@class AWSDataexchangeDeleteDataSetRequest;
@class AWSDataexchangeDeleteRevisionRequest;
@class AWSDataexchangeDetails;
@class AWSDataexchangeExportAssetToSignedUrlRequestDetails;
@class AWSDataexchangeExportAssetToSignedUrlResponseDetails;
@class AWSDataexchangeExportAssetsToS3RequestDetails;
@class AWSDataexchangeExportAssetsToS3ResponseDetails;
@class AWSDataexchangeExportServerSideEncryption;
@class AWSDataexchangeGetAssetRequest;
@class AWSDataexchangeGetAssetResponse;
@class AWSDataexchangeGetDataSetRequest;
@class AWSDataexchangeGetDataSetResponse;
@class AWSDataexchangeGetJobRequest;
@class AWSDataexchangeGetJobResponse;
@class AWSDataexchangeGetRevisionRequest;
@class AWSDataexchangeGetRevisionResponse;
@class AWSDataexchangeImportAssetFromSignedUrlJobErrorDetails;
@class AWSDataexchangeImportAssetFromSignedUrlRequestDetails;
@class AWSDataexchangeImportAssetFromSignedUrlResponseDetails;
@class AWSDataexchangeImportAssetsFromS3RequestDetails;
@class AWSDataexchangeImportAssetsFromS3ResponseDetails;
@class AWSDataexchangeJobEntry;
@class AWSDataexchangeJobError;
@class AWSDataexchangeListDataSetRevisionsRequest;
@class AWSDataexchangeListDataSetRevisionsResponse;
@class AWSDataexchangeListDataSetsRequest;
@class AWSDataexchangeListDataSetsResponse;
@class AWSDataexchangeListJobsRequest;
@class AWSDataexchangeListJobsResponse;
@class AWSDataexchangeListRevisionAssetsRequest;
@class AWSDataexchangeListRevisionAssetsResponse;
@class AWSDataexchangeListTagsForResourceRequest;
@class AWSDataexchangeListTagsForResourceResponse;
@class AWSDataexchangeOriginDetails;
@class AWSDataexchangeRequestDetails;
@class AWSDataexchangeResponseDetails;
@class AWSDataexchangeRevisionEntry;
@class AWSDataexchangeS3SnapshotAsset;
@class AWSDataexchangeStartJobRequest;
@class AWSDataexchangeStartJobResponse;
@class AWSDataexchangeTagResourceRequest;
@class AWSDataexchangeUntagResourceRequest;
@class AWSDataexchangeUpdateAssetRequest;
@class AWSDataexchangeUpdateAssetResponse;
@class AWSDataexchangeUpdateDataSetRequest;
@class AWSDataexchangeUpdateDataSetResponse;
@class AWSDataexchangeUpdateRevisionRequest;
@class AWSDataexchangeUpdateRevisionResponse;

/**
 <p>The destination for the asset.</p>
 Required parameters: [Bucket, AssetId]
 */
@interface AWSDataexchangeAssetDestinationEntry : AWSModel


/**
 <p>The unique identifier for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The S3 bucket that is the destination for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of the object in Amazon S3 for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 
 */
@interface AWSDataexchangeAssetDetails : AWSModel


/**
 <p>The S3 object that is the asset.</p>
 */
@property (nonatomic, strong) AWSDataexchangeS3SnapshotAsset * _Nullable s3SnapshotAsset;

@end

/**
 <p>An asset in AWS Data Exchange is a piece of data that can be stored as an S3 object. The asset can be a structured data file, an image file, or some other data file. When you create an import job for your files, you create an asset in AWS Data Exchange for each of those files.</p>
 Required parameters: [AssetType, CreatedAt, DataSetId, Id, Arn, AssetDetails, UpdatedAt, RevisionId, Name]
 */
@interface AWSDataexchangeAssetEntry : AWSModel


/**
 <p>The ARN for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the asset, including its size.</p>
 */
@property (nonatomic, strong) AWSDataexchangeAssetDetails * _Nullable assetDetails;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the asset was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the asset. When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier for the revision associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is returned when an asset owner is viewing the entitled copy of its owned asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the asset was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The source of the assets.</p>
 Required parameters: [Bucket, Key]
 */
@interface AWSDataexchangeAssetSourceEntry : AWSModel


/**
 <p>The S3 bucket that's part of the source of the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The name of the object in Amazon S3 for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

@end

/**
 
 */
@interface AWSDataexchangeCancelJobRequest : AWSRequest


/**
 <p>The unique identifier for a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>The request body for CreateDataSet.</p>
 Required parameters: [AssetType, Description, Name]
 */
@interface AWSDataexchangeCreateDataSetRequest : AWSRequest


/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>A description for the data set. This value can be up to 16,348 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A data set tag is an optional label that you can assign to a data set when you create it. Each tag consists of a key and an optional value, both of which you define. When you use tagging, you can also use tag-based access control in IAM policies to control access to these data sets and revisions.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDataexchangeCreateDataSetResponse : AWSModel


/**
 <p>The ARN for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the data set was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers).</p>
 */
@property (nonatomic, assign) AWSDataexchangeOrigin origin;

/**
 <p>If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.</p>
 */
@property (nonatomic, strong) AWSDataexchangeOriginDetails * _Nullable originDetails;

/**
 <p>The data set ID of the owned data set corresponding to the entitled data set being viewed. This parameter is returned when a data set owner is viewing the entitled copy of its owned data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The tags for the data set.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The date and time that the data set was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The request body for CreateJob.</p>
 Required parameters: [Type, Details]
 */
@interface AWSDataexchangeCreateJobRequest : AWSRequest


/**
 <p>The details for the CreateJob request.</p>
 */
@property (nonatomic, strong) AWSDataexchangeRequestDetails * _Nullable details;

/**
 <p>The type of job to be created.</p>
 */
@property (nonatomic, assign) AWSDataexchangeTypes types;

@end

/**
 
 */
@interface AWSDataexchangeCreateJobResponse : AWSModel


/**
 <p>The ARN for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time that the job was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Details about the job.</p>
 */
@property (nonatomic, strong) AWSDataexchangeResponseDetails * _Nullable details;

/**
 <p>The errors associated with jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeJobError *> * _Nullable errors;

/**
 <p>The unique identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The state of the job.</p>
 */
@property (nonatomic, assign) AWSDataexchangeState state;

/**
 <p>The job type.</p>
 */
@property (nonatomic, assign) AWSDataexchangeTypes types;

/**
 <p>The date and time that the job was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The request body for CreateRevision.</p>
 Required parameters: [DataSetId]
 */
@interface AWSDataexchangeCreateRevisionRequest : AWSRequest


/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>A revision tag is an optional label that you can assign to a revision when you create it. Each tag consists of a key and an optional value, both of which you define. When you use tagging, you can also use tag-based access control in IAM policies to control access to these data sets and revisions.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDataexchangeCreateRevisionResponse : AWSModel


/**
 <p>The ARN for the revision</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The date and time that the revision was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products.</p><p>Finalized revisions can be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely identified by their ARN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalized;

/**
 <p>The unique identifier for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The revision ID of the owned revision corresponding to the entitled revision being viewed. This parameter is returned when a revision owner is viewing the entitled copy of its owned revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The tags for the revision.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The date and time that the revision was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>A data set is an AWS resource with one or more revisions.</p>
 Required parameters: [Origin, AssetType, Description, CreatedAt, Id, Arn, UpdatedAt, Name]
 */
@interface AWSDataexchangeDataSetEntry : AWSModel


/**
 <p>The ARN for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the data set was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers).</p>
 */
@property (nonatomic, assign) AWSDataexchangeOrigin origin;

/**
 <p>If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.</p>
 */
@property (nonatomic, strong) AWSDataexchangeOriginDetails * _Nullable originDetails;

/**
 <p>The data set ID of the owned data set corresponding to the entitled data set being viewed. This parameter is returned when a data set owner is viewing the entitled copy of its owned data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the data set was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSDataexchangeDeleteAssetRequest : AWSRequest


/**
 <p>The unique identifier for an asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeDeleteDataSetRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

@end

/**
 
 */
@interface AWSDataexchangeDeleteRevisionRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeDetails : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSDataexchangeImportAssetFromSignedUrlJobErrorDetails * _Nullable importAssetFromSignedUrlJobErrorDetails;

/**
 <p>The list of sources for the assets.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetSourceEntry *> * _Nullable importAssetsFromS3JobErrorDetails;

@end

/**
 <p>Details of the operation to be performed by the job.</p>
 Required parameters: [DataSetId, AssetId, RevisionId]
 */
@interface AWSDataexchangeExportAssetToSignedUrlRequestDetails : AWSModel


/**
 <p>The unique identifier for the asset that is exported to a signed URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The unique identifier for the data set associated with this export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the revision associated with this export request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>The details of the export to signed URL response.</p>
 Required parameters: [DataSetId, AssetId, RevisionId]
 */
@interface AWSDataexchangeExportAssetToSignedUrlResponseDetails : AWSModel


/**
 <p>The unique identifier for the asset associated with this export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The unique identifier for the data set associated with this export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the revision associated with this export response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The signed URL for the export request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signedUrl;

/**
 <p>The date and time that the signed URL expires, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable signedUrlExpiresAt;

@end

/**
 <p>Details of the operation to be performed by the job.</p>
 Required parameters: [AssetDestinations, DataSetId, RevisionId]
 */
@interface AWSDataexchangeExportAssetsToS3RequestDetails : AWSModel


/**
 <p>The destination for the asset.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetDestinationEntry *> * _Nullable assetDestinations;

/**
 <p>The unique identifier for the data set associated with this export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Encryption configuration for the export job.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportServerSideEncryption * _Nullable encryption;

/**
 <p>The unique identifier for the revision associated with this export request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>Details about the export to Amazon S3 response.</p>
 Required parameters: [AssetDestinations, DataSetId, RevisionId]
 */
@interface AWSDataexchangeExportAssetsToS3ResponseDetails : AWSModel


/**
 <p>The destination in Amazon S3 where the asset is exported.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetDestinationEntry *> * _Nullable assetDestinations;

/**
 <p>The unique identifier for the data set associated with this export job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Encryption configuration of the export job.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportServerSideEncryption * _Nullable encryption;

/**
 <p>The unique identifier for the revision associated with this export response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>Encryption configuration of the export job. Includes the encryption type as well as the AWS KMS key. The KMS key is only necessary if you chose the KMS encryption type.</p>
 Required parameters: [Type]
 */
@interface AWSDataexchangeExportServerSideEncryption : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the the AWS KMS key you want to use to encrypt the Amazon S3 objects. This parameter is required if you choose aws:kms as an encryption type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The type of server side encryption used for encrypting the objects in Amazon S3.</p>
 */
@property (nonatomic, assign) AWSDataexchangeServerSideEncryptionTypes types;

@end

/**
 
 */
@interface AWSDataexchangeGetAssetRequest : AWSRequest


/**
 <p>The unique identifier for an asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeGetAssetResponse : AWSModel


/**
 <p>The ARN for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the asset, including its size.</p>
 */
@property (nonatomic, strong) AWSDataexchangeAssetDetails * _Nullable assetDetails;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the asset was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the asset When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier for the revision associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is returned when an asset owner is viewing the entitled copy of its owned asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the asset was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSDataexchangeGetDataSetRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

@end

/**
 
 */
@interface AWSDataexchangeGetDataSetResponse : AWSModel


/**
 <p>The ARN for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the data set was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers).</p>
 */
@property (nonatomic, assign) AWSDataexchangeOrigin origin;

/**
 <p>If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.</p>
 */
@property (nonatomic, strong) AWSDataexchangeOriginDetails * _Nullable originDetails;

/**
 <p>The data set ID of the owned data set corresponding to the entitled data set being viewed. This parameter is returned when a data set owner is viewing the entitled copy of its owned data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The tags for the data set.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The date and time that the data set was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSDataexchangeGetJobRequest : AWSRequest


/**
 <p>The unique identifier for a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSDataexchangeGetJobResponse : AWSModel


/**
 <p>The ARN for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time that the job was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Details about the job.</p>
 */
@property (nonatomic, strong) AWSDataexchangeResponseDetails * _Nullable details;

/**
 <p>The errors associated with jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeJobError *> * _Nullable errors;

/**
 <p>The unique identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The state of the job.</p>
 */
@property (nonatomic, assign) AWSDataexchangeState state;

/**
 <p>The job type.</p>
 */
@property (nonatomic, assign) AWSDataexchangeTypes types;

/**
 <p>The date and time that the job was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSDataexchangeGetRevisionRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeGetRevisionResponse : AWSModel


/**
 <p>The ARN for the revision</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The date and time that the revision was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products.</p><p>Finalized revisions can be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely identified by their ARN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalized;

/**
 <p>The unique identifier for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The revision ID of the owned revision corresponding to the entitled revision being viewed. This parameter is returned when a revision owner is viewing the entitled copy of its owned revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The tags for the revision.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The date and time that the revision was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSDataexchangeImportAssetFromSignedUrlJobErrorDetails : AWSModel


/**
 <p>The name of the asset. When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

@end

/**
 <p>Details of the operation to be performed by the job.</p>
 Required parameters: [DataSetId, Md5Hash, RevisionId, AssetName]
 */
@interface AWSDataexchangeImportAssetFromSignedUrlRequestDetails : AWSModel


/**
 <p>The name of the asset. When importing from Amazon S3, the S3 object key is used as the asset name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>The unique identifier for the data set associated with this import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The Base64-encoded Md5 hash for the asset, used to ensure the integrity of the file at that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable md5Hash;

/**
 <p>The unique identifier for the revision associated with this import request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>The details in the response for an import request, including the signed URL and other information.</p>
 Required parameters: [DataSetId, AssetName, RevisionId]
 */
@interface AWSDataexchangeImportAssetFromSignedUrlResponseDetails : AWSModel


/**
 <p>The name for the asset associated with this import response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetName;

/**
 <p>The unique identifier for the data set associated with this import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The Base64-encoded Md5 hash for the asset, used to ensure the integrity of the file at that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable md5Hash;

/**
 <p>The unique identifier for the revision associated with this import response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The signed URL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signedUrl;

/**
 <p>The time and date at which the signed URL expires, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable signedUrlExpiresAt;

@end

/**
 <p>Details of the operation to be performed by the job.</p>
 Required parameters: [DataSetId, AssetSources, RevisionId]
 */
@interface AWSDataexchangeImportAssetsFromS3RequestDetails : AWSModel


/**
 <p>Is a list of S3 bucket and object key pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetSourceEntry *> * _Nullable assetSources;

/**
 <p>The unique identifier for the data set associated with this import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the revision associated with this import request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 <p>Details from an import from Amazon S3 response.</p>
 Required parameters: [DataSetId, AssetSources, RevisionId]
 */
@interface AWSDataexchangeImportAssetsFromS3ResponseDetails : AWSModel


/**
 <p>Is a list of Amazon S3 bucket and object key pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetSourceEntry *> * _Nullable assetSources;

/**
 <p>The unique identifier for the data set associated with this import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the revision associated with this import response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 AWS Data Exchange Jobs are asynchronous import or export operations used to create or copy assets. A data set owner can both import and export as they see fit. Someone with an entitlement to a data set can only export. Jobs are deleted 90 days after they are created.
 Required parameters: [Type, Details, State, CreatedAt, Id, Arn, UpdatedAt]
 */
@interface AWSDataexchangeJobEntry : AWSModel


/**
 <p>The ARN for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time that the job was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Details of the operation to be performed by the job, such as export destination details or import source details.</p>
 */
@property (nonatomic, strong) AWSDataexchangeResponseDetails * _Nullable details;

/**
 <p>Errors for jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeJobError *> * _Nullable errors;

/**
 <p>The unique identifier for the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The state of the job.</p>
 */
@property (nonatomic, assign) AWSDataexchangeState state;

/**
 <p>The job type.</p>
 */
@property (nonatomic, assign) AWSDataexchangeTypes types;

/**
 <p>The date and time that the job was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 An error that occurred with the job request.
 Required parameters: [Message, Code]
 */
@interface AWSDataexchangeJobError : AWSModel


/**
 The code for the job error.
 */
@property (nonatomic, assign) AWSDataexchangeCode code;

/**
 
 */
@property (nonatomic, strong) AWSDataexchangeDetails * _Nullable details;

/**
 <p>The name of the limit that was reached.</p>
 */
@property (nonatomic, assign) AWSDataexchangeJobErrorLimitName limitName;

/**
 The value of the exceeded limit.
 */
@property (nonatomic, strong) NSNumber * _Nullable limitValue;

/**
 The message related to the job error.
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 The unique identifier for the resource related to the error.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 The type of resource related to the error.
 */
@property (nonatomic, assign) AWSDataexchangeJobErrorResourceTypes resourceType;

@end

/**
 
 */
@interface AWSDataexchangeListDataSetRevisionsRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The maximum number of results returned by a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDataexchangeListDataSetRevisionsResponse : AWSModel


/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The asset objects listed by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeRevisionEntry *> * _Nullable revisions;

@end

/**
 
 */
@interface AWSDataexchangeListDataSetsRequest : AWSRequest


/**
 <p>The maximum number of results returned by a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers).</p>
 */
@property (nonatomic, strong) NSString * _Nullable origin;

@end

/**
 
 */
@interface AWSDataexchangeListDataSetsResponse : AWSModel


/**
 <p>The data set objects listed by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeDataSetEntry *> * _Nullable dataSets;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDataexchangeListJobsRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The maximum number of results returned by a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeListJobsResponse : AWSModel


/**
 <p>The jobs listed by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeJobEntry *> * _Nullable jobs;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDataexchangeListRevisionAssetsRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The maximum number of results returned by a single call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeListRevisionAssetsResponse : AWSModel


/**
 <p>The asset objects listed by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSDataexchangeAssetEntry *> * _Nullable assets;

/**
 <p>The token value retrieved from a previous call to access the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDataexchangeListTagsForResourceRequest : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSDataexchangeListTagsForResourceResponse : AWSModel


/**
 A label that consists of a customer-defined key and an optional value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDataexchangeOriginDetails : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 <p>The details for the request.</p>
 */
@interface AWSDataexchangeRequestDetails : AWSModel


/**
 <p>Details about the export to signed URL request.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportAssetToSignedUrlRequestDetails * _Nullable exportAssetToSignedUrl;

/**
 <p>Details about the export to Amazon S3 request.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportAssetsToS3RequestDetails * _Nullable exportAssetsToS3;

/**
 <p>Details about the import from signed URL request.</p>
 */
@property (nonatomic, strong) AWSDataexchangeImportAssetFromSignedUrlRequestDetails * _Nullable importAssetFromSignedUrl;

/**
 <p>Details about the import from Amazon S3 request.</p>
 */
@property (nonatomic, strong) AWSDataexchangeImportAssetsFromS3RequestDetails * _Nullable importAssetsFromS3;

@end

/**
 <p>Details for the response.</p>
 */
@interface AWSDataexchangeResponseDetails : AWSModel


/**
 <p>Details for the export to signed URL response.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportAssetToSignedUrlResponseDetails * _Nullable exportAssetToSignedUrl;

/**
 <p>Details for the export to Amazon S3 response.</p>
 */
@property (nonatomic, strong) AWSDataexchangeExportAssetsToS3ResponseDetails * _Nullable exportAssetsToS3;

/**
 <p>Details for the import from signed URL response.</p>
 */
@property (nonatomic, strong) AWSDataexchangeImportAssetFromSignedUrlResponseDetails * _Nullable importAssetFromSignedUrl;

/**
 <p>Details for the import from Amazon S3 response.</p>
 */
@property (nonatomic, strong) AWSDataexchangeImportAssetsFromS3ResponseDetails * _Nullable importAssetsFromS3;

@end

/**
 <p>A revision is a container for one or more assets.</p>
 Required parameters: [CreatedAt, DataSetId, Id, Arn, UpdatedAt]
 */
@interface AWSDataexchangeRevisionEntry : AWSModel


/**
 <p>The ARN for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The date and time that the revision was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products.</p><p>Finalized revisions can be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely identified by their ARN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalized;

/**
 <p>The unique identifier for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The revision ID of the owned revision corresponding to the entitled revision being viewed. This parameter is returned when a revision owner is viewing the entitled copy of its owned revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the revision was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The S3 object that is the asset.</p>
 Required parameters: [Size]
 */
@interface AWSDataexchangeS3SnapshotAsset : AWSModel


/**
 <p>The size of the S3 object that is the object.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 
 */
@interface AWSDataexchangeStartJobRequest : AWSRequest


/**
 <p>The unique identifier for a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSDataexchangeStartJobResponse : AWSModel


@end

/**
 <p>The request body for TagResource.</p>
 Required parameters: [ResourceArn, Tags]
 */
@interface AWSDataexchangeTagResourceRequest : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 A label that consists of a customer-defined key and an optional value.
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDataexchangeUntagResourceRequest : AWSRequest


/**
 <p>An Amazon Resource Name (ARN) that uniquely identifies an AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 The key tags.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>The request body for UpdateAsset.</p>
 Required parameters: [RevisionId, AssetId, DataSetId, Name]
 */
@interface AWSDataexchangeUpdateAssetRequest : AWSRequest


/**
 <p>The unique identifier for an asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assetId;

/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The name of the asset. When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeUpdateAssetResponse : AWSModel


/**
 <p>The ARN for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Information about the asset, including its size.</p>
 */
@property (nonatomic, strong) AWSDataexchangeAssetDetails * _Nullable assetDetails;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the asset was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The unique identifier for the asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the asset When importing from Amazon S3, the S3 object key is used as the asset name. When exporting to Amazon S3, the asset name is used as default target S3 object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier for the revision associated with this asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

/**
 <p>The asset ID of the owned asset corresponding to the entitled asset being viewed. This parameter is returned when an asset owner is viewing the entitled copy of its owned asset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the asset was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The request body for UpdateDataSet.</p>
 Required parameters: [DataSetId]
 */
@interface AWSDataexchangeUpdateDataSetRequest : AWSRequest


/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>The description for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSDataexchangeUpdateDataSetResponse : AWSModel


/**
 <p>The ARN for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The type of file your data is stored in. Currently, the supported asset type is S3_SNAPSHOT.</p>
 */
@property (nonatomic, assign) AWSDataexchangeAssetType assetType;

/**
 <p>The date and time that the data set was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A property that defines the data set as OWNED by the account (for providers) or ENTITLED to the account (for subscribers).</p>
 */
@property (nonatomic, assign) AWSDataexchangeOrigin origin;

/**
 <p>If the origin of this data set is ENTITLED, includes the details for the product on AWS Marketplace.</p>
 */
@property (nonatomic, strong) AWSDataexchangeOriginDetails * _Nullable originDetails;

/**
 <p>The data set ID of the owned data set corresponding to the entitled data set being viewed. This parameter is returned when a data set owner is viewing the entitled copy of its owned data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the data set was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

/**
 <p>The request body for UpdateRevision.</p>
 Required parameters: [RevisionId, DataSetId]
 */
@interface AWSDataexchangeUpdateRevisionRequest : AWSRequest


/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The unique identifier for a data set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>Finalizing a revision tells AWS Data Exchange that your changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalized;

/**
 <p>The unique identifier for a revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable revisionId;

@end

/**
 
 */
@interface AWSDataexchangeUpdateRevisionResponse : AWSModel


/**
 <p>The ARN for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>An optional comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The date and time that the revision was created, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The unique identifier for the data set associated with this revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSetId;

/**
 <p>To publish a revision to a data set in a product, the revision must first be finalized. Finalizing a revision tells AWS Data Exchange that changes to the assets in the revision are complete. After it's in this read-only state, you can publish the revision to your products.</p><p>Finalized revisions can be published through the AWS Data Exchange console or the AWS Marketplace Catalog API, using the StartChangeSet AWS Marketplace Catalog API action. When using the API, revisions are uniquely identified by their ARN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable finalized;

/**
 <p>The unique identifier for the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The revision ID of the owned revision corresponding to the entitled revision being viewed. This parameter is returned when a revision owner is viewing the entitled copy of its owned revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceId;

/**
 <p>The date and time that the revision was last updated, in ISO 8601 format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedAt;

@end

NS_ASSUME_NONNULL_END
