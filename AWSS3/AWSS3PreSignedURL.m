//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSS3PreSignedURL.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSLogging.h"
#import "AWSBolts.h"
#import "AWSSynchronizedMutableDictionary.h"
#import <CommonCrypto/CommonCrypto.h>

NSString *const AWSS3PresignedURLErrorDomain = @"com.amazonaws.AWSS3PresignedURLErrorDomain";

static NSString *const AWSS3PreSignedURLBuilderAcceleratedEndpoint = @"s3-accelerate.amazonaws.com";

static NSString *const AWSInfoS3PreSignedURLBuilder = @"S3PreSignedURLBuilder";
static NSString *const AWSS3PreSignedURLBuilderSDKVersion = @"2.4.7";

@interface AWSS3PreSignedURLBuilder()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSS3PreSignedURLBuilder

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSS3PreSignedURLBuilderSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSS3 versions need to match. Check your SDK installation. AWSCore: %@ AWSS3: %@", AWSiOSSDKVersion, AWSS3PreSignedURLBuilderSDKVersion]
                                     userInfo:nil];
    }
}

+ (instancetype)defaultS3PreSignedURLBuilder {
    static AWSS3PreSignedURLBuilder *_defaultS3PreSignedURLBuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoS3PreSignedURLBuilder];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _defaultS3PreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultS3PreSignedURLBuilder;
}

+ (void)registerS3PreSignedURLBuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)S3PreSignedURLBuilderForKey:(NSString *)key {
    @synchronized(self) {
        AWSS3PreSignedURLBuilder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoS3PreSignedURLBuilder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:serviceConfiguration
                                                                              forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeS3PreSignedURLBuilderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultS3PreSignedURLBuilder` or `+ S3PreSignedURLBuilderForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceS3
                                                         useUnsafeURL:NO];
    }

    return self;
}

