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

FOUNDATION_EXPORT NSString *const AWSCloudfrontErrorDomain;

typedef NS_ENUM(NSInteger, AWSCloudfrontErrorType) {
    AWSCloudfrontErrorUnknown,
    AWSCloudfrontErrorAccessDenied,
    AWSCloudfrontErrorBatchTooLarge,
    AWSCloudfrontErrorCNAMEAlreadyExists,
    AWSCloudfrontErrorCannotChangeImmutablePublicKeyFields,
    AWSCloudfrontErrorCloudFrontOriginAccessIdentityAlreadyExists,
    AWSCloudfrontErrorCloudFrontOriginAccessIdentityInUse,
    AWSCloudfrontErrorDistributionAlreadyExists,
    AWSCloudfrontErrorDistributionNotDisabled,
    AWSCloudfrontErrorFieldLevelEncryptionConfigAlreadyExists,
    AWSCloudfrontErrorFieldLevelEncryptionConfigInUse,
    AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists,
    AWSCloudfrontErrorFieldLevelEncryptionProfileInUse,
    AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded,
    AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior,
    AWSCloudfrontErrorIllegalUpdate,
    AWSCloudfrontErrorInconsistentQuantities,
    AWSCloudfrontErrorInvalidArgument,
    AWSCloudfrontErrorInvalidDefaultRootObject,
    AWSCloudfrontErrorInvalidErrorCode,
    AWSCloudfrontErrorInvalidForwardCookies,
    AWSCloudfrontErrorInvalidGeoRestrictionParameter,
    AWSCloudfrontErrorInvalidHeadersForS3Origin,
    AWSCloudfrontErrorInvalidIfMatchVersion,
    AWSCloudfrontErrorInvalidLambdaFunctionAssociation,
    AWSCloudfrontErrorInvalidLocationCode,
    AWSCloudfrontErrorInvalidMinimumProtocolVersion,
    AWSCloudfrontErrorInvalidOrigin,
    AWSCloudfrontErrorInvalidOriginAccessIdentity,
    AWSCloudfrontErrorInvalidOriginKeepaliveTimeout,
    AWSCloudfrontErrorInvalidOriginReadTimeout,
    AWSCloudfrontErrorInvalidProtocolSettings,
    AWSCloudfrontErrorInvalidQueryStringParameters,
    AWSCloudfrontErrorInvalidRelativePath,
    AWSCloudfrontErrorInvalidRequiredProtocol,
    AWSCloudfrontErrorInvalidResponseCode,
    AWSCloudfrontErrorInvalidTTLOrder,
    AWSCloudfrontErrorInvalidTagging,
    AWSCloudfrontErrorInvalidViewerCertificate,
    AWSCloudfrontErrorInvalidWebACLId,
    AWSCloudfrontErrorMissingBody,
    AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity,
    AWSCloudfrontErrorNoSuchDistribution,
    AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig,
    AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile,
    AWSCloudfrontErrorNoSuchInvalidation,
    AWSCloudfrontErrorNoSuchOrigin,
    AWSCloudfrontErrorNoSuchPublicKey,
    AWSCloudfrontErrorNoSuchResource,
    AWSCloudfrontErrorNoSuchStreamingDistribution,
    AWSCloudfrontErrorPreconditionFailed,
    AWSCloudfrontErrorPublicKeyAlreadyExists,
    AWSCloudfrontErrorPublicKeyInUse,
    AWSCloudfrontErrorQueryArgProfileEmpty,
    AWSCloudfrontErrorStreamingDistributionAlreadyExists,
    AWSCloudfrontErrorStreamingDistributionNotDisabled,
    AWSCloudfrontErrorTooManyCacheBehaviors,
    AWSCloudfrontErrorTooManyCertificates,
    AWSCloudfrontErrorTooManyCloudFrontOriginAccessIdentities,
    AWSCloudfrontErrorTooManyCookieNamesInWhiteList,
    AWSCloudfrontErrorTooManyDistributionCNAMEs,
    AWSCloudfrontErrorTooManyDistributions,
    AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig,
    AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionConfigs,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionProfiles,
    AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles,
    AWSCloudfrontErrorTooManyHeadersInForwardedValues,
    AWSCloudfrontErrorTooManyInvalidationsInProgress,
    AWSCloudfrontErrorTooManyLambdaFunctionAssociations,
    AWSCloudfrontErrorTooManyOriginCustomHeaders,
    AWSCloudfrontErrorTooManyOriginGroupsPerDistribution,
    AWSCloudfrontErrorTooManyOrigins,
    AWSCloudfrontErrorTooManyPublicKeys,
    AWSCloudfrontErrorTooManyQueryStringParameters,
    AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs,
    AWSCloudfrontErrorTooManyStreamingDistributions,
    AWSCloudfrontErrorTooManyTrustedSigners,
    AWSCloudfrontErrorTrustedSignerDoesNotExist,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontCertificateSource) {
    AWSCloudfrontCertificateSourceUnknown,
    AWSCloudfrontCertificateSourceCloudfront,
    AWSCloudfrontCertificateSourceIam,
    AWSCloudfrontCertificateSourceAcm,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontEventType) {
    AWSCloudfrontEventTypeUnknown,
    AWSCloudfrontEventTypeViewerRequest,
    AWSCloudfrontEventTypeViewerResponse,
    AWSCloudfrontEventTypeOriginRequest,
    AWSCloudfrontEventTypeOriginResponse,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontFormat) {
    AWSCloudfrontFormatUnknown,
    AWSCloudfrontFormatURLEncoded,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontGeoRestrictionType) {
    AWSCloudfrontGeoRestrictionTypeUnknown,
    AWSCloudfrontGeoRestrictionTypeBlacklist,
    AWSCloudfrontGeoRestrictionTypeWhitelist,
    AWSCloudfrontGeoRestrictionTypeNone,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontHttpVersion) {
    AWSCloudfrontHttpVersionUnknown,
    AWSCloudfrontHttpVersionHttp11,
    AWSCloudfrontHttpVersionHttp2,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontICPRecordalStatus) {
    AWSCloudfrontICPRecordalStatusUnknown,
    AWSCloudfrontICPRecordalStatusApproved,
    AWSCloudfrontICPRecordalStatusSuspended,
    AWSCloudfrontICPRecordalStatusPending,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontItemSelection) {
    AWSCloudfrontItemSelectionUnknown,
    AWSCloudfrontItemSelectionNone,
    AWSCloudfrontItemSelectionWhitelist,
    AWSCloudfrontItemSelectionAll,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontMethod) {
    AWSCloudfrontMethodUnknown,
    AWSCloudfrontMethodGet,
    AWSCloudfrontMethodHead,
    AWSCloudfrontMethodPost,
    AWSCloudfrontMethodPut,
    AWSCloudfrontMethodPatch,
    AWSCloudfrontMethodOptions,
    AWSCloudfrontMethodDelete,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontMinimumProtocolVersion) {
    AWSCloudfrontMinimumProtocolVersionUnknown,
    AWSCloudfrontMinimumProtocolVersionSSLv3,
    AWSCloudfrontMinimumProtocolVersionTLSv1,
    AWSCloudfrontMinimumProtocolVersionTLSv12016,
    AWSCloudfrontMinimumProtocolVersionTLSv112016,
    AWSCloudfrontMinimumProtocolVersionTLSv122018,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontOriginProtocolPolicy) {
    AWSCloudfrontOriginProtocolPolicyUnknown,
    AWSCloudfrontOriginProtocolPolicyHttpOnly,
    AWSCloudfrontOriginProtocolPolicyMatchViewer,
    AWSCloudfrontOriginProtocolPolicyHttpsOnly,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontPriceClass) {
    AWSCloudfrontPriceClassUnknown,
    AWSCloudfrontPriceClassPriceClass100,
    AWSCloudfrontPriceClassPriceClass200,
    AWSCloudfrontPriceClassPriceClassAll,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontSSLSupportMethod) {
    AWSCloudfrontSSLSupportMethodUnknown,
    AWSCloudfrontSSLSupportMethodSniOnly,
    AWSCloudfrontSSLSupportMethodVip,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontSslProtocol) {
    AWSCloudfrontSslProtocolUnknown,
    AWSCloudfrontSslProtocolSSLv3,
    AWSCloudfrontSslProtocolTLSv1,
    AWSCloudfrontSslProtocolTLSv11,
    AWSCloudfrontSslProtocolTLSv12,
};

typedef NS_ENUM(NSInteger, AWSCloudfrontViewerProtocolPolicy) {
    AWSCloudfrontViewerProtocolPolicyUnknown,
    AWSCloudfrontViewerProtocolPolicyAllowAll,
    AWSCloudfrontViewerProtocolPolicyHttpsOnly,
    AWSCloudfrontViewerProtocolPolicyRedirectToHttps,
};

@class AWSCloudfrontActiveTrustedSigners;
@class AWSCloudfrontAliasICPRecordal;
@class AWSCloudfrontAliases;
@class AWSCloudfrontAllowedMethods;
@class AWSCloudfrontCacheBehavior;
@class AWSCloudfrontCacheBehaviors;
@class AWSCloudfrontCachedMethods;
@class AWSCloudfrontCloudFrontOriginAccessIdentity;
@class AWSCloudfrontCloudFrontOriginAccessIdentityConfig;
@class AWSCloudfrontCloudFrontOriginAccessIdentityList;
@class AWSCloudfrontCloudFrontOriginAccessIdentitySummary;
@class AWSCloudfrontContentTypeProfile;
@class AWSCloudfrontContentTypeProfileConfig;
@class AWSCloudfrontContentTypeProfiles;
@class AWSCloudfrontCookieNames;
@class AWSCloudfrontCookiePreference;
@class AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest;
@class AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult;
@class AWSCloudfrontCreateDistributionRequest;
@class AWSCloudfrontCreateDistributionResult;
@class AWSCloudfrontCreateDistributionWithTagsRequest;
@class AWSCloudfrontCreateDistributionWithTagsResult;
@class AWSCloudfrontCreateFieldLevelEncryptionConfigRequest;
@class AWSCloudfrontCreateFieldLevelEncryptionConfigResult;
@class AWSCloudfrontCreateFieldLevelEncryptionProfileRequest;
@class AWSCloudfrontCreateFieldLevelEncryptionProfileResult;
@class AWSCloudfrontCreateInvalidationRequest;
@class AWSCloudfrontCreateInvalidationResult;
@class AWSCloudfrontCreatePublicKeyRequest;
@class AWSCloudfrontCreatePublicKeyResult;
@class AWSCloudfrontCreateStreamingDistributionRequest;
@class AWSCloudfrontCreateStreamingDistributionResult;
@class AWSCloudfrontCreateStreamingDistributionWithTagsRequest;
@class AWSCloudfrontCreateStreamingDistributionWithTagsResult;
@class AWSCloudfrontCustomErrorResponse;
@class AWSCloudfrontCustomErrorResponses;
@class AWSCloudfrontCustomHeaders;
@class AWSCloudfrontCustomOriginConfig;
@class AWSCloudfrontDefaultCacheBehavior;
@class AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest;
@class AWSCloudfrontDeleteDistributionRequest;
@class AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest;
@class AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest;
@class AWSCloudfrontDeletePublicKeyRequest;
@class AWSCloudfrontDeleteStreamingDistributionRequest;
@class AWSCloudfrontDistribution;
@class AWSCloudfrontDistributionConfig;
@class AWSCloudfrontDistributionConfigWithTags;
@class AWSCloudfrontDistributionList;
@class AWSCloudfrontDistributionSummary;
@class AWSCloudfrontEncryptionEntities;
@class AWSCloudfrontEncryptionEntity;
@class AWSCloudfrontFieldLevelEncryption;
@class AWSCloudfrontFieldLevelEncryptionConfig;
@class AWSCloudfrontFieldLevelEncryptionList;
@class AWSCloudfrontFieldLevelEncryptionProfile;
@class AWSCloudfrontFieldLevelEncryptionProfileConfig;
@class AWSCloudfrontFieldLevelEncryptionProfileList;
@class AWSCloudfrontFieldLevelEncryptionProfileSummary;
@class AWSCloudfrontFieldLevelEncryptionSummary;
@class AWSCloudfrontFieldPatterns;
@class AWSCloudfrontForwardedValues;
@class AWSCloudfrontGeoRestriction;
@class AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest;
@class AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult;
@class AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest;
@class AWSCloudfrontGetCloudFrontOriginAccessIdentityResult;
@class AWSCloudfrontGetDistributionConfigRequest;
@class AWSCloudfrontGetDistributionConfigResult;
@class AWSCloudfrontGetDistributionRequest;
@class AWSCloudfrontGetDistributionResult;
@class AWSCloudfrontGetFieldLevelEncryptionConfigRequest;
@class AWSCloudfrontGetFieldLevelEncryptionConfigResult;
@class AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest;
@class AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult;
@class AWSCloudfrontGetFieldLevelEncryptionProfileRequest;
@class AWSCloudfrontGetFieldLevelEncryptionProfileResult;
@class AWSCloudfrontGetFieldLevelEncryptionRequest;
@class AWSCloudfrontGetFieldLevelEncryptionResult;
@class AWSCloudfrontGetInvalidationRequest;
@class AWSCloudfrontGetInvalidationResult;
@class AWSCloudfrontGetPublicKeyConfigRequest;
@class AWSCloudfrontGetPublicKeyConfigResult;
@class AWSCloudfrontGetPublicKeyRequest;
@class AWSCloudfrontGetPublicKeyResult;
@class AWSCloudfrontGetStreamingDistributionConfigRequest;
@class AWSCloudfrontGetStreamingDistributionConfigResult;
@class AWSCloudfrontGetStreamingDistributionRequest;
@class AWSCloudfrontGetStreamingDistributionResult;
@class AWSCloudfrontHeaders;
@class AWSCloudfrontInvalidation;
@class AWSCloudfrontInvalidationBatch;
@class AWSCloudfrontInvalidationList;
@class AWSCloudfrontInvalidationSummary;
@class AWSCloudfrontKeyPairIds;
@class AWSCloudfrontLambdaFunctionAssociation;
@class AWSCloudfrontLambdaFunctionAssociations;
@class AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest;
@class AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult;
@class AWSCloudfrontListDistributionsByWebACLIdRequest;
@class AWSCloudfrontListDistributionsByWebACLIdResult;
@class AWSCloudfrontListDistributionsRequest;
@class AWSCloudfrontListDistributionsResult;
@class AWSCloudfrontListFieldLevelEncryptionConfigsRequest;
@class AWSCloudfrontListFieldLevelEncryptionConfigsResult;
@class AWSCloudfrontListFieldLevelEncryptionProfilesRequest;
@class AWSCloudfrontListFieldLevelEncryptionProfilesResult;
@class AWSCloudfrontListInvalidationsRequest;
@class AWSCloudfrontListInvalidationsResult;
@class AWSCloudfrontListPublicKeysRequest;
@class AWSCloudfrontListPublicKeysResult;
@class AWSCloudfrontListStreamingDistributionsRequest;
@class AWSCloudfrontListStreamingDistributionsResult;
@class AWSCloudfrontListTagsForResourceRequest;
@class AWSCloudfrontListTagsForResourceResult;
@class AWSCloudfrontLoggingConfig;
@class AWSCloudfrontOrigin;
@class AWSCloudfrontOriginCustomHeader;
@class AWSCloudfrontOriginGroup;
@class AWSCloudfrontOriginGroupFailoverCriteria;
@class AWSCloudfrontOriginGroupMember;
@class AWSCloudfrontOriginGroupMembers;
@class AWSCloudfrontOriginGroups;
@class AWSCloudfrontOriginSslProtocols;
@class AWSCloudfrontOrigins;
@class AWSCloudfrontPaths;
@class AWSCloudfrontPublicKey;
@class AWSCloudfrontPublicKeyConfig;
@class AWSCloudfrontPublicKeyList;
@class AWSCloudfrontPublicKeySummary;
@class AWSCloudfrontQueryArgProfile;
@class AWSCloudfrontQueryArgProfileConfig;
@class AWSCloudfrontQueryArgProfiles;
@class AWSCloudfrontQueryStringCacheKeys;
@class AWSCloudfrontRestrictions;
@class AWSCloudfrontS3Origin;
@class AWSCloudfrontS3OriginConfig;
@class AWSCloudfrontSigner;
@class AWSCloudfrontStatusCodes;
@class AWSCloudfrontStreamingDistribution;
@class AWSCloudfrontStreamingDistributionConfig;
@class AWSCloudfrontStreamingDistributionConfigWithTags;
@class AWSCloudfrontStreamingDistributionList;
@class AWSCloudfrontStreamingDistributionSummary;
@class AWSCloudfrontStreamingLoggingConfig;
@class AWSCloudfrontTag;
@class AWSCloudfrontTagKeys;
@class AWSCloudfrontTagResourceRequest;
@class AWSCloudfrontTags;
@class AWSCloudfrontTrustedSigners;
@class AWSCloudfrontUntagResourceRequest;
@class AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest;
@class AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult;
@class AWSCloudfrontUpdateDistributionRequest;
@class AWSCloudfrontUpdateDistributionResult;
@class AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest;
@class AWSCloudfrontUpdateFieldLevelEncryptionConfigResult;
@class AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest;
@class AWSCloudfrontUpdateFieldLevelEncryptionProfileResult;
@class AWSCloudfrontUpdatePublicKeyRequest;
@class AWSCloudfrontUpdatePublicKeyResult;
@class AWSCloudfrontUpdateStreamingDistributionRequest;
@class AWSCloudfrontUpdateStreamingDistributionResult;
@class AWSCloudfrontViewerCertificate;

