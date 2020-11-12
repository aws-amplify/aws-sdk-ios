//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSBolts.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSCocoaLumberjack.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import <CommonCrypto/CommonCrypto.h>

NSString *const AWSS3PresignedURLErrorDomain = @"com.amazonaws.AWSS3PresignedURLErrorDomain";

static NSString *const AWSS3PreSignedURLBuilderAcceleratedEndpoint = @"s3-accelerate.amazonaws.com";

static NSString *const AWSInfoS3PreSignedURLBuilder = @"S3PreSignedURLBuilder";
static NSString *const AWSS3PreSignedURLBuilderSDKVersion = @"2.19.1";

@interface AWSS3PreSignedURLBuilder()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@interface AWSS3GetPreSignedURLRequest ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *internalRequestParameters;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *internalRequestHeaders;
@property NSString *uploadID;
@property NSNumber *partNumber;
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
        
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                                  service:AWSServiceS3
                                                             useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                       service:AWSServiceS3];
        }
    }

    return self;
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
            }

            return credentialsProvider;
        }];
    }] continueWithSuccessBlock:^id _Nullable(AWSTask * _Nonnull task) {
        //generate baseURL String (use virtualHostStyle if possible)
        //base url is not url encoded.
        NSString *keyPath = nil;
        if (bucketName == nil || [bucketName aws_isVirtualHostedStyleCompliant]) {
            keyPath = (keyName == nil ? @"" : [NSString stringWithFormat:@"%@", [keyName aws_stringWithURLEncodingPath]]);
        } else {
            keyPath = (keyName == nil ? [NSString stringWithFormat:@"%@", bucketName] : [NSString stringWithFormat:@"%@/%@", bucketName, [keyName aws_stringWithURLEncodingPath]]);
        }

        //generate correct hostName (use virtualHostStyle if possible)
        NSString *host = nil;
        if (!self.configuration.localTestingEnabled &&
            bucketName &&
            [bucketName aws_isVirtualHostedStyleCompliant]) {
            if (isAccelerateModeEnabled) {
                host = [NSString stringWithFormat:@"%@.%@", bucketName, AWSS3PreSignedURLBuilderAcceleratedEndpoint];
            } else {
                host = [NSString stringWithFormat:@"%@.%@", bucketName, endpoint.hostName];
            }
        } else {
            host = endpoint.hostName;
        }
        [getPreSignedURLRequest setValue:host forRequestHeader:@"host"];
        
        //If this is a presigned request for a multipart upload, set the uploadID and partNumber on the request.
        if (getPreSignedURLRequest.uploadID
            && getPreSignedURLRequest.partNumber) {
            
            [getPreSignedURLRequest setValue:getPreSignedURLRequest.uploadID
                         forRequestParameter:@"uploadId"];
            
            [getPreSignedURLRequest setValue:[NSString stringWithFormat:@"%@", getPreSignedURLRequest.partNumber]
                         forRequestParameter:@"partNumber"];
        }
        NSString *portNumber = endpoint.portNumber != nil ? [NSString stringWithFormat:@":%@", endpoint.portNumber.stringValue]: @"";
        AWSEndpoint *newEndpoint = [[AWSEndpoint alloc]initWithRegion:configuration.regionType service:AWSServiceS3 URL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", endpoint.useUnsafeURL?@"http":@"https", host, portNumber]]];
        
        int32_t expireDuration = [expires timeIntervalSinceNow];
        if (expireDuration > 604800) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSS3PresignedURLErrorDomain
                                                              code:AWSS3PresignedURLErrorInvalidExpiresDate
                                                          userInfo:@{NSLocalizedDescriptionKey: @"Invalid ExpiresDate, must be less than seven days in future"}]
                    ];
        }

        return [AWSSignatureV4Signer  generateQueryStringForSignatureV4WithCredentialProvider:task.result
                                                                                   httpMethod:httpMethod
                                                                               expireDuration:expireDuration
                                                                                     endpoint:newEndpoint
                                                                                      keyPath:keyPath
                                                                               requestHeaders:getPreSignedURLRequest.requestHeaders
                                                                            requestParameters:getPreSignedURLRequest.requestParameters
                                                                                     signBody:NO];
    }];
}

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
