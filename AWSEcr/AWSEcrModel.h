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

FOUNDATION_EXPORT NSString *const AWSEcrErrorDomain;

typedef NS_ENUM(NSInteger, AWSEcrErrorType) {
    AWSEcrErrorUnknown,
    AWSEcrErrorEmptyUpload,
    AWSEcrErrorImageAlreadyExists,
    AWSEcrErrorImageNotFound,
    AWSEcrErrorImageTagAlreadyExists,
    AWSEcrErrorInvalidLayer,
    AWSEcrErrorInvalidLayerPart,
    AWSEcrErrorInvalidParameter,
    AWSEcrErrorInvalidTagParameter,
    AWSEcrErrorLayerAlreadyExists,
    AWSEcrErrorLayerInaccessible,
    AWSEcrErrorLayerPartTooSmall,
    AWSEcrErrorLayersNotFound,
    AWSEcrErrorLifecyclePolicyNotFound,
    AWSEcrErrorLifecyclePolicyPreviewInProgress,
    AWSEcrErrorLifecyclePolicyPreviewNotFound,
    AWSEcrErrorLimitExceeded,
    AWSEcrErrorReferencedImagesNotFound,
    AWSEcrErrorRepositoryAlreadyExists,
    AWSEcrErrorRepositoryNotEmpty,
    AWSEcrErrorRepositoryNotFound,
    AWSEcrErrorRepositoryPolicyNotFound,
    AWSEcrErrorScanNotFound,
    AWSEcrErrorServer,
    AWSEcrErrorTooManyTags,
    AWSEcrErrorUnsupportedImageType,
    AWSEcrErrorUploadNotFound,
};

typedef NS_ENUM(NSInteger, AWSEcrFindingSeverity) {
    AWSEcrFindingSeverityUnknown,
    AWSEcrFindingSeverityInformational,
    AWSEcrFindingSeverityLow,
    AWSEcrFindingSeverityMedium,
    AWSEcrFindingSeverityHigh,
    AWSEcrFindingSeverityCritical,
    AWSEcrFindingSeverityUndefined,
};

typedef NS_ENUM(NSInteger, AWSEcrImageActionType) {
    AWSEcrImageActionTypeUnknown,
    AWSEcrImageActionTypeExpire,
};

typedef NS_ENUM(NSInteger, AWSEcrImageFailureCode) {
    AWSEcrImageFailureCodeUnknown,
    AWSEcrImageFailureCodeInvalidImageDigest,
    AWSEcrImageFailureCodeInvalidImageTag,
    AWSEcrImageFailureCodeImageTagDoesNotMatchDigest,
    AWSEcrImageFailureCodeImageNotFound,
    AWSEcrImageFailureCodeMissingDigestAndTag,
    AWSEcrImageFailureCodeImageReferencedByManifestList,
};

typedef NS_ENUM(NSInteger, AWSEcrImageTagMutability) {
    AWSEcrImageTagMutabilityUnknown,
    AWSEcrImageTagMutabilityMutable,
    AWSEcrImageTagMutabilityImmutable,
};

typedef NS_ENUM(NSInteger, AWSEcrLayerAvailability) {
    AWSEcrLayerAvailabilityUnknown,
    AWSEcrLayerAvailabilityAvailable,
    AWSEcrLayerAvailabilityUnavailable,
};

typedef NS_ENUM(NSInteger, AWSEcrLayerFailureCode) {
    AWSEcrLayerFailureCodeUnknown,
    AWSEcrLayerFailureCodeInvalidLayerDigest,
    AWSEcrLayerFailureCodeMissingLayerDigest,
};

typedef NS_ENUM(NSInteger, AWSEcrLifecyclePolicyPreviewStatus) {
    AWSEcrLifecyclePolicyPreviewStatusUnknown,
    AWSEcrLifecyclePolicyPreviewStatusInProgress,
    AWSEcrLifecyclePolicyPreviewStatusComplete,
    AWSEcrLifecyclePolicyPreviewStatusExpired,
    AWSEcrLifecyclePolicyPreviewStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSEcrScanStatus) {
    AWSEcrScanStatusUnknown,
    AWSEcrScanStatusInProgress,
    AWSEcrScanStatusComplete,
    AWSEcrScanStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSEcrTagStatus) {
    AWSEcrTagStatusUnknown,
    AWSEcrTagStatusTagged,
    AWSEcrTagStatusUntagged,
    AWSEcrTagStatusAny,
};