/**
 <p>A complex type that lists the AWS accounts, if any, that you included in the <code>TrustedSigners</code> complex type for this distribution. These are the accounts that you want to allow to create signed URLs for private content.</p><p>The <code>Signer</code> complex type lists the AWS account number of the trusted signer or <code>self</code> if the signer is the AWS account that created the distribution. The <code>Signer</code> element also includes the IDs of any active CloudFront key pairs that are associated with the trusted signer's AWS account. If no <code>KeyPairId</code> element appears for a <code>Signer</code>, that signer can't create signed URLs. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Enabled, Quantity]
 */
@interface AWSCloudfrontActiveTrustedSigners : AWSModel


/**
 <p>Enabled is <code>true</code> if any of the AWS accounts listed in the <code>TrustedSigners</code> complex type for this distribution have active CloudFront key pairs. If not, <code>Enabled</code> is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A complex type that contains one <code>Signer</code> complex type for each trusted signer that is specified in the <code>TrustedSigners</code> complex type.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontSigner *> * _Nullable items;

/**
 <p>The number of trusted signers specified in the <code>TrustedSigners</code> complex type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>AWS services in China customers must file for an Internet Content Provider (ICP) recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME, that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs associated with distributions. The status is returned in the CloudFront response; you can't configure it yourself.</p><p>For more information about ICP recordals, see <a href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html"> Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS services in China</i>.</p>
 */
@interface AWSCloudfrontAliasICPRecordal : AWSModel


/**
 <p>A domain name associated with a distribution. </p>
 */
@property (nonatomic, strong) NSString * _Nullable CNAME;

/**
 <p>The Internet Content Provider (ICP) recordal status for a CNAME. The ICPRecordalStatus is set to APPROVED for all CNAMEs (aliases) in regions outside of China. </p><p>The status values returned are the following:</p><ul><li><p><b>APPROVED</b> indicates that the associated CNAME has a valid ICP recordal number. Multiple CNAMEs can be associated with a distribution, and CNAMEs can correspond to different ICP recordals. To be marked as APPROVED, that is, valid to use with China region, a CNAME must have one ICP recordal number associated with it.</p></li><li><p><b>SUSPENDED</b> indicates that the associated CNAME does not have a valid ICP recordal number.</p></li><li><p><b>PENDING</b> indicates that CloudFront can't determine the ICP recordal status of the CNAME associated with the distribution because there was an error in trying to determine the status. You can try again to see if the error is resolved in which case CloudFront returns an APPROVED or SUSPENDED status.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudfrontICPRecordalStatus ICPRecordalStatus;

@end

/**
 <p>A complex type that contains information about CNAMEs (alternate domain names), if any, for this distribution. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontAliases : AWSModel


/**
 <p>A complex type that contains the CNAME aliases, if any, that you want to associate with this distribution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of CNAME aliases, if any, that you want to associate with this distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. There are three choices:</p><ul><li><p>CloudFront forwards only <code>GET</code> and <code>HEAD</code> requests.</p></li><li><p>CloudFront forwards only <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests.</p></li><li><p>CloudFront forwards <code>GET, HEAD, OPTIONS, PUT, PATCH, POST</code>, and <code>DELETE</code> requests.</p></li></ul><p>If you pick the third choice, you may need to restrict access to your Amazon S3 bucket or to your custom origin so users can't perform operations that you don't want them to. For example, you might not want users to have permissions to delete objects from your origin.</p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontAllowedMethods : AWSModel


/**
 <p>A complex type that controls whether CloudFront caches the response to requests using the specified HTTP methods. There are two choices:</p><ul><li><p>CloudFront caches responses to <code>GET</code> and <code>HEAD</code> requests.</p></li><li><p>CloudFront caches responses to <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests.</p></li></ul><p>If you pick the second choice for your Amazon S3 Origin, you may need to forward Access-Control-Request-Method, Access-Control-Request-Headers, and Origin headers for the responses to be cached correctly. </p>
 */
@property (nonatomic, strong) AWSCloudfrontCachedMethods * _Nullable cachedMethods;

/**
 <p>A complex type that contains the HTTP methods that you want CloudFront to process and forward to your origin.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of HTTP methods that you want CloudFront to forward to your origin. Valid values are 2 (for <code>GET</code> and <code>HEAD</code> requests), 3 (for <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests) and 7 (for <code>GET, HEAD, OPTIONS, PUT, PATCH, POST</code>, and <code>DELETE</code> requests).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that describes how CloudFront processes requests.</p><p>You must create at least as many cache behaviors (including the default cache behavior) as you have origins if you want CloudFront to serve objects from all of the origins. Each cache behavior specifies the one origin from which you want CloudFront to get objects. If you have two origins and only the default cache behavior, the default cache behavior will cause CloudFront to get objects from one of the origins, but the other origin is never used.</p><p>For the current quota (formerly known as limit) on the number of cache behaviors that you can add to a distribution, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-limits.html">Quotas</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p>If you don’t want to specify any cache behaviors, include only an empty <code>CacheBehaviors</code> element. Don’t include an empty <code>CacheBehavior</code> element because this is invalid.</p><p>To delete all cache behaviors in an existing distribution, update the distribution configuration and include only an empty <code>CacheBehaviors</code> element.</p><p>To add, change, or remove one or more cache behaviors, update the distribution configuration and specify all of the cache behaviors that you want to include in the updated distribution.</p><p>For more information about cache behaviors, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior">Cache Behavior Settings</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [PathPattern, TargetOriginId, ForwardedValues, TrustedSigners, ViewerProtocolPolicy, MinTTL]
 */
@interface AWSCloudfrontCacheBehavior : AWSModel


/**
 <p>A complex type that controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. There are three choices:</p><ul><li><p>CloudFront forwards only <code>GET</code> and <code>HEAD</code> requests.</p></li><li><p>CloudFront forwards only <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests.</p></li><li><p>CloudFront forwards <code>GET, HEAD, OPTIONS, PUT, PATCH, POST</code>, and <code>DELETE</code> requests.</p></li></ul><p>If you pick the third choice, you may need to restrict access to your Amazon S3 bucket or to your custom origin so users can't perform operations that you don't want them to. For example, you might not want users to have permissions to delete objects from your origin.</p>
 */
@property (nonatomic, strong) AWSCloudfrontAllowedMethods * _Nullable allowedMethods;

/**
 <p>Whether you want CloudFront to automatically compress certain files for this cache behavior. If so, specify true; if not, specify false. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compress;

/**
 <p>The default amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. The value that you specify applies only when your origin does not add HTTP headers such as <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and <code>Expires</code> to objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultTTL;

/**
 <p>The value of <code>ID</code> for the field-level encryption configuration that you want CloudFront to use for encrypting specific fields of data for this cache behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldLevelEncryptionId;

/**
 <p>A complex type that specifies how CloudFront handles query strings, cookies, and HTTP headers.</p>
 */
@property (nonatomic, strong) AWSCloudfrontForwardedValues * _Nullable forwardedValues;

/**
 <p>A complex type that contains zero or more Lambda function associations for a cache behavior.</p>
 */
@property (nonatomic, strong) AWSCloudfrontLambdaFunctionAssociations * _Nullable lambdaFunctionAssociations;

/**
 <p>The maximum amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. The value that you specify applies only when your origin adds HTTP headers such as <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and <code>Expires</code> to objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxTTL;

/**
 <p>The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html"> Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i> Amazon CloudFront Developer Guide</i>.</p><p>You must specify <code>0</code> for <code>MinTTL</code> if you configure CloudFront to forward all headers to your origin (under <code>Headers</code>, if you specify <code>1</code> for <code>Quantity</code> and <code>*</code> for <code>Name</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minTTL;

/**
 <p>The pattern (for example, <code>images/*.jpg</code>) that specifies which requests to apply the behavior to. When CloudFront receives a viewer request, the requested path is compared with path patterns in the order in which cache behaviors are listed in the distribution.</p><note><p>You can optionally include a slash (<code>/</code>) at the beginning of the path pattern. For example, <code>/images/*.jpg</code>. CloudFront behavior is the same with or without the leading <code>/</code>.</p></note><p>The path pattern for the default cache behavior is <code>*</code> and cannot be changed. If the request for an object does not match the path pattern for any cache behaviors, CloudFront applies the behavior in the default cache behavior.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesPathPattern">Path Pattern</a> in the <i> Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPattern;

/**
 <p>Indicates whether you want to distribute media files in the Microsoft Smooth Streaming format using the origin that is associated with this cache behavior. If so, specify <code>true</code>; if not, specify <code>false</code>. If you specify <code>true</code> for <code>SmoothStreaming</code>, you can still distribute other content using this cache behavior if the content matches the value of <code>PathPattern</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable smoothStreaming;

/**
 <p>The value of <code>ID</code> for the origin that you want CloudFront to route requests to when they match this cache behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetOriginId;

/**
 <p>A complex type that specifies the AWS accounts, if any, that you want to allow to create signed URLs for private content.</p><p>If you want to require signed URLs in requests for objects in the target origin that match the <code>PathPattern</code> for this cache behavior, specify <code>true</code> for <code>Enabled</code>, and specify the applicable values for <code>Quantity</code> and <code>Items</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content with Signed URLs and Signed Cookies</a> in the <i>Amazon CloudFront Developer Guide</i>. </p><p>If you don’t want to require signed URLs in requests for objects that match <code>PathPattern</code>, specify <code>false</code> for <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit <code>Items</code>.</p><p>To add, change, or remove one or more trusted signers, change <code>Enabled</code> to <code>true</code> (if it’s currently <code>false</code>), change <code>Quantity</code> as applicable, and specify all of the trusted signers that you want to include in the updated distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTrustedSigners * _Nullable trustedSigners;

/**
 <p>The protocol that viewers can use to access the files in the origin specified by <code>TargetOriginId</code> when a request matches the path pattern in <code>PathPattern</code>. You can specify the following options:</p><ul><li><p><code>allow-all</code>: Viewers can use HTTP or HTTPS.</p></li><li><p><code>redirect-to-https</code>: If a viewer submits an HTTP request, CloudFront returns an HTTP status code of 301 (Moved Permanently) to the viewer along with the HTTPS URL. The viewer then resubmits the request using the new URL. </p></li><li><p><code>https-only</code>: If a viewer sends an HTTP request, CloudFront returns an HTTP status code of 403 (Forbidden). </p></li></ul><p>For more information about requiring the HTTPS protocol, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html">Requiring HTTPS Between Viewers and CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><note><p>The only way to guarantee that viewers retrieve an object that was fetched from the origin using HTTPS is never to use any other protocol to fetch the object. If you have recently changed from HTTP to HTTPS, we recommend that you clear your objects’ cache because cached objects are protocol agnostic. That means that an edge location will return an object from the cache regardless of whether the current request protocol matches the protocol used previously. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing Cache Expiration</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></note>
 */
@property (nonatomic, assign) AWSCloudfrontViewerProtocolPolicy viewerProtocolPolicy;

@end

/**
 <p>A complex type that contains zero or more <code>CacheBehavior</code> elements. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontCacheBehaviors : AWSModel


/**
 <p>Optional: A complex type that contains cache behaviors for this distribution. If <code>Quantity</code> is <code>0</code>, you can omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontCacheBehavior *> * _Nullable items;

/**
 <p>The number of cache behaviors for this distribution. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that controls whether CloudFront caches the response to requests using the specified HTTP methods. There are two choices:</p><ul><li><p>CloudFront caches responses to <code>GET</code> and <code>HEAD</code> requests.</p></li><li><p>CloudFront caches responses to <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests.</p></li></ul><p>If you pick the second choice for your Amazon S3 Origin, you may need to forward Access-Control-Request-Method, Access-Control-Request-Headers, and Origin headers for the responses to be cached correctly. </p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontCachedMethods : AWSModel


/**
 <p>A complex type that contains the HTTP methods that you want CloudFront to cache responses to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of HTTP methods for which you want CloudFront to cache responses. Valid values are <code>2</code> (for caching responses to <code>GET</code> and <code>HEAD</code> requests) and <code>3</code> (for caching responses to <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>CloudFront origin access identity.</p>
 Required parameters: [Id, S3CanonicalUserId]
 */
@interface AWSCloudfrontCloudFrontOriginAccessIdentity : AWSModel


/**
 <p>The current configuration information for the identity. </p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentityConfig * _Nullable cloudFrontOriginAccessIdentityConfig;

/**
 <p>The ID for the origin access identity, for example, <code>E74FTE3AJFJ256A</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon S3 canonical user ID for the origin access identity, used when giving the origin access identity read permission to an object in Amazon S3. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3CanonicalUserId;

@end

/**
 <p>Origin access identity configuration. Send a <code>GET</code> request to the <code>/<i>CloudFront API version</i>/CloudFront/identity ID/config</code> resource. </p>
 Required parameters: [CallerReference, Comment]
 */
@interface AWSCloudfrontCloudFrontOriginAccessIdentityConfig : AWSModel


/**
 <p>A unique value (for example, a date-time stamp) that ensures that the request can't be replayed.</p><p>If the value of <code>CallerReference</code> is new (regardless of the content of the <code>CloudFrontOriginAccessIdentityConfig</code> object), a new origin access identity is created.</p><p>If the <code>CallerReference</code> is a value already sent in a previous identity request, and the content of the <code>CloudFrontOriginAccessIdentityConfig</code> is identical to the original request (ignoring white space), the response includes the same information returned to the original request. </p><p>If the <code>CallerReference</code> is a value you already sent in a previous request to create an identity, but the content of the <code>CloudFrontOriginAccessIdentityConfig</code> is different from the original request, CloudFront returns a <code>CloudFrontOriginAccessIdentityAlreadyExists</code> error. </p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>Any comments you want to include about the origin access identity. </p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

@end

/**
 <p>Lists the origin access identities for CloudFront.Send a <code>GET</code> request to the <code>/<i>CloudFront API version</i>/origin-access-identity/cloudfront</code> resource. The response includes a <code>CloudFrontOriginAccessIdentityList</code> element with zero or more <code>CloudFrontOriginAccessIdentitySummary</code> child elements. By default, your entire list of origin access identities is returned in one single page. If the list is long, you can paginate it using the <code>MaxItems</code> and <code>Marker</code> parameters.</p>
 Required parameters: [Marker, MaxItems, IsTruncated, Quantity]
 */
@interface AWSCloudfrontCloudFrontOriginAccessIdentityList : AWSModel


/**
 <p>A flag that indicates whether more origin access identities remain to be listed. If your results were truncated, you can make a follow-up pagination request using the <code>Marker</code> request parameter to retrieve more items in the list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>A complex type that contains one <code>CloudFrontOriginAccessIdentitySummary</code> element for each origin access identity that was created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontCloudFrontOriginAccessIdentitySummary *> * _Nullable items;

/**
 <p>Use this when paginating results to indicate where to begin in your list of origin access identities. The results include identities in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last identity on that page). </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of origin access identities you want in the response body. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value you can use for the <code>Marker</code> request parameter to continue listing your origin access identities where they left off. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of CloudFront origin access identities that were created by the current AWS account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>Summary of the information about a CloudFront origin access identity.</p>
 Required parameters: [Id, S3CanonicalUserId, Comment]
 */
@interface AWSCloudfrontCloudFrontOriginAccessIdentitySummary : AWSModel


