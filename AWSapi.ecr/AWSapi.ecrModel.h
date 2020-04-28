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

FOUNDATION_EXPORT NSString *const AWSapi.ecrErrorDomain;

typedef NS_ENUM(NSInteger, AWSapi.ecrErrorType) {
    AWSapi.ecrErrorUnknown,
    AWSapi.ecrErrorEmptyUpload,
    AWSapi.ecrErrorImageAlreadyExists,
    AWSapi.ecrErrorImageNotFound,
    AWSapi.ecrErrorImageTagAlreadyExists,
    AWSapi.ecrErrorInvalidLayer,
    AWSapi.ecrErrorInvalidLayerPart,
    AWSapi.ecrErrorInvalidParameter,
    AWSapi.ecrErrorInvalidTagParameter,
    AWSapi.ecrErrorLayerAlreadyExists,
    AWSapi.ecrErrorLayerInaccessible,
    AWSapi.ecrErrorLayerPartTooSmall,
    AWSapi.ecrErrorLayersNotFound,
    AWSapi.ecrErrorLifecyclePolicyNotFound,
    AWSapi.ecrErrorLifecyclePolicyPreviewInProgress,
    AWSapi.ecrErrorLifecyclePolicyPreviewNotFound,
    AWSapi.ecrErrorLimitExceeded,
    AWSapi.ecrErrorReferencedImagesNotFound,
    AWSapi.ecrErrorRepositoryAlreadyExists,
    AWSapi.ecrErrorRepositoryNotEmpty,
    AWSapi.ecrErrorRepositoryNotFound,
    AWSapi.ecrErrorRepositoryPolicyNotFound,
    AWSapi.ecrErrorScanNotFound,
    AWSapi.ecrErrorServer,
    AWSapi.ecrErrorTooManyTags,
    AWSapi.ecrErrorUnsupportedImageType,
    AWSapi.ecrErrorUploadNotFound,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrFindingSeverity) {
    AWSapi.ecrFindingSeverityUnknown,
    AWSapi.ecrFindingSeverityInformational,
    AWSapi.ecrFindingSeverityLow,
    AWSapi.ecrFindingSeverityMedium,
    AWSapi.ecrFindingSeverityHigh,
    AWSapi.ecrFindingSeverityCritical,
    AWSapi.ecrFindingSeverityUndefined,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrImageActionType) {
    AWSapi.ecrImageActionTypeUnknown,
    AWSapi.ecrImageActionTypeExpire,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrImageFailureCode) {
    AWSapi.ecrImageFailureCodeUnknown,
    AWSapi.ecrImageFailureCodeInvalidImageDigest,
    AWSapi.ecrImageFailureCodeInvalidImageTag,
    AWSapi.ecrImageFailureCodeImageTagDoesNotMatchDigest,
    AWSapi.ecrImageFailureCodeImageNotFound,
    AWSapi.ecrImageFailureCodeMissingDigestAndTag,
    AWSapi.ecrImageFailureCodeImageReferencedByManifestList,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrImageTagMutability) {
    AWSapi.ecrImageTagMutabilityUnknown,
    AWSapi.ecrImageTagMutabilityMutable,
    AWSapi.ecrImageTagMutabilityImmutable,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrLayerAvailability) {
    AWSapi.ecrLayerAvailabilityUnknown,
    AWSapi.ecrLayerAvailabilityAvailable,
    AWSapi.ecrLayerAvailabilityUnavailable,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrLayerFailureCode) {
    AWSapi.ecrLayerFailureCodeUnknown,
    AWSapi.ecrLayerFailureCodeInvalidLayerDigest,
    AWSapi.ecrLayerFailureCodeMissingLayerDigest,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrLifecyclePolicyPreviewStatus) {
    AWSapi.ecrLifecyclePolicyPreviewStatusUnknown,
    AWSapi.ecrLifecyclePolicyPreviewStatusInProgress,
    AWSapi.ecrLifecyclePolicyPreviewStatusComplete,
    AWSapi.ecrLifecyclePolicyPreviewStatusExpired,
    AWSapi.ecrLifecyclePolicyPreviewStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrScanStatus) {
    AWSapi.ecrScanStatusUnknown,
    AWSapi.ecrScanStatusInProgress,
    AWSapi.ecrScanStatusComplete,
    AWSapi.ecrScanStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSapi.ecrTagStatus) {
    AWSapi.ecrTagStatusUnknown,
    AWSapi.ecrTagStatusTagged,
    AWSapi.ecrTagStatusUntagged,
    AWSapi.ecrTagStatusAny,
};