@class AWSEcrAttribute;
@class AWSEcrAuthorizationData;
@class AWSEcrBatchCheckLayerAvailabilityRequest;
@class AWSEcrBatchCheckLayerAvailabilityResponse;
@class AWSEcrBatchDeleteImageRequest;
@class AWSEcrBatchDeleteImageResponse;
@class AWSEcrBatchGetImageRequest;
@class AWSEcrBatchGetImageResponse;
@class AWSEcrCompleteLayerUploadRequest;
@class AWSEcrCompleteLayerUploadResponse;
@class AWSEcrCreateRepositoryRequest;
@class AWSEcrCreateRepositoryResponse;
@class AWSEcrDeleteLifecyclePolicyRequest;
@class AWSEcrDeleteLifecyclePolicyResponse;
@class AWSEcrDeleteRepositoryPolicyRequest;
@class AWSEcrDeleteRepositoryPolicyResponse;
@class AWSEcrDeleteRepositoryRequest;
@class AWSEcrDeleteRepositoryResponse;
@class AWSEcrDescribeImageScanFindingsRequest;
@class AWSEcrDescribeImageScanFindingsResponse;
@class AWSEcrDescribeImagesFilter;
@class AWSEcrDescribeImagesRequest;
@class AWSEcrDescribeImagesResponse;
@class AWSEcrDescribeRepositoriesRequest;
@class AWSEcrDescribeRepositoriesResponse;
@class AWSEcrGetAuthorizationTokenRequest;
@class AWSEcrGetAuthorizationTokenResponse;
@class AWSEcrGetDownloadUrlForLayerRequest;
@class AWSEcrGetDownloadUrlForLayerResponse;
@class AWSEcrGetLifecyclePolicyPreviewRequest;
@class AWSEcrGetLifecyclePolicyPreviewResponse;
@class AWSEcrGetLifecyclePolicyRequest;
@class AWSEcrGetLifecyclePolicyResponse;
@class AWSEcrGetRepositoryPolicyRequest;
@class AWSEcrGetRepositoryPolicyResponse;
@class AWSEcrImage;
@class AWSEcrImageDetail;
@class AWSEcrImageFailure;
@class AWSEcrImageIdentifier;
@class AWSEcrImageScanFinding;
@class AWSEcrImageScanFindings;
@class AWSEcrImageScanFindingsSummary;
@class AWSEcrImageScanStatus;
@class AWSEcrImageScanningConfiguration;
@class AWSEcrInitiateLayerUploadRequest;
@class AWSEcrInitiateLayerUploadResponse;
@class AWSEcrLayer;
@class AWSEcrLayerFailure;
@class AWSEcrLifecyclePolicyPreviewFilter;
@class AWSEcrLifecyclePolicyPreviewResult;
@class AWSEcrLifecyclePolicyPreviewSummary;
@class AWSEcrLifecyclePolicyRuleAction;
@class AWSEcrListImagesFilter;
@class AWSEcrListImagesRequest;
@class AWSEcrListImagesResponse;
@class AWSEcrListTagsForResourceRequest;
@class AWSEcrListTagsForResourceResponse;
@class AWSEcrPutImageRequest;
@class AWSEcrPutImageResponse;
@class AWSEcrPutImageScanningConfigurationRequest;
@class AWSEcrPutImageScanningConfigurationResponse;
@class AWSEcrPutImageTagMutabilityRequest;
@class AWSEcrPutImageTagMutabilityResponse;
@class AWSEcrPutLifecyclePolicyRequest;
@class AWSEcrPutLifecyclePolicyResponse;
@class AWSEcrRepository;
@class AWSEcrSetRepositoryPolicyRequest;
@class AWSEcrSetRepositoryPolicyResponse;
@class AWSEcrStartImageScanRequest;
@class AWSEcrStartImageScanResponse;
@class AWSEcrStartLifecyclePolicyPreviewRequest;
@class AWSEcrStartLifecyclePolicyPreviewResponse;
@class AWSEcrTag;
@class AWSEcrTagResourceRequest;
@class AWSEcrTagResourceResponse;
@class AWSEcrUntagResourceRequest;
@class AWSEcrUntagResourceResponse;
@class AWSEcrUploadLayerPartRequest;
@class AWSEcrUploadLayerPartResponse;