/**
 <p>The comment for this origin access identity, as originally specified when created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The ID for the origin access identity. For example: <code>E74FTE3AJFJ256A</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin access identity read permission to an object in Amazon S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3CanonicalUserId;

@end

/**
 <p>A field-level encryption content type profile. </p>
 Required parameters: [Format, ContentType]
 */
@interface AWSCloudfrontContentTypeProfile : AWSModel


/**
 <p>The content type for a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The format for a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, assign) AWSCloudfrontFormat format;

/**
 <p>The profile ID for a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, strong) NSString * _Nullable profileId;

@end

/**
 <p>The configuration for a field-level encryption content type-profile mapping. </p>
 Required parameters: [ForwardWhenContentTypeIsUnknown]
 */
@interface AWSCloudfrontContentTypeProfileConfig : AWSModel


/**
 <p>The configuration for a field-level encryption content type-profile. </p>
 */
@property (nonatomic, strong) AWSCloudfrontContentTypeProfiles * _Nullable contentTypeProfiles;

/**
 <p>The setting in a field-level encryption content type-profile mapping that specifies what to do when an unknown content type is provided for the profile. If true, content is forwarded without being encrypted when the content type is unknown. If false (the default), an error is returned when the content type is unknown. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forwardWhenContentTypeIsUnknown;

@end

/**
 <p>Field-level encryption content type-profile. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontContentTypeProfiles : AWSModel


/**
 <p>Items in a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontContentTypeProfile *> * _Nullable items;

/**
 <p>The number of field-level encryption content type-profile mappings. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that specifies whether you want CloudFront to forward cookies to the origin and, if so, which ones. For more information about forwarding cookies to the origin, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html"> Caching Content Based on Request Headers</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontCookieNames : AWSModel


/**
 <p>A complex type that contains one <code>Name</code> element for each cookie that you want CloudFront to forward to the origin for this cache behavior. It must contain the same number of items that is specified in the <code>Quantity</code> field.</p><p>When you set <code>Forward = whitelist</code> (in the <code>CookiePreferences</code> object), this field must contain at least one item.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of different cookies that you want CloudFront to forward to the origin for this cache behavior. The value must equal the number of items that are in the <code>Items</code> field.</p><p>When you set <code>Forward = whitelist</code> (in the <code>CookiePreferences</code> object), this value must be <code>1</code> or higher.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that specifies whether you want CloudFront to forward cookies to the origin and, if so, which ones. For more information about forwarding cookies to the origin, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">Caching Content Based on Cookies</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Forward]
 */
@interface AWSCloudfrontCookiePreference : AWSModel


/**
 <p>Specifies which cookies to forward to the origin for this cache behavior: all, none, or the list of cookies specified in the <code>WhitelistedNames</code> complex type.</p><p>Amazon S3 doesn't process cookies. When the cache behavior is forwarding requests to an Amazon S3 origin, specify none for the <code>Forward</code> element.</p>
 */
@property (nonatomic, assign) AWSCloudfrontItemSelection forward;

/**
 <p>Required if you specify <code>whitelist</code> for the value of <code>Forward</code>. A complex type that specifies how many different cookies you want CloudFront to forward to the origin for this cache behavior and, if you want to forward selected cookies, the names of those cookies.</p><p>If you specify <code>all</code> or <code>none</code> for the value of <code>Forward</code>, omit <code>WhitelistedNames</code>. If you change the value of <code>Forward</code> from <code>whitelist</code> to <code>all</code> or <code>none</code> and you don't delete the <code>WhitelistedNames</code> element and its child elements, CloudFront deletes them automatically.</p><p>For the current limit on the number of cookie names that you can whitelist for each cache behavior, see <a href="https://docs.aws.amazon.com/general/latest/gr/xrefaws_service_limits.html#limits_cloudfront"> CloudFront Limits</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCookieNames * _Nullable whitelistedNames;

@end

/**
 <p>The request to create a new origin access identity (OAI). An origin access identity is a special CloudFront user that you can associate with Amazon S3 origins, so that you can secure all or just some of your Amazon S3 content. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html"> Restricting Access to Amazon S3 Content by Using an Origin Access Identity</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 Required parameters: [CloudFrontOriginAccessIdentityConfig]
 */
@interface AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest : AWSRequest


/**
 <p>The current configuration information for the identity.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentityConfig * _Nullable cloudFrontOriginAccessIdentityConfig;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult : AWSModel


/**
 <p>The origin access identity's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentity * _Nullable cloudFrontOriginAccessIdentity;

/**
 <p>The current version of the origin access identity created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new origin access identity just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/origin-access-identity/cloudfront/E74FTE3AJFJ256A</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>The request to create a new distribution.</p>
 Required parameters: [DistributionConfig]
 */
@interface AWSCloudfrontCreateDistributionRequest : AWSRequest


/**
 <p>The distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfig * _Nullable distributionConfig;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontCreateDistributionResult : AWSModel


/**
 <p>The distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistribution * _Nullable distribution;

/**
 <p>The current version of the distribution created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new distribution resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>The request to create a new distribution with tags. </p>
 Required parameters: [DistributionConfigWithTags]
 */
@interface AWSCloudfrontCreateDistributionWithTagsRequest : AWSRequest


/**
 <p>The distribution's configuration information. </p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfigWithTags * _Nullable distributionConfigWithTags;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontCreateDistributionWithTagsResult : AWSModel


/**
 <p>The distribution's information. </p>
 */
@property (nonatomic, strong) AWSCloudfrontDistribution * _Nullable distribution;

/**
 <p>The current version of the distribution created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new distribution resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 
 */
@interface AWSCloudfrontCreateFieldLevelEncryptionConfigRequest : AWSRequest


/**
 <p>The request to create a new field-level encryption configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionConfig * _Nullable fieldLevelEncryptionConfig;

@end

/**
 
 */
@interface AWSCloudfrontCreateFieldLevelEncryptionConfigResult : AWSModel


/**
 <p>The current version of the field level encryption configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Returned when you create a new field-level encryption configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryption * _Nullable fieldLevelEncryption;

/**
 <p>The fully qualified URI of the new configuration resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/field-level-encryption-config/EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 
 */
@interface AWSCloudfrontCreateFieldLevelEncryptionProfileRequest : AWSRequest


/**
 <p>The request to create a field-level encryption profile.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfileConfig * _Nullable fieldLevelEncryptionProfileConfig;

@end

/**
 
 */
@interface AWSCloudfrontCreateFieldLevelEncryptionProfileResult : AWSModel


/**
 <p>The current version of the field level encryption profile. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Returned when you create a new field-level encryption profile.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfile * _Nullable fieldLevelEncryptionProfile;

/**
 <p>The fully qualified URI of the new profile resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/field-level-encryption-profile/EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 <p>The request to create an invalidation.</p>
 Required parameters: [DistributionId, InvalidationBatch]
 */
@interface AWSCloudfrontCreateInvalidationRequest : AWSRequest


/**
 <p>The distribution's id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionId;

/**
 <p>The batch information for the invalidation.</p>
 */
@property (nonatomic, strong) AWSCloudfrontInvalidationBatch * _Nullable invalidationBatch;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontCreateInvalidationResult : AWSModel


/**
 <p>The invalidation's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontInvalidation * _Nullable invalidation;

/**
 <p>The fully qualified URI of the distribution and invalidation batch request, including the <code>Invalidation ID</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

@end

/**
 
 */
@interface AWSCloudfrontCreatePublicKeyRequest : AWSRequest


/**
 <p>The request to add a public key to CloudFront.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKeyConfig * _Nullable publicKeyConfig;

@end

/**
 
 */
@interface AWSCloudfrontCreatePublicKeyResult : AWSModel


/**
 <p>The current version of the public key. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new public key resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/cloudfront-public-key/EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>Returned when you add a public key.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKey * _Nullable publicKey;

@end

/**
 <p>The request to create a new streaming distribution.</p>
 Required parameters: [StreamingDistributionConfig]
 */
@interface AWSCloudfrontCreateStreamingDistributionRequest : AWSRequest


/**
 <p>The streaming distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfig * _Nullable streamingDistributionConfig;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontCreateStreamingDistributionResult : AWSModel


/**
 <p>The current version of the streaming distribution created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new streaming distribution resource just created. For example: <code>https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The streaming distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistribution * _Nullable streamingDistribution;

@end

/**
 <p>The request to create a new streaming distribution with tags.</p>
 Required parameters: [StreamingDistributionConfigWithTags]
 */
@interface AWSCloudfrontCreateStreamingDistributionWithTagsRequest : AWSRequest


/**
 <p> The streaming distribution's configuration information. </p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfigWithTags * _Nullable streamingDistributionConfigWithTags;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontCreateStreamingDistributionWithTagsResult : AWSModel


/**
 <p>The current version of the distribution created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The fully qualified URI of the new streaming distribution resource just created. For example:<code> https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The streaming distribution's information. </p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistribution * _Nullable streamingDistribution;

@end

/**
 <p>A complex type that controls:</p><ul><li><p>Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with custom error messages before returning the response to the viewer. </p></li><li><p>How long CloudFront caches HTTP status codes in the 4xx and 5xx range.</p></li></ul><p>For more information about custom error pages, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [ErrorCode]
 */
@interface AWSCloudfrontCustomErrorResponse : AWSModel


/**
 <p>The minimum amount of time, in seconds, that you want CloudFront to cache the HTTP status code specified in <code>ErrorCode</code>. When this time period has elapsed, CloudFront queries your origin to see whether the problem that caused the error has been resolved and the requested object is now available.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorCachingMinTTL;

/**
 <p>The HTTP status code for which you want to specify a custom error page and/or a caching duration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable errorCode;

/**
 <p>The HTTP status code that you want CloudFront to return to the viewer along with the custom error page. There are a variety of reasons that you might want CloudFront to return a status code different from the status code that your origin returned to CloudFront, for example:</p><ul><li><p>Some Internet devices (some firewalls and corporate proxies, for example) intercept HTTP 4xx and 5xx and prevent the response from being returned to the viewer. If you substitute <code>200</code>, the response typically won't be intercepted.</p></li><li><p>If you don't care about distinguishing among different client errors or server errors, you can specify <code>400</code> or <code>500</code> as the <code>ResponseCode</code> for all 4xx or 5xx errors.</p></li><li><p>You might want to return a <code>200</code> status code (OK) and static website so your customers don't know that your website is down.</p></li></ul><p>If you specify a value for <code>ResponseCode</code>, you must also specify a value for <code>ResponsePagePath</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCode;

/**
 <p>The path to the custom error page that you want CloudFront to return to a viewer when your origin returns the HTTP status code specified by <code>ErrorCode</code>, for example, <code>/4xx-errors/403-forbidden.html</code>. If you want to store your objects and your custom error pages in different locations, your distribution must include a cache behavior for which the following is true:</p><ul><li><p>The value of <code>PathPattern</code> matches the path to your custom error messages. For example, suppose you saved custom error pages for 4xx errors in an Amazon S3 bucket in a directory named <code>/4xx-errors</code>. Your distribution must include a cache behavior for which the path pattern routes requests for your custom error pages to that location, for example, <code>/4xx-errors/*</code>. </p></li><li><p>The value of <code>TargetOriginId</code> specifies the value of the <code>ID</code> element for the origin that contains your custom error pages.</p></li></ul><p>If you specify a value for <code>ResponsePagePath</code>, you must also specify a value for <code>ResponseCode</code>.</p><p>We recommend that you store custom error pages in an Amazon S3 bucket. If you store custom error pages on an HTTP server and the server starts to return 5xx errors, CloudFront can't get the files that you want to return to viewers because the origin server is unavailable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable responsePagePath;

@end

/**
 <p>A complex type that controls:</p><ul><li><p>Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with custom error messages before returning the response to the viewer.</p></li><li><p>How long CloudFront caches HTTP status codes in the 4xx and 5xx range.</p></li></ul><p>For more information about custom error pages, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontCustomErrorResponses : AWSModel


/**
 <p>A complex type that contains a <code>CustomErrorResponse</code> element for each HTTP status code for which you want to specify a custom error page and/or a caching duration. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontCustomErrorResponse *> * _Nullable items;

/**
 <p>The number of HTTP status codes for which you want to specify a custom error page and/or a caching duration. If <code>Quantity</code> is <code>0</code>, you can omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains the list of Custom Headers for each origin. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontCustomHeaders : AWSModel


/**
 <p><b>Optional</b>: A list that contains one <code>OriginCustomHeader</code> element for each custom header that you want CloudFront to forward to the origin. If Quantity is <code>0</code>, omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontOriginCustomHeader *> * _Nullable items;

/**
 <p>The number of custom headers, if any, for this distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A custom origin. A custom origin is any origin that is <i>not</i> an Amazon S3 bucket, with one exception. An Amazon S3 bucket that is <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">configured with static website hosting</a><i>is</i> a custom origin.</p>
 Required parameters: [HTTPPort, HTTPSPort, OriginProtocolPolicy]
 */
@interface AWSCloudfrontCustomOriginConfig : AWSModel


/**
 <p>The HTTP port that CloudFront uses to connect to the origin. Specify the HTTP port that the origin listens on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable HTTPPort;

/**
 <p>The HTTPS port that CloudFront uses to connect to the origin. Specify the HTTPS port that the origin listens on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable HTTPSPort;

/**
 <p>Specifies how long, in seconds, CloudFront persists its connection to the origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the default (if you don’t specify otherwise) is 5 seconds.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginKeepaliveTimeout">Origin Keep-alive Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable originKeepaliveTimeout;

/**
 <p>Specifies the protocol (HTTP or HTTPS) that CloudFront uses to connect to the origin. Valid values are:</p><ul><li><p><code>http-only</code> – CloudFront always uses HTTP to connect to the origin.</p></li><li><p><code>match-viewer</code> – CloudFront connects to the origin using the same protocol that the viewer used to connect to CloudFront.</p></li><li><p><code>https-only</code> – CloudFront always uses HTTPS to connect to the origin.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudfrontOriginProtocolPolicy originProtocolPolicy;

/**
 <p>Specifies how long, in seconds, CloudFront waits for a response from the origin. This is also known as the <i>origin response timeout</i>. The minimum timeout is 1 second, the maximum is 60 seconds, and the default (if you don’t specify otherwise) is 30 seconds.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginResponseTimeout">Origin Response Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable originReadTimeout;

/**
 <p>Specifies the minimum SSL/TLS protocol that CloudFront uses when connecting to your origin over HTTPS. Valid values include <code>SSLv3</code>, <code>TLSv1</code>, <code>TLSv1.1</code>, and <code>TLSv1.2</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginSSLProtocols">Minimum Origin SSL Protocol</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOriginSslProtocols * _Nullable originSslProtocols;

@end

/**
 <p>A complex type that describes the default cache behavior if you don’t specify a <code>CacheBehavior</code> element or if request URLs don’t match any of the values of <code>PathPattern</code> in <code>CacheBehavior</code> elements. You must create exactly one default cache behavior.</p>
 Required parameters: [TargetOriginId, ForwardedValues, TrustedSigners, ViewerProtocolPolicy, MinTTL]
 */
@interface AWSCloudfrontDefaultCacheBehavior : AWSModel


/**
 <p>A complex type that controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. There are three choices:</p><ul><li><p>CloudFront forwards only <code>GET</code> and <code>HEAD</code> requests.</p></li><li><p>CloudFront forwards only <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests.</p></li><li><p>CloudFront forwards <code>GET, HEAD, OPTIONS, PUT, PATCH, POST</code>, and <code>DELETE</code> requests.</p></li></ul><p>If you pick the third choice, you may need to restrict access to your Amazon S3 bucket or to your custom origin so users can't perform operations that you don't want them to. For example, you might not want users to have permissions to delete objects from your origin.</p>
 */
@property (nonatomic, strong) AWSCloudfrontAllowedMethods * _Nullable allowedMethods;

/**
 <p>Whether you want CloudFront to automatically compress certain files for this cache behavior. If so, specify <code>true</code>; if not, specify <code>false</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compress;

/**
 <p>The default amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. The value that you specify applies only when your origin does not add HTTP headers such as <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and <code>Expires</code> to objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultTTL;

/**
 <p>The value of <code>ID</code> for the field-level encryption configuration that you want CloudFront to use for encrypting specific fields of data for the default cache behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fieldLevelEncryptionId;

/**
 <p>A complex type that specifies how CloudFront handles query strings, cookies, and HTTP headers.</p>
 */