@class AWSapi.ecrAttribute;
@class AWSapi.ecrAuthorizationData;
@class AWSapi.ecrBatchCheckLayerAvailabilityRequest;
@class AWSapi.ecrBatchCheckLayerAvailabilityResponse;
@class AWSapi.ecrBatchDeleteImageRequest;
@class AWSapi.ecrBatchDeleteImageResponse;
@class AWSapi.ecrBatchGetImageRequest;
@class AWSapi.ecrBatchGetImageResponse;
@class AWSapi.ecrCompleteLayerUploadRequest;
@class AWSapi.ecrCompleteLayerUploadResponse;
@class AWSapi.ecrCreateRepositoryRequest;
@class AWSapi.ecrCreateRepositoryResponse;
@class AWSapi.ecrDeleteLifecyclePolicyRequest;
@class AWSapi.ecrDeleteLifecyclePolicyResponse;
@class AWSapi.ecrDeleteRepositoryPolicyRequest;
@class AWSapi.ecrDeleteRepositoryPolicyResponse;
@class AWSapi.ecrDeleteRepositoryRequest;
@class AWSapi.ecrDeleteRepositoryResponse;
@class AWSapi.ecrDescribeImageScanFindingsRequest;
@class AWSapi.ecrDescribeImageScanFindingsResponse;
@class AWSapi.ecrDescribeImagesFilter;
@class AWSapi.ecrDescribeImagesRequest;
@class AWSapi.ecrDescribeImagesResponse;
@class AWSapi.ecrDescribeRepositoriesRequest;
@class AWSapi.ecrDescribeRepositoriesResponse;
@class AWSapi.ecrGetAuthorizationTokenRequest;
@class AWSapi.ecrGetAuthorizationTokenResponse;
@class AWSapi.ecrGetDownloadUrlForLayerRequest;
@class AWSapi.ecrGetDownloadUrlForLayerResponse;
@class AWSapi.ecrGetLifecyclePolicyPreviewRequest;
@class AWSapi.ecrGetLifecyclePolicyPreviewResponse;
@class AWSapi.ecrGetLifecyclePolicyRequest;
@class AWSapi.ecrGetLifecyclePolicyResponse;
@class AWSapi.ecrGetRepositoryPolicyRequest;
@class AWSapi.ecrGetRepositoryPolicyResponse;
@class AWSapi.ecrImage;
@class AWSapi.ecrImageDetail;
@class AWSapi.ecrImageFailure;
@class AWSapi.ecrImageIdentifier;
@class AWSapi.ecrImageScanFinding;
@class AWSapi.ecrImageScanFindings;
@class AWSapi.ecrImageScanFindingsSummary;
@class AWSapi.ecrImageScanStatus;
@class AWSapi.ecrImageScanningConfiguration;
@class AWSapi.ecrInitiateLayerUploadRequest;
@class AWSapi.ecrInitiateLayerUploadResponse;
@class AWSapi.ecrLayer;
@class AWSapi.ecrLayerFailure;
@class AWSapi.ecrLifecyclePolicyPreviewFilter;
@class AWSapi.ecrLifecyclePolicyPreviewResult;
@class AWSapi.ecrLifecyclePolicyPreviewSummary;
@class AWSapi.ecrLifecyclePolicyRuleAction;
@class AWSapi.ecrListImagesFilter;
@class AWSapi.ecrListImagesRequest;
@class AWSapi.ecrListImagesResponse;
@class AWSapi.ecrListTagsForResourceRequest;
@class AWSapi.ecrListTagsForResourceResponse;
@class AWSapi.ecrPutImageRequest;
@class AWSapi.ecrPutImageResponse;
@class AWSapi.ecrPutImageScanningConfigurationRequest;
@class AWSapi.ecrPutImageScanningConfigurationResponse;
@class AWSapi.ecrPutImageTagMutabilityRequest;
@class AWSapi.ecrPutImageTagMutabilityResponse;
@class AWSapi.ecrPutLifecyclePolicyRequest;
@class AWSapi.ecrPutLifecyclePolicyResponse;
@class AWSapi.ecrRepository;
@class AWSapi.ecrSetRepositoryPolicyRequest;
@class AWSapi.ecrSetRepositoryPolicyResponse;
@class AWSapi.ecrStartImageScanRequest;
@class AWSapi.ecrStartImageScanResponse;
@class AWSapi.ecrStartLifecyclePolicyPreviewRequest;
@class AWSapi.ecrStartLifecyclePolicyPreviewResponse;
@class AWSapi.ecrTag;
@class AWSapi.ecrTagResourceRequest;
@class AWSapi.ecrTagResourceResponse;
@class AWSapi.ecrUntagResourceRequest;
@class AWSapi.ecrUntagResourceResponse;
@class AWSapi.ecrUploadLayerPartRequest;
@class AWSapi.ecrUploadLayerPartResponse;