/**
 <p>This data type is used in the <a>ImageScanFinding</a> data type.</p>
 Required parameters: [key]
 */
@interface AWSEcrAttribute : AWSModel


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
@interface AWSEcrAuthorizationData : AWSModel


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
@interface AWSEcrBatchCheckLayerAvailabilityRequest : AWSRequest


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
@interface AWSEcrBatchCheckLayerAvailabilityResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrLayerFailure *> * _Nullable failures;

/**
 <p>A list of image layer objects corresponding to the image layer references in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrLayer *> * _Nullable layers;

@end

/**
 <p>Deletes specified images within a specified repository. Images are specified with either the <code>imageTag</code> or <code>imageDigest</code>.</p>
 Required parameters: [repositoryName, imageIds]
 */
@interface AWSEcrBatchDeleteImageRequest : AWSRequest


/**
 <p>A list of image ID references that correspond to images to delete. The format of the <code>imageIds</code> reference is <code>imageTag=tag</code> or <code>imageDigest=digest</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

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
@interface AWSEcrBatchDeleteImageResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageFailure *> * _Nullable failures;

/**
 <p>The image IDs of the deleted images.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

@end

/**
 
 */
@interface AWSEcrBatchGetImageRequest : AWSRequest


/**
 <p>The accepted media types for the request.</p><p>Valid values: <code>application/vnd.docker.distribution.manifest.v1+json</code> | <code>application/vnd.docker.distribution.manifest.v2+json</code> | <code>application/vnd.oci.image.manifest.v1+json</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceptedMediaTypes;

/**
 <p>A list of image ID references that correspond to images to describe. The format of the <code>imageIds</code> reference is <code>imageTag=tag</code> or <code>imageDigest=digest</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

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
@interface AWSEcrBatchGetImageResponse : AWSModel


/**
 <p>Any failures associated with the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageFailure *> * _Nullable failures;

/**
 <p>A list of image objects corresponding to the image references in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImage *> * _Nullable images;

@end

/**
 
 */
@interface AWSEcrCompleteLayerUploadRequest : AWSRequest


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
@interface AWSEcrCompleteLayerUploadResponse : AWSModel


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
@interface AWSEcrCreateRepositoryRequest : AWSRequest


/**
 <p>The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The tag mutability setting for the repository. If this parameter is omitted, the default setting of <code>MUTABLE</code> will be used which will allow image tags to be overwritten. If <code>IMMUTABLE</code> is specified, all image tags within the repository will be immutable which will prevent them from being overwritten.</p>
 */
@property (nonatomic, assign) AWSEcrImageTagMutability imageTagMutability;

/**
 <p>The name to use for the repository. The repository name may be specified on its own (such as <code>nginx-web-app</code>) or it can be prepended with a namespace to group the repository into a category (such as <code>project-a/nginx-web-app</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryName;

/**
 <p>The metadata that you apply to the repository to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSEcrCreateRepositoryResponse : AWSModel


/**
 <p>The repository that was created.</p>
 */
@property (nonatomic, strong) AWSEcrRepository * _Nullable repository;

@end

/**
 
 */
@interface AWSEcrDeleteLifecyclePolicyRequest : AWSRequest


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
@interface AWSEcrDeleteLifecyclePolicyResponse : AWSModel


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
@interface AWSEcrDeleteRepositoryPolicyRequest : AWSRequest


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
@interface AWSEcrDeleteRepositoryPolicyResponse : AWSModel


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
@interface AWSEcrDeleteRepositoryRequest : AWSRequest


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
@interface AWSEcrDeleteRepositoryResponse : AWSModel


/**
 <p>The repository that was deleted.</p>
 */
@property (nonatomic, strong) AWSEcrRepository * _Nullable repository;

@end

/**
 
 */