@property (nonatomic, strong) AWSCloudfrontForwardedValues * _Nullable forwardedValues;

/**
 <p>A complex type that contains zero or more Lambda function associations for a cache behavior.</p>
 */
@property (nonatomic, strong) AWSCloudfrontLambdaFunctionAssociations * _Nullable lambdaFunctionAssociations;

/**
 <p>The maximum amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. The value that you specify applies only when your origin adds HTTP headers such as <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and <code>Expires</code> to objects. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxTTL;

/**
 <p>The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront forwards another request to your origin to determine whether the object has been updated. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p>You must specify <code>0</code> for <code>MinTTL</code> if you configure CloudFront to forward all headers to your origin (under <code>Headers</code>, if you specify <code>1</code> for <code>Quantity</code> and <code>*</code> for <code>Name</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minTTL;

/**
 <p>Indicates whether you want to distribute media files in the Microsoft Smooth Streaming format using the origin that is associated with this cache behavior. If so, specify <code>true</code>; if not, specify <code>false</code>. If you specify <code>true</code> for <code>SmoothStreaming</code>, you can still distribute other content using this cache behavior if the content matches the value of <code>PathPattern</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable smoothStreaming;

/**
 <p>The value of <code>ID</code> for the origin that you want CloudFront to route requests to when they use the default cache behavior.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetOriginId;

/**
 <p>A complex type that specifies the AWS accounts, if any, that you want to allow to create signed URLs for private content.</p><p>If you want to require signed URLs in requests for objects in the target origin that match the <code>PathPattern</code> for this cache behavior, specify <code>true</code> for <code>Enabled</code>, and specify the applicable values for <code>Quantity</code> and <code>Items</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content with Signed URLs and Signed Cookies</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p>If you don’t want to require signed URLs in requests for objects that match <code>PathPattern</code>, specify <code>false</code> for <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit <code>Items</code>.</p><p>To add, change, or remove one or more trusted signers, change <code>Enabled</code> to <code>true</code> (if it’s currently <code>false</code>), change <code>Quantity</code> as applicable, and specify all of the trusted signers that you want to include in the updated distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTrustedSigners * _Nullable trustedSigners;

/**
 <p>The protocol that viewers can use to access the files in the origin specified by <code>TargetOriginId</code> when a request matches the path pattern in <code>PathPattern</code>. You can specify the following options:</p><ul><li><p><code>allow-all</code>: Viewers can use HTTP or HTTPS.</p></li><li><p><code>redirect-to-https</code>: If a viewer submits an HTTP request, CloudFront returns an HTTP status code of 301 (Moved Permanently) to the viewer along with the HTTPS URL. The viewer then resubmits the request using the new URL.</p></li><li><p><code>https-only</code>: If a viewer sends an HTTP request, CloudFront returns an HTTP status code of 403 (Forbidden).</p></li></ul><p>For more information about requiring the HTTPS protocol, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html">Requiring HTTPS Between Viewers and CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><note><p>The only way to guarantee that viewers retrieve an object that was fetched from the origin using HTTPS is never to use any other protocol to fetch the object. If you have recently changed from HTTP to HTTPS, we recommend that you clear your objects’ cache because cached objects are protocol agnostic. That means that an edge location will return an object from the cache regardless of whether the current request protocol matches the protocol used previously. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing Cache Expiration</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></note>
 */
@property (nonatomic, assign) AWSCloudfrontViewerProtocolPolicy viewerProtocolPolicy;

@end

/**
 <p>Deletes a origin access identity.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest : AWSRequest


/**
 <p>The origin access identity's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header you received from a previous <code>GET</code> or <code>PUT</code> request. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 <p>This action deletes a web distribution. To delete a web distribution using the CloudFront API, perform the following steps.</p><p><b>To delete a web distribution using the CloudFront API:</b></p><ol><li><p>Disable the web distribution </p></li><li><p>Submit a <code>GET Distribution Config</code> request to get the current configuration and the <code>Etag</code> header for the distribution.</p></li><li><p>Update the XML document that was returned in the response to your <code>GET Distribution Config</code> request to change the value of <code>Enabled</code> to <code>false</code>.</p></li><li><p>Submit a <code>PUT Distribution Config</code> request to update the configuration for your distribution. In the request body, include the XML document that you updated in Step 3. Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Distribution Config</code> request in Step 2.</p></li><li><p>Review the response to the <code>PUT Distribution Config</code> request to confirm that the distribution was successfully disabled.</p></li><li><p>Submit a <code>GET Distribution</code> request to confirm that your changes have propagated. When propagation is complete, the value of <code>Status</code> is <code>Deployed</code>.</p></li><li><p>Submit a <code>DELETE Distribution</code> request. Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Distribution Config</code> request in Step 6.</p></li><li><p>Review the response to your <code>DELETE Distribution</code> request to confirm that the distribution was successfully deleted.</p></li></ol><p>For information about deleting a distribution using the CloudFront console, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontDeleteDistributionRequest : AWSRequest


/**
 <p>The distribution ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when you disabled the distribution. For example: <code>E2QWRUHAPOMQZL</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 
 */
@interface AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest : AWSRequest


/**
 <p>The ID of the configuration you want to delete from CloudFront.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the configuration identity to delete. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 
 */
@interface AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest : AWSRequest


/**
 <p>Request the ID of the profile you want to delete from CloudFront.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the profile to delete. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 
 */
@interface AWSCloudfrontDeletePublicKeyRequest : AWSRequest


/**
 <p>The ID of the public key you want to remove from CloudFront.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the public key identity to delete. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 <p>The request to delete a streaming distribution.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontDeleteStreamingDistributionRequest : AWSRequest


/**
 <p>The distribution ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when you disabled the streaming distribution. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 <p>A distribution tells CloudFront where you want content to be delivered from, and the details about how to track and manage content delivery.</p>
 Required parameters: [Id, ARN, Status, LastModifiedTime, InProgressInvalidationBatches, DomainName, ActiveTrustedSigners, DistributionConfig]
 */
@interface AWSCloudfrontDistribution : AWSModel


/**
 <p>The ARN (Amazon Resource Name) for the distribution. For example: <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>, where <code>123456789012</code> is your AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>CloudFront automatically adds this element to the response only if you've set up the distribution to serve private content with signed URLs. The element lists the key pair IDs that CloudFront is aware of for each trusted signer. The <code>Signer</code> child element lists the AWS account number of the trusted signer (or an empty <code>Self</code> element if the signer is you). The <code>Signer</code> element also includes the IDs of any active key pairs associated with the trusted signer's AWS account. If no <code>KeyPairId</code> element appears for a <code>Signer</code>, that signer can't create working signed URLs.</p>
 */
@property (nonatomic, strong) AWSCloudfrontActiveTrustedSigners * _Nullable activeTrustedSigners;

/**
 <p>AWS services in China customers must file for an Internet Content Provider (ICP) recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME, that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs associated with distributions.</p><p>For more information about ICP recordals, see <a href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html"> Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS services in China</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontAliasICPRecordal *> * _Nullable aliasICPRecordals;

/**
 <p>The current configuration information for the distribution. Send a <code>GET</code> request to the <code>/<i>CloudFront API version</i>/distribution ID/config</code> resource.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfig * _Nullable distributionConfig;

/**
 <p>The domain name corresponding to the distribution, for example, <code>d111111abcdef8.cloudfront.net</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The identifier for the distribution. For example: <code>EDFDVBD632BHDS5</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The number of invalidation batches currently in progress. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgressInvalidationBatches;

/**
 <p>The date and time the distribution was last modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>This response element indicates the current status of the distribution. When the status is <code>Deployed</code>, the distribution's information is fully propagated to all CloudFront edge locations. </p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A distribution configuration.</p>
 Required parameters: [CallerReference, Origins, DefaultCacheBehavior, Comment, Enabled]
 */
@interface AWSCloudfrontDistributionConfig : AWSModel


/**
 <p>A complex type that contains information about CNAMEs (alternate domain names), if any, for this distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontAliases * _Nullable aliases;

/**
 <p>A complex type that contains zero or more <code>CacheBehavior</code> elements. </p>
 */
@property (nonatomic, strong) AWSCloudfrontCacheBehaviors * _Nullable cacheBehaviors;

/**
 <p>A unique value (for example, a date-time stamp) that ensures that the request can't be replayed.</p><p>If the value of <code>CallerReference</code> is new (regardless of the content of the <code>DistributionConfig</code> object), CloudFront creates a new distribution.</p><p>If <code>CallerReference</code> is a value that you already sent in a previous request to create a distribution, CloudFront returns a <code>DistributionAlreadyExists</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>Any comments you want to include about the distribution.</p><p>If you don't want to specify a comment, include an empty <code>Comment</code> element.</p><p>To delete an existing comment, update the distribution configuration and include an empty <code>Comment</code> element.</p><p>To add or change a comment, update the distribution configuration and specify the new comment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A complex type that controls the following:</p><ul><li><p>Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with custom error messages before returning the response to the viewer.</p></li><li><p>How long CloudFront caches HTTP status codes in the 4xx and 5xx range.</p></li></ul><p>For more information about custom error pages, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCustomErrorResponses * _Nullable customErrorResponses;

/**
 <p>A complex type that describes the default cache behavior if you don't specify a <code>CacheBehavior</code> element or if files don't match any of the values of <code>PathPattern</code> in <code>CacheBehavior</code> elements. You must create exactly one default cache behavior.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDefaultCacheBehavior * _Nullable defaultCacheBehavior;

/**
 <p>The object that you want CloudFront to request from your origin (for example, <code>index.html</code>) when a viewer requests the root URL for your distribution (<code>http://www.example.com</code>) instead of an object in your distribution (<code>http://www.example.com/product-description.html</code>). Specifying a default root object avoids exposing the contents of your distribution.</p><p>Specify only the object name, for example, <code>index.html</code>. Don't add a <code>/</code> before the object name.</p><p>If you don't want to specify a default root object when you create a distribution, include an empty <code>DefaultRootObject</code> element.</p><p>To delete the default root object from an existing distribution, update the distribution configuration and include an empty <code>DefaultRootObject</code> element.</p><p>To replace the default root object, update the distribution configuration and specify the new object.</p><p>For more information about the default root object, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DefaultRootObject.html">Creating a Default Root Object</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRootObject;

/**
 <p>From this field, you can enable or disable the selected distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>(Optional) Specify the maximum HTTP version that you want viewers to use to communicate with CloudFront. The default value for new web distributions is http2. Viewers that don't support HTTP/2 automatically use an earlier HTTP version.</p><p>For viewers and CloudFront to use HTTP/2, viewers must support TLS 1.2 or later, and must support Server Name Identification (SNI).</p><p>In general, configuring CloudFront to communicate with viewers using HTTP/2 reduces latency. You can improve performance by optimizing for HTTP/2. For more information, do an Internet search for "http/2 optimization." </p>
 */
@property (nonatomic, assign) AWSCloudfrontHttpVersion httpVersion;

/**
 <p>If you want CloudFront to respond to IPv6 DNS requests with an IPv6 address for your distribution, specify <code>true</code>. If you specify <code>false</code>, CloudFront responds to IPv6 DNS requests with the DNS response code <code>NOERROR</code> and with no IP addresses. This allows viewers to submit a second request, for an IPv4 address for your distribution. </p><p>In general, you should enable IPv6 if you have users on IPv6 networks who want to access your content. However, if you're using signed URLs or signed cookies to restrict access to your content, and if you're using a custom policy that includes the <code>IpAddress</code> parameter to restrict the IP addresses that can access your content, don't enable IPv6. If you want to restrict access to some content by IP address and not restrict access to other content (or restrict access but not by IP address), you can create two distributions. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-creating-signed-url-custom-policy.html">Creating a Signed URL Using a Custom Policy</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p>If you're using an Amazon Route 53 alias resource record set to route traffic to your CloudFront distribution, you need to create a second alias resource record set when both of the following are true:</p><ul><li><p>You enable IPv6 for the distribution</p></li><li><p>You're using alternate domain names in the URLs for your objects</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html">Routing Traffic to an Amazon CloudFront Web Distribution by Using Your Domain Name</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>If you created a CNAME resource record set, either with Amazon Route 53 or with another DNS service, you don't need to make any changes. A CNAME record will route traffic to your distribution regardless of the IP address format of the viewer request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isIPV6Enabled;

/**
 <p>A complex type that controls whether access logs are written for the distribution.</p><p>For more information about logging, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html">Access Logs</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontLoggingConfig * _Nullable logging;

/**
 <p> A complex type that contains information about origin groups for this distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOriginGroups * _Nullable originGroups;

/**
 <p>A complex type that contains information about origins for this distribution. </p>
 */
@property (nonatomic, strong) AWSCloudfrontOrigins * _Nullable origins;

/**
 <p>The price class that corresponds with the maximum price that you want to pay for CloudFront service. If you specify <code>PriceClass_All</code>, CloudFront responds to requests for your objects from all CloudFront edge locations.</p><p>If you specify a price class other than <code>PriceClass_All</code>, CloudFront serves your objects from the CloudFront edge location that has the lowest latency among the edge locations in your price class. Viewers who are in or near regions that are excluded from your specified price class may encounter slower performance.</p><p>For more information about price classes, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html">Choosing the Price Class for a CloudFront Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>. For information about CloudFront pricing, including how price classes (such as Price Class 100) map to CloudFront regions, see <a href="http://aws.amazon.com/cloudfront/pricing/">Amazon CloudFront Pricing</a>. For price class information, scroll down to see the table at the bottom of the page.</p>
 */
@property (nonatomic, assign) AWSCloudfrontPriceClass priceClass;

/**
 <p>A complex type that identifies ways in which you want to restrict distribution of your content.</p>
 */
@property (nonatomic, strong) AWSCloudfrontRestrictions * _Nullable restrictions;

/**
 <p>A complex type that determines the distribution’s SSL/TLS configuration for communicating with viewers.</p>
 */
@property (nonatomic, strong) AWSCloudfrontViewerCertificate * _Nullable viewerCertificate;

/**
 <p>A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution. To specify a web ACL created using the latest version of AWS WAF, use the ACL ARN, for example <code>arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/473e64fd-f30b-4765-81a0-62ad96dd167a</code>. To specify a web ACL created using AWS WAF Classic, use the ACL ID, for example <code>473e64fd-f30b-4765-81a0-62ad96dd167a</code>.</p><p>AWS WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to CloudFront, and lets you control access to your content. Based on conditions that you specify, such as the IP addresses that requests originate from or the values of query strings, CloudFront responds to requests either with the requested content or with an HTTP 403 status code (Forbidden). You can also configure CloudFront to return a custom error page when a request is blocked. For more information about AWS WAF, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html">AWS WAF Developer Guide</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 <p>A distribution Configuration and a list of tags to be associated with the distribution.</p>
 Required parameters: [DistributionConfig, Tags]
 */
@interface AWSCloudfrontDistributionConfigWithTags : AWSModel


/**
 <p>A distribution configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfig * _Nullable distributionConfig;

/**
 <p>A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTags * _Nullable tags;

@end

/**
 <p>A distribution list.</p>
 Required parameters: [Marker, MaxItems, IsTruncated, Quantity]
 */
@interface AWSCloudfrontDistributionList : AWSModel


/**
 <p>A flag that indicates whether more distributions remain to be listed. If your results were truncated, you can make a follow-up pagination request using the <code>Marker</code> request parameter to retrieve more distributions in the list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>A complex type that contains one <code>DistributionSummary</code> element for each distribution that was created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontDistributionSummary *> * _Nullable items;

/**
 <p>The value you provided for the <code>Marker</code> request parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value you provided for the <code>MaxItems</code> request parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value you can use for the <code>Marker</code> request parameter to continue listing your distributions where they left off. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of distributions that were created by the current AWS account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A summary of the information about a CloudFront distribution.</p>
 Required parameters: [Id, ARN, Status, LastModifiedTime, DomainName, Aliases, Origins, DefaultCacheBehavior, CacheBehaviors, CustomErrorResponses, Comment, PriceClass, Enabled, ViewerCertificate, Restrictions, WebACLId, HttpVersion, IsIPV6Enabled]
 */
@interface AWSCloudfrontDistributionSummary : AWSModel