/**
 <p>This data type is used in the <a>ImageScanFinding</a> data type.</p>
 Required parameters: [key]
 */
@interface AWSapi.ecrAttribute : AWSModel


/**
 <p>The attribute key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value assigned to the attribute key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>An object representing authorization data for an Amazon ECR registry.</p>
 */
@interface AWSapi.ecrAuthorizationData : AWSModel


/**
 <p>A base64-encoded string that contains authorization data for the specified Amazon ECR registry. When the string is decoded, it is presented in the format <code>user:password</code> for private registry authentication using <code>docker login</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizationToken;

/**
 <p>The Unix time in seconds and milliseconds when the authorization token expires. Authorization tokens are valid for 12 hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiresAt;

/**
 <p>The registry URL to use for this authorization token in a <code>docker login</code> command. The Amazon ECR registry URL format is <code>https://aws_account_id.dkr.ecr.region.amazonaws.com</code>. For example, <code>https://012345678910.dkr.ecr.us-east-1.amazonaws.com</code>.. </p>
 */
@property (nonatomic, strong) NSString * _Nullable proxyEndpoint;

@end

/**
 
 */
@interface AWSapi.ecrBatchCheckLayerAvailabilityRequest : AWSRequest


/**
 <p>The digests of the image layers to check.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable layerDigests;

/**
 <p>The AWS account ID associated with the registry that contains the image layers to check. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository that is associated with the image layers to check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrBatchCheckLayerAvailabilityResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrLayerFailure *> * _Nullable failures;

/**
 <p>A list of image layer objects corresponding to the image layer references in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrLayer *> * _Nullable layers;

@end

/**
 <p>Deletes specified images within a specified repository. Images are specified with either the <code>imageTag</code> or <code>imageDigest</code>.</p>
 Required parameters: [repositoryName, imageIds]
 */
@interface AWSapi.ecrBatchDeleteImageRequest : AWSRequest


/**
 <p>A list of image ID references that correspond to images to delete. The format of the <code>imageIds</code> reference is <code>imageTag=tag</code> or <code>imageDigest=digest</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The AWS account ID associated with the registry that contains the image to delete. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository that contains the image to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrBatchDeleteImageResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageFailure *> * _Nullable failures;

/**
 <p>The image IDs of the deleted images.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

@end

/**
 
 */
@interface AWSapi.ecrBatchGetImageRequest : AWSRequest


/**
 <p>The accepted media types for the request.</p><p>Valid values: <code>application/vnd.docker.distribution.manifest.v1+json</code> | <code>application/vnd.docker.distribution.manifest.v2+json</code> | <code>application/vnd.oci.image.manifest.v1+json</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceptedMediaTypes;

/**
 <p>A list of image ID references that correspond to images to describe. The format of the <code>imageIds</code> reference is <code>imageTag=tag</code> or <code>imageDigest=digest</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The AWS account ID associated with the registry that contains the images to describe. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository that contains the images to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrBatchGetImageResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageFailure *> * _Nullable failures;

/**
 <p>A list of image objects corresponding to the image references in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImage *> * _Nullable images;

@end

/**
 
 */
@interface AWSapi.ecrCompleteLayerUploadRequest : AWSRequest


/**
 <p>The <code>sha256</code> digest of the image layer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable layerDigests;

/**
 <p>The AWS account ID associated with the registry to which to upload layers. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to associate with the image layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The upload ID from a previous <a>InitiateLayerUpload</a> operation to associate with the image layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSapi.ecrCompleteLayerUploadResponse : AWSModel


/**
 <p>The <code>sha256</code> digest of the image layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerDigest;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The upload ID associated with the layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSapi.ecrCreateRepositoryRequest : AWSRequest


/**
 <p>The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The tag mutability setting for the repository. If this parameter is omitted, the default setting of <code>MUTABLE</code> will be used which will allow image tags to be overwritten. If <code>IMMUTABLE</code> is specified, all image tags within the repository will be immutable which will prevent them from being overwritten.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageTagMutability imageTagMutability;

/**
 <p>The name to use for the repository. The repository name may be specified on its own (such as <code>nginx-web-app</code>) or it can be prepended with a namespace to group the repository into a category (such as <code>project-a/nginx-web-app</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The metadata that you apply to the repository to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapi.ecrCreateRepositoryResponse : AWSModel


/**
 <p>The repository that was created.</p>
 */