@interface AWSEcrDescribeImageScanFindingsRequest : AWSRequest


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

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
@interface AWSEcrDescribeImageScanFindingsResponse : AWSModel


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

/**
 <p>The information contained in the image scan findings.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanFindings * _Nullable imageScanFindings;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanStatus * _Nullable imageScanStatus;

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
@interface AWSEcrDescribeImagesFilter : AWSModel


/**
 <p>The tag status with which to filter your <a>DescribeImages</a> results. You can filter results based on whether they are <code>TAGGED</code> or <code>UNTAGGED</code>.</p>
 */
@property (nonatomic, assign) AWSEcrTagStatus tagStatus;

@end

/**
 
 */
@interface AWSEcrDescribeImagesRequest : AWSRequest


/**
 <p>The filter key and value with which to filter your <code>DescribeImages</code> results.</p>
 */
@property (nonatomic, strong) AWSEcrDescribeImagesFilter * _Nullable filter;

/**
 <p>The list of image IDs for the requested repository.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

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
@interface AWSEcrDescribeImagesResponse : AWSModel


/**
 <p>A list of <a>ImageDetail</a> objects that contain data about the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageDetail *> * _Nullable imageDetails;

/**
 <p>The <code>nextToken</code> value to include in a future <code>DescribeImages</code> request. When the results of a <code>DescribeImages</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSEcrDescribeRepositoriesRequest : AWSRequest


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
@interface AWSEcrDescribeRepositoriesResponse : AWSModel


/**
 <p>The <code>nextToken</code> value to include in a future <code>DescribeRepositories</code> request. When the results of a <code>DescribeRepositories</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of repository objects corresponding to valid repositories.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrRepository *> * _Nullable repositories;

@end

/**
 
 */
@interface AWSEcrGetAuthorizationTokenRequest : AWSRequest


/**
 <p>A list of AWS account IDs that are associated with the registries for which to get AuthorizationData objects. If you do not specify a registry, the default registry is assumed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable registryIds;

@end

/**
 
 */
@interface AWSEcrGetAuthorizationTokenResponse : AWSModel


/**
 <p>A list of authorization token data objects that correspond to the <code>registryIds</code> values in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrAuthorizationData *> * _Nullable authorizationData;

@end

/**
 
 */
@interface AWSEcrGetDownloadUrlForLayerRequest : AWSRequest


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
@interface AWSEcrGetDownloadUrlForLayerResponse : AWSModel


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
@interface AWSEcrGetLifecyclePolicyPreviewRequest : AWSRequest


/**
 <p>An optional parameter that filters results based on image tag status and all tags, if tagged.</p>
 */
@property (nonatomic, strong) AWSEcrLifecyclePolicyPreviewFilter * _Nullable filter;

/**
 <p>The list of imageIDs to be included.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

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
@interface AWSEcrGetLifecyclePolicyPreviewResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSEcrLifecyclePolicyPreviewResult *> * _Nullable previewResults;

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
@property (nonatomic, assign) AWSEcrLifecyclePolicyPreviewStatus status;

/**
 <p>The list of images that is returned as a result of the action.</p>
 */
@property (nonatomic, strong) AWSEcrLifecyclePolicyPreviewSummary * _Nullable summary;

@end

/**
 
 */
@interface AWSEcrGetLifecyclePolicyRequest : AWSRequest


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
@interface AWSEcrGetLifecyclePolicyResponse : AWSModel


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
@interface AWSEcrGetRepositoryPolicyRequest : AWSRequest


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
@interface AWSEcrGetRepositoryPolicyResponse : AWSModel


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
@interface AWSEcrImage : AWSModel


/**
 <p>An object containing the image tag and image digest associated with an image.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

/**
 <p>The image manifest associated with the image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifest;

/**
 <p>The media type associated with the image manifest.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifestMediaType;

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
@interface AWSEcrImageDetail : AWSModel


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
@property (nonatomic, strong) AWSEcrImageScanFindingsSummary * _Nullable imageScanFindingsSummary;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanStatus * _Nullable imageScanStatus;

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
@interface AWSEcrImageFailure : AWSModel


/**
 <p>The code associated with the failure.</p>
 */