/**
 <p>The ARN (Amazon Resource Name) for the distribution. For example: <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>, where <code>123456789012</code> is your AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>AWS services in China customers must file for an Internet Content Provider (ICP) recordal if they want to serve content publicly on an alternate domain name, also known as a CNAME, that they've added to CloudFront. AliasICPRecordal provides the ICP recordal status for CNAMEs associated with distributions.</p><p>For more information about ICP recordals, see <a href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html"> Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS services in China</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontAliasICPRecordal *> * _Nullable aliasICPRecordals;

/**
 <p>A complex type that contains information about CNAMEs (alternate domain names), if any, for this distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontAliases * _Nullable aliases;

/**
 <p>A complex type that contains zero or more <code>CacheBehavior</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCacheBehaviors * _Nullable cacheBehaviors;

/**
 <p>The comment originally specified when this distribution was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A complex type that contains zero or more <code>CustomErrorResponses</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCustomErrorResponses * _Nullable customErrorResponses;

/**
 <p>A complex type that describes the default cache behavior if you don't specify a <code>CacheBehavior</code> element or if files don't match any of the values of <code>PathPattern</code> in <code>CacheBehavior</code> elements. You must create exactly one default cache behavior.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDefaultCacheBehavior * _Nullable defaultCacheBehavior;

/**
 <p>The domain name that corresponds to the distribution, for example, <code>d111111abcdef8.cloudfront.net</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Whether the distribution is enabled to accept user requests for content.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> Specify the maximum HTTP version that you want viewers to use to communicate with CloudFront. The default value for new web distributions is <code>http2</code>. Viewers that don't support <code>HTTP/2</code> will automatically use an earlier version.</p>
 */
@property (nonatomic, assign) AWSCloudfrontHttpVersion httpVersion;

/**
 <p>The identifier for the distribution. For example: <code>EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Whether CloudFront responds to IPv6 DNS requests with an IPv6 address for your distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isIPV6Enabled;

/**
 <p>The date and time the distribution was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p> A complex type that contains information about origin groups for this distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOriginGroups * _Nullable originGroups;

/**
 <p>A complex type that contains information about origins for this distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOrigins * _Nullable origins;

/**
 <p>A complex type that contains information about price class for this streaming distribution. </p>
 */
@property (nonatomic, assign) AWSCloudfrontPriceClass priceClass;

/**
 <p>A complex type that identifies ways in which you want to restrict distribution of your content.</p>
 */
@property (nonatomic, strong) AWSCloudfrontRestrictions * _Nullable restrictions;

/**
 <p>The current status of the distribution. When the status is <code>Deployed</code>, the distribution's information is propagated to all CloudFront edge locations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A complex type that determines the distribution’s SSL/TLS configuration for communicating with viewers.</p>
 */
@property (nonatomic, strong) AWSCloudfrontViewerCertificate * _Nullable viewerCertificate;

/**
 <p>The Web ACL Id (if any) associated with the distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 <p>Complex data type for field-level encryption profiles that includes all of the encryption entities. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontEncryptionEntities : AWSModel


/**
 <p>An array of field patterns in a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontEncryptionEntity *> * _Nullable items;

/**
 <p>Number of field pattern items in a field-level encryption content type-profile mapping. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>Complex data type for field-level encryption profiles that includes the encryption key and field pattern specifications. </p>
 Required parameters: [PublicKeyId, ProviderId, FieldPatterns]
 */
@interface AWSCloudfrontEncryptionEntity : AWSModel


/**
 <p>Field patterns in a field-level encryption content type profile specify the fields that you want to be encrypted. You can provide the full field name, or any beginning characters followed by a wildcard (*). You can't overlap field patterns. For example, you can't have both ABC* and AB*. Note that field patterns are case-sensitive. </p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldPatterns * _Nullable fieldPatterns;

/**
 <p>The provider associated with the public key being used for encryption. This value must also be provided with the private key for applications to be able to decrypt data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerId;

/**
 <p>The public key associated with a set of field-level encryption patterns, to be used when encrypting the fields that match the patterns. </p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKeyId;

@end

/**
 <p>A complex data type that includes the profile configurations and other options specified for field-level encryption. </p>
 Required parameters: [Id, LastModifiedTime, FieldLevelEncryptionConfig]
 */
@interface AWSCloudfrontFieldLevelEncryption : AWSModel


/**
 <p>A complex data type that includes the profile configurations specified for field-level encryption. </p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionConfig * _Nullable fieldLevelEncryptionConfig;

/**
 <p>The configuration ID for a field-level encryption configuration which includes a set of profiles that specify certain selected data fields to be encrypted by specific public keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The last time the field-level encryption configuration was changed. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>A complex data type that includes the profile configurations specified for field-level encryption. </p>
 Required parameters: [CallerReference]
 */
@interface AWSCloudfrontFieldLevelEncryptionConfig : AWSModel


/**
 <p>A unique number that ensures the request can't be replayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>An optional comment about the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A complex data type that specifies when to forward content if a content type isn't recognized and profiles to use as by default in a request if a query argument doesn't specify a profile to use.</p>
 */
@property (nonatomic, strong) AWSCloudfrontContentTypeProfileConfig * _Nullable contentTypeProfileConfig;

/**
 <p>A complex data type that specifies when to forward content if a profile isn't found and the profile that can be provided as a query argument in a request.</p>
 */
@property (nonatomic, strong) AWSCloudfrontQueryArgProfileConfig * _Nullable queryArgProfileConfig;

@end

/**
 <p>List of field-level encrpytion configurations.</p>
 Required parameters: [MaxItems, Quantity]
 */
@interface AWSCloudfrontFieldLevelEncryptionList : AWSModel


/**
 <p>An array of field-level encryption items.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontFieldLevelEncryptionSummary *> * _Nullable items;

/**
 <p>The maximum number of elements you want in the response body. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If there are more elements to be listed, this element is present and contains the value that you can use for the <code>Marker</code> request parameter to continue listing your configurations where you left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of field-level encryption items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex data type for field-level encryption profiles.</p>
 Required parameters: [Id, LastModifiedTime, FieldLevelEncryptionProfileConfig]
 */
@interface AWSCloudfrontFieldLevelEncryptionProfile : AWSModel


/**
 <p>A complex data type that includes the profile name and the encryption entities for the field-level encryption profile.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfileConfig * _Nullable fieldLevelEncryptionProfileConfig;

/**
 <p>The ID for a field-level encryption profile configuration which includes a set of profiles that specify certain selected data fields to be encrypted by specific public keys.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The last time the field-level encryption profile was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

@end

/**
 <p>A complex data type of profiles for the field-level encryption.</p>
 Required parameters: [Name, CallerReference, EncryptionEntities]
 */
@interface AWSCloudfrontFieldLevelEncryptionProfileConfig : AWSModel


/**
 <p>A unique number that ensures that the request can't be replayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>An optional comment for the field-level encryption profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A complex data type of encryption entities for the field-level encryption profile that include the public key ID, provider, and field patterns for specifying which fields to encrypt with this key.</p>
 */
@property (nonatomic, strong) AWSCloudfrontEncryptionEntities * _Nullable encryptionEntities;

/**
 <p>Profile name for the field-level encryption profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>List of field-level encryption profiles.</p>
 Required parameters: [MaxItems, Quantity]
 */
@interface AWSCloudfrontFieldLevelEncryptionProfileList : AWSModel


/**
 <p>The field-level encryption profile items.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontFieldLevelEncryptionProfileSummary *> * _Nullable items;

/**
 <p>The maximum number of field-level encryption profiles you want in the response body. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If there are more elements to be listed, this element is present and contains the value that you can use for the <code>Marker</code> request parameter to continue listing your profiles where you left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of field-level encryption profiles.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>The field-level encryption profile summary.</p>
 Required parameters: [Id, LastModifiedTime, Name, EncryptionEntities]
 */
@interface AWSCloudfrontFieldLevelEncryptionProfileSummary : AWSModel


/**
 <p>An optional comment for the field-level encryption profile summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>A complex data type of encryption entities for the field-level encryption profile that include the public key ID, provider, and field patterns for specifying which fields to encrypt with this key.</p>
 */
@property (nonatomic, strong) AWSCloudfrontEncryptionEntities * _Nullable encryptionEntities;

/**
 <p>ID for the field-level encryption profile summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The time when the the field-level encryption profile summary was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>Name for the field-level encryption profile summary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A summary of a field-level encryption item.</p>
 Required parameters: [Id, LastModifiedTime]
 */
@interface AWSCloudfrontFieldLevelEncryptionSummary : AWSModel


/**
 <p>An optional comment about the field-level encryption item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p> A summary of a content type-profile mapping. </p>
 */
@property (nonatomic, strong) AWSCloudfrontContentTypeProfileConfig * _Nullable contentTypeProfileConfig;

/**
 <p>The unique ID of a field-level encryption item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The last time that the summary of field-level encryption items was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p> A summary of a query argument-profile mapping. </p>
 */
@property (nonatomic, strong) AWSCloudfrontQueryArgProfileConfig * _Nullable queryArgProfileConfig;

@end

/**
 <p>A complex data type that includes the field patterns to match for field-level encryption.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontFieldPatterns : AWSModel


/**
 <p>An array of the field-level encryption field patterns.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of field-level encryption field patterns.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that specifies how CloudFront handles query strings, cookies, and HTTP headers.</p>
 Required parameters: [QueryString, Cookies]
 */
@interface AWSCloudfrontForwardedValues : AWSModel


/**
 <p>A complex type that specifies whether you want CloudFront to forward cookies to the origin and, if so, which ones. For more information about forwarding cookies to the origin, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">How CloudFront Forwards, Caches, and Logs Cookies</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCookiePreference * _Nullable cookies;

/**
 <p>A complex type that specifies the <code>Headers</code>, if any, that you want CloudFront to forward to the origin for this cache behavior (whitelisted headers). For the headers that you specify, CloudFront also caches separate versions of a specified object that is based on the header values in viewer requests.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html"> Caching Content Based on Request Headers</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontHeaders * _Nullable headers;

/**
 <p>Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior and cache based on the query string parameters. CloudFront behavior depends on the value of <code>QueryString</code> and on the values that you specify for <code>QueryStringCacheKeys</code>, if any:</p><p>If you specify true for <code>QueryString</code> and you don't specify any values for <code>QueryStringCacheKeys</code>, CloudFront forwards all query string parameters to the origin and caches based on all query string parameters. Depending on how many query string parameters and values you have, this can adversely affect performance because CloudFront must forward more requests to the origin.</p><p>If you specify true for <code>QueryString</code> and you specify one or more values for <code>QueryStringCacheKeys</code>, CloudFront forwards all query string parameters to the origin, but it only caches based on the query string parameters that you specify.</p><p>If you specify false for <code>QueryString</code>, CloudFront doesn't forward any query string parameters to the origin, and doesn't cache based on query string parameters.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/QueryStringParameters.html">Configuring CloudFront to Cache Based on Query String Parameters</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable queryString;

/**
 <p>A complex type that contains information about the query string parameters that you want CloudFront to use for caching for this cache behavior.</p>
 */
@property (nonatomic, strong) AWSCloudfrontQueryStringCacheKeys * _Nullable queryStringCacheKeys;

@end

/**
 <p>A complex type that controls the countries in which your content is distributed. CloudFront determines the location of your users using <code>MaxMind</code> GeoIP databases. </p>
 Required parameters: [RestrictionType, Quantity]
 */
@interface AWSCloudfrontGeoRestriction : AWSModel


/**
 <p> A complex type that contains a <code>Location</code> element for each country in which you want CloudFront either to distribute your content (<code>whitelist</code>) or not distribute your content (<code>blacklist</code>).</p><p>The <code>Location</code> element is a two-letter, uppercase country code for a country that you want to include in your <code>blacklist</code> or <code>whitelist</code>. Include one <code>Location</code> element for each country.</p><p>CloudFront and <code>MaxMind</code> both use <code>ISO 3166</code> country codes. For the current list of countries and the corresponding codes, see <code>ISO 3166-1-alpha-2</code> code on the <i>International Organization for Standardization</i> website. You can also refer to the country list on the CloudFront console, which includes both country names and codes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>When geo restriction is <code>enabled</code>, this is the number of countries in your <code>whitelist</code> or <code>blacklist</code>. Otherwise, when it is not enabled, <code>Quantity</code> is <code>0</code>, and you can omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

/**
 <p>The method that you want to use to restrict distribution of your content by country:</p><ul><li><p><code>none</code>: No geo restriction is enabled, meaning access to content is not restricted by client geo location.</p></li><li><p><code>blacklist</code>: The <code>Location</code> elements specify the countries in which you don't want CloudFront to distribute your content.</p></li><li><p><code>whitelist</code>: The <code>Location</code> elements specify the countries in which you want CloudFront to distribute your content.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudfrontGeoRestrictionType restrictionType;

@end

/**
 <p>The origin access identity's configuration information. For more information, see <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_CloudFrontOriginAccessIdentityConfig.html">CloudFrontOriginAccessIdentityConfig</a>.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest : AWSRequest


/**
 <p>The identity's ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult : AWSModel


/**
 <p>The origin access identity's configuration information. </p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentityConfig * _Nullable cloudFrontOriginAccessIdentityConfig;

/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 <p>The request to get an origin access identity's information.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest : AWSRequest


/**
 <p>The identity's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetCloudFrontOriginAccessIdentityResult : AWSModel


/**
 <p>The origin access identity's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentity * _Nullable cloudFrontOriginAccessIdentity;

/**
 <p>The current version of the origin access identity's information. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 <p>The request to get a distribution configuration.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetDistributionConfigRequest : AWSRequest


/**
 <p>The distribution's ID. If the ID is empty, an empty distribution configuration is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetDistributionConfigResult : AWSModel


/**
 <p>The distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfig * _Nullable distributionConfig;

/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 <p>The request to get a distribution's information.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetDistributionRequest : AWSRequest


/**
 <p>The distribution's ID. If the ID is empty, an empty distribution configuration is returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetDistributionResult : AWSModel


/**
 <p>The distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistribution * _Nullable distribution;

/**
 <p>The current version of the distribution's information. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionConfigRequest : AWSRequest


/**
 <p>Request the ID for the field-level encryption configuration information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionConfigResult : AWSModel


/**
 <p>The current version of the field level encryption configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the field-level encryption configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionConfig * _Nullable fieldLevelEncryptionConfig;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest : AWSRequest


/**
 <p>Get the ID for the field-level encryption profile configuration information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult : AWSModel


/**
 <p>The current version of the field-level encryption profile configuration result. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the field-level encryption profile configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfileConfig * _Nullable fieldLevelEncryptionProfileConfig;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionProfileRequest : AWSRequest


/**
 <p>Get the ID for the field-level encryption profile information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionProfileResult : AWSModel


/**
 <p>The current version of the field level encryption profile. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the field-level encryption profile information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfile * _Nullable fieldLevelEncryptionProfile;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionRequest : AWSRequest


/**
 <p>Request the ID for the field-level encryption configuration information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetFieldLevelEncryptionResult : AWSModel


/**
 <p>The current version of the field level encryption configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the field-level encryption configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryption * _Nullable fieldLevelEncryption;

@end

/**
 <p>The request to get an invalidation's information. </p>
 Required parameters: [DistributionId, Id]
 */
@interface AWSCloudfrontGetInvalidationRequest : AWSRequest


/**
 <p>The distribution's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionId;

/**
 <p>The identifier for the invalidation request, for example, <code>IDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetInvalidationResult : AWSModel


/**
 <p>The invalidation's information. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/InvalidationDatatype.html">Invalidation Complex Type</a>. </p>
 */
@property (nonatomic, strong) AWSCloudfrontInvalidation * _Nullable invalidation;

@end

/**
 
 */
@interface AWSCloudfrontGetPublicKeyConfigRequest : AWSRequest


/**
 <p>Request the ID for the public key configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetPublicKeyConfigResult : AWSModel


/**
 <p>The current version of the public key configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the result for the public key configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKeyConfig * _Nullable publicKeyConfig;

@end

/**
 
 */
@interface AWSCloudfrontGetPublicKeyRequest : AWSRequest


/**
 <p>Request the ID for the public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSCloudfrontGetPublicKeyResult : AWSModel


/**
 <p>The current version of the public key. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the public key.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKey * _Nullable publicKey;

@end

/**
 <p>To request to get a streaming distribution configuration.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetStreamingDistributionConfigRequest : AWSRequest


/**
 <p>The streaming distribution's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetStreamingDistributionConfigResult : AWSModel


/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The streaming distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfig * _Nullable streamingDistributionConfig;

@end

/**
 <p>The request to get a streaming distribution's information.</p>
 Required parameters: [Id]
 */