@property (nonatomic, strong) AWSapi.ecrRepository * _Nullable repository;

@end

/**
 
 */
@interface AWSapi.ecrDeleteLifecyclePolicyRequest : AWSRequest


/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDeleteLifecyclePolicyResponse : AWSModel


/**
 <p>The time stamp of the last time that the lifecycle policy was run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastEvaluatedAt;

/**
 <p>The JSON lifecycle policy text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDeleteRepositoryPolicyRequest : AWSRequest


/**
 <p>The AWS account ID associated with the registry that contains the repository policy to delete. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository that is associated with the repository policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDeleteRepositoryPolicyResponse : AWSModel


/**
 <p>The JSON repository policy that was deleted from the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDeleteRepositoryRequest : AWSRequest


/**
 <p> If a repository contains images, forces the deletion.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The AWS account ID associated with the registry that contains the repository to delete. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDeleteRepositoryResponse : AWSModel


/**
 <p>The repository that was deleted.</p>
 */
@property (nonatomic, strong) AWSapi.ecrRepository * _Nullable repository;

@end

/**
 
 */
@interface AWSapi.ecrDescribeImageScanFindingsRequest : AWSRequest


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

/**
 <p>The maximum number of image scan results returned by <code>DescribeImageScanFindings</code> in paginated output. When this parameter is used, <code>DescribeImageScanFindings</code> only returns <code>maxResults</code> results in a single page along with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeImageScanFindings</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 1000. If this parameter is not used, then <code>DescribeImageScanFindings</code> returns up to 100 results and a <code>nextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>DescribeImageScanFindings</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. This value is null when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to describe the image scan findings for. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository for the image for which to describe the scan findings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDescribeImageScanFindingsResponse : AWSModel


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

/**
 <p>The information contained in the image scan findings.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanFindings * _Nullable imageScanFindings;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanStatus * _Nullable imageScanStatus;

/**
 <p>The <code>nextToken</code> value to include in a future <code>DescribeImageScanFindings</code> request. When the results of a <code>DescribeImageScanFindings</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is null when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>An object representing a filter on a <a>DescribeImages</a> operation.</p>
 */
@interface AWSapi.ecrDescribeImagesFilter : AWSModel


/**
 <p>The tag status with which to filter your <a>DescribeImages</a> results. You can filter results based on whether they are <code>TAGGED</code> or <code>UNTAGGED</code>.</p>
 */
@property (nonatomic, assign) AWSapi.ecrTagStatus tagStatus;

@end

/**
 
 */
@interface AWSapi.ecrDescribeImagesRequest : AWSRequest


/**
 <p>The filter key and value with which to filter your <code>DescribeImages</code> results.</p>
 */
@property (nonatomic, strong) AWSapi.ecrDescribeImagesFilter * _Nullable filter;

/**
 <p>The list of image IDs for the requested repository.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The maximum number of repository results returned by <code>DescribeImages</code> in paginated output. When this parameter is used, <code>DescribeImages</code> only returns <code>maxResults</code> results in a single page along with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeImages</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 1000. If this parameter is not used, then <code>DescribeImages</code> returns up to 100 results and a <code>nextToken</code> value, if applicable. This option cannot be used when you specify images with <code>imageIds</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>DescribeImages</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. This value is <code>null</code> when there are no more results to return. This option cannot be used when you specify images with <code>imageIds</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to describe images. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository that contains the images to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrDescribeImagesResponse : AWSModel


/**
 <p>A list of <a>ImageDetail</a> objects that contain data about the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageDetail *> * _Nullable imageDetails;

/**
 <p>The <code>nextToken</code> value to include in a future <code>DescribeImages</code> request. When the results of a <code>DescribeImages</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapi.ecrDescribeRepositoriesRequest : AWSRequest


/**
 <p>The maximum number of repository results returned by <code>DescribeRepositories</code> in paginated output. When this parameter is used, <code>DescribeRepositories</code> only returns <code>maxResults</code> results in a single page along with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeRepositories</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 1000. If this parameter is not used, then <code>DescribeRepositories</code> returns up to 100 results and a <code>nextToken</code> value, if applicable. This option cannot be used when you specify repositories with <code>repositoryNames</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>DescribeRepositories</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. This value is <code>null</code> when there are no more results to return. This option cannot be used when you specify repositories with <code>repositoryNames</code>.</p><note><p>This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS account ID associated with the registry that contains the repositories to be described. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>A list of repositories to describe. If this parameter is omitted, then all repositories in a registry are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable repositoryNames;

@end

/**
 
 */