- (NSString *)generateQueryStringForSignatureV4WithBucketName:(NSString *)bucketName
                                                      keyName:(NSString *)keyName
                                                  credentials:(AWSCredentials *)credentials
                                                   httpMethod:(AWSHTTPMethod)httpMethod
                                               expireDuration:(int32_t)expireDuration
                                                     endpoint:(AWSEndpoint *)endpoint
                                                      keyPath:(NSString *)keyPath
                                               requestHeaders:(NSDictionary<NSString *, NSString *> *)requestHeaders
                                            requestParameters:(NSDictionary<NSString *, NSString *> *)requestParameters {
    //Implementation of V4 signaure http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html
    NSMutableString *queryString = [NSMutableString new];

    //Append Identifies the version of AWS Signature and the algorithm that you used to calculate the signature.
    [queryString appendFormat:@"%@=%@&",@"X-Amz-Algorithm",AWSSignatureV4Algorithm];

    //Get ClockSkew Fixed Date
    NSDate *currentDate = [NSDate aws_clockSkewFixedDate];

    //Format of X-Amz-Credential : <your-access-key-id>/<date>/<AWS-region>/<AWS-service>/aws4_request.
    NSString *scope = [NSString stringWithFormat:@"%@/%@/%@/%@",
                       [currentDate aws_stringValue:AWSDateShortDateFormat1],
                       endpoint.regionName,
                       endpoint.serviceName,
                       AWSSignatureV4Terminator];

    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@",credentials.accessKey, scope];
    //need to replace "/" with "%2F"
    NSString *xAmzCredentialString = [signingCredentials stringByReplacingOccurrencesOfString:@"/" withString:@"\%2F"];

    [queryString appendFormat:@"%@=%@&",@"X-Amz-Credential",xAmzCredentialString];

    //X-Amz-Date in ISO 8601 format, for example, 20130721T201207Z. This value must match the date value used to calculate the signature.
    [queryString appendFormat:@"%@=%@&",@"X-Amz-Date",[currentDate aws_stringValue:AWSDateISO8601DateFormat2]];

    //X-Amz-Expires, Provides the time period, in seconds, for which the generated presigned URL is valid.
    //For example, 86400 (24 hours). This value is an integer. The minimum value you can set is 1, and the maximum is 604800 (seven days).
    [queryString appendFormat:@"%@=%d&", @"X-Amz-Expires", expireDuration];

    /*
     X-Amz-SignedHeaders Lists the headers that you used to calculate the signature. The HTTP host header is required.
     Any x-amz-* headers that you plan to add to the request are also required for signature calculation.
     In general, for added security, you should sign all the request headers that you plan to include in your request.
     */

    [queryString appendFormat:@"%@=%@&", @"X-Amz-SignedHeaders", [[AWSSignatureV4Signer getSignedHeadersString:requestHeaders] aws_stringWithURLEncoding]];

    //add additionalParameters to queryString
    for (NSString *key in requestParameters) {
        NSString *value = requestParameters[key];
        [queryString appendFormat:@"%@=%@&",[key aws_stringWithURLEncoding], [value aws_stringWithURLEncoding]];
    }

    //add security-token if necessary
    if ([credentials.sessionKey length] > 0) {
        [queryString appendFormat:@"%@=%@&", @"x-amz-security-token", [credentials.sessionKey aws_stringWithURLEncoding]];
    }

    // =============  generate v4 signature string ===================

    /* Canonical Request Format:
     *
     * HTTP-VERB + "\n" +  (e.g. GET, PUT, POST)
     * Canonical URI + "\n" + (e.g. /test.txt)
     * Canonical Query String + "\n" (multiple queryString need to sorted by QueryParameter)
     * Canonical Headrs + "\n" + (multiple headers need to be sorted by HeaderName)
     * Signed Headers + "\n" + (multiple headers need to be sorted by HeaderName)
     * "UNSIGNED-PAYLOAD"
     */


    NSString *httpMethodString = [NSString aws_stringWithHTTPMethod:httpMethod];

    //CanonicalURI is the URI-encoded version of the absolute path component of the URI—everything starting with the "/" that follows the domain name and up to the end of the string or to the question mark character ('?') if you have query string parameters. e.g. https://s3.amazonaws.com/examplebucket/myphoto.jpg /examplebucket/myphoto.jpg is the absolute path. In the absolute path, you don't encode the "/".

    NSString *canonicalURI = [NSString stringWithFormat:@"/%@", keyPath]; //keyPath has already been url-encoded.

    NSString *contentSha256 = @"UNSIGNED-PAYLOAD";

    //Generate Canonical Request
    NSString *canonicalRequest = [AWSSignatureV4Signer getCanonicalizedRequest:httpMethodString
                                                                          path:canonicalURI
                                                                         query:queryString
                                                                       headers:requestHeaders
                                                                 contentSha256:contentSha256];
    AWSLogVerbose(@"AWSS4 PresignedURL Canonical request: [%@]", canonicalRequest);

    //Generate String to Sign
    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              AWSSignatureV4Algorithm,
                              [currentDate aws_stringValue:AWSDateISO8601DateFormat2],
                              scope,
                              [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]]];

    AWSLogVerbose(@"AWS4 PresignedURL String to Sign: [%@]", stringToSign);

    //Generate Signature
    NSData *kSigning  = [AWSSignatureV4Signer getV4DerivedKey:credentials.secretKey
                                                         date:[currentDate aws_stringValue:AWSDateShortDateFormat1]
                                                       region:endpoint.regionName
                                                      service:endpoint.serviceName];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];
    NSString *signatureString = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature
                                                                                           encoding:NSASCIIStringEncoding]];

    // ============  generate v4 signature string (END) ===================

    [queryString appendFormat:@"%@=%@", @"X-Amz-Signature", signatureString];

    return queryString;
}