@interface AWSCloudfrontGetStreamingDistributionRequest : AWSRequest


/**
 <p>The streaming distribution's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontGetStreamingDistributionResult : AWSModel


/**
 <p>The current version of the streaming distribution's information. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The streaming distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistribution * _Nullable streamingDistribution;

@end

/**
 <p>A complex type that specifies the request headers, if any, that you want CloudFront to base caching on for this cache behavior. </p><p>For the headers that you specify, CloudFront caches separate versions of a specified object based on the header values in viewer requests. For example, suppose viewer requests for <code>logo.jpg</code> contain a custom <code>product</code> header that has a value of either <code>acme</code> or <code>apex</code>, and you configure CloudFront to cache your content based on values in the <code>product</code> header. CloudFront forwards the <code>product</code> header to the origin and caches the response from the origin once for each header value. For more information about caching based on header values, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html">How CloudFront Forwards and Caches Headers</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontHeaders : AWSModel


/**
 <p>A list that contains one <code>Name</code> element for each header that you want CloudFront to use for caching in this cache behavior. If <code>Quantity</code> is <code>0</code>, omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of different headers that you want CloudFront to base caching on for this cache behavior. You can configure each cache behavior in a web distribution to do one of the following:</p><ul><li><p><b>Forward all headers to your origin</b>: Specify <code>1</code> for <code>Quantity</code> and <code>*</code> for <code>Name</code>.</p><important><p>CloudFront doesn't cache the objects that are associated with this cache behavior. Instead, CloudFront sends every request to the origin. </p></important></li><li><p><b>Forward a whitelist of headers you specify</b>: Specify the number of headers that you want CloudFront to base caching on. Then specify the header names in <code>Name</code> elements. CloudFront caches your objects based on the values in the specified headers.</p></li><li><p><b>Forward only the default headers</b>: Specify <code>0</code> for <code>Quantity</code> and omit <code>Items</code>. In this configuration, CloudFront doesn't cache based on the values in the request headers.</p></li></ul><p>Regardless of which option you choose, CloudFront forwards headers to your origin based on whether the origin is an S3 bucket or a custom origin. See the following documentation:</p><ul><li><p><b>S3 bucket</b>: See <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorS3Origin.html#request-s3-removed-headers">HTTP Request Headers That CloudFront Removes or Updates</a></p></li><li><p><b>Custom origin</b>: See <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorCustomOrigin.html#request-custom-headers-behavior">HTTP Request Headers and CloudFront Behavior</a></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>An invalidation. </p>
 Required parameters: [Id, Status, CreateTime, InvalidationBatch]
 */
@interface AWSCloudfrontInvalidation : AWSModel


/**
 <p>The date and time the invalidation request was first made. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The identifier for the invalidation request. For example: <code>IDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The current invalidation information for the batch request. </p>
 */
@property (nonatomic, strong) AWSCloudfrontInvalidationBatch * _Nullable invalidationBatch;

/**
 <p>The status of the invalidation request. When the invalidation batch is finished, the status is <code>Completed</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>An invalidation batch.</p>
 Required parameters: [Paths, CallerReference]
 */
@interface AWSCloudfrontInvalidationBatch : AWSModel


/**
 <p>A value that you specify to uniquely identify an invalidation request. CloudFront uses the value to prevent you from accidentally resubmitting an identical request. Whenever you create a new invalidation request, you must specify a new value for <code>CallerReference</code> and change other values in the request as applicable. One way to ensure that the value of <code>CallerReference</code> is unique is to use a <code>timestamp</code>, for example, <code>20120301090000</code>.</p><p>If you make a second invalidation request with the same value for <code>CallerReference</code>, and if the rest of the request is the same, CloudFront doesn't create a new invalidation request. Instead, CloudFront returns information about the invalidation request that you previously created with the same <code>CallerReference</code>.</p><p>If <code>CallerReference</code> is a value you already sent in a previous invalidation batch request but the content of any <code>Path</code> is different from the original request, CloudFront returns an <code>InvalidationBatchAlreadyExists</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>A complex type that contains information about the objects that you want to invalidate. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 */
@property (nonatomic, strong) AWSCloudfrontPaths * _Nullable paths;

@end

/**
 <p>The <code>InvalidationList</code> complex type describes the list of invalidation objects. For more information about invalidation, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html">Invalidating Objects (Web Distributions Only)</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 Required parameters: [Marker, MaxItems, IsTruncated, Quantity]
 */
@interface AWSCloudfrontInvalidationList : AWSModel


/**
 <p>A flag that indicates whether more invalidation batch requests remain to be listed. If your results were truncated, you can make a follow-up pagination request using the <code>Marker</code> request parameter to retrieve more invalidation batches in the list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>A complex type that contains one <code>InvalidationSummary</code> element for each invalidation batch created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontInvalidationSummary *> * _Nullable items;

/**
 <p>The value that you provided for the <code>Marker</code> request parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value that you provided for the <code>MaxItems</code> request parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value that you can use for the <code>Marker</code> request parameter to continue listing your invalidation batches where they left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of invalidation batches that were created by the current AWS account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A summary of an invalidation request.</p>
 Required parameters: [Id, CreateTime, Status]
 */
@interface AWSCloudfrontInvalidationSummary : AWSModel


/**
 <p>The time that an invalidation request was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The unique ID for an invalidation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The status of an invalidation request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>A complex type that lists the active CloudFront key pairs, if any, that are associated with <code>AwsAccountNumber</code>. </p><p>For more information, see <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ActiveTrustedSigners.html">ActiveTrustedSigners</a>.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontKeyPairIds : AWSModel


/**
 <p>A complex type that lists the active CloudFront key pairs, if any, that are associated with <code>AwsAccountNumber</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ActiveTrustedSigners.html">ActiveTrustedSigners</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of active CloudFront key pairs for <code>AwsAccountNumber</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ActiveTrustedSigners.html">ActiveTrustedSigners</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains a Lambda function association.</p>
 Required parameters: [LambdaFunctionARN, EventType]
 */
@interface AWSCloudfrontLambdaFunctionAssociation : AWSModel


/**
 <p>Specifies the event type that triggers a Lambda function invocation. You can specify the following values:</p><ul><li><p><code>viewer-request</code>: The function executes when CloudFront receives a request from a viewer and before it checks to see whether the requested object is in the edge cache. </p></li><li><p><code>origin-request</code>: The function executes only when CloudFront forwards a request to your origin. When the requested object is in the edge cache, the function doesn't execute.</p></li><li><p><code>origin-response</code>: The function executes after CloudFront receives a response from the origin and before it caches the object in the response. When the requested object is in the edge cache, the function doesn't execute.</p></li><li><p><code>viewer-response</code>: The function executes before CloudFront returns the requested object to the viewer. The function executes regardless of whether the object was already in the edge cache.</p><p>If the origin returns an HTTP status code other than HTTP 200 (OK), the function doesn't execute.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudfrontEventType eventType;

/**
 <p>A flag that allows a Lambda function to have read access to the body content. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-include-body-access.html">Accessing the Request Body by Choosing the Include Body Option</a> in the Amazon CloudFront Developer Guide.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeBody;

/**
 <p>The ARN of the Lambda function. You must specify the ARN of a function version; you can't specify a Lambda alias or $LATEST.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaFunctionARN;

@end

/**
 <p>A complex type that specifies a list of Lambda functions associations for a cache behavior.</p><p>If you want to invoke one or more Lambda functions triggered by requests that match the <code>PathPattern</code> of the cache behavior, specify the applicable values for <code>Quantity</code> and <code>Items</code>. Note that there can be up to 4 <code>LambdaFunctionAssociation</code> items in this list (one for each possible value of <code>EventType</code>) and each <code>EventType</code> can be associated with the Lambda function only once.</p><p>If you don't want to invoke any Lambda functions for the requests that match <code>PathPattern</code>, specify <code>0</code> for <code>Quantity</code> and omit <code>Items</code>. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontLambdaFunctionAssociations : AWSModel


/**
 <p><b>Optional</b>: A complex type that contains <code>LambdaFunctionAssociation</code> items for this cache behavior. If <code>Quantity</code> is <code>0</code>, you can omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontLambdaFunctionAssociation *> * _Nullable items;

/**
 <p>The number of Lambda function associations for this cache behavior.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>The request to list origin access identities. </p>
 */
@interface AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest : AWSRequest


/**
 <p>Use this when paginating results to indicate where to begin in your list of origin access identities. The results include identities in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last identity on that page).</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of origin access identities you want in the response body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult : AWSModel


/**
 <p>The <code>CloudFrontOriginAccessIdentityList</code> type. </p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentityList * _Nullable cloudFrontOriginAccessIdentityList;

@end

/**
 <p>The request to list distributions that are associated with a specified AWS WAF web ACL. </p>
 Required parameters: [WebACLId]
 */
@interface AWSCloudfrontListDistributionsByWebACLIdRequest : AWSRequest


/**
 <p>Use <code>Marker</code> and <code>MaxItems</code> to control pagination of results. If you have more than <code>MaxItems</code> distributions that satisfy the request, the response includes a <code>NextMarker</code> element. To get the next page of results, submit another request. For the value of <code>Marker</code>, specify the value of <code>NextMarker</code> from the last response. (For the first request, omit <code>Marker</code>.) </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of distributions that you want CloudFront to return in the response body. The maximum and default values are both 100.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

/**
 <p>The ID of the AWS WAF web ACL that you want to list the associated distributions. If you specify "null" for the ID, the request returns a list of the distributions that aren't associated with a web ACL. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 <p>The response to a request to list the distributions that are associated with a specified AWS WAF web ACL. </p>
 */
@interface AWSCloudfrontListDistributionsByWebACLIdResult : AWSModel


/**
 <p>The <code>DistributionList</code> type. </p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionList * _Nullable distributionList;

@end

/**
 <p>The request to list your distributions. </p>
 */
@interface AWSCloudfrontListDistributionsRequest : AWSRequest


/**
 <p>Use this when paginating results to indicate where to begin in your list of distributions. The results include distributions in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last distribution on that page).</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of distributions you want in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontListDistributionsResult : AWSModel


/**
 <p>The <code>DistributionList</code> type. </p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionList * _Nullable distributionList;

@end

/**
 
 */
@interface AWSCloudfrontListFieldLevelEncryptionConfigsRequest : AWSRequest


/**
 <p>Use this when paginating results to indicate where to begin in your list of configurations. The results include configurations in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last configuration on that page). </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of field-level encryption configurations you want in the response body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 
 */
@interface AWSCloudfrontListFieldLevelEncryptionConfigsResult : AWSModel


/**
 <p>Returns a list of all field-level encryption configurations that have been created in CloudFront for this account.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionList * _Nullable fieldLevelEncryptionList;

@end

/**
 
 */
@interface AWSCloudfrontListFieldLevelEncryptionProfilesRequest : AWSRequest


/**
 <p>Use this when paginating results to indicate where to begin in your list of profiles. The results include profiles in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last profile on that page). </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of field-level encryption profiles you want in the response body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 
 */
@interface AWSCloudfrontListFieldLevelEncryptionProfilesResult : AWSModel


/**
 <p>Returns a list of the field-level encryption profiles that have been created in CloudFront for this account.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfileList * _Nullable fieldLevelEncryptionProfileList;

@end

/**
 <p>The request to list invalidations. </p>
 Required parameters: [DistributionId]
 */
@interface AWSCloudfrontListInvalidationsRequest : AWSRequest


/**
 <p>The distribution's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributionId;

/**
 <p>Use this parameter when paginating results to indicate where to begin in your list of invalidation batches. Because the results are returned in decreasing order from most recent to oldest, the most recent results are on the first page, the second page will contain earlier results, and so on. To get the next page of results, set <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response. This value is the same as the ID of the last invalidation batch on that page. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of invalidation batches that you want in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontListInvalidationsResult : AWSModel


/**
 <p>Information about invalidation batches. </p>
 */
@property (nonatomic, strong) AWSCloudfrontInvalidationList * _Nullable invalidationList;

@end

/**
 
 */
@interface AWSCloudfrontListPublicKeysRequest : AWSRequest


/**
 <p>Use this when paginating results to indicate where to begin in your list of public keys. The results include public keys in the list that occur after the marker. To get the next page of results, set the <code>Marker</code> to the value of the <code>NextMarker</code> from the current page's response (which is also the ID of the last public key on that page). </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The maximum number of public keys you want in the response body. </p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 
 */
@interface AWSCloudfrontListPublicKeysResult : AWSModel


/**
 <p>Returns a list of all public keys that have been added to CloudFront for this account.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKeyList * _Nullable publicKeyList;

@end

/**
 <p>The request to list your streaming distributions. </p>
 */
@interface AWSCloudfrontListStreamingDistributionsRequest : AWSRequest


/**
 <p>The value that you provided for the <code>Marker</code> request parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value that you provided for the <code>MaxItems</code> request parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxItems;

@end

/**
 <p>The returned result of the corresponding request. </p>
 */
@interface AWSCloudfrontListStreamingDistributionsResult : AWSModel


/**
 <p>The <code>StreamingDistributionList</code> type. </p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionList * _Nullable streamingDistributionList;

@end

/**
 <p> The request to list tags for a CloudFront resource.</p>
 Required parameters: [Resource]
 */
@interface AWSCloudfrontListTagsForResourceRequest : AWSRequest


/**
 <p> An ARN of a CloudFront resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

@end

/**
 <p> The returned result of the corresponding request.</p>
 Required parameters: [Tags]
 */
@interface AWSCloudfrontListTagsForResourceResult : AWSModel


/**
 <p> A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTags * _Nullable tags;

@end

/**
 <p>A complex type that controls whether access logs are written for the distribution.</p>
 Required parameters: [Enabled, IncludeCookies, Bucket, Prefix]
 */
@interface AWSCloudfrontLoggingConfig : AWSModel


/**
 <p>The Amazon S3 bucket to store the access logs in, for example, <code>myawslogbucket.s3.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies whether you want CloudFront to save access logs to an Amazon S3 bucket. If you don't want to enable logging when you create a distribution or if you want to disable logging for an existing distribution, specify <code>false</code> for <code>Enabled</code>, and specify empty <code>Bucket</code> and <code>Prefix</code> elements. If you specify <code>false</code> for <code>Enabled</code> but you specify values for <code>Bucket</code>, <code>prefix</code>, and <code>IncludeCookies</code>, the values are automatically deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies whether you want CloudFront to include cookies in access logs, specify <code>true</code> for <code>IncludeCookies</code>. If you choose to include cookies in logs, CloudFront logs all cookies regardless of how you configure the cache behaviors for this distribution. If you don't want to include cookies when you create a distribution or if you want to disable include cookies for an existing distribution, specify <code>false</code> for <code>IncludeCookies</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeCookies;

/**
 <p>An optional string that you want CloudFront to prefix to the access log <code>filenames</code> for this distribution, for example, <code>myprefix/</code>. If you want to enable logging, but you don't want to specify a prefix, you still must include an empty <code>Prefix</code> element in the <code>Logging</code> element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>An origin.</p><p>An origin is the location where content is stored, and from which CloudFront gets content to serve to viewers. To specify an origin:</p><ul><li><p>Use the <code>S3OriginConfig</code> type to specify an Amazon S3 bucket that is <i><b>not</b></i> configured with static website hosting.</p></li><li><p>Use the <code>CustomOriginConfig</code> type to specify various other kinds of content containers or HTTP servers, including:</p><ul><li><p>An Amazon S3 bucket that is configured with static website hosting</p></li><li><p>An Elastic Load Balancing load balancer</p></li><li><p>An AWS Elemental MediaPackage origin</p></li><li><p>An AWS Elemental MediaStore container</p></li><li><p>Any other HTTP server, running on an Amazon EC2 instance or any other kind of host</p></li></ul></li></ul><p>For the current maximum number of origins that you can specify per distribution, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-limits.html#limits-web-distributions">General Quotas on Web Distributions</a> in the <i>Amazon CloudFront Developer Guide</i> (quotas were formerly referred to as limits).</p>
 Required parameters: [Id, DomainName]
 */
@interface AWSCloudfrontOrigin : AWSModel