@interface AWSapi.ecrDescribeRepositoriesResponse : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>DescribeRepositories</code> request. When the results of a <code>DescribeRepositories</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of repository objects corresponding to valid repositories.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrRepository *> * _Nullable repositories;

@end

/**
 
 */
@interface AWSapi.ecrGetAuthorizationTokenRequest : AWSRequest


/**
 <p>A list of AWS account IDs that are associated with the registries for which to get AuthorizationData objects. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable registryIds;

@end

/**
 
 */
@interface AWSapi.ecrGetAuthorizationTokenResponse : AWSModel


/**
 <p>A list of authorization token data objects that correspond to the <code>registryIds</code> values in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrAuthorizationData *> * _Nullable authorizationData;

@end

/**
 
 */
@interface AWSapi.ecrGetDownloadUrlForLayerRequest : AWSRequest


/**
 <p>The digest of the image layer to download.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerDigest;

/**
 <p>The AWS account ID associated with the registry that contains the image layer to download. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository that is associated with the image layer to download.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrGetDownloadUrlForLayerResponse : AWSModel


/**
 <p>The pre-signed Amazon S3 download URL for the requested layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUrl;

/**
 <p>The digest of the image layer to download.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerDigest;

@end

/**
 
 */
@interface AWSapi.ecrGetLifecyclePolicyPreviewRequest : AWSRequest


/**
 <p>An optional parameter that filters results based on image tag status and all tags, if tagged.</p>
 */
@property (nonatomic, strong) AWSapi.ecrLifecyclePolicyPreviewFilter * _Nullable filter;

/**
 <p>The list of imageIDs to be included.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The maximum number of repository results returned by <code>GetLifecyclePolicyPreviewRequest</code> in&#x2028; paginated output. When this parameter is used, <code>GetLifecyclePolicyPreviewRequest</code> only returns&#x2028; <code>maxResults</code> results in a single page along with a <code>nextToken</code>&#x2028; response element. The remaining results of the initial request can be seen by sending&#x2028; another <code>GetLifecyclePolicyPreviewRequest</code> request with the returned <code>nextToken</code>&#x2028; value. This value can be between 1 and 1000. If this&#x2028; parameter is not used, then <code>GetLifecyclePolicyPreviewRequest</code> returns up to&#x2028; 100 results and a <code>nextToken</code> value, if&#x2028; applicable. This option cannot be used when you specify images with <code>imageIds</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated&#x2028; <code>GetLifecyclePolicyPreviewRequest</code> request where <code>maxResults</code> was used and the&#x2028; results exceeded the value of that parameter. Pagination continues from the end of the&#x2028; previous results that returned the <code>nextToken</code> value. This value is&#x2028; <code>null</code> when there are no more results to return. This option cannot be used when you specify images with <code>imageIds</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrGetLifecyclePolicyPreviewResponse : AWSModel


/**
 <p>The JSON lifecycle policy text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The <code>nextToken</code> value to include in a future <code>GetLifecyclePolicyPreview</code> request. When the results of a <code>GetLifecyclePolicyPreview</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The results of the lifecycle policy preview request.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrLifecyclePolicyPreviewResult *> * _Nullable previewResults;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The status of the lifecycle policy preview request.</p>
 */
@property (nonatomic, assign) AWSapi.ecrLifecyclePolicyPreviewStatus status;

/**
 <p>The list of images that is returned as a result of the action.</p>
 */
@property (nonatomic, strong) AWSapi.ecrLifecyclePolicyPreviewSummary * _Nullable summary;

@end

/**
 
 */
@interface AWSapi.ecrGetLifecyclePolicyRequest : AWSRequest


/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrGetLifecyclePolicyResponse : AWSModel


/**
 <p>The time stamp of the last time that the lifecycle policy was run.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastEvaluatedAt;

/**
 <p>The JSON lifecycle policy text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrGetRepositoryPolicyRequest : AWSRequest


/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository with the policy to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrGetRepositoryPolicyResponse : AWSModel


/**
 <p>The JSON repository policy text associated with the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>An object representing an Amazon ECR image.</p>
 */
@interface AWSapi.ecrImage : AWSModel