- (AWSTask<NSURL *> *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {
    //retrive parameters from request;
    NSString *bucketName = getPreSignedURLRequest.bucket;
    NSString *keyName = getPreSignedURLRequest.key;
    AWSHTTPMethod httpMethod = getPreSignedURLRequest.HTTPMethod;
    AWSServiceConfiguration *configuration = self.configuration;
    id<AWSCredentialsProvider>credentialsProvider = configuration.credentialsProvider;
    AWSEndpoint *endpoint = self.configuration.endpoint;
    BOOL isAccelerateModeEnabled = getPreSignedURLRequest.isAccelerateModeEnabled;

    NSDate *expires = getPreSignedURLRequest.expires;

    return [[[AWSTask taskWithResult:nil] continueWithBlock:^id(AWSTask *task) {

        //validate additionalParams
        for (id key in getPreSignedURLRequest.requestParameters) {
            id value = getPreSignedURLRequest.requestParameters[key];
            if (![key isKindOfClass:[NSString class]]
                || ![value isKindOfClass:[NSString class]]) {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                                  code:AWSS3PresignedURLErrorInvalidRequestParameters
                                                              userInfo:@{NSLocalizedDescriptionKey: @"requestParameters can only contain key-value pairs in NSString type."}]
                        ];
            }
        }

        //validate endpoint
        if (!endpoint) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorEndpointIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"endpoint in configuration can not be nil"}]
                    ];
        } else if (endpoint.serviceType != AWSServiceS3) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidServiceType
                                                          userInfo:@{NSLocalizedDescriptionKey: @"Invalid serviceType: serviceType in endpoint must be AWSServiceS3"}]
                    ];
        }

        //validate credentialsProvider
        if (!credentialsProvider) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PreSignedURLErrorCredentialProviderIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"credentialsProvider in configuration can not be nil"}]
                    ];
        }

        //validate bucketName
        if (!bucketName || [bucketName length] < 1) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorBucketNameIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"S3 bucket can not be nil or empty"}]];
        }

        // Validates the buket name for transfer acceleration.
        if (isAccelerateModeEnabled && ![bucketName aws_isVirtualHostedStyleCompliant]) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidBucketNameForAccelerateModeEnabled
                                                          userInfo:@{
                                                                     NSLocalizedDescriptionKey: @"For your bucket to work with transfer acceleration, the bucket name must conform to DNS naming requirements and must not contain periods."}]];
        }

        //validate keyName
        if (!keyName || [keyName length] < 1) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorKeyNameIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"S3 key can not be nil or empty"}]
                    ];
        }

        //validate expires Date
        if (!expires) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                          userInfo:@{NSLocalizedDescriptionKey: @"expires can not be nil"}]
                    ];
        }else if ([expires timeIntervalSinceNow] < 0.0) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
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
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                                  code:AWSS3PresignedURLErrorUnsupportedHTTPVerbs
                                                              userInfo:@{NSLocalizedDescriptionKey: @"unsupported HTTP Method, currently only support AWSHTTPMethodGET, AWSHTTPMethodPUT, AWSHTTPMethodHEAD, AWSHTTPMethodDELETE"}]
                        ];
                break;
        }

        return [[credentialsProvider credentials] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
            AWSCredentials *credentials = task.result;
            if ([credentials.expiration timeIntervalSinceNow] < getPreSignedURLRequest.minimumCredentialsExpirationInterval) {
                [credentialsProvider invalidateCachedTemporaryCredentials];
                return [credentialsProvider credentials];
            }

            return task;
        }];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        AWSCredentials *credentials = task.result;

        //validate accessKey
        if ([credentials.accessKey length] > 0) {
            //continue to process.
        } else {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorAccessKeyIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"accessKey in credentialsProvider can not be nil"}]
                    ];
        }

        //validate secretKey
        if ([credentials.secretKey length] > 0) {
            //continue to process.
        } else {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorSecretKeyIsNil
                                                          userInfo:@{NSLocalizedDescriptionKey: @"secretKey in credentialsProvider can not be nil"}]
                    ];

        }

        //generate baseURL String (use virtualHostStyle if possible)
        NSString *keyPath = nil;
        if (bucketName == nil || [bucketName aws_isVirtualHostedStyleCompliant]) {
            keyPath = (keyName == nil ? @"" : [NSString stringWithFormat:@"%@", [keyName aws_stringWithURLEncodingPath]]);
        } else {
            keyPath = (keyName == nil ? [NSString stringWithFormat:@"%@", bucketName] : [NSString stringWithFormat:@"%@/%@", bucketName, [keyName aws_stringWithURLEncodingPath]]);
        }

        //generate correct hostName (use virtualHostStyle if possible)
        NSString *host = nil;
        if (bucketName && [bucketName aws_isVirtualHostedStyleCompliant]) {
            if (isAccelerateModeEnabled) {
                host = [NSString stringWithFormat:@"%@.%@", bucketName, AWSS3PreSignedURLBuilderAcceleratedEndpoint];
            } else {
                host = [NSString stringWithFormat:@"%@.%@", bucketName, endpoint.hostName];
            }
        } else {
            host = endpoint.hostName;
        }
        [getPreSignedURLRequest setValue:host forRequestHeader:@"host"];

        int32_t expireDuration = [expires timeIntervalSinceNow];
        if (expireDuration > 604800) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                          userInfo:@{NSLocalizedDescriptionKey: @"Invalid ExpiresDate, must be less than seven days in future"}]
                    ];

        }

        NSString *generatedQueryString = [self generateQueryStringForSignatureV4WithBucketName:bucketName
                                                                                       keyName:keyName
                                                                                   credentials:credentials
                                                                                    httpMethod:httpMethod
                                                                                expireDuration:expireDuration
                                                                                      endpoint:endpoint
                                                                                       keyPath:keyPath
                                                                                requestHeaders:getPreSignedURLRequest.requestHeaders
                                                                             requestParameters:getPreSignedURLRequest.requestParameters];

        if (generatedQueryString == nil) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PreSignedURLErrorInternalError
                                                          userInfo:@{NSLocalizedDescriptionKey: @"failed to generate queryString."}]];
        }

        NSString *urlString = [NSString stringWithFormat:@"%@://%@/%@?%@", endpoint.useUnsafeURL ? @"http" : @"https", host, keyPath, generatedQueryString];
        NSURL *result = [NSURL URLWithString:urlString];

        return [AWSTask taskWithResult:result];
    }];
}