@property (nonatomic, assign) AWSEcrImageFailureCode failureCode;

/**
 <p>The reason for the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The image ID associated with the failure.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

@end

/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@interface AWSEcrImageIdentifier : AWSModel


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
@interface AWSEcrImageScanFinding : AWSModel


/**
 <p>A collection of attributes of the host from which the finding is generated.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrAttribute *> * _Nullable attributes;

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
@property (nonatomic, assign) AWSEcrFindingSeverity severity;

/**
 <p>A link containing additional details about the security vulnerability.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>The details of an image scan.</p>
 */
@interface AWSEcrImageScanFindings : AWSModel


/**
 <p>The image vulnerability counts, sorted by severity.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable findingSeverityCounts;

/**
 <p>The findings from the image scan.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageScanFinding *> * _Nullable findings;

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
@interface AWSEcrImageScanFindingsSummary : AWSModel


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
@interface AWSEcrImageScanStatus : AWSModel


/**
 <p>The description of the image scan status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The current state of an image scan.</p>
 */
@property (nonatomic, assign) AWSEcrScanStatus status;

@end

/**
 <p>The image scanning configuration for a repository.</p>
 */
@interface AWSEcrImageScanningConfiguration : AWSModel


/**
 <p>The setting that determines whether images are scanned after being pushed to a repository. If set to <code>true</code>, images will be scanned after being pushed. If this parameter is not specified, it will default to <code>false</code> and images will not be scanned unless a scan is manually started with the <a>StartImageScan</a> API.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scanOnPush;

@end

/**
 
 */
@interface AWSEcrInitiateLayerUploadRequest : AWSRequest


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
@interface AWSEcrInitiateLayerUploadResponse : AWSModel


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
@interface AWSEcrLayer : AWSModel


/**
 <p>The availability status of the image layer.</p>
 */
@property (nonatomic, assign) AWSEcrLayerAvailability layerAvailability;

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
@interface AWSEcrLayerFailure : AWSModel


/**
 <p>The failure code associated with the failure.</p>
 */
@property (nonatomic, assign) AWSEcrLayerFailureCode failureCode;

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
@interface AWSEcrLifecyclePolicyPreviewFilter : AWSModel


/**
 <p>The tag status of the image.</p>
 */
@property (nonatomic, assign) AWSEcrTagStatus tagStatus;

@end

/**
 <p>The result of the lifecycle policy preview.</p>
 */
@interface AWSEcrLifecyclePolicyPreviewResult : AWSModel


/**
 <p>The type of action to be taken.</p>
 */
@property (nonatomic, strong) AWSEcrLifecyclePolicyRuleAction * _Nullable action;

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
@interface AWSEcrLifecyclePolicyPreviewSummary : AWSModel


/**
 <p>The number of expiring images.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiringImageTotalCount;

@end

/**
 <p>The type of action to be taken.</p>
 */
@interface AWSEcrLifecyclePolicyRuleAction : AWSModel


/**
 <p>The type of action to be taken.</p>
 */
@property (nonatomic, assign) AWSEcrImageActionType types;

@end

/**
 <p>An object representing a filter on a <a>ListImages</a> operation.</p>
 */
@interface AWSEcrListImagesFilter : AWSModel


/**
 <p>The tag status with which to filter your <a>ListImages</a> results. You can filter results based on whether they are <code>TAGGED</code> or <code>UNTAGGED</code>.</p>
 */
@property (nonatomic, assign) AWSEcrTagStatus tagStatus;

@end

/**
 
 */
@interface AWSEcrListImagesRequest : AWSRequest


/**
 <p>The filter key and value with which to filter your <code>ListImages</code> results.</p>
 */
@property (nonatomic, strong) AWSEcrListImagesFilter * _Nullable filter;

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
@interface AWSEcrListImagesResponse : AWSModel