/**
 <p>An object containing the image tag and image digest associated with an image.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

/**
 <p>The image manifest associated with the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifest;

/**
 <p>The AWS account ID associated with the registry containing the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository associated with the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>An object that describes an image returned by a <a>DescribeImages</a> operation.</p>
 */
@interface AWSapi.ecrImageDetail : AWSModel


/**
 <p>The <code>sha256</code> digest of the image manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageDigest;

/**
 <p>The date and time, expressed in standard JavaScript date format, at which the current image was pushed to the repository. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable imagePushedAt;

/**
 <p>A summary of the last completed image scan.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanFindingsSummary * _Nullable imageScanFindingsSummary;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanStatus * _Nullable imageScanStatus;

/**
 <p>The size, in bytes, of the image in the repository.</p><p>If the image is a manifest list, this will be the max size of all manifests in the list.</p><note><p>Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the <code>docker images</code> command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by <a>DescribeImages</a>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable imageSizeInBytes;

/**
 <p>The list of tags associated with this image.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable imageTags;

/**
 <p>The AWS account ID associated with the registry to which this image belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to which this image belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>An object representing an Amazon ECR image failure.</p>
 */
@interface AWSapi.ecrImageFailure : AWSModel


/**
 <p>The code associated with the failure.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageFailureCode failureCode;

/**
 <p>The reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The image ID associated with the failure.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

@end

/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@interface AWSapi.ecrImageIdentifier : AWSModel


/**
 <p>The <code>sha256</code> digest of the image manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageDigest;

/**
 <p>The tag used for the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageTag;

@end

/**
 <p>Contains information about an image scan finding.</p>
 */
@interface AWSapi.ecrImageScanFinding : AWSModel


/**
 <p>A collection of attributes of the host from which the finding is generated.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrAttribute *> * _Nullable attributes;

/**
 <p>The description of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name associated with the finding, usually a CVE number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The finding severity.</p>
 */
@property (nonatomic, assign) AWSapi.ecrFindingSeverity severity;

/**
 <p>A link containing additional details about the security vulnerability.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>The details of an image scan.</p>
 */
@interface AWSapi.ecrImageScanFindings : AWSModel


/**
 <p>The image vulnerability counts, sorted by severity.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable findingSeverityCounts;

/**
 <p>The findings from the image scan.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageScanFinding *> * _Nullable findings;

/**
 <p>The time of the last completed image scan.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable imageScanCompletedAt;

/**
 <p>The time when the vulnerability data was last scanned.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable vulnerabilitySourceUpdatedAt;

@end

/**
 <p>A summary of the last completed image scan.</p>
 */
@interface AWSapi.ecrImageScanFindingsSummary : AWSModel


/**
 <p>The image vulnerability counts, sorted by severity.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable findingSeverityCounts;

/**
 <p>The time of the last completed image scan.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable imageScanCompletedAt;

/**
 <p>The time when the vulnerability data was last scanned.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable vulnerabilitySourceUpdatedAt;

@end

/**
 <p>The current status of an image scan.</p>
 */
@interface AWSapi.ecrImageScanStatus : AWSModel


/**
 <p>The description of the image scan status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The current state of an image scan.</p>
 */
@property (nonatomic, assign) AWSapi.ecrScanStatus status;

@end

/**
 <p>The image scanning configuration for a repository.</p>
 */
@interface AWSapi.ecrImageScanningConfiguration : AWSModel


/**
 <p>The setting that determines whether images are scanned after being pushed to a repository. If set to <code>true</code>, images will be scanned after being pushed. If this parameter is not specified, it will default to <code>false</code> and images will not be scanned unless a scan is manually started with the <a>StartImageScan</a> API.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scanOnPush;

@end

/**
 
 */
@interface AWSapi.ecrInitiateLayerUploadRequest : AWSRequest


/**
 <p>The AWS account ID associated with the registry to which you intend to upload layers. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to which you intend to upload layers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrInitiateLayerUploadResponse : AWSModel


/**
 <p>The size, in bytes, that Amazon ECR expects future layer part uploads to be.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partSize;

/**
 <p>The upload ID for the layer upload. This parameter is passed to further <a>UploadLayerPart</a> and <a>CompleteLayerUpload</a> operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 <p>An object representing an Amazon ECR image layer.</p>
 */
@interface AWSapi.ecrLayer : AWSModel


/**
 <p>The availability status of the image layer.</p>
 */
@property (nonatomic, assign) AWSapi.ecrLayerAvailability layerAvailability;