@end

@interface AWSS3GetPreSignedURLRequest ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;

@end

@implementation AWSS3GetPreSignedURLRequest

- (instancetype)init {
    if ( self = [super init] ) {
        _accelerateModeEnabled = NO;
        _minimumCredentialsExpirationInterval = 50 * 60;
        _internalRequestParameters = [NSMutableDictionary<NSString *, NSString *> new];
        _internalRequestHeaders = [NSMutableDictionary<NSString *, NSString *> new];
    }
    return self;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaders {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestHeaders];
}

- (NSDictionary<NSString *, NSString *> *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

- (NSString *)contentType {
    return [self.internalRequestHeaders objectForKey:@"Content-Type"];
}

- (void)setContentType:(NSString *)contentType {
    [self setValue:contentType forRequestHeader:@"Content-Type"];
}

- (NSString *)contentMD5 {
    return [self.internalRequestHeaders objectForKey:@"Content-MD5"];
}

- (void)setContentMD5:(NSString *)contentMD5 {
    [self setValue:contentMD5 forRequestHeader:@"Content-MD5"];
}

- (void)setValue:(NSString * _Nullable)value forRequestHeader:(NSString *)requestHeader {
    [self.internalRequestHeaders setValue:value forKey:requestHeader];
}

- (void)setValue:(NSString * _Nullable)value forRequestParameter:(NSString *)requestParameter {
    [self.internalRequestParameters setValue:value forKey:requestParameter];
}

@end