/**
 <p>The list of image IDs for the requested repository.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrImageIdentifier *> * _Nullable imageIds;

/**
 <p>The <code>nextToken</code> value to include in a future <code>ListImages</code> request. When the results of a <code>ListImages</code> request exceed <code>maxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSEcrListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the only supported resource is an Amazon ECR repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSEcrListTagsForResourceResponse : AWSModel


/**
 <p>The tags for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSEcrPutImageRequest : AWSRequest


/**
 <p>The image manifest corresponding to the image to be uploaded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifest;

/**
 <p>The media type of the image manifest. If you push an image manifest that does not contain the <code>mediaType</code> field, you must specify the <code>imageManifestMediaType</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageManifestMediaType;

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
@interface AWSEcrPutImageResponse : AWSModel


/**
 <p>Details of the image uploaded.</p>
 */
@property (nonatomic, strong) AWSEcrImage * _Nullable image;

@end

/**
 
 */
@interface AWSEcrPutImageScanningConfigurationRequest : AWSRequest


/**
 <p>The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanningConfiguration * _Nullable imageScanningConfiguration;

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
@interface AWSEcrPutImageScanningConfigurationResponse : AWSModel


/**
 <p>The image scanning configuration setting for the repository.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanningConfiguration * _Nullable imageScanningConfiguration;

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
@interface AWSEcrPutImageTagMutabilityRequest : AWSRequest


/**
 <p>The tag mutability setting for the repository. If <code>MUTABLE</code> is specified, image tags can be overwritten. If <code>IMMUTABLE</code> is specified, all image tags within the repository will be immutable which will prevent them from being overwritten.</p>
 */
@property (nonatomic, assign) AWSEcrImageTagMutability imageTagMutability;

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
@interface AWSEcrPutImageTagMutabilityResponse : AWSModel


/**
 <p>The image tag mutability setting for the repository.</p>
 */
@property (nonatomic, assign) AWSEcrImageTagMutability imageTagMutability;

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
@interface AWSEcrPutLifecyclePolicyRequest : AWSRequest


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
@interface AWSEcrPutLifecyclePolicyResponse : AWSModel


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
@interface AWSEcrRepository : AWSModel


/**
 <p>The date and time, in JavaScript date format, when the repository was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The image scanning configuration for a repository.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanningConfiguration * _Nullable imageScanningConfiguration;

/**
 <p>The tag mutability setting for the repository.</p>
 */
@property (nonatomic, assign) AWSEcrImageTagMutability imageTagMutability;

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
@interface AWSEcrSetRepositoryPolicyRequest : AWSRequest


/**
 <p>If the policy you are attempting to set on a repository policy would prevent you from setting another policy in the future, you must force the <a>SetRepositoryPolicy</a> operation. This is intended to prevent accidental repository lock outs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The JSON repository policy text to apply to the repository. For more information, see <a href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html">Amazon ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry User Guide</i>.</p>
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
@interface AWSEcrSetRepositoryPolicyResponse : AWSModel


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
@interface AWSEcrStartImageScanRequest : AWSRequest


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

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
@interface AWSEcrStartImageScanResponse : AWSModel


/**
 <p>An object with identifying information for an Amazon ECR image.</p>
 */
@property (nonatomic, strong) AWSEcrImageIdentifier * _Nullable imageId;

/**
 <p>The current state of the scan.</p>
 */
@property (nonatomic, strong) AWSEcrImageScanStatus * _Nullable imageScanStatus;

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
@interface AWSEcrStartLifecyclePolicyPreviewRequest : AWSRequest


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
@interface AWSEcrStartLifecyclePolicyPreviewResponse : AWSModel


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
@property (nonatomic, assign) AWSEcrLifecyclePolicyPreviewStatus status;

@end

/**
 <p>The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@interface AWSEcrTag : AWSModel


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
@interface AWSEcrTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the the resource to which to add tags. Currently, the only supported resource is an Amazon ECR repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEcrTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSEcrTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSEcrUntagResourceRequest : AWSRequest


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
@interface AWSEcrUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSEcrUploadLayerPartRequest : AWSRequest


/**
 <p>The base64-encoded layer part payload.</p>
 */
@property (nonatomic, strong) NSData * _Nullable layerPartBlob;

/**
 <p>The position of the first byte of the layer part witin the overall image layer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable partFirstByte;

/**
 <p>The position of the last byte of the layer part within the overall image layer.</p>
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
@interface AWSEcrUploadLayerPartResponse : AWSModel


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