/**
 <p>The <code>sha256</code> digest of the image layer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerDigest;

/**
 <p>The size, in bytes, of the image layer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable layerSize;

/**
 <p>The media type of the layer, such as <code>application/vnd.docker.image.rootfs.diff.tar.gzip</code> or <code>application/vnd.oci.image.layer.v1.tar+gzip</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaType;

@end

/**
 <p>An object representing an Amazon ECR image layer failure.</p>
 */
@interface AWSapi.ecrLayerFailure : AWSModel


/**
 <p>The failure code associated with the failure.</p>
 */
@property (nonatomic, assign) AWSapi.ecrLayerFailureCode failureCode;

/**
 <p>The reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The layer digest associated with the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable layerDigest;

@end

/**
 <p>The filter for the lifecycle policy preview.</p>
 */
@interface AWSapi.ecrLifecyclePolicyPreviewFilter : AWSModel


/**
 <p>The tag status of the image.</p>
 */
@property (nonatomic, assign) AWSapi.ecrTagStatus tagStatus;

@end

/**
 <p>The result of the lifecycle policy preview.</p>
 */
@interface AWSapi.ecrLifecyclePolicyPreviewResult : AWSModel


/**
 <p>The type of action to be taken.</p>
 */
@property (nonatomic, strong) AWSapi.ecrLifecyclePolicyRuleAction * _Nullable action;

/**
 <p>The priority of the applied rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable appliedRulePriority;

/**
 <p>The <code>sha256</code> digest of the image manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageDigest;

/**
 <p>The date and time, expressed in standard JavaScript date format, at which the current image was pushed to the repository.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable imagePushedAt;

/**
 <p>The list of tags associated with this image.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable imageTags;

@end

/**
 <p>The summary of the lifecycle policy preview request.</p>
 */
@interface AWSapi.ecrLifecyclePolicyPreviewSummary : AWSModel


/**
 <p>The number of expiring images.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiringImageTotalCount;

@end

/**
 <p>The type of action to be taken.</p>
 */
@interface AWSapi.ecrLifecyclePolicyRuleAction : AWSModel


/**
 <p>The type of action to be taken.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageActionType types;

@end

/**
 <p>An object representing a filter on a <a>ListImages</a> operation.</p>
 */
@interface AWSapi.ecrListImagesFilter : AWSModel


/**
 <p>The tag status with which to filter your <a>ListImages</a> results. You can filter results based on whether they are <code>TAGGED</code> or <code>UNTAGGED</code>.</p>
 */
@property (nonatomic, assign) AWSapi.ecrTagStatus tagStatus;

@end

/**
 
 */
@interface AWSapi.ecrListImagesRequest : AWSRequest


/**
 <p>The filter key and value with which to filter your <code>ListImages</code> results.</p>
 */
@property (nonatomic, strong) AWSapi.ecrListImagesFilter * _Nullable filter;

/**
 <p>The maximum number of image results returned by <code>ListImages</code> in paginated output. When this parameter is used, <code>ListImages</code> only returns <code>maxResults</code> results in a single page along with a <code>nextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>ListImages</code> request with the returned <code>nextToken</code> value. This value can be between 1 and 1000. If this parameter is not used, then <code>ListImages</code> returns up to 100 results and a <code>nextToken</code> value, if applicable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>nextToken</code> value returned from a previous paginated <code>ListImages</code> request where <code>maxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>nextToken</code> value. This value is <code>null</code> when there are no more results to return.</p><note><p>This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to list images. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository with image IDs to be listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrListImagesResponse : AWSModel


/**
 <p>The list of image IDs for the requested repository.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The <code>nextToken</code> value to include in a future <code>ListImages</code> request. When the results of a <code>ListImages</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSapi.ecrListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the only supported resource is an Amazon ECR repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSapi.ecrListTagsForResourceResponse : AWSModel


/**
 <p>The tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapi.ecrPutImageRequest : AWSRequest


/**
 <p>The image manifest corresponding to the image to be uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifest;

/**
 <p>The tag to associate with the image. This parameter is required for images that use the Docker Image Manifest V2 Schema 2 or OCI formats.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageTag;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to put the image. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository in which to put the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutImageResponse : AWSModel


/**
 <p>Details of the image uploaded.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImage * _Nullable image;

@end

/**
 
 */
@interface AWSapi.ecrPutImageScanningConfigurationRequest : AWSRequest


