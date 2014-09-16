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
- (NSURL *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

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
@property (nonatomic, assign) AWSHTTPMethod httpMethod;

/**
 * The time when the signature expires, specified as an NSDate object.
 */
@property (nonatomic, strong) NSDate *expires;

/**
 * (Optional) VersionId used in the pre signed URL. Default is nil.
 */
@property (nonatomic, strong) NSString *versionId;

/**
 * Return a AWSS3PreSignedURLRequest object.
 * @param bucketName The name of the bucket.
 * @param bucketName The name of the S3 object.
 * @param httpMethod Specifies the verb used in the pre-signed URL. accepted AWSHTTPMethodGET, AWSHTTPMethodPUT, AWSHTTPMethodHEAD.
 * @param expires The time when the signature expires, specified as an NSDate object.
 */
- (instancetype)initWithBucket:(NSString *)bucketName
                           key:(NSString *)keyName
                    httpMethod:(AWSHTTPMethod)httpMethod
                       expires:(NSDate *)expires;

@end
