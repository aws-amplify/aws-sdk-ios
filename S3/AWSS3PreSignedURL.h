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

#import "AWSService.h"

FOUNDATION_EXPORT NSString *const AWSS3PresignedURLErrorDomain;
typedef NS_ENUM(NSInteger, AWSS3PresignedURLErrorType) {
    AWSS3PresignedURLErrorUnknown,
    AWSS3PresignedURLErrorAccessKeyIsNil,
    AWSS3PresignedURLErrorSecretKeyIsNil,
    AWSS3PresignedURLErrorBucketNameIsNil,
    AWSS3PresignedURLErrorKeyNameIsNil,
    AWSS3PresignedURLErrorInvalidExpiresDate,
    AWSS3PresignedURLErrorUnsupportedHTTPVerbs,
    AWSS3PresignedURLErrorEndpointIsNil,
    AWSS3PresignedURLErrorInvalidServiceType,
    AWSS3PreSignedURLErrorCredentialProviderIsNil,
};

@class AWSS3GetPreSignedURLRequest;

@interface AWSS3PreSignedURLBuilder : AWSService

+ (instancetype)defaultS3PreSignedURLBuilder;

/**
 * a AWSServiceConfiguration object contains credentialsProvider and endpoint instance.
 * credentialProvider contains accessKey, secretKey, and maybe sessionKey if STS credential is used.
 * endpoint contains regionType and serviceType. If endpoint is nil, AWSRegionUSEast1 and AWSServiceS3 will be used as default value.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

/**
 * Build a time-limited pre-signed URL to get object from S3, return nil if build process failed.
 *
 * @param preSignedURLRequest The AWSS3PreSignedURLRequest that defines the parameters of the operation.
 * @return A pre-signed NSURL for the resource. return nil if any errors occured.
 * @see AWSS3GetPreSignedURLRequest
 */
- (BFTask *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

/** The GetPreSignedURLRequest contains the parameters used to create
 * a pre signed URL.
 * @see AWSS3PreSignedURLBuilder
 *
 */
@interface AWSS3GetPreSignedURLRequest : NSObject

/**
 * The name of the bucket
 */
@property (nonatomic, strong) NSString *bucket;

/**
 * The name of the S3 object
 */
@property (nonatomic, strong) NSString *key;

/**
 * Specifies the verb used in the pre-signed URL. accepted AWSHTTPMethodGET, AWSHTTPMethodPUT, AWSHTTPMethodHEAD.
 */
@property (nonatomic, assign) AWSHTTPMethod HTTPMethod;

/**
 * The time when the signature expires, specified as an NSDate object.
 */
@property (nonatomic, strong) NSDate *expires;

/**
 * (Optional) AWSS3GetPreSignedURLRequest will automatically refresh temporary credential if expiration duration in less than minimumCredentialsExpirationInterval. Only applied for credential provider using temporary token (e.g. CognitoIdentityProvider). Default value is 3000 seconds.
 */
@property (nonatomic, assign) NSTimeInterval minimumCredentialsExpirationInterval;

/**
 * (Optional) VersionId used in the pre signed URL. Default is nil.
 */
@property (nonatomic, strong) NSString *versionId;

/**
 * (Optional) A standard MIME type describing the format of the object data. only apply when AWSHTTPMethod property is AWSHTTPMethodPUT.
 */
@property (nonatomic, strong) NSString *contentType;


@end