/**
 <p>The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to update the image scanning configuration setting. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository in which to update the image scanning configuration setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutImageScanningConfigurationResponse : AWSModel


/**
 <p>The image scanning configuration setting for the repository.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutImageTagMutabilityRequest : AWSRequest


/**
 <p>The tag mutability setting for the repository. If <code>MUTABLE</code> is specified, image tags can be overwritten. If <code>IMMUTABLE</code> is specified, all image tags within the repository will be immutable which will prevent them from being overwritten.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageTagMutability imageTagMutability;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to update the image tag mutability settings. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository in which to update the image tag mutability settings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutImageTagMutabilityResponse : AWSModel


/**
 <p>The image tag mutability setting for the repository.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageTagMutability imageTagMutability;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutLifecyclePolicyRequest : AWSRequest


/**
 <p>The JSON repository policy text to apply to the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do&#x2028; not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to receive the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrPutLifecyclePolicyResponse : AWSModel


/**
 <p>The JSON repository policy text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 <p>An object representing a repository.</p>
 */
@interface AWSapi.ecrRepository : AWSModel


/**
 <p>The date and time, in JavaScript date format, when the repository was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The image scanning configuration for a repository.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The tag mutability setting for the repository.</p>
 */
@property (nonatomic, assign) AWSapi.ecrImageTagMutability imageTagMutability;

/**
 <p>The AWS account ID associated with the registry that contains the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The Amazon Resource Name (ARN) that identifies the repository. The ARN contains the <code>arn:aws:ecr</code> namespace, followed by the region of the repository, AWS account ID of the repository owner, repository namespace, and repository name. For example, <code>arn:aws:ecr:region:012345678910:repository/test</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryArn;

/**
 <p>The name of the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The URI for the repository. You can use this URI for Docker <code>push</code> or <code>pull</code> operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryUri;

@end

/**
 
 */
@interface AWSapi.ecrSetRepositoryPolicyRequest : AWSRequest


/**
 <p>If the policy you are attempting to set on a repository policy would prevent you from setting another policy in the future, you must force the <a>SetRepositoryPolicy</a> operation. This is intended to prevent accidental repository lock outs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The JSON repository policy text to apply to the repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicyExamples.html">Amazon ECR Repository Policy Examples</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyText;

/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to receive the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrSetRepositoryPolicyResponse : AWSModel


/**
 <p>The JSON repository policy text applied to the repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrStartImageScanRequest : AWSRequest


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

/**
 <p>The AWS account ID associated with the registry that contains the repository in which to start an image scan request. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository that contains the images to scan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrStartImageScanResponse : AWSModel


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageIdentifier * _Nullable imageId;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSapi.ecrImageScanStatus * _Nullable imageScanStatus;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrStartLifecyclePolicyPreviewRequest : AWSRequest


/**
 <p>The policy to be evaluated against. If you do not specify a policy, the current policy for the repository is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to be evaluated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

@end

/**
 
 */
@interface AWSapi.ecrStartLifecyclePolicyPreviewResponse : AWSModel


/**
 <p>The JSON repository policy text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecyclePolicyText;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The status of the lifecycle policy preview request.</p>
 */
@property (nonatomic, assign) AWSapi.ecrLifecyclePolicyPreviewStatus status;

@end

/**
 <p>The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@interface AWSapi.ecrTag : AWSModel


/**
 <p>One part of a key-value pair that make up a tag. A <code>key</code> is a general label that acts like a category for more specific tag values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The optional part of a key-value pair that make up a tag. A <code>value</code> acts as a descriptor within a tag category (key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSapi.ecrTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the the resource to which to add tags. Currently, the only supported resource is an Amazon ECR repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSapi.ecrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSapi.ecrTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSapi.ecrUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which to remove tags. Currently, the only supported resource is an Amazon ECR repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of the tags to be removed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSapi.ecrUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSapi.ecrUploadLayerPartRequest : AWSRequest


/**
 <p>The base64-encoded layer part payload.</p>
 */
@property (nonatomic, strong) NSData * _Nullable layerPartBlob;

/**
 <p>The integer value of the first byte of the layer part.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partFirstByte;

/**
 <p>The integer value of the last byte of the layer part.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partLastByte;

/**
 <p>The AWS account ID associated with the registry to which you are uploading layer parts. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The name of the repository to which you are uploading layer parts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The upload ID from a previous <a>InitiateLayerUpload</a> operation to associate with the layer part upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

/**
 
 */
@interface AWSapi.ecrUploadLayerPartResponse : AWSModel


/**
 <p>The integer value of the last byte received in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastByteReceived;

/**
 <p>The registry ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryId;

/**
 <p>The repository name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The upload ID associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadId;

@end

NS_ASSUME_NONNULL_END
