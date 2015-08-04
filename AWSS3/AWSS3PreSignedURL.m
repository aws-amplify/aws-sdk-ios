/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSS3PreSignedURL.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSLogging.h"
#import "AWSBolts.h"
#import "AWSSynchronizedMutableDictionary.h"
#import <CommonCrypto/CommonCrypto.h>

NSString *const AWSS3PresignedURLErrorDomain = @"com.amazonaws.AWSS3PresignedURLErrorDomain";

@interface AWSS3PreSignedURLBuilder()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSS3PreSignedURLBuilder

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultS3PreSignedURLBuilder {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSS3PreSignedURLBuilder *_defaultS3PreSignedURLBuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultS3PreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultS3PreSignedURLBuilder;
}

+ (void)registerS3PreSignedURLBuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)S3PreSignedURLBuilderForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
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
        _configuration = configuration;
        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceS3
                                                         useUnsafeURL:NO];
    }

    return self;
}

- (NSString *)generateQueryStringForSignatureV4WithBucketName:(NSString *)bucketName
                                                      keyName:(NSString *)keyName
                                           credentialsProvider:(id<AWSCredentialsProvider> )credentialsProvider
                                                   httpMethod:(AWSHTTPMethod)httpMethod
                                                  contentType:(NSString *)contentType
                                               expireDuration:(int32_t)expireDuration
                                         requestParameters:(NSDictionary *)requestParameters
                                                     endpoint:(AWSEndpoint *)endpoint
                                                      keyPath:(NSString *)keyPath
                                                         host:(NSString *)host
                                                   contentMD5:(NSString *)contentMD5
{
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
    
    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@",credentialsProvider.accessKey,scope];
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
    
    NSMutableDictionary *headers = [NSMutableDictionary new];
    [headers setObject:host forKey:@"host"];
    
    if ([contentType length] > 0) {
        [headers setObject:contentType forKey:@"Content-Type"];
    }
    if ([contentMD5 length] > 0) {
        [headers setObject:contentMD5 forKey:@"Content-MD5"];
    }

    [queryString appendFormat:@"%@=%@&",@"X-Amz-SignedHeaders",[[AWSSignatureV4Signer getSignedHeadersString:headers] aws_stringWithURLEncoding]];
    
    //add additionalParameters to queryString
    for (NSString *key in requestParameters) {
        id value = requestParameters[key];
        if ([value isKindOfClass:[NSNull class]]) {
            [queryString appendFormat:@"%@=&",[key aws_stringWithURLEncoding]];
        } else {
            [queryString appendFormat:@"%@=%@&",[key aws_stringWithURLEncoding], [value aws_stringWithURLEncoding]];
        }
        
    }
    
    //add security-token if necessary
    if ([credentialsProvider respondsToSelector:@selector(sessionKey)] && [credentialsProvider.sessionKey length] > 0) {
        [queryString appendFormat:@"%@=%@&", @"x-amz-security-token", [credentialsProvider.sessionKey aws_stringWithURLEncoding]];
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
    
    NSString *canonicalURI = [NSString stringWithFormat:@"/%@",keyPath]; //keyPath has already been url-encoded.
   
    NSString *contentSha256 = @"UNSIGNED-PAYLOAD";
    
    //Generate Canonical Request
    NSString *canonicalRequest = [AWSSignatureV4Signer getCanonicalizedRequest:httpMethodString
                                                                          path:canonicalURI
                                                                         query:queryString
                                                                       headers:headers
                                                                 contentSha256:contentSha256];
    AWSLogDebug(@"AWSS4 PresignedURL Canonical request: [%@]", canonicalRequest);
    
    //Generate String to Sign
    NSString *stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
                              AWSSignatureV4Algorithm,
                              [currentDate aws_stringValue:AWSDateISO8601DateFormat2],
                              scope,
                              [AWSSignatureSignerUtility hexEncode:[AWSSignatureSignerUtility hashString:canonicalRequest]]];
    
    AWSLogDebug(@"AWS4 PresignedURL String to Sign: [%@]", stringToSign);
    
    //Generate Signature
    NSData *kSigning  = [AWSSignatureV4Signer getV4DerivedKey:credentialsProvider.secretKey
                                                         date:[currentDate aws_stringValue:AWSDateShortDateFormat1]
                                                       region:endpoint.regionName
                                                      service:endpoint.serviceName];
    NSData *signature = [AWSSignatureSignerUtility sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]
                                                              withKey:kSigning];
    NSString *signatureString = [AWSSignatureSignerUtility hexEncode:[[NSString alloc] initWithData:signature
                                                                                           encoding:NSASCIIStringEncoding]];
    
    // ============  generate v4 signature string (END) ===================
    
    [queryString appendFormat:@"%@=%@",@"X-Amz-Signature",signatureString];
    
    return queryString;
}