/**
 <p>The number of times that CloudFront attempts to connect to the origin. The minimum number is 1, the maximum is 3, and the default (if you don’t specify otherwise) is 3.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#origin-connection-attempts">Origin Connection Attempts</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionAttempts;

/**
 <p>The number of seconds that CloudFront waits when trying to establish a connection to the origin. The minimum timeout is 1 second, the maximum is 10 seconds, and the default (if you don’t specify otherwise) is 10 seconds.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#origin-connection-timeout">Origin Connection Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable connectionTimeout;

/**
 <p>A list of HTTP header names and values that CloudFront adds to requests it sends to the origin.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/add-origin-custom-headers.html">Adding Custom Headers to Origin Requests</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCustomHeaders * _Nullable customHeaders;

/**
 <p>Use this type to specify an origin that is a content container or HTTP server, including an Amazon S3 bucket that is configured with static website hosting. To specify an Amazon S3 bucket that is <i><b>not</b></i> configured with static website hosting, use the <code>S3OriginConfig</code> type instead.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCustomOriginConfig * _Nullable customOriginConfig;

/**
 <p>The domain name for the origin.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesDomainName">Origin Domain Name</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>A unique identifier for the origin. This value must be unique within the distribution.</p><p>Use this value to specify the <code>TargetOriginId</code> in a <a>CacheBehavior</a> or <a>DefaultCacheBehavior</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>An optional path that CloudFront appends to the origin domain name when CloudFront requests content from the origin.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginPath">Origin Path</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originPath;

/**
 <p>Use this type to specify an origin that is an Amazon S3 bucket that is <i><b>not</b></i> configured with static website hosting. To specify any other type of origin, including an Amazon S3 bucket that is configured with static website hosting, use the <code>CustomOriginConfig</code> type instead.</p>
 */
@property (nonatomic, strong) AWSCloudfrontS3OriginConfig * _Nullable s3OriginConfig;

@end

/**
 <p>A complex type that contains <code>HeaderName</code> and <code>HeaderValue</code> elements, if any, for this distribution. </p>
 Required parameters: [HeaderName, HeaderValue]
 */
@interface AWSCloudfrontOriginCustomHeader : AWSModel


/**
 <p>The name of a header that you want CloudFront to forward to your origin. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/forward-custom-headers.html">Forwarding Custom Headers to Your Origin (Web Distributions Only)</a> in the <i> Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable headerName;

/**
 <p>The value for the header that you specified in the <code>HeaderName</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable headerValue;

@end

/**
 <p>An origin group includes two origins (a primary origin and a second origin to failover to) and a failover criteria that you specify. You create an origin group to support origin failover in CloudFront. When you create or update a distribution, you can specifiy the origin group instead of a single origin, and CloudFront will failover from the primary origin to the second origin under the failover conditions that you've chosen.</p>
 Required parameters: [Id, FailoverCriteria, Members]
 */
@interface AWSCloudfrontOriginGroup : AWSModel


/**
 <p>A complex type that contains information about the failover criteria for an origin group.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOriginGroupFailoverCriteria * _Nullable failoverCriteria;

/**
 <p>The origin group's ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A complex type that contains information about the origins in an origin group.</p>
 */
@property (nonatomic, strong) AWSCloudfrontOriginGroupMembers * _Nullable members;

@end

/**
 <p>A complex data type that includes information about the failover criteria for an origin group, including the status codes for which CloudFront will failover from the primary origin to the second origin.</p>
 Required parameters: [StatusCodes]
 */
@interface AWSCloudfrontOriginGroupFailoverCriteria : AWSModel


/**
 <p>The status codes that, when returned from the primary origin, will trigger CloudFront to failover to the second origin.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStatusCodes * _Nullable statusCodes;

@end

/**
 <p>An origin in an origin group.</p>
 Required parameters: [OriginId]
 */
@interface AWSCloudfrontOriginGroupMember : AWSModel


/**
 <p>The ID for an origin in an origin group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originId;

@end

/**
 <p>A complex data type for the origins included in an origin group.</p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontOriginGroupMembers : AWSModel


/**
 <p>Items (origins) in an origin group.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontOriginGroupMember *> * _Nullable items;

/**
 <p>The number of origins in an origin group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex data type for the origin groups specified for a distribution.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontOriginGroups : AWSModel


/**
 <p>The items (origin groups) in a distribution.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontOriginGroup *> * _Nullable items;

/**
 <p>The number of origin groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains information about the SSL/TLS protocols that CloudFront can use when establishing an HTTPS connection with your origin. </p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontOriginSslProtocols : AWSModel


/**
 <p>A list that contains allowed SSL/TLS protocols for this distribution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of SSL/TLS protocols that you want to allow CloudFront to use when establishing an HTTPS connection with this origin. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains information about origins and origin groups for this distribution. </p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontOrigins : AWSModel


/**
 <p>A complex type that contains origins or origin groups for this distribution.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontOrigin *> * _Nullable items;

/**
 <p>The number of origins or origin groups for this distribution.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains information about the objects that you want to invalidate. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontPaths : AWSModel


/**
 <p>A complex type that contains a list of the paths that you want to invalidate.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of invalidation paths specified for the objects that you want to invalidate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex data type of public keys you add to CloudFront to use with features like field-level encryption.</p>
 Required parameters: [Id, CreatedTime, PublicKeyConfig]
 */
@interface AWSCloudfrontPublicKey : AWSModel


/**
 <p>A time you added a public key to CloudFront.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>A unique ID assigned to a public key you've added to CloudFront.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A complex data type for a public key you add to CloudFront to use with features like field-level encryption.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKeyConfig * _Nullable publicKeyConfig;

@end

/**
 <p>Information about a public key you add to CloudFront to use with features like field-level encryption.</p>
 Required parameters: [CallerReference, Name, EncodedKey]
 */
@interface AWSCloudfrontPublicKeyConfig : AWSModel


/**
 <p>A unique number that ensures that the request can't be replayed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>An optional comment about a public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The encoded public key that you want to add to CloudFront to use with features like field-level encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedKey;

/**
 <p>The name for a public key you add to CloudFront to use with features like field-level encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A list of public keys you've added to CloudFront to use with features like field-level encryption.</p>
 Required parameters: [MaxItems, Quantity]
 */
@interface AWSCloudfrontPublicKeyList : AWSModel


/**
 <p>An array of information about a public key you add to CloudFront to use with features like field-level encryption.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontPublicKeySummary *> * _Nullable items;

/**
 <p>The maximum number of public keys you want in the response body. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If there are more elements to be listed, this element is present and contains the value that you can use for the <code>Marker</code> request parameter to continue listing your public keys where you left off.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of public keys you added to CloudFront to use with features like field-level encryption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex data type for public key information. </p>
 Required parameters: [Id, Name, CreatedTime, EncodedKey]
 */
@interface AWSCloudfrontPublicKeySummary : AWSModel


/**
 <p> Comment for public key information summary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p> Creation time for public key information summary. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p> Encoded key for public key information summary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedKey;

/**
 <p> ID for public key information summary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p> Name for public key information summary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Query argument-profile mapping for field-level encryption.</p>
 Required parameters: [QueryArg, ProfileId]
 */
@interface AWSCloudfrontQueryArgProfile : AWSModel


/**
 <p>ID of profile to use for field-level encryption query argument-profile mapping</p>
 */
@property (nonatomic, strong) NSString * _Nullable profileId;

/**
 <p>Query argument for field-level encryption query argument-profile mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryArg;

@end

/**
 <p>Configuration for query argument-profile mapping for field-level encryption.</p>
 Required parameters: [ForwardWhenQueryArgProfileIsUnknown]
 */
@interface AWSCloudfrontQueryArgProfileConfig : AWSModel


/**
 <p>Flag to set if you want a request to be forwarded to the origin even if the profile specified by the field-level encryption query argument, fle-profile, is unknown.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forwardWhenQueryArgProfileIsUnknown;

/**
 <p>Profiles specified for query argument-profile mapping for field-level encryption.</p>
 */
@property (nonatomic, strong) AWSCloudfrontQueryArgProfiles * _Nullable queryArgProfiles;

@end

/**
 <p>Query argument-profile mapping for field-level encryption.</p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontQueryArgProfiles : AWSModel


/**
 <p>Number of items for query argument-profile mapping for field-level encryption.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontQueryArgProfile *> * _Nullable items;

/**
 <p>Number of profiles for query argument-profile mapping for field-level encryption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that contains information about the query string parameters that you want CloudFront to use for caching for a cache behavior. </p>
 Required parameters: [Quantity]
 */
@interface AWSCloudfrontQueryStringCacheKeys : AWSModel


/**
 <p>A list that contains the query string parameters that you want CloudFront to use as a basis for caching for a cache behavior. If <code>Quantity</code> is 0, you can omit <code>Items</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of <code>whitelisted</code> query string parameters for a cache behavior.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A complex type that identifies ways in which you want to restrict distribution of your content.</p>
 Required parameters: [GeoRestriction]
 */
@interface AWSCloudfrontRestrictions : AWSModel


/**
 <p>A complex type that controls the countries in which your content is distributed. CloudFront determines the location of your users using <code>MaxMind</code> GeoIP databases.</p>
 */
@property (nonatomic, strong) AWSCloudfrontGeoRestriction * _Nullable geoRestriction;

@end

/**
 <p>A complex type that contains information about the Amazon S3 bucket from which you want CloudFront to get your media files for distribution.</p>
 Required parameters: [DomainName, OriginAccessIdentity]
 */
@interface AWSCloudfrontS3Origin : AWSModel


/**
 <p>The DNS name of the Amazon S3 origin. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The CloudFront origin access identity to associate with the distribution. Use an origin access identity to configure the distribution so that end users can only access objects in an Amazon S3 bucket through CloudFront.</p><p>If you want end users to be able to access objects using either the CloudFront URL or the Amazon S3 URL, specify an empty <code>OriginAccessIdentity</code> element.</p><p>To delete the origin access identity from an existing distribution, update the distribution configuration and include an empty <code>OriginAccessIdentity</code> element.</p><p>To replace the origin access identity, update the distribution configuration and specify the new origin access identity.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html">Using an Origin Access Identity to Restrict Access to Your Amazon S3 Content</a> in the <i> Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originAccessIdentity;

@end

/**
 <p>A complex type that contains information about the Amazon S3 origin. If the origin is a custom origin or an S3 bucket that is configured as a website endpoint, use the <code>CustomOriginConfig</code> element instead.</p>
 Required parameters: [OriginAccessIdentity]
 */
@interface AWSCloudfrontS3OriginConfig : AWSModel


/**
 <p>The CloudFront origin access identity to associate with the origin. Use an origin access identity to configure the origin so that viewers can <i>only</i> access objects in an Amazon S3 bucket through CloudFront. The format of the value is:</p><p>origin-access-identity/cloudfront/<i>ID-of-origin-access-identity</i></p><p>where <code><i>ID-of-origin-access-identity</i></code> is the value that CloudFront returned in the <code>ID</code> element when you created the origin access identity.</p><p>If you want viewers to be able to access objects using either the CloudFront URL or the Amazon S3 URL, specify an empty <code>OriginAccessIdentity</code> element.</p><p>To delete the origin access identity from an existing distribution, update the distribution configuration and include an empty <code>OriginAccessIdentity</code> element.</p><p>To replace the origin access identity, update the distribution configuration and specify the new origin access identity.</p><p>For more information about the origin access identity, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable originAccessIdentity;

@end

/**
 <p>A complex type that lists the AWS accounts that were included in the <code>TrustedSigners</code> complex type, as well as their active CloudFront key pair IDs, if any. </p>
 */
@interface AWSCloudfrontSigner : AWSModel


/**
 <p>An AWS account that is included in the <code>TrustedSigners</code> complex type for this distribution. Valid values include:</p><ul><li><p><code>self</code>, which is the AWS account used to create the distribution.</p></li><li><p>An AWS account number.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountNumber;

/**
 <p>A complex type that lists the active CloudFront key pairs, if any, that are associated with <code>AwsAccountNumber</code>.</p>
 */
@property (nonatomic, strong) AWSCloudfrontKeyPairIds * _Nullable keyPairIds;

@end

/**
 <p>A complex data type for the status codes that you specify that, when returned by a primary origin, trigger CloudFront to failover to a second origin.</p>
 Required parameters: [Quantity, Items]
 */
@interface AWSCloudfrontStatusCodes : AWSModel


/**
 <p>The items (status codes) for an origin group.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable items;

/**
 <p>The number of status codes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>A streaming distribution tells CloudFront where you want RTMP content to be delivered from, and the details about how to track and manage content delivery.</p>
 Required parameters: [Id, ARN, Status, DomainName, ActiveTrustedSigners, StreamingDistributionConfig]
 */
@interface AWSCloudfrontStreamingDistribution : AWSModel


/**
 <p>The ARN (Amazon Resource Name) for the distribution. For example: <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>, where <code>123456789012</code> is your AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>A complex type that lists the AWS accounts, if any, that you included in the <code>TrustedSigners</code> complex type for this distribution. These are the accounts that you want to allow to create signed URLs for private content.</p><p>The <code>Signer</code> complex type lists the AWS account number of the trusted signer or <code>self</code> if the signer is the AWS account that created the distribution. The <code>Signer</code> element also includes the IDs of any active CloudFront key pairs that are associated with the trusted signer's AWS account. If no <code>KeyPairId</code> element appears for a <code>Signer</code>, that signer can't create signed URLs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 */
@property (nonatomic, strong) AWSCloudfrontActiveTrustedSigners * _Nullable activeTrustedSigners;

/**
 <p>The domain name that corresponds to the streaming distribution, for example, <code>s5c39gqb8ow64r.cloudfront.net</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The identifier for the RTMP distribution. For example: <code>EGTXBD79EXAMPLE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date and time that the distribution was last modified. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The current status of the RTMP distribution. When the status is <code>Deployed</code>, the distribution's information is propagated to all CloudFront edge locations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The current configuration information for the RTMP distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfig * _Nullable streamingDistributionConfig;

@end

/**
 <p>The RTMP distribution's configuration information.</p>
 Required parameters: [CallerReference, S3Origin, Comment, TrustedSigners, Enabled]
 */
@interface AWSCloudfrontStreamingDistributionConfig : AWSModel


/**
 <p>A complex type that contains information about CNAMEs (alternate domain names), if any, for this streaming distribution. </p>
 */
@property (nonatomic, strong) AWSCloudfrontAliases * _Nullable aliases;

/**
 <p>A unique value (for example, a date-time stamp) that ensures that the request can't be replayed.</p><p>If the value of <code>CallerReference</code> is new (regardless of the content of the <code>StreamingDistributionConfig</code> object), CloudFront creates a new distribution.</p><p>If <code>CallerReference</code> is a value that you already sent in a previous request to create a distribution, CloudFront returns a <code>DistributionAlreadyExists</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerReference;

/**
 <p>Any comments you want to include about the streaming distribution. </p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>Whether the streaming distribution is enabled to accept user requests for content.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>A complex type that controls whether access logs are written for the streaming distribution. </p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingLoggingConfig * _Nullable logging;

/**
 <p>A complex type that contains information about price class for this streaming distribution. </p>
 */
@property (nonatomic, assign) AWSCloudfrontPriceClass priceClass;

/**
 <p>A complex type that contains information about the Amazon S3 bucket from which you want CloudFront to get your media files for distribution. </p>
 */
@property (nonatomic, strong) AWSCloudfrontS3Origin * _Nullable s3Origin;

/**
 <p>A complex type that specifies any AWS accounts that you want to permit to create signed URLs for private content. If you want the distribution to use signed URLs, include this element; if you want the distribution to use public URLs, remove this element. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 */
@property (nonatomic, strong) AWSCloudfrontTrustedSigners * _Nullable trustedSigners;

@end

/**
 <p>A streaming distribution Configuration and a list of tags to be associated with the streaming distribution.</p>
 Required parameters: [StreamingDistributionConfig, Tags]
 */
@interface AWSCloudfrontStreamingDistributionConfigWithTags : AWSModel


/**
 <p>A streaming distribution Configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfig * _Nullable streamingDistributionConfig;

/**
 <p>A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTags * _Nullable tags;

@end

/**
 <p>A streaming distribution list. </p>
 Required parameters: [Marker, MaxItems, IsTruncated, Quantity]
 */
@interface AWSCloudfrontStreamingDistributionList : AWSModel


