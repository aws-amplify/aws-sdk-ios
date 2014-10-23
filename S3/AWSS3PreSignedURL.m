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

#import "AWSS3PreSignedURL.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSLogging.h"
#import "Bolts.h"

NSString *const AWSS3PresignedURLErrorDomain = @"com.amazonaws.AWSS3PresignedURLErrorDomain";

@interface AWSS3PreSignedURLBuilder()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSS3PreSignedURLBuilder

+ (instancetype)defaultS3PreSignedURLBuilder {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSS3PreSignedURLBuilder *_defaultS3PreSignedURLBuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultS3PreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultS3PreSignedURLBuilder;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;
        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceS3];
    }

    return self;
}

- (BFTask *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    
    return [[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
    
    //retrive parameters from request;
    NSString *bucketName = getPreSignedURLRequest.bucket;
    NSString *keyName = getPreSignedURLRequest.key;
    AWSHTTPMethod httpMethod = getPreSignedURLRequest.HTTPMethod;

    AWSServiceConfiguration *configuration = self.configuration;
    id<AWSCredentialsProvider>credentialProvider = configuration.credentialsProvider;
    AWSEndpoint *endpoint = self.configuration.endpoint;

    NSDate *expires = getPreSignedURLRequest.expires;
    NSString *versionId = getPreSignedURLRequest.versionId;

    //validate endpoint
    if (!endpoint) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorEndpointIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"endpoint in configuration can not be nil"}]
                ];
    } else if (endpoint.serviceType != AWSServiceS3) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorInvalidServiceType
                                                     userInfo:@{NSLocalizedDescriptionKey: @"Invalid serviceType: serviceType in endpoint must be AWSServiceS3"}]
                ];
    }

    //validate credentialProvider
    if (!credentialProvider) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PreSignedURLErrorCredentialProviderIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"credentialProvider in configuration can not be nil"}]
                ];
    }
        
    //validate expiration date if using temporary token and refresh it if condition met
    if ([credentialProvider respondsToSelector:@selector(expiration)]) {
        if ([credentialProvider respondsToSelector:@selector(refresh)]) {
            if ([credentialProvider.expiration timeIntervalSinceNow] < getPreSignedURLRequest.minimumCredentialsExpirationInterval) {
                //need to refresh temp credential
                [[credentialProvider refresh] waitUntilFinished];
            }
        }
    }

    //validate accessKey
    if ([credentialProvider respondsToSelector:@selector(accessKey)] && [credentialProvider.accessKey length] > 0) {
        //continue to process.
    } else {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorAccessKeyIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"accessKey in credentialProvider can not be nil"}]
                ];
    }

    //validate secretKey
    if ([credentialProvider respondsToSelector:@selector(secretKey)] && [credentialProvider.secretKey length] > 0) {
        //continue to process.
    } else {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorSecretKeyIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"secretKey in credentialProvider can not be nil"}]
                ];
        
    }

    //validate bucketName
    if (!bucketName || [bucketName length] < 1) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorBucketNameIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"S3 bucket can not be nil or empty"}]
                ];
    }

    //validate keyName
    if (!keyName || [keyName length] < 1) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorKeyNameIsNil
                                                     userInfo:@{NSLocalizedDescriptionKey: @"S3 key can not be nil or empty"}]
                ];
    }

    //validate expires Date
    if (!expires) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                     userInfo:@{NSLocalizedDescriptionKey: @"expires can not be nil"}]
                ];
    }else if ([expires timeIntervalSinceNow] < 0.0) {
        return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                         code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                     userInfo:@{NSLocalizedDescriptionKey: @"expires can not be in past"}]
                ];
    }

    //validate httpMethod
    switch (httpMethod) {
        case AWSHTTPMethodGET:
        case AWSHTTPMethodPUT:
        case AWSHTTPMethodHEAD:
        case AWSHTTPMethodDELETE:
            break;
        default:
            return [BFTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                             code:AWSS3PresignedURLErrorUnsupportedHTTPVerbs
                                                         userInfo:@{NSLocalizedDescriptionKey: @"unsupported HTTP Method, currently only support AWSHTTPMethodGET, AWSHTTPMethodPUT, AWSHTTPMethodHEAD, AWSHTTPMethodDELETE"}]
                    ];
            break;
    }

    
    //generate baseURL String (use virtualHostStyle if possible)
    NSString *keyPath = nil;
    if (bucketName == nil || [self aws_isVirtualHostedStyleCompliant:bucketName]) {
        keyPath = (keyName == nil ? @"" : [NSString stringWithFormat:@"%@", [keyName aws_stringWithURLEncodingPath]]);
    } else {
        keyPath = (keyName == nil ? [NSString stringWithFormat:@"%@", bucketName] : [NSString stringWithFormat:@"%@/%@", bucketName, [keyName aws_stringWithURLEncodingPath]]);
    }

    //generate correct hostName (use virtualHostStyle if possible)
    NSString *host = nil;
    if (bucketName && [self aws_isVirtualHostedStyleCompliant:bucketName]) {
        host = [NSString stringWithFormat:@"%@.%@", bucketName, endpoint.hostName];
    } else {
        host = endpoint.hostName;
    }

    //generate queryString
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    //security Token
    if ([credentialProvider respondsToSelector:@selector(sessionKey)] && [credentialProvider.sessionKey length] > 0) {
        [queryString appendFormat:@"%@=%@&", @"x-amz-security-token", [credentialProvider.sessionKey aws_stringWithURLEncoding]];
    }

    [queryString appendFormat:@"%@=%@", @"AWSAccessKeyId", [credentialProvider.accessKey aws_stringWithURLEncoding]];

    // Add expire time
    int32_t expireTimestamp = (int32_t)[expires timeIntervalSince1970];
    [queryString appendFormat:@"&%@=%d", @"Expires", expireTimestamp];

    // Version
    if (versionId) {
        [queryString appendFormat:@"&%@=%@", @"versionId", [versionId aws_stringWithURLEncoding]];
    }

    // =============  generate the signature string ===================

    /* String to Sign Format:
     *
     * HTTP-VERB + "\n" +
     * Content-MD5 + "\n" + (Optional)
     * Content-Type + "\n" + (Optional)
     * Expires + "\n" +
     * CanonicalizedAmzHeaders +
     * CanonicalizedResource;
     */

    //Content-Type or Content-MD5 are optional for PUT requests and meaningless for GET requests), substitute the empty string ("") for that position.
    NSString *contentMd5 = @"";
    NSString *contentType = @"";
    if (httpMethod == AWSHTTPMethodPUT && getPreSignedURLRequest.contentType) {
        contentType = getPreSignedURLRequest.contentType;
    }
    
    NSMutableString *canonicalizedAmzHeaders = [NSMutableString stringWithFormat:@""];
    if ([credentialProvider respondsToSelector:@selector(sessionKey)] && [credentialProvider.sessionKey length] > 0) {
        [canonicalizedAmzHeaders appendFormat:@"%@:%@\n",@"x-amz-security-token",credentialProvider.sessionKey];
    }
    NSString *canonicalizedResource = @"";
    if (nil == keyName || [keyName length] < 1) {
        if (nil == bucketName || [bucketName length] < 1) {
            canonicalizedResource = @"/";
        }
        else {
            if ( [self aws_isVirtualHostedStyleCompliant:bucketName]) {
                canonicalizedResource = [NSString stringWithFormat:@"/%@/", bucketName];
            }else {
                canonicalizedResource = [NSString stringWithFormat:@"/%@", bucketName];
            }
        }
    }
    else {
        canonicalizedResource = [NSString stringWithFormat:@"/%@/%@", bucketName, [keyName aws_stringWithURLEncodingPath]];
    }

    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%d\n%@%@",
                              [NSString aws_stringWithHTTPMethod:httpMethod],
                              contentMd5,
                              contentType,
                              expireTimestamp,
                              canonicalizedAmzHeaders,
                              canonicalizedResource];

    /* Signature Format:
     * URL-Encode( Base64( HMAC-SHA1( YourSecretAccessKeyID, UTF-8-Encoding-Of( StringToSign ) ) ) );
     */
    NSString *signature = [[AWSSignatureSignerUtility HMACSign:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                       withKey:credentialProvider.secretKey
                                                usingAlgorithm:kCCHmacAlgSHA1] aws_stringWithURLEncoding];
    [queryString appendFormat:@"&%@=%@",@"Signature",signature];

    // =============  generate the signature string (END)===================

    NSURL *result = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@/%@?%@", endpoint.useUnsafeURL?@"http":@"https", host, keyPath, queryString]];

        return [BFTask taskWithResult:result];
        
    }];
}

@end

@implementation AWSS3GetPreSignedURLRequest

- (instancetype)init {
    if ( self = [super init] ) {
        self.minimumCredentialsExpirationInterval = 50*60;
    }
    return self;
}
@end