- (AWSTask *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest {

    return [[AWSTask taskWithResult:nil] continueWithBlock:^id(AWSTask *task) {

        //retrive parameters from request;
        NSString *bucketName = getPreSignedURLRequest.bucket;
        NSString *keyName = getPreSignedURLRequest.key;
        AWSHTTPMethod httpMethod = getPreSignedURLRequest.HTTPMethod;

        AWSServiceConfiguration *configuration = self.configuration;
        id<AWSCredentialsProvider>credentialsProvider = configuration.credentialsProvider;
        AWSEndpoint *endpoint = self.configuration.endpoint;

        NSDate *expires = getPreSignedURLRequest.expires;
        
        //validate additionalParams
        for (id key in getPreSignedURLRequest.requestParameters) {
            id value = getPreSignedURLRequest.requestParameters[key];
            if (![key isKindOfClass:[NSString class]] || (![value isKindOfClass:[NSString class]] && ![value isKindOfClass:[NSNull class]]) ) {
                return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                                  code:AWSS3PresignedURLErrorInvalidRequestParameters
                                                              userInfo:@{NSLocalizedDescriptionKey: @"requestParameters can only contain key-value pairs in NSString type."}]
                        ];
            }
        }
        
        
        NSString *contentType = getPreSignedURLRequest.contentType;
        NSString *contentMD5 = getPreSignedURLRequest.contentMD5;
        

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

        //validate expiration date if using temporary token and refresh it if condition met
        if ([credentialsProvider respondsToSelector:@selector(expiration)]) {
            if ([credentialsProvider respondsToSelector:@selector(refresh)]) {
                if ([credentialsProvider.expiration timeIntervalSinceNow] < getPreSignedURLRequest.minimumCredentialsExpirationInterval) {
                    //need to refresh temp credential
                    [[credentialsProvider refresh] waitUntilFinished];
                }
            }
        }

        //validate accessKey
        if ([credentialsProvider respondsToSelector:@selector(accessKey)] && [credentialsProvider.accessKey length] > 0) {
            //continue to process.
        } else {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                             code:AWSS3PresignedURLErrorAccessKeyIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"accessKey in credentialsProvider can not be nil"}]
                    ];
        }

        //validate secretKey
        if ([credentialsProvider respondsToSelector:@selector(secretKey)] && [credentialsProvider.secretKey length] > 0) {
            //continue to process.
        } else {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                             code:AWSS3PresignedURLErrorSecretKeyIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"secretKey in credentialsProvider can not be nil"}]
                    ];

        }

        //validate bucketName
        if (!bucketName || [bucketName length] < 1) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                             code:AWSS3PresignedURLErrorBucketNameIsNil
                                                         userInfo:@{NSLocalizedDescriptionKey: @"S3 bucket can not be nil or empty"}]
                    ];
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
            host = [NSString stringWithFormat:@"%@.%@", bucketName, endpoint.hostName];
        } else {
            host = endpoint.hostName;
        }

    
        int32_t expireDuration = [expires timeIntervalSinceNow];
        if (expireDuration > 604800) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                          userInfo:@{NSLocalizedDescriptionKey: @"Invalid ExpiresDate, must be less than seven days in future"}]
                    ];
            
        }
        NSString *generatedQueryString = [self generateQueryStringForSignatureV4WithBucketName:bucketName
                                                                                       keyName:keyName
                                                                           credentialsProvider:credentialsProvider
                                                                                    httpMethod:httpMethod
                                                                                   contentType:contentType
                                                                                expireDuration:expireDuration
                                                                          requestParameters:getPreSignedURLRequest.requestParameters
                                                                                      endpoint:endpoint
                                                                                       keyPath:keyPath
                                                                                          host:host
                                                                                    contentMD5:contentMD5];
        

        if (generatedQueryString == nil) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PreSignedURLErrorInternalError
                                                          userInfo:@{NSLocalizedDescriptionKey: @"failed to generate queryString."}]];
        }

        NSString *urlString = [NSString stringWithFormat:@"%@://%@/%@?%@", endpoint.useUnsafeURL?@"http":@"https", host, keyPath, generatedQueryString];
        NSURL *result = [NSURL URLWithString:urlString];

        return [AWSTask taskWithResult:result];
        
    }];
}

@end

@interface AWSS3GetPreSignedURLRequest ()

@property (nonatomic, strong) NSMutableDictionary *internalRequestParameters;

@end

@implementation AWSS3GetPreSignedURLRequest

- (instancetype)init {
    if ( self = [super init] ) {
        _minimumCredentialsExpirationInterval = 50*60;
        _internalRequestParameters = [NSMutableDictionary new];
    }
    return self;
}

- (void)setValue:(NSString *)value forRequestParameter:(NSString *)requestParameter {
    if (value) {
        [self.internalRequestParameters setObject:value forKey:requestParameter];
    } else {
        [self.internalRequestParameters setObject:[NSNull null] forKey:requestParameter];
    }
}

//Getter method for requestParameters property
- (NSDictionary *)requestParameters {
    return [NSDictionary dictionaryWithDictionary:self.internalRequestParameters];
}

//Setter method for versionId property
- (void)setVersionId:(NSString *)versionId {
    if ([versionId length] > 0) {
        if (self.internalRequestParameters[AWSS3PresignedURLVersionID] == nil) {
            self.internalRequestParameters[AWSS3PresignedURLVersionID] = versionId;
        } else {
            AWSLogError(@"versionId ignored: entry already exists in requestParameters. Please update the versionId by calling setValue:forRequestParameters: method.");
        }
    }
}

//Getter method for versionID property
- (NSString *)versionId {
    return self.internalRequestParameters[AWSS3PresignedURLVersionID];
}

@end