/**
 <p>A flag that indicates whether more streaming distributions remain to be listed. If your results were truncated, you can make a follow-up pagination request using the <code>Marker</code> request parameter to retrieve more distributions in the list. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>A complex type that contains one <code>StreamingDistributionSummary</code> element for each distribution that was created by the current AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontStreamingDistributionSummary *> * _Nullable items;

/**
 <p>The value you provided for the <code>Marker</code> request parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The value you provided for the <code>MaxItems</code> request parameter. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>If <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value you can use for the <code>Marker</code> request parameter to continue listing your RTMP distributions where they left off. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The number of streaming distributions that were created by the current AWS account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p> A summary of the information for a CloudFront streaming distribution.</p>
 Required parameters: [Id, ARN, Status, LastModifiedTime, DomainName, S3Origin, Aliases, TrustedSigners, Comment, PriceClass, Enabled]
 */
@interface AWSCloudfrontStreamingDistributionSummary : AWSModel


/**
 <p> The ARN (Amazon Resource Name) for the streaming distribution. For example: <code>arn:aws:cloudfront::123456789012:streaming-distribution/EDFDVBD632BHDS5</code>, where <code>123456789012</code> is your AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>A complex type that contains information about CNAMEs (alternate domain names), if any, for this streaming distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontAliases * _Nullable aliases;

/**
 <p>The comment originally specified when this distribution was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The domain name corresponding to the distribution, for example, <code>d111111abcdef8.cloudfront.net</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Whether the distribution is enabled to accept end user requests for content.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The identifier for the distribution, for example, <code>EDFDVBD632BHDS5</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date and time the distribution was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>A complex type that contains information about price class for this streaming distribution. </p>
 */
@property (nonatomic, assign) AWSCloudfrontPriceClass priceClass;

/**
 <p>A complex type that contains information about the Amazon S3 bucket from which you want CloudFront to get your media files for distribution.</p>
 */
@property (nonatomic, strong) AWSCloudfrontS3Origin * _Nullable s3Origin;

/**
 <p> Indicates the current status of the distribution. When the status is <code>Deployed</code>, the distribution's information is fully propagated throughout the Amazon CloudFront system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A complex type that specifies the AWS accounts, if any, that you want to allow to create signed URLs for private content. If you want to require signed URLs in requests for objects in the target origin that match the <code>PathPattern</code> for this cache behavior, specify <code>true</code> for <code>Enabled</code>, and specify the applicable values for <code>Quantity</code> and <code>Items</code>.If you don't want to require signed URLs in requests for objects that match <code>PathPattern</code>, specify <code>false</code> for <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit <code>Items</code>. To add, change, or remove one or more trusted signers, change <code>Enabled</code> to <code>true</code> (if it's currently <code>false</code>), change <code>Quantity</code> as applicable, and specify all of the trusted signers that you want to include in the updated distribution.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>. </p>
 */
@property (nonatomic, strong) AWSCloudfrontTrustedSigners * _Nullable trustedSigners;

@end

/**
 <p>A complex type that controls whether access logs are written for this streaming distribution.</p>
 Required parameters: [Enabled, Bucket, Prefix]
 */
@interface AWSCloudfrontStreamingLoggingConfig : AWSModel


/**
 <p>The Amazon S3 bucket to store the access logs in, for example, <code>myawslogbucket.s3.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Specifies whether you want CloudFront to save access logs to an Amazon S3 bucket. If you don't want to enable logging when you create a streaming distribution or if you want to disable logging for an existing streaming distribution, specify <code>false</code> for <code>Enabled</code>, and specify <code>empty Bucket</code> and <code>Prefix</code> elements. If you specify <code>false</code> for <code>Enabled</code> but you specify values for <code>Bucket</code> and <code>Prefix</code>, the values are automatically deleted. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>An optional string that you want CloudFront to prefix to the access log filenames for this streaming distribution, for example, <code>myprefix/</code>. If you want to enable logging, but you don't want to specify a prefix, you still must include an empty <code>Prefix</code> element in the <code>Logging</code> element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p> A complex type that contains <code>Tag</code> key and <code>Tag</code> value.</p>
 Required parameters: [Key]
 */
@interface AWSCloudfrontTag : AWSModel


/**
 <p> A string that contains <code>Tag</code> key.</p><p>The string length should be between 1 and 128 characters. Valid characters include <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, space, and the special characters <code>_ - . : / = + @</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p> A string that contains an optional <code>Tag</code> value.</p><p>The string length should be between 0 and 256 characters. Valid characters include <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, space, and the special characters <code>_ - . : / = + @</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@interface AWSCloudfrontTagKeys : AWSModel


/**
 <p> A complex type that contains <code>Tag</code> key elements.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

@end

/**
 <p> The request to add tags to a CloudFront resource.</p>
 Required parameters: [Resource, Tags]
 */
@interface AWSCloudfrontTagResourceRequest : AWSRequest


/**
 <p> An ARN of a CloudFront resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p> A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTags * _Nullable tags;

@end

/**
 <p> A complex type that contains zero or more <code>Tag</code> elements.</p>
 */
@interface AWSCloudfrontTags : AWSModel


/**
 <p> A complex type that contains <code>Tag</code> elements.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudfrontTag *> * _Nullable items;

@end

/**
 <p>A complex type that specifies the AWS accounts, if any, that you want to allow to create signed URLs for private content.</p><p>If you want to require signed URLs in requests for objects in the target origin that match the <code>PathPattern</code> for this cache behavior, specify <code>true</code> for <code>Enabled</code>, and specify the applicable values for <code>Quantity</code> and <code>Items</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i> Amazon CloudFront Developer Guide</i>.</p><p>If you don't want to require signed URLs in requests for objects that match <code>PathPattern</code>, specify <code>false</code> for <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit <code>Items</code>.</p><p>To add, change, or remove one or more trusted signers, change <code>Enabled</code> to <code>true</code> (if it's currently <code>false</code>), change <code>Quantity</code> as applicable, and specify all of the trusted signers that you want to include in the updated distribution.</p><p>For more information about updating the distribution configuration, see <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/DistributionConfig.html">DistributionConfig</a> in the <i>Amazon CloudFront API Reference</i>.</p>
 Required parameters: [Enabled, Quantity]
 */
@interface AWSCloudfrontTrustedSigners : AWSModel


/**
 <p>Specifies whether you want to require viewers to use signed URLs to access the files specified by <code>PathPattern</code> and <code>TargetOriginId</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p><b>Optional</b>: A complex type that contains trusted signers for this cache behavior. If <code>Quantity</code> is <code>0</code>, you can omit <code>Items</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable items;

/**
 <p>The number of trusted signers for this cache behavior.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p> The request to remove tags from a CloudFront resource.</p>
 Required parameters: [Resource, TagKeys]
 */
@interface AWSCloudfrontUntagResourceRequest : AWSRequest


/**
 <p> An ARN of a CloudFront resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p> A complex type that contains zero or more <code>Tag</code> key elements.</p>
 */
@property (nonatomic, strong) AWSCloudfrontTagKeys * _Nullable tagKeys;

@end

/**
 <p>The request to update an origin access identity.</p>
 Required parameters: [CloudFrontOriginAccessIdentityConfig, Id]
 */
@interface AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest : AWSRequest


/**
 <p>The identity's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentityConfig * _Nullable cloudFrontOriginAccessIdentityConfig;

/**
 <p>The identity's id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the identity's configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult : AWSModel


/**
 <p>The origin access identity's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontCloudFrontOriginAccessIdentity * _Nullable cloudFrontOriginAccessIdentity;

/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 <p>The request to update a distribution.</p>
 Required parameters: [DistributionConfig, Id]
 */
@interface AWSCloudfrontUpdateDistributionRequest : AWSRequest


/**
 <p>The distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistributionConfig * _Nullable distributionConfig;

/**
 <p>The distribution's id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the distribution's configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontUpdateDistributionResult : AWSModel


/**
 <p>The distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontDistribution * _Nullable distribution;

/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

@end

/**
 
 */
@interface AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest : AWSRequest


/**
 <p>Request to update a field-level encryption configuration. </p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionConfig * _Nullable fieldLevelEncryptionConfig;

/**
 <p>The ID of the configuration you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the configuration identity to update. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 
 */
@interface AWSCloudfrontUpdateFieldLevelEncryptionConfigResult : AWSModel


/**
 <p>The value of the <code>ETag</code> header that you received when updating the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the results of updating the configuration.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryption * _Nullable fieldLevelEncryption;

@end

/**
 
 */
@interface AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest : AWSRequest


/**
 <p>Request to update a field-level encryption profile. </p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfileConfig * _Nullable fieldLevelEncryptionProfileConfig;

/**
 <p>The ID of the field-level encryption profile request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the profile identity to update. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

@end

/**
 
 */
@interface AWSCloudfrontUpdateFieldLevelEncryptionProfileResult : AWSModel


/**
 <p>The result of the field-level encryption profile request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the results of updating the profile.</p>
 */
@property (nonatomic, strong) AWSCloudfrontFieldLevelEncryptionProfile * _Nullable fieldLevelEncryptionProfile;

@end

/**
 
 */
@interface AWSCloudfrontUpdatePublicKeyRequest : AWSRequest


/**
 <p>ID of the public key to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the public key to update. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 <p>Request to update public key information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKeyConfig * _Nullable publicKeyConfig;

@end

/**
 
 */
@interface AWSCloudfrontUpdatePublicKeyResult : AWSModel


/**
 <p>The current version of the update public key result. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>Return the results of updating the public key.</p>
 */
@property (nonatomic, strong) AWSCloudfrontPublicKey * _Nullable publicKey;

@end

/**
 <p>The request to update a streaming distribution.</p>
 Required parameters: [StreamingDistributionConfig, Id]
 */
@interface AWSCloudfrontUpdateStreamingDistributionRequest : AWSRequest


/**
 <p>The streaming distribution's id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The value of the <code>ETag</code> header that you received when retrieving the streaming distribution's configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ifMatch;

/**
 <p>The streaming distribution's configuration information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistributionConfig * _Nullable streamingDistributionConfig;

@end

/**
 <p>The returned result of the corresponding request.</p>
 */
@interface AWSCloudfrontUpdateStreamingDistributionResult : AWSModel


/**
 <p>The current version of the configuration. For example: <code>E2QWRUHAPOMQZL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ETag;

/**
 <p>The streaming distribution's information.</p>
 */
@property (nonatomic, strong) AWSCloudfrontStreamingDistribution * _Nullable streamingDistribution;

@end

/**
 <p>A complex type that determines the distribution’s SSL/TLS configuration for communicating with viewers.</p><p>If the distribution doesn’t use <code>Aliases</code> (also known as alternate domain names or CNAMEs)—that is, if the distribution uses the CloudFront domain name such as <code>d111111abcdef8.cloudfront.net</code>—set <code>CloudFrontDefaultCertificate</code> to <code>true</code> and leave all other fields empty.</p><p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs), use the fields in this type to specify the following settings:</p><ul><li><p>Which viewers the distribution accepts HTTPS connections from: only viewers that support <a href="https://en.wikipedia.org/wiki/Server_Name_Indication">server name indication (SNI)</a> (recommended), or all viewers including those that don’t support SNI.</p><ul><li><p>To accept HTTPS connections from only viewers that support SNI, set <code>SSLSupportMethod</code> to <code>sni-only</code>. This is recommended. Most browsers and clients released after 2010 support SNI. </p></li><li><p>To accept HTTPS connections from all viewers, including those that don’t support SNI, set <code>SSLSupportMethod</code> to <code>vip</code>. This is not recommended, and results in additional monthly charges from CloudFront. </p></li></ul></li><li><p>The minimum SSL/TLS protocol version that the distribution can use to communicate with viewers. To specify a minimum version, choose a value for <code>MinimumProtocolVersion</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValues-security-policy">Security Policy</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></li><li><p>The location of the SSL/TLS certificate, <a href="https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html">AWS Certificate Manager (ACM)</a> (recommended) or <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">AWS Identity and Access Management (AWS IAM)</a>. You specify the location by setting a value in one of the following fields (not both):</p><ul><li><p><code>ACMCertificateArn</code></p></li><li><p><code>IAMCertificateId</code></p></li></ul></li></ul><p>All distributions support HTTPS connections from viewers. To require viewers to use HTTPS only, or to redirect them from HTTP to HTTPS, use <code>ViewerProtocolPolicy</code> in the <code>CacheBehavior</code> or <code>DefaultCacheBehavior</code>. To specify how CloudFront should use SSL/TLS to communicate with your custom origin, use <code>CustomOriginConfig</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https.html">Using HTTPS with CloudFront</a> and <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-alternate-domain-names.html"> Using Alternate Domain Names and HTTPS</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@interface AWSCloudfrontViewerCertificate : AWSModel


/**
 <p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs) and the SSL/TLS certificate is stored in <a href="https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html">AWS Certificate Manager (ACM)</a>, provide the Amazon Resource Name (ARN) of the ACM certificate. CloudFront only supports ACM certificates in the US East (N. Virginia) Region (<code>us-east-1</code>).</p><p>If you specify an ACM certificate ARN, you must also specify values for <code>MinimumProtocolVerison</code> and <code>SSLSupportMethod</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ACMCertificateArn;

/**
 <p>This field is deprecated. Use one of the following fields instead:</p><ul><li><p><code>ACMCertificateArn</code></p></li><li><p><code>IAMCertificateId</code></p></li><li><p><code>CloudFrontDefaultCertificate</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>This field is deprecated. Use one of the following fields instead:</p><ul><li><p><code>ACMCertificateArn</code></p></li><li><p><code>IAMCertificateId</code></p></li><li><p><code>CloudFrontDefaultCertificate</code></p></li></ul>
 */
@property (nonatomic, assign) AWSCloudfrontCertificateSource certificateSource;

/**
 <p>If the distribution uses the CloudFront domain name such as <code>d111111abcdef8.cloudfront.net</code>, set this field to <code>true</code>.</p><p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs), set this field to <code>false</code> and specify values for the following fields:</p><ul><li><p><code>ACMCertificateArn</code> or <code>IAMCertificateId</code> (specify a value for one, not both)</p></li><li><p><code>MinimumProtocolVersion</code></p></li><li><p><code>SSLSupportMethod</code></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable cloudFrontDefaultCertificate;

/**
 <p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs) and the SSL/TLS certificate is stored in <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">AWS Identity and Access Management (AWS IAM)</a>, provide the ID of the IAM certificate.</p><p>If you specify an IAM certificate ID, you must also specify values for <code>MinimumProtocolVerison</code> and <code>SSLSupportMethod</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable IAMCertificateId;

/**
 <p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs), specify the security policy that you want CloudFront to use for HTTPS connections with viewers. The security policy determines two settings:</p><ul><li><p>The minimum SSL/TLS protocol that CloudFront can use to communicate with viewers.</p></li><li><p>The ciphers that CloudFront can use to encrypt the content that it returns to viewers.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValues-security-policy">Security Policy</a> and <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/secure-connections-supported-viewer-protocols-ciphers.html#secure-connections-supported-ciphers">Supported Protocols and Ciphers Between Viewers and CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><note><p>On the CloudFront console, this setting is called <b>Security Policy</b>.</p></note><p>We recommend that you specify <code>TLSv1.2_2018</code> unless your viewers are using browsers or devices that don’t support TLSv1.2.</p><p>When you’re using SNI only (you set <code>SSLSupportMethod</code> to <code>sni-only</code>), you must specify <code>TLSv1</code> or higher. </p><p>If the distribution uses the CloudFront domain name such as <code>d111111abcdef8.cloudfront.net</code> (you set <code>CloudFrontDefaultCertificate</code> to <code>true</code>), CloudFront automatically sets the security policy to <code>TLSv1</code> regardless of the value that you set here.</p>
 */
@property (nonatomic, assign) AWSCloudfrontMinimumProtocolVersion minimumProtocolVersion;

/**
 <p>If the distribution uses <code>Aliases</code> (alternate domain names or CNAMEs), specify which viewers the distribution accepts HTTPS connections from.</p><ul><li><p><code>sni-only</code> – The distribution accepts HTTPS connections from only viewers that support <a href="https://en.wikipedia.org/wiki/Server_Name_Indication">server name indication (SNI)</a>. This is recommended. Most browsers and clients released after 2010 support SNI.</p></li><li><p><code>vip</code> – The distribution accepts HTTPS connections from all viewers including those that don’t support SNI. This is not recommended, and results in additional monthly charges from CloudFront.</p></li></ul><p>If the distribution uses the CloudFront domain name such as <code>d111111abcdef8.cloudfront.net</code>, don’t set a value for this field.</p>
 */
@property (nonatomic, assign) AWSCloudfrontSSLSupportMethod SSLSupportMethod;

@end

NS_ASSUME_NONNULL_END
